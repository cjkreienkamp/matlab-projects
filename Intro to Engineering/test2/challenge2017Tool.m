function varargout = challenge2017Tool(varargin)
% CHALLENGE2017TOOL MATLAB code for challenge2017Tool.fig
%      CHALLENGE2017TOOL, by itself, creates a new CHALLENGE2017TOOL or raises the existing
%      singleton*.
%
%      H = CHALLENGE2017TOOL returns the handle to a new CHALLENGE2017TOOL or the handle to
%      the existing singleton*.
%
%      CHALLENGE2017TOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHALLENGE2017TOOL.M with the given input arguments.
%
%      CHALLENGE2017TOOL('Property','Value',...) creates a new CHALLENGE2017TOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before challenge2017Tool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to challenge2017Tool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help challenge2017Tool

% Last Modified by GUIDE v2.5 06-Apr-2017 14:12:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @challenge2017Tool_OpeningFcn, ...
                   'gui_OutputFcn',  @challenge2017Tool_OutputFcn, ...
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


% --- Executes just before challenge2017Tool is made visible.
function challenge2017Tool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to challenge2017Tool (see VARARGIN)

% Choose default command line output for challenge2017Tool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
plotFuncF(handles)
% UIWAIT makes challenge2017Tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = challenge2017Tool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function aSlider_Callback(hObject, eventdata, handles)
% hObject    handle to aSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.aText.String = num2str(handles.aSlider.Value);
plotFuncF(handles)


% --- Executes during object creation, after setting all properties.
function aSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function aText_Callback(hObject, eventdata, handles)
% hObject    handle to aText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aText as text
%        str2double(get(hObject,'String')) returns contents of aText as a double
handles.aSlider.Value = str2double(handles.aText.String);
plotFuncF(handles)


% --- Executes during object creation, after setting all properties.
function aText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gridOnCheckbox.
function gridOnCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to gridOnCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gridOnCheckbox
plotFuncF(handles)
