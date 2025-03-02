function varargout = Magic8Tool(varargin)
% MAGIC8TOOL MATLAB code for Magic8Tool.fig
%      MAGIC8TOOL, by itself, creates a new MAGIC8TOOL or raises the existing
%      singleton*.
%
%      H = MAGIC8TOOL returns the handle to a new MAGIC8TOOL or the handle to
%      the existing singleton*.
%
%      MAGIC8TOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAGIC8TOOL.M with the given input arguments.
%
%      MAGIC8TOOL('Property','Value',...) creates a new MAGIC8TOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Magic8Tool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Magic8Tool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Magic8Tool

% Last Modified by GUIDE v2.5 06-Apr-2017 11:05:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Magic8Tool_OpeningFcn, ...
                   'gui_OutputFcn',  @Magic8Tool_OutputFcn, ...
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


% --- Executes just before Magic8Tool is made visible.
function Magic8Tool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Magic8Tool (see VARARGIN)

% Choose default command line output for Magic8Tool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Magic8Tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Magic8Tool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in spinButton.
function spinButton_Callback(hObject, eventdata, handles)
% hObject    handle to spinButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MagicEightBallF(handles)


function replyText_Callback(hObject, eventdata, handles)
% hObject    handle to replyText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of replyText as text
%        str2double(get(hObject,'String')) returns contents of replyText as a double
MagicEightBallF(handles)


% --- Executes during object creation, after setting all properties.
function replyText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to replyText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
