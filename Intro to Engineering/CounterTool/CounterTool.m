function varargout = CounterTool(varargin)
% COUNTERTOOL MATLAB code for CounterTool.fig
%      COUNTERTOOL, by itself, creates a new COUNTERTOOL or raises the existing
%      singleton*.
%
%      H = COUNTERTOOL returns the handle to a new COUNTERTOOL or the handle to
%      the existing singleton*.
%
%      COUNTERTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COUNTERTOOL.M with the given input arguments.
%
%      COUNTERTOOL('Property','Value',...) creates a new COUNTERTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CounterTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CounterTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CounterTool

% Last Modified by GUIDE v2.5 23-Mar-2017 01:30:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CounterTool_OpeningFcn, ...
                   'gui_OutputFcn',  @CounterTool_OutputFcn, ...
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


% --- Executes just before CounterTool is made visible.
function CounterTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CounterTool (see VARARGIN)

% Choose default command line output for CounterTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CounterTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CounterTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function countText_Callback(hObject, eventdata, handles)
% hObject    handle to countText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of countText as text
%        str2double(get(hObject,'String')) returns contents of countText as a double


% --- Executes during object creation, after setting all properties.
function countText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to countText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in countButton.
function countButton_Callback(hObject, eventdata, handles)
% hObject    handle to countButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
numCount = str2double(handles.countText.String);
handles.countText.String = num2str(numCount + 1);

% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.countText.String = 0;