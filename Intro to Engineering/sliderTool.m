function varargout = sliderTool(varargin)
% SLIDERTOOL MATLAB code for sliderTool.fig
%      SLIDERTOOL, by itself, creates a new SLIDERTOOL or raises the existing
%      singleton*.
%
%      H = SLIDERTOOL returns the handle to a new SLIDERTOOL or the handle to
%      the existing singleton*.
%
%      SLIDERTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLIDERTOOL.M with the given input arguments.
%
%      SLIDERTOOL('Property','Value',...) creates a new SLIDERTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sliderTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sliderTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sliderTool

% Last Modified by GUIDE v2.5 28-Feb-2017 14:27:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sliderTool_OpeningFcn, ...
                   'gui_OutputFcn',  @sliderTool_OutputFcn, ...
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


% --- Executes just before sliderTool is made visible.
function sliderTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sliderTool (see VARARGIN)

% Choose default command line output for sliderTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sliderTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sliderTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function widthSlider_Callback(hObject, eventdata, handles)
% hObject    handle to widthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w = handles.widthSlider.Value;
handles.widthText.String = num2str(w);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function widthSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function widthText_Callback(hObject, eventdata, handles)
% hObject    handle to widthText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wstr = handles.widthText.String;
handles.widthSlider.Value = str2double(wstr);

% Hints: get(hObject,'String') returns contents of widthText as text
%        str2double(get(hObject,'String')) returns contents of widthText as a double


% --- Executes during object creation, after setting all properties.
function widthText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
