function varargout = MotoneuronMorphoLogy(varargin)
global major minor;
global me number_of_proximal_dendrites name_of_sibling_dendrites diam length start_point end_point total_number_of_dendrites_per_stem;
global me_ah child_ah axon_hillock_compartment_length diam_ah_segment start_point_ah end_point_ah number_of_axon_hillock_compartments;
global  number_of_initial_segment_compartments me_is child_is start_point_is end_point_is IS_diam initial_segment_compartment_length;
global me_ap child_ap ap_diam axon_proper_compartment_length start_point_ap end_point_ap number_of_axon_proper_compartments;
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MotoneuronMorphoLogy_OpeningFcn, ...
                   'gui_OutputFcn',  @MotoneuronMorphoLogy_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MotoneuronMorphoLogy is made visible.
function MotoneuronMorphoLogy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MotoneuronMorphoLogy (see VARARGIN)

% Choose default command line output for MotoneuronMorphoLogy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes MotoneuronMorphoLogy wait for user response (see UIRESUME)
% uiwait(handles.figure1);
initialize_gui(hObject, handles)


% --- Outputs from this function are returned to the command line.
function varargout = MotoneuronMorphoLogy_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function minor_mean_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function minor_mean_Callback(hObject, eventdata, handles)
minor_mean = str2double(get(hObject, 'String'));
if isnan(minor_mean)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.minor_mean = minor_mean;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function minor_sd_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function minor_sd_Callback(hObject, eventdata, handles)
minor_sd = str2double(get(hObject, 'String'));
if isnan(minor_sd)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.minor_sd = minor_sd;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function major_mean_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function major_mean_Callback(hObject, eventdata, handles)
major_mean = str2double(get(hObject, 'String'));
if isnan(major_mean)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.major_mean = major_mean;
setappdata(gcbf, 'metricdata', data);

function major_sd_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function major_sd_Callback(hObject, eventdata, handles)
major_sd = str2double(get(hObject, 'String'));
if isnan(major_sd)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.major_sd = major_sd;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function AH_length_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function AH_length_Callback(hObject, eventdata, handles)
AH_length = str2double(get(hObject, 'String'));
if isnan(AH_length)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.AH_length = AH_length;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function IS_length_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function IS_length_Callback(hObject, eventdata, handles)
IS_length = str2double(get(hObject, 'String'));
if isnan(IS_length)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.IS_length = IS_length;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function AH_base_diam_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function AH_base_diam_Callback(hObject, eventdata, handles)
AH_base_diam = str2double(get(hObject, 'String'));
if isnan(AH_base_diam)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.AH_base_diam = AH_base_diam;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function IS_d_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function IS_d_Callback(hObject, eventdata, handles)
IS_d = str2double(get(hObject, 'String'));
if isnan(IS_d)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.IS_d = IS_d;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function proper_length_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function proper_length_Callback(hObject, eventdata, handles)
proper_length = str2double(get(hObject, 'String'));
if isnan(proper_length)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.proper_length = proper_length;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function proper_diam_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function proper_diam_Callback(hObject, eventdata, handles)
proper_diam = str2double(get(hObject, 'String'));
if isnan(proper_diam)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.proper_diam = proper_diam;
setappdata(gcbf, 'metricdata', data);


 
% --- Executes during object creation, after setting all properties.
function n_prox_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function n_prox_Callback(hObject, eventdata, handles)
n_prox = str2double(get(hObject, 'String'));
if isnan(n_prox)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.n_prox = n_prox;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function n_prox_sd_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function n_prox_sd_Callback(hObject, eventdata, handles)
n_prox_sd = str2double(get(hObject, 'String'));
if isnan(n_prox_sd)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.n_prox_sd = n_prox_sd;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function d_prox_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function d_prox_Callback(hObject, eventdata, handles)
d_prox = str2double(get(hObject, 'String'));
if isnan(d_prox)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.d_prox = d_prox;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function d_prox_sd_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function d_prox_sd_Callback(hObject, eventdata, handles)
d_prox_sd = str2double(get(hObject, 'String'));
if isnan(d_prox_sd)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.d_prox_sd = d_prox_sd;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function bmo_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function bmo_Callback(hObject, eventdata, handles)
bmo = str2double(get(hObject, 'String'));
if isnan(bmo)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.bmo = bmo;
setappdata(gcbf, 'metricdata', data);



% --- Executes during object creation, after setting all properties.
function bmo_sd_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function bmo_sd_Callback(hObject, eventdata, handles)
bmo_sd = str2double(get(hObject, 'String'));
if isnan(bmo_sd)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.bmo_sd = bmo_sd;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function Rratio_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function Rratio_Callback(hObject, eventdata, handles)
Rratio = str2double(get(hObject, 'String'));
if isnan(Rratio)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.Rratio = Rratio;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function Rratio_sd_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Rratio_sd_Callback(hObject, eventdata, handles)
Rratio_sd = str2double(get(hObject, 'String'));
if isnan(Rratio_sd)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.Rratio_sd = Rratio_sd;
setappdata(gcbf, 'metricdata', data);

% --- Executes during object creation, after setting all properties.
function proximal_dendrites_length_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function proximal_dendrites_length_Callback(hObject, eventdata, handles)
proximal_dendrites_length = str2double(get(hObject, 'String'));
if isnan(proximal_dendrites_length)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.proximal_dendrites_length=proximal_dendrites_length;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function distal_1_group_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function distal_1_group_Callback(hObject, eventdata, handles)
distal_1_group = str2double(get(hObject, 'String'));
if isnan(distal_1_group)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.distal_1_group=distal_1_group;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function distal_2_group_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function distal_2_group_Callback(hObject, eventdata, handles)
distal_2_group = str2double(get(hObject, 'String'));
if isnan(distal_2_group)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.distal_2_group=distal_2_group;
setappdata(gcbf, 'metricdata', data);


% --- Executes during object creation, after setting all properties.
function distal_3_group_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function distal_3_group_Callback(hObject, eventdata, handles)
distal_3_group = str2double(get(hObject, 'String'));
if isnan(distal_3_group)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.distal_3_group=distal_3_group;
setappdata(gcbf, 'metricdata', data);


%--- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
clear global
global major minor;
global me number_of_proximal_dendrites name_of_sibling_dendrites diam length start_point end_point total_number_of_dendrites;
global me_ah child_ah axon_hillock_compartment_length diam_ah_segment start_point_ah end_point_ah number_of_axon_hillock_compartments;
global  number_of_initial_segment_compartments me_is child_is start_point_is end_point_is IS_diam initial_segment_compartment_length;
global me_ap child_ap ap_diam axon_proper_compartment_length start_point_ap end_point_ap number_of_axon_proper_compartments;

data = getappdata(gcbf, 'metricdata');
[data.major, data.minor, data.mean_diameter, data.As]=soma(data.major_mean,data.major_sd,data.minor_mean,data.minor_sd);
[data.me_ah, data.child_ah, data.axon_hillock_compartment_length, data.diam_ah_segment, data.start_point_ah, data.end_point_ah, data.number_of_axon_hillock_compartments, data.number_of_initial_segment_compartments, data.me_is, data.child_is, data.start_point_is, data.end_point_is, data.IS_diam, data.initial_segment_compartment_length, data.me_ap, data.child_ap, data.ap_diam, data.axon_proper_compartment_length, data.start_point_ap, data.end_point_ap, data.number_of_axon_proper_compartments]=axon(data.major,data.minor,data.AH_base_diam,data.AH_length,data.IS_d,data.IS_length,data.proper_diam,data.proper_length);
[data.total_number_of_dendrites,data.number_of_proximal_dendrites,data.knots,data.number_of_distal_dendrites,data.number_of_sibling_dendrites,data.name_of_sibling_dendrites,data.parent,data.length,data.diam,data.start_point,data.end_point,data.Ad,data.order,data.n_end,data.total_dendritic_length,data.me]=dendrites(data.major,data.minor,data.As,data.n_prox, data.n_prox_sd, data.d_prox, data.d_prox_sd, data.bmo, data.bmo_sd, data.Rratio, data.Rratio_sd,data.proximal_dendrites_length,data.distal_1_group,data.distal_2_group,data.distal_3_group);
setappdata(gcbf, 'metricdata', data);
major=data.major;
minor=data.minor;
me=data.me;
number_of_proximal_dendrites=data.number_of_proximal_dendrites;
name_of_sibling_dendrites=data.name_of_sibling_dendrites;
diam=data.diam;
length=data.length;
start_point=data.start_point(:,1:3,:);
end_point=data.end_point(:,1:3,:);
total_number_of_dendrites=data.total_number_of_dendrites;
me_ah=data.me_ah;
child_ah=data.child_ah;
axon_hillock_compartment_length=data.axon_hillock_compartment_length;
diam_ah_segment=data.diam_ah_segment;
start_point_ah=data.start_point_ah;
end_point_ah=data.end_point_ah;
number_of_axon_hillock_compartments=data.number_of_axon_hillock_compartments;
number_of_initial_segment_compartments=data.number_of_initial_segment_compartments;
me_is=data.me_is;
child_is=data.child_is;
start_point_is=data.start_point_is;
end_point_is=data.end_point_is;
IS_diam=data.IS_diam;
initial_segment_compartment_length=data.initial_segment_compartment_length;
me_ap=data.me_ap;
child_ap=data.child_ap;
ap_diam=data.ap_diam;
axon_proper_compartment_length=data.axon_proper_compartment_length;
start_point_ap=data.start_point_ap;
end_point_ap=data.end_point_ap;
number_of_axon_proper_compartments=data.number_of_axon_proper_compartments;

data = getappdata(gcbf, 'metricdata');
[data.x_dend,data.y_dend,data.radius,data.relative_complexity]=dendrogram(data.total_number_of_dendrites,data.number_of_proximal_dendrites,data.knots,data.number_of_distal_dendrites,data.number_of_sibling_dendrites, data.name_of_sibling_dendrites, data.parent, data.length, data.diam, data.start_point, data.end_point);
setappdata(gcbf, 'metricdata', data);



axes(handles.axes1)
cla;
plot(data.radius,data.relative_complexity,'.k');
xlabel('\fontname{Arial}\fontsize{10}\mum');
ylabel('\fontname{Arial}\fontsize{10}% of intersections');


axes(handles.axes2)
cla;
for j=1:data.number_of_proximal_dendrites    
    for i=1:data.total_number_of_dendrites(j)
        hold on;
        rectangle('position',[data.x_dend(i,j),data.y_dend(i,j),data.length(i,j),data.diam(i,j)],'FaceColor','b','EdgeColor','r');
     end
end
xlabel('\fontname{Arial}\fontsize{10}\mum');
ylabel('\fontname{Arial}\fontsize{10}\mum');
figure(2);
for j=1:data.number_of_proximal_dendrites    
    for i=1:data.total_number_of_dendrites(j)
        hold on;
        rectangle('position',[data.x_dend(i,j),data.y_dend(i,j),data.length(i,j),data.diam(i,j)],'FaceColor','b','EdgeColor','r');
     end
end

str_soma_area=num2str(data.As,'%9.2f');
str_dendritic_area=num2str(data.Ad,'%9.2f');
str_AdAs=num2str(data.Ad/data.As,'%3.1f');
str_total_dend_length=num2str(data.total_dendritic_length,'%9.2f')
set(handles.soma_area,'String',str_soma_area);
set(handles.dendritic_area,'String',str_dendritic_area);
set(handles.total_dendritic_length,'String',str_total_dend_length);
set(handles.AdAs,'String',str_AdAs);

set(handles.text69,'String','somatic area');
set(handles.text70,'String','dendritic area');
set(handles.text71,'String','dendritic area / somatic area');
set(handles.text72,'String','combined dend. length');

set(handles.text73,'String','mkm^2');
set(handles.text74,'String','mkm^2');
set(handles.text75,'String','mkm');


handles.output = hObject;
guidata(hObject, handles);



handles.output = hObject;
guidata(hObject, handles);


outrelcomp=[data.radius(:),data.relative_complexity(:)];
save('relcomp.dat','outrelcomp','-ASCII');

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
initialize_gui(gcbf, handles);

function initialize_gui(fig_handle, handles)
data.minor_mean = 19.6;
data.minor_sd = 5.5;
data.major_mean = 31.51;
data.major_sd = 8.28;

data.AH_base_diam=3;
data.AH_length=8;
data.IS_d=0.8;
data.IS_length=10;
data.proper_diam=0.8;
data.proper_length=500;

data.n_prox=6.3;
data.n_prox_sd=1.8;
data.d_prox=3.16;
data.d_prox_sd=1.42;
data.bmo=5.1;
data.bmo_sd=1.3;
data.Rratio=0.89;
data.Rratio_sd=0.13;

data.proximal_dendrites_length=25;
data.distal_1_group=20;
data.distal_2_group=30;
data.distal_3_group=250;

setappdata(fig_handle, 'metricdata', data);

set(handles.minor_mean, 'String', data.minor_mean);
set(handles.minor_sd, 'String', data.minor_sd);
set(handles.major_mean, 'String', data.major_mean);
set(handles.major_sd, 'String', data.major_sd);

set(handles.AH_base_diam,'String',data.AH_base_diam);
set(handles.AH_length, 'String',data.AH_length);
set(handles.IS_d, 'String',data.IS_d);
set(handles.IS_length, 'String',data.IS_length);
set(handles.proper_diam, 'String',data.proper_diam);
set(handles.proper_length, 'String',data.proper_length);

set(handles.n_prox,'String',data.n_prox);
set(handles.n_prox_sd,'String',data.n_prox_sd);
set(handles.d_prox,'String',data.d_prox);
set(handles.d_prox_sd,'String',data.d_prox_sd);
set(handles.bmo,'String',data.bmo);
set(handles.bmo_sd,'String',data.bmo_sd);
set(handles.Rratio,'String',data.Rratio);
set(handles.Rratio_sd,'String',data.Rratio_sd);

set(handles.proximal_dendrites_length,'String',data.proximal_dendrites_length);
set(handles.distal_1_group,'String',data.distal_1_group);
set(handles.distal_2_group,'String',data.distal_2_group);
set(handles.distal_3_group,'String',data.distal_3_group);

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
delete(MotoneuronMorphoLogy);
delete(To_NEURON);

% --- Executes on button press in Report.
function Report_Callback(hObject, eventdata, handles)
T=NOW;
Run_time=datestr(T);
data = getappdata(gcbf, 'metricdata');
soma_report=[data.major, data.minor, data.mean_diameter, data.As];
dendrites_report=[data.Ad,data.Ad/data.As,data.order,data.number_of_proximal_dendrites,data.n_end,data.total_dendritic_length];
fid=fopen('Report.doc','a');
fseek(fid,0,'eof');
if (ftell(fid)~=0)
    fprintf(fid,'\n\n');
end

fprintf(fid,'Soma report  '); fprintf(fid,Run_time);
fprintf(fid,'\n\n');
fprintf(fid,'major axes, mkm      %3.1f',soma_report(1));
fprintf(fid,'\n');
fprintf(fid,'minor axes, mkm      %3.1f',soma_report(2));
fprintf(fid,'\n');
fprintf(fid,'mean diameter, mkm   %3.1f',soma_report(3));
fprintf(fid,'\n');
fprintf(fid,'somatic area, mkm^2 %5.0f',soma_report(4));
fprintf(fid,'\n\n');
fprintf(fid,'Dendrites report  ');
fprintf(fid,'\n\n');
fprintf(fid,'dendritic area, mkm^2  %4.0f',dendrites_report(1));
fprintf(fid,'\n\');
fprintf(fid,'Ad/As                   %2.1f',dendrites_report(2));
fprintf(fid,'\n\');
fprintf(fid,'bmo                       %2.1f',dendrites_report(3));
fprintf(fid,'\n\');
fprintf(fid,'n-Prox                   %2.0f',dendrites_report(4));
fprintf(fid,'\n\');
fprintf(fid,'n-End                     %2.0f',dendrites_report(5));
fprintf(fid,'\n\');
fprintf(fid,'l-Tot, mkm             %5.0f',dendrites_report(6));

status=fclose(fid);


% --- Executes on button press in NEURON.
function NEURON_Callback(hObject, eventdata, handles)
pos_size = get(handles.figure1,'Position');
To_NEURON;

% --- Executes on button press in Save_settings.
function Save_settings_Callback(hObject, eventdata, handles)
T=NOW;
Run_time=datestr(T);
data = getappdata(gcbf, 'metricdata');
soma_save=[data.major_mean,data.major_sd, data.minor_mean, data.minor_sd];
axon_save=[data.AH_base_diam,data.AH_length,data.IS_d,data.IS_length,data.proper_diam,data.proper_length];
proximal_save=[data.n_prox, data.n_prox_sd, data.d_prox, data.d_prox_sd];
distal_save=[data.bmo, data.bmo_sd, data.Rratio, data.Rratio_sd];
lengths_save=[data.proximal_dendrites_length,data.distal_1_group,data.distal_2_group,data.distal_3_group];
fid=fopen('Settings.doc','a');
fseek(fid,0,'eof');
if (ftell(fid)~=0)
    fprintf(fid,'\n\n');
end

fprintf(fid,'Soma axes  '); fprintf(fid,Run_time);
fprintf(fid,'\n\n');
fprintf(fid,'major mean, mkm      %3.1f',soma_save(1));
fprintf(fid,'\n');
fprintf(fid,'major sd, mkm         %3.1f',soma_save(2));
fprintf(fid,'\n');
fprintf(fid,'minor mean, mkm      %3.1f',soma_save(3));
fprintf(fid,'\n'); 
fprintf(fid,'minor sd, mkm         %3.1f',soma_save(4));
fprintf(fid,'\n\n');
fprintf(fid,'Axon  ');
fprintf(fid,'\n\n');
fprintf(fid,'AH dase diameter, mkm        %3.1f',axon_save(1));
fprintf(fid,'\n');
fprintf(fid,'AH length, mkm               %3.1f',axon_save(2));
fprintf(fid,'\n');
fprintf(fid,'IS diameter, mkm             %3.1f',axon_save(3));
fprintf(fid,'\n');
fprintf(fid,'IS length, mkm              %3.1f',axon_save(4));
fprintf(fid,'\n');
fprintf(fid,'Proper diameter, mkm         %3.1f',axon_save(5));
fprintf(fid,'\n');
fprintf(fid,'Proper length, mkm         %3.1f',axon_save(6));
fprintf(fid,'\n\n');
fprintf(fid,'Dendrites  ');
fprintf(fid,'\n\n');
fprintf(fid,'Proximal  ');
fprintf(fid,'\n');
fprintf(fid,'number of prox. dend.            %3.0f',proximal_save(1));
fprintf(fid,'\n');
fprintf(fid,'number of prox. dend. sd         %3.0f',proximal_save(2));
fprintf(fid,'\n');
fprintf(fid,'diameter of prox. dend., mkm       %3.2f',proximal_save(3));
fprintf(fid,'\n');
fprintf(fid,'diameter of prox. dend. sd, mkm    %3.2f',proximal_save(4));
fprintf(fid,'\n\n');
fprintf(fid,'Distal  ');
fprintf(fid,'\n');
fprintf(fid,'bmo                 %3.0f',distal_save(1));
fprintf(fid,'\n');
fprintf(fid,'bmo sd              %3.0f',distal_save(2));
fprintf(fid,'\n');
fprintf(fid,'Rall`s ratio          %3.2f',distal_save(3));
fprintf(fid,'\n');
fprintf(fid,'Rall`s ratio sd       %3.2f',distal_save(4));
fprintf(fid,'\n\n');
fprintf(fid,'Maximal Lengths  ');
fprintf(fid,'\n');
fprintf(fid,'proximal dendrites, mkm            %3.2f',lengths_save(1));
fprintf(fid,'\n');
fprintf(fid,'distal first group, mkm            %3.2f',lengths_save(2));
fprintf(fid,'\n');
fprintf(fid,'distal second group, mkm           %3.2f',lengths_save(3));
fprintf(fid,'\n');
fprintf(fid,'distal third group, mkm            %3.2f',lengths_save(4));

status=fclose(fid);


% --- Executes on button press in multiple_start.
function multiple_start_Callback(hObject, eventdata, handles)
% hObject    handle to multiple_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
for i=1:500
    Start_Callback(hObject, eventdata, handles)
    close('1'); close('2');
    Report_Callback(hObject, eventdata, handles)
    data = getappdata(gcbf, 'metricdata');
    mean_som_area(i)=data.As;
    mean_som=sum(mean_som_area)/i
    soma_sd=std(mean_som_area)
    mean_dend_area(i)=data.Ad;
    mean_dend=sum(mean_dend_area)/i
    dend_sd=std(mean_dend_area)
    mean_Ad_As(i)=data.Ad/data.As;
    mean_Ad_As_screen=sum(mean_Ad_As)/i
    Ad_As_sd=std(mean_Ad_As)
    mean_bmo(i)=data.bmo;
    mean_bmo_screen=sum(mean_bmo)/i
    bmo_sd=std(mean_bmo)
    mean_n_end(i)=data.n_end;
    mean_n_end_screen=sum(mean_n_end)/i
    n_end_sd=std(mean_n_end)
    mean_total_dendritic_length(i)=data.total_dendritic_length;
    mean_total_dendritic_length_screen=sum(mean_total_dendritic_length)/i
    mean_total_dendritic_length_sd=std(mean_total_dendritic_length)
    i
end

