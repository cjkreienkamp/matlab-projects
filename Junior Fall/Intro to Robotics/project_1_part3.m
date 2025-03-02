% Chris Kreienkamp -- 901965168
% Introduction to Robotics
% Project 1

%%forward kinematic
clear;clc;
close all;
%import the model
lbr = importrobot('iiwa14.urdf');
lbr.DataFormat = 'row';
gripper = 'iiwa_link_ee_kuka';
    
%define the position and dimension of the cup
cupHeight = 0.2;
cupRadius = 0.35;
cupPosition = [0.5, -0.5, .1];

%add target position
body = robotics.RigidBody('cupFrame');
polar_angle_for_cup = 0;
p_desired = cupPosition + [-cupRadius*cos(polar_angle_for_cup), ...
        -cupRadius*sin(polar_angle_for_cup), ...
        .2];
R_desired = eul2rotm([0 pi 0]);
T_desired = [R_desired p_desired' ; 0 0 0 1]; % Desired Homogenous Transfrm

setFixedTransform(body.Joint, T_desired );
addBody(lbr, body, lbr.BaseName);

%forward kinematics
figure(1);
clf

theta_0 = [deg2rad(90), deg2rad(50), deg2rad(20), deg2rad(10), ...
    deg2rad(50), deg2rad(15), deg2rad(10)];  %angles of each joint
show(lbr, theta_0 , 'PreservePlot', false); hold on
exampleHelperPlotCupAndTable(cupHeight, cupRadius, cupPosition);      

axis([-1.5 1.5 -1.5 1.5 -0 1.5])
view([100 20])
zoom(.5)

%program
[theta, iteration_errors] = IK(T_desired, theta_0, lbr, gripper, 1);
theta_matrix = zeros(length(theta_0), 100);
x_matrix = zeros(100);
y_matrix = zeros(100);

for i = 1:100
    
    polar_angle_for_cup = (i-1)*2*pi/99;
    theta_0 = theta;
    p_desired = cupPosition + [-cupRadius*cos(polar_angle_for_cup), ...
        -cupRadius*sin(polar_angle_for_cup), ...
        .2];
    R_desired = eul2rotm([0 pi 0]);
    T_desired = [R_desired p_desired' ; 0 0 0 1]; % Desired Homogenous Transfrm
    setFixedTransform(body.Joint, T_desired );
    
    [theta, iteration_errors] = IK(T_desired, theta_0, lbr, gripper, 1);
    show(lbr, theta , 'PreservePlot', false); drawnow; pause(0.05);
    theta_matrix(:,i) = wrapToPi(theta);
    T = getTransform(lbr,theta, gripper);
    x_matrix(i) = T(1,4);
    y_matrix(i) = T(2,4);
end

% plot of IK solution joint angles versus polar_angle_for_cup
figure(2)
plot(linspace(0,2*pi,100) , theta_matrix, '.','LineWidth',5)
set(gca,'FontSize',20)
axis([0 2*pi -pi pi])
xlabel('polar angle for cup (rad)'); ylabel('IK solution joint angles (rad)')
xticks([0 pi*1/4 pi*2/4 pi*3/4 pi pi*5/4 pi*6/4 pi*7/4 pi*2])
xticklabels({0,'','\pi/2','','\pi','','3\pi/2','','2\pi'})
yticks([-pi -pi*3/4 -pi/2 -pi/4 0 pi/4 pi/2 pi*3/4 pi])
yticklabels({'-\pi','','-\pi/2','','0','','\pi/2','','\pi'})
legend('\theta_1','\theta_2','\theta_3','\theta_4','\theta_5',...
'\theta_6','\theta_7','Location','Southwest','NumColumns',7)

%parametric plot of x and y positions of the end effector along solution
figure(3)
plot(x_matrix,y_matrix,'.','LineWidth',5)
set(gca,'FontSize',20)
xlabel('x position (m)'); ylabel('y position (m)')
axis('square')


%% e = computeError( T_desired, angleJ, robot, end_effector)  
% Function to compute the 6x1 vector of error
% 
% Inputs: T_desired     Desired homogenous transform from the base to
%                       the end effector (4 x 4)
%         theta         Joint angle vector for the manipulator (1 x N)
%         robot         Robotics Systems Toolbox Robot object 
%         end_effector  Name of end-effector
%
% Outputs: e    6x1 vector containing angle-axis error and position error
%               between the desired and actual end-effector pose
%
function e = computeError( T_desired, theta, robot, end_effector)    
    % TODO: Extract the rotation from the desired homogenous transform
    R_desired = T_desired(1:3,1:3); 
    % TODO: Extract the position from the desired homogenous transform
    p_desired = T_desired(1:3,4);                 
    
    % Homogeneous transform from 0 to the end_effector
    T = getTransform(robot,theta, end_effector); 
    
    % TODO: Extract the actual rotation from the homogeneous transform
    R = T(1:3,1:3);  
    % TODO: Extract the actual position from the homogeneous transform
    p = T(1:3,4);               
    
    % TODO: Compute the position error
    position_error   = p_desired-p;  
    % TODO: Compute the cross product matrix of the angle-axis error
    S_angle_axis     = logm(R_desired*R'); 
    % TODO: Compute the angle-axis error
    angle_axis_error = [S_angle_axis(3,2); ...
        S_angle_axis(1,3); ...
        S_angle_axis(2,1)];    
    
    e = vertcat(angle_axis_error , position_error );
end
 
 
%% [angle_new, step_size] = IK_step(angle, T_desired, robot, end_effector)
% Function to take a step toward the desired end-effector pose
%
% Inputs: theta         Current joint angle vector for manipulator (1 X N)
%         T_desired     Desired homogenous transform from the base to
%                       the end effector (4 x 4) 
%         robot         Robotics Systems Toolbox Robot object
%         end_effector  Name of end-effector
%
% Ouputs: theta_new     Updated joint angle after the step (1 X N)
%         reduction     Reduction in error from this step 
%
function [theta_new,reduction] =IK_step(theta,T_desired,robot,end_effector)
    
    e = computeError( T_desired, theta,robot, end_effector);
    initial_error = norm(e);
    J = geometricJacobian(robot,theta,end_effector);
    
    % Algorithm parameters
    lambda = 1e-4;                      % Damped-Least Squares Damping
    minimum_beta = 1e-15;               % Smallest step allowed
    accepted_reduction_percent = 0.01;  % Criteria to accept the step
    
    % Initial test step size
    beta = 1;
    
    % TODO: Compute ideal step with the damped-least-squares pseduoinverse
    delta_theta = J'*inv(J*J'+lambda*eye(6))*e; 
    
    % Candidate for new joint angles
    theta_test = theta + delta_theta' * beta;
    
    e = computeError( T_desired, theta_test,robot, end_effector);
    % TODO: Compute reduction in error for the candidate step
    reduction           = initial_error - norm(e);
    % TODO: Compute the expected reduction in error for the candidate step 
    % (assuming linearization perfect)
    expected_reduction  = beta * initial_error;
    

    % Perform a backtracking line search over the step size parameter beta
    % Accept the step when either 
    %  a) the reduction in error is at least 
    %     accepted_reduction_percent * expected_reduction or
    %  b) the step size is smaller than the minimum allowed beta
    % TODO: Fill in conditions on the termination of the loop
    while (reduction < accepted_reduction_percent * expected_reduction)...
            && (beta > minimum_beta) 
        %fprintf(1,'Rejected step with beta = %e, Actual Reduction = %e,  
        % Expected Reduction = %e\n',beta, reduction, expected_reduction);
        beta = beta * .5;                           % Reduce beta
        theta_test =theta+delta_theta'*beta;% Create new test configuration
        e = computeError( T_desired, theta_test,robot, end_effector);
        % TODO: Fill in same as above
        reduction = initial_error - norm(e);     
        % TODO: Fill in same as above
        expected_reduction = beta * initial_error;  
    end
    
    theta_new = theta_test;
    fprintf(1,'Accepted Step beta = %e, Actual Reduction = %e',...
        'Expected Reduction = %e\n',beta, reduction, expected_reduction);
    
end
 

%% [theta, iteration_errors] = IK(T_desired, theta_0, robot, end_effector)
% Solve the numerical IK problem from a given initial guess
%
% Inputs: T_desired     Desired homogenous transform from the base to
%                       the end effector (4 x 4)
%         theta_0       Init guess for manipulator joint angle vector (1xN)
%         robot         Robotics Systems Toolbox Robot object 
%         end_effector  Name of end-effector
%         animate_flag  Set to 1 to enable animation of each step
% Outputs: theta        Joint angle vector that solves numerical IK problem
%          iteration_errors Vector of norm of e at each iteration
function [theta, iteration_errors] = ...
    IK(T_desired, theta_0, robot, end_effector, animate_flag)
    theta = theta_0; 
    e = computeError( T_desired, theta, robot, end_effector);
    error_threshold = 1e-6;
    iteration_errors = [norm(e)];
    
    % While the error has magnitude larger than some threshold
    % TODO: Complete while loop condition
    reduction = 1;
    while (iteration_errors > error_threshold) & (reduction > 1e-6)
        [theta, reduction] =IK_step(theta, T_desired, robot, end_effector);
        e = computeError( T_desired, theta, robot, end_effector);
        iteration_errors(end+1) = norm(e);
        if animate_flag
            show(robot, theta , 'PreservePlot', false);
            pause(.5)
        end
    end  

end