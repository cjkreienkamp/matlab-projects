function varargout = StartTool(varargin)
% STARTTOOL MATLAB code for StartTool.fig
%      STARTTOOL, by itself, creates a new STARTTOOL or raises the existing
%      singleton*.
%
%      H = STARTTOOL returns the handle to a new STARTTOOL or the handle to
%      the existing singleton*.
%
%      STARTTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STARTTOOL.M with the given input arguments.
%
%      STARTTOOL('Property','Value',...) creates a new STARTTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StartTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StartTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StartTool

% Last Modified by GUIDE v2.5 28-Feb-2017 14:16:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StartTool_OpeningFcn, ...
                   'gui_OutputFcn',  @StartTool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before StartTool is made visible.
function StartTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StartTool (see VARARGIN)

% Choose default command line output for StartTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StartTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StartTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp(' ')
disp('Hello! ')
disp(' ')
N = 5;
for iCount = N:-1:1
    disp(iCount)
    pause(0.5)
end
disp('BOOM!' )