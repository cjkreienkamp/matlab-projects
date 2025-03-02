function varargout = BlackjackTool(varargin)
% BLACKJACKTOOL MATLAB code for BlackjackTool.fig
%      BLACKJACKTOOL, by itself, creates a new BLACKJACKTOOL or raises the existing
%      singleton*.
%
%      H = BLACKJACKTOOL returns the handle to a new BLACKJACKTOOL or the handle to
%      the existing singleton*.
%
%      BLACKJACKTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BLACKJACKTOOL.M with the given input arguments.
%
%      BLACKJACKTOOL('Property','Value',...) creates a new BLACKJACKTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BlackjackTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BlackjackTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BlackjackTool

% Last Modified by GUIDE v2.5 17-Apr-2017 09:18:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BlackjackTool_OpeningFcn, ...
                   'gui_OutputFcn',  @BlackjackTool_OutputFcn, ...
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


% --- Executes just before BlackjackTool is made visible.
function BlackjackTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BlackjackTool (see VARARGIN)

% Choose default command line output for BlackjackTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BlackjackTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BlackjackTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nHandsText_Callback(hObject, eventdata, handles)
% hObject    handle to nHandsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nHandsText as text
%        str2double(get(hObject,'String')) returns contents of nHandsText as a double


% --- Executes during object creation, after setting all properties.
function nHandsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nHandsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function player1Text_Callback(hObject, eventdata, handles)
% hObject    handle to player1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of player1Text as text
%        str2double(get(hObject,'String')) returns contents of player1Text as a double


% --- Executes during object creation, after setting all properties.
function player1Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function player2Text_Callback(hObject, eventdata, handles)
% hObject    handle to player2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of player2Text as text
%        str2double(get(hObject,'String')) returns contents of player2Text as a double

% --- Executes during object creation, after setting all properties.
function player2Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function player3Text_Callback(hObject, eventdata, handles)
% hObject    handle to player3Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of player3Text as text
%        str2double(get(hObject,'String')) returns contents of player3Text as a double


% --- Executes during object creation, after setting all properties.
function player3Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player3Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
runSimpleBlackJackF(handles);