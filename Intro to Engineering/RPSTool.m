function varargout = RPSTool(varargin)
% RPSTOOL MATLAB code for RPSTool.fig
%      RPSTOOL, by itself, creates a new RPSTOOL or raises the existing
%      singleton*.
%
%      H = RPSTOOL returns the handle to a new RPSTOOL or the handle to
%      the existing singleton*.
%
%      RPSTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RPSTOOL.M with the given input arguments.
%
%      RPSTOOL('Property','Value',...) creates a new RPSTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RPSTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RPSTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RPSTool

% Last Modified by GUIDE v2.5 30-Mar-2017 00:23:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RPSTool_OpeningFcn, ...
                   'gui_OutputFcn',  @RPSTool_OutputFcn, ...
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


% --- Executes just before RPSTool is made visible.
function RPSTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RPSTool (see VARARGIN)

% Choose default command line output for RPSTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RPSTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RPSTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rockButton.
function rockButton_Callback(hObject, eventdata, handles)
% hObject    handle to rockButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
processRPSF(handles,1)


% --- Executes on button press in scissorsButton.
function scissorsButton_Callback(hObject, eventdata, handles)
% hObject    handle to scissorsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
processRPSF(handles,3)

% --- Executes on button press in paperButton.
function paperButton_Callback(hObject, eventdata, handles)
% hObject    handle to paperButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
processRPSF(handles,2)


function humanChoice_Callback(hObject, eventdata, handles)
% hObject    handle to humanChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of humanChoice as text
%        str2double(get(hObject,'String')) returns contents of humanChoice as a double


% --- Executes during object creation, after setting all properties.
function humanChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humanChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function computerChoice_Callback(hObject, eventdata, handles)
% hObject    handle to computerChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of computerChoice as text
%        str2double(get(hObject,'String')) returns contents of computerChoice as a double


% --- Executes during object creation, after setting all properties.
function computerChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to computerChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function winner_Callback(hObject, eventdata, handles)
% hObject    handle to winner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of winner as text
%        str2double(get(hObject,'String')) returns contents of winner as a double


% --- Executes during object creation, after setting all properties.
function winner_CreateFcn(hObject, eventdata, handles)
% hObject    handle to winner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function humanWins_Callback(hObject, eventdata, handles)
% hObject    handle to humanWins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of humanWins as text
%        str2double(get(hObject,'String')) returns contents of humanWins as a double


% --- Executes during object creation, after setting all properties.
function humanWins_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humanWins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function computerWins_Callback(hObject, eventdata, handles)
% hObject    handle to computerWins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of computerWins as text
%        str2double(get(hObject,'String')) returns contents of computerWins as a double


% --- Executes during object creation, after setting all properties.
function computerWins_CreateFcn(hObject, eventdata, handles)
% hObject    handle to computerWins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ties_Callback(hObject, eventdata, handles)
% hObject    handle to ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ties as text
%        str2double(get(hObject,'String')) returns contents of ties as a double


% --- Executes during object creation, after setting all properties.
function ties_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ties.String = num2str(0);
handles.humanWins.String = num2str(0);
handles.computerWins.String = num2str(0);
handles.winner.String = 'Winner...';
handles.humanChoice.String = 'Human chooses...';
handles.computerChoice.String = 'Computer chooses...';
