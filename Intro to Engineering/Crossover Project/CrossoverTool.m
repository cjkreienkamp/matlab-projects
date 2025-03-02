function varargout = CrossoverTool(varargin)
% CROSSOVERTOOL MATLAB code for CrossoverTool.fig
%      CROSSOVERTOOL, by itself, creates a new CROSSOVERTOOL or raises the existing
%      singleton*.
%
%      H = CROSSOVERTOOL returns the handle to a new CROSSOVERTOOL or the handle to
%      the existing singleton*.
%
%      CROSSOVERTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CROSSOVERTOOL.M with the given input arguments.
%
%      CROSSOVERTOOL('Property','Value',...) creates a new CROSSOVERTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CrossoverTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CrossoverTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CrossoverTool

% Last Modified by GUIDE v2.5 03-Apr-2017 14:07:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CrossoverTool_OpeningFcn, ...
                   'gui_OutputFcn',  @CrossoverTool_OutputFcn, ...
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


% --- Executes just before CrossoverTool is made visible.
function CrossoverTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CrossoverTool (see VARARGIN)

% Choose default command line output for CrossoverTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CrossoverTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CrossoverTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function WoofInductSlider_Callback(hObject, eventdata, handles)
% hObject    handle to WoofInductSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
WoofInductVal=handles.WoofInductSlider.Value;
handles.WoofInductText.String=num2str(WoofInductVal);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function WoofInductSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WoofInductSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MidInduct1Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MidInduct1Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
MidInduct1Val=handles.MidInduct1Slider.Value;
handles.MidInduct1Text.String=num2str(MidInduct1Val);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function MidInduct1Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidInduct1Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MidInduct2Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MidInduct2Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
MidInduct2Val=handles.MidInduct2Slider.Value;
handles.MidInduct2Text.String=num2str(MidInduct2Val);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function MidInduct2Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidInduct2Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function TweetInductSlider_Callback(hObject, eventdata, handles)
% hObject    handle to TweetInductSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
TweetInductVal=handles.TweetInductSlider.Value;
handles.TweetInductText.String=num2str(TweetInductVal);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function TweetInductSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TweetInductSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function TweetInductText_Callback(hObject, eventdata, handles)
% hObject    handle to TweetInductText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TweetInductText as text
%        str2double(get(hObject,'String')) returns contents of TweetInductText as a double
TweetInductStr=handles.TweetInductText.String;
handles.TweetInductSlider.Value=str2double(TweetInductStr);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function TweetInductText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TweetInductText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WoofInductText_Callback(hObject, eventdata, handles)
% hObject    handle to WoofInductText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WoofInductText as text
%        str2double(get(hObject,'String')) returns contents of WoofInductText as a double
WoofInductStr=handles.WoofInductText.String;
handles.WoofInductSlider.Value=str2double(WoofInductStr);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function WoofInductText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WoofInductText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MidInduct1Text_Callback(hObject, eventdata, handles)
% hObject    handle to MidInduct1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MidInduct1Text as text
%        str2double(get(hObject,'String')) returns contents of MidInduct1Text as a double
MidInduct1Str=handles.MidInduct1Text.String;
handles.MidInduct1Slider.Value=str2double(MidInduct1Str);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function MidInduct1Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidInduct1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MidInduct2Text_Callback(hObject, eventdata, handles)
% hObject    handle to MidInduct2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MidInduct2Text as text
%        str2double(get(hObject,'String')) returns contents of MidInduct2Text as a double
MidInduct2Str=handles.MidInduct2Text.String;
handles.MidInduct2Slider.Value=str2double(MidInduct2Str);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function MidInduct2Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidInduct2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function WoofCapSlider_Callback(hObject, eventdata, handles)
% hObject    handle to WoofCapSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
WoofCapVal=handles.WoofCapSlider.Value;
handles.WoofCapText.String=num2str(WoofCapVal);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function WoofCapSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WoofCapSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MidCap1Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MidCap1Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
MidCap1Val=handles.MidCap1Slider.Value;
handles.MidCap1Text.String=num2str(MidCap1Val);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function MidCap1Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidCap1Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MidCap2Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MidCap2Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
MidCap2Val=handles.MidCap2Slider.Value;
handles.MidCap2Text.String=num2str(MidCap2Val);
CrossoverAnalyzerF(handles);


% --- Executes during object creation, after setting all properties.
function MidCap2Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidCap2Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function TweetCapSlider_Callback(hObject, eventdata, handles)
% hObject    handle to TweetCapSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
TweetCapVal=handles.TweetCapSlider.Value;
handles.TweetCapText.String=num2str(TweetCapVal);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function TweetCapSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TweetCapSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function TweetCapText_Callback(hObject, eventdata, handles)
% hObject    handle to TweetCapText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TweetCapText as text
%        str2double(get(hObject,'String')) returns contents of TweetCapText as a double
TweetCapStr=handles.TweetCapText.String;
handles.TweetCapSlider.Value=str2double(TweetCapStr);
CrossoverAnalyzerF(handles);


% --- Executes during object creation, after setting all properties.
function TweetCapText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TweetCapText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WoofCapText_Callback(hObject, eventdata, handles)
% hObject    handle to WoofCapText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WoofCapText as text
%        str2double(get(hObject,'String')) returns contents of WoofCapText as a double
WoofCapStr=handles.WoofCapText.String;
handles.WoofCapSlider.Value=str2double(WoofCapStr);
CrossoverAnalyzerF(handles);

% --- Executes during object creation, after setting all properties.
function WoofCapText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WoofCapText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MidCap1Text_Callback(hObject, eventdata, handles)
% hObject    handle to MidCap1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MidCap1Text as text
%        str2double(get(hObject,'String')) returns contents of MidCap1Text as a double
MidCap1Str=handles.MidCap1Text.String;
handles.MidCap1Slider.Value=str2double(MidCap1Str);
CrossoverAnalyzerF(handles);


% --- Executes during object creation, after setting all properties.
function MidCap1Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidCap1Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MidCap2Text_Callback(hObject, eventdata, handles)
% hObject    handle to MidCap2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MidCap2Text as text
%        str2double(get(hObject,'String')) returns contents of MidCap2Text as a double
MidCap2Str=handles.MidCap2Text.String;
handles.MidCap2Slider.Value=str2double(MidCap2Str);
CrossoverAnalyzerF(handles);


% --- Executes during object creation, after setting all properties.
function MidCap2Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MidCap2Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider20_Callback(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider21_Callback(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider22_Callback(hObject, eventdata, handles)
% hObject    handle to slider22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider23_Callback(hObject, eventdata, handles)
% hObject    handle to slider23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CrossoverAnalyzerF(handles);
