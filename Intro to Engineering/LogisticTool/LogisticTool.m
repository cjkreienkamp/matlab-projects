function varargout = LogisticTool(varargin)
% LOGISTICTOOL MATLAB code for LogisticTool.fig
%      LOGISTICTOOL, by itself, creates a new LOGISTICTOOL or raises the existing
%      singleton*.
%
%      H = LOGISTICTOOL returns the handle to a new LOGISTICTOOL or the handle to
%      the existing singleton*.
%
%      LOGISTICTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGISTICTOOL.M with the given input arguments.
%
%      LOGISTICTOOL('Property','Value',...) creates a new LOGISTICTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LogisticTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LogisticTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LogisticTool

% Last Modified by GUIDE v2.5 23-Mar-2017 00:54:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LogisticTool_OpeningFcn, ...
                   'gui_OutputFcn',  @LogisticTool_OutputFcn, ...
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


% --- Executes just before LogisticTool is made visible.
function LogisticTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LogisticTool (see VARARGIN)

% Choose default command line output for LogisticTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LogisticTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
plotlogisticF(handles)


% --- Outputs from this function are returned to the command line.
function varargout = LogisticTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function ySlider_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
y =handles.ySlider.Value;
handles.ySliderText.String = num2str(y);
plotlogisticF(handles)


% --- Executes during object creation, after setting all properties.
function ySlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function aSlider_Callback(hObject, eventdata, handles)
% hObject    handle to aSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a =handles.aSlider.Value;
handles.aSliderText.String = num2str(a);
plotlogisticF(handles)



% --- Executes during object creation, after setting all properties.
function aSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ySliderText_Callback(hObject, eventdata, handles)
% hObject    handle to ySliderText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ySliderText as text
%        str2double(get(hObject,'String')) returns contents of ySliderText as a double
y = handles.ySliderText.String;
handles.ySlider.Value = str2double(y);
plotlogisticF(handles)


% --- Executes during object creation, after setting all properties.
function ySliderText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySliderText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aSliderText_Callback(hObject, eventdata, handles)
% hObject    handle to aSliderText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aSliderText as text
%        str2double(get(hObject,'String')) returns contents of aSliderText as a double
a = handles.aSliderText.String;
handles.aSlider.Value = str2double(a);
plotlogisticF(handles)


% --- Executes during object creation, after setting all properties.
function aSliderText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aSliderText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
