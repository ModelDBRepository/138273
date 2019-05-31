function varargout = To_NEURON(varargin)
global major minor;
global me number_of_proximal_dendrites name_of_sibling_dendrites diam length start_point end_point total_number_of_dendrites_per_stem;
global me_ah child_ah axon_hillock_compartment_length diam_ah_segment start_point_ah end_point_ah number_of_axon_hillock_compartments;
global  number_of_initial_segment_compartments me_is child_is start_point_is end_point_is IS_diam initial_segment_compartment_length;
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @To_NEURON_OpeningFcn, ...
                   'gui_OutputFcn',  @To_NEURON_OutputFcn, ...
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


% --- Executes just before To_NEURON is made visible.
function To_NEURON_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
initialize_cond_gui(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = To_NEURON_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


function Na_soma_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function Na_soma_dens_Callback(hObject, eventdata, handles)
Na_soma_dens = str2double(get(hObject, 'String'));
if isnan(Na_soma_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Na_soma_dens = Na_soma_dens;
setappdata(gcbf, 'metricdata', data);


function Na_prox_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Na_prox_dens_Callback(hObject, eventdata, handles)
Na_prox_dens = str2double(get(hObject, 'String'));
if isnan(Na_prox_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Na_prox_dens = Na_prox_dens;
setappdata(gcbf, 'metricdata', data);


function Na_distal_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Na_distal_dens_Callback(hObject, eventdata, handles)
Na_distal_dens = str2double(get(hObject, 'String'));
if isnan(Na_distal_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Na_distal_dens = Na_distal_dens;
setappdata(gcbf, 'metricdata', data);


function Na_AH_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Na_AH_dens_Callback(hObject, eventdata, handles)
Na_AH_dens = str2double(get(hObject, 'String'));
if isnan(Na_AH_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Na_AH_dens = Na_AH_dens;
setappdata(gcbf, 'metricdata', data);


function Na_IS_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Na_IS_dens_Callback(hObject, eventdata, handles)
Na_IS_dens = str2double(get(hObject, 'String'));
if isnan(Na_IS_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Na_IS_dens = Na_IS_dens;
setappdata(gcbf, 'metricdata', data);


function Na_proper_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function Na_proper_dens_Callback(hObject, eventdata, handles)
Na_proper_dens = str2double(get(hObject, 'String'));
if isnan(Na_proper_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Na_proper_dens = Na_proper_dens;
setappdata(gcbf, 'metricdata', data);


function Ka_soma_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Ka_soma_dens_Callback(hObject, eventdata, handles)
Ka_soma_dens = str2double(get(hObject, 'String'));
if isnan(Ka_soma_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Ka_soma_dens = Ka_soma_dens;
setappdata(gcbf, 'metricdata', data);


function Ka_prox_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Ka_prox_dens_Callback(hObject, eventdata, handles)
Ka_prox_dens = str2double(get(hObject, 'String'));
if isnan(Ka_prox_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Ka_prox_dens = Ka_prox_dens;
setappdata(gcbf, 'metricdata', data);


function Ka_distal_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Ka_distal_dens_Callback(hObject, eventdata, handles)
Ka_distal_dens = str2double(get(hObject, 'String'));
if isnan(Ka_distal_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Ka_distal_dens = Ka_distal_dens;
setappdata(gcbf, 'metricdata', data);

function Ka_AH_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Ka_AH_dens_Callback(hObject, eventdata, handles)
Ka_AH_dens = str2double(get(hObject, 'String'));
if isnan(Ka_AH_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Ka_AH_dens = Ka_AH_dens;
setappdata(gcbf, 'metricdata', data);


function Ka_IS_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Ka_IS_dens_Callback(hObject, eventdata, handles)
Ka_IS_dens = str2double(get(hObject, 'String'));
if isnan(Ka_IS_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Ka_IS_dens = Ka_IS_dens;
setappdata(gcbf, 'metricdata', data);


function Ka_proper_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Ka_proper_dens_Callback(hObject, eventdata, handles)
Ka_proper_dens = str2double(get(hObject, 'String'));
if isnan(Ka_proper_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Ka_proper_dens = Ka_proper_dens;
setappdata(gcbf, 'metricdata', data);


function Kdr_soma_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Kdr_soma_dens_Callback(hObject, eventdata, handles)
Kdr_soma_dens = str2double(get(hObject, 'String'));
if isnan(Kdr_soma_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Kdr_soma_dens = Kdr_soma_dens;
setappdata(gcbf, 'metricdata', data);


function Kdr_prox_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Kdr_prox_dens_Callback(hObject, eventdata, handles)
Kdr_prox_dens = str2double(get(hObject, 'String'));
if isnan(Kdr_prox_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Kdr_prox_dens = Kdr_prox_dens;
setappdata(gcbf, 'metricdata', data);

function Kdr_distal_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Kdr_distal_dens_Callback(hObject, eventdata, handles)
Kdr_distal_dens = str2double(get(hObject, 'String'));
if isnan(Kdr_distal_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Kdr_distal_dens = Kdr_distal_dens;
setappdata(gcbf, 'metricdata', data);

function Kdr_AH_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Kdr_AH_dens_Callback(hObject, eventdata, handles)
Kdr_AH_dens = str2double(get(hObject, 'String'));
if isnan(Kdr_AH_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Kdr_AH_dens = Kdr_AH_dens;
setappdata(gcbf, 'metricdata', data);


function Kdr_IS_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Kdr_IS_dens_Callback(hObject, eventdata, handles)
Kdr_IS_dens = str2double(get(hObject, 'String'));
if isnan(Kdr_IS_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Kdr_IS_dens = Kdr_IS_dens;
setappdata(gcbf, 'metricdata', data);

function Kdr_proper_dens_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Kdr_proper_dens_Callback(hObject, eventdata, handles)
Kdr_proper_dens = str2double(get(hObject, 'String'));
if isnan(Kdr_proper_dens)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
data = getappdata(gcbf, 'metricdata');
data.Kdr_proper_dens = Kdr_proper_dens;
setappdata(gcbf, 'metricdata', data);

function Vm_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Vm_Callback(hObject, eventdata, handles)
Vm = str2double(get(hObject, 'String'));
if isnan(Vm)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Vm = Vm;
setappdata(gcbf, 'metricdata', data);


function Cm_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Cm_Callback(hObject, eventdata, handles)
Cm = str2double(get(hObject, 'String'));
if isnan(Cm)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Cm = Cm;
setappdata(gcbf, 'metricdata', data);


function Rm_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function Rm_Callback(hObject, eventdata, handles)
Rm = str2double(get(hObject, 'String'));
if isnan(Rm)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Rm = Rm;
setappdata(gcbf, 'metricdata', data);


function Ra_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function Ra_Callback(hObject, eventdata, handles)
Ra = str2double(get(hObject, 'String'));
if isnan(Ra)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

data = getappdata(gcbf, 'metricdata');
data.Ra = Ra;
setappdata(gcbf, 'metricdata', data);

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
delete(To_NEURON);


% --- Executes on button press in Reset_Cond.
function Reset_Cond_Callback(hObject, eventdata, handles)
initialize_cond_gui(gcbf, handles);

function initialize_cond_gui(fig_handle, handles)
data.Na_soma_dens = 0;
data.Na_prox_dens = 0;
data.Na_distal_dens = 0;
data.Na_AH_dens = 0;
data.Na_IS_dens = 0;
data.Na_proper_dens = 0;

data.Ka_soma_dens = 0;
data.Ka_prox_dens = 0;
data.Ka_distal_dens = 0;
data.Ka_AH_dens = 0;
data.Ka_IS_dens = 0;
data.Ka_proper_dens = 0;

data.Kdr_soma_dens = 0;
data.Kdr_prox_dens = 0;
data.Kdr_distal_dens = 0;
data.Kdr_AH_dens = 0;
data.Kdr_IS_dens = 0;
data.Kdr_proper_dens = 0;

data.Vm=-70;
data.Cm=2.4;
data.Rm=5300;
data.Ra=87;

setappdata(fig_handle, 'metricdata', data);
set(handles.Na_soma_dens, 'String', data.Na_soma_dens);
set(handles.Na_prox_dens, 'String', data.Na_prox_dens);
set(handles.Na_distal_dens, 'String', data.Na_distal_dens);
set(handles.Na_AH_dens, 'String', data.Na_AH_dens);
set(handles.Na_IS_dens, 'String', data.Na_IS_dens);
set(handles.Na_proper_dens, 'String', data.Na_proper_dens);

set(handles.Ka_soma_dens, 'String', data.Ka_soma_dens);
set(handles.Ka_prox_dens, 'String', data.Ka_prox_dens);
set(handles.Ka_distal_dens, 'String', data.Ka_distal_dens);
set(handles.Ka_AH_dens, 'String', data.Ka_AH_dens);
set(handles.Ka_IS_dens, 'String', data.Ka_IS_dens);
set(handles.Ka_proper_dens, 'String', data.Ka_proper_dens);

set(handles.Kdr_soma_dens, 'String', data.Kdr_soma_dens);
set(handles.Kdr_prox_dens, 'String', data.Kdr_prox_dens);
set(handles.Kdr_distal_dens, 'String', data.Kdr_distal_dens);
set(handles.Kdr_AH_dens, 'String', data.Kdr_AH_dens);
set(handles.Kdr_IS_dens, 'String', data.Kdr_IS_dens);
set(handles.Kdr_proper_dens, 'String', data.Kdr_proper_dens);

set(handles.Vm, 'String', data.Vm);
set(handles.Cm, 'String', data.Cm);
set(handles.Rm, 'String', data.Rm);
set(handles.Ra, 'String', data.Ra);


function NEURON_code_Callback(hObject, eventdata, handles)
global major minor;
global me number_of_proximal_dendrites name_of_sibling_dendrites diam length start_point end_point total_number_of_dendrites;
global me_ah child_ah axon_hillock_compartment_length diam_ah_segment start_point_ah end_point_ah number_of_axon_hillock_compartments;
global  number_of_initial_segment_compartments me_is child_is start_point_is end_point_is IS_diam initial_segment_compartment_length;
global me_ap child_ap ap_diam axon_proper_compartment_length start_point_ap end_point_ap number_of_axon_proper_compartments;

path_current=cd;
mkdir('neuron');
path_current_name=strcat(path_current,'\neuron\');
name_file_soma=strcat(path_current_name,'common.dat');
soma=[major,minor];
save(name_file_soma,'soma','number_of_proximal_dendrites','-ASCII');

[rme,cme,nsdme]=size(me);
[rname,cname,nsdme]=size(name_of_sibling_dendrites);
name_of_sibling_dendrites(rname+1:rme,:,:)=0;

for npd=1:number_of_proximal_dendrites
name='tree';
postfix=num2str(npd);
name_file_tree=strcat(path_current_name,name,postfix,'.dat');
neuron(:,:,npd)=[me(:,npd) name_of_sibling_dendrites(:,:,npd) diam(:,npd) length(:,npd) start_point(:,:,npd) end_point(:,:,npd)];
neuron_file(:,:)=neuron(:,:,npd);
total_number_file=total_number_of_dendrites(npd);
save(name_file_tree,'total_number_file','neuron_file','-ASCII');
end

% save axon hillock for the Neuron 
axon_hillock=[me_ah,child_ah,diam_ah_segment,axon_hillock_compartment_length,start_point_ah,end_point_ah];
name_file_ah=strcat(path_current_name,'axonhillock.dat');
save(name_file_ah,'number_of_axon_hillock_compartments','axon_hillock','-ASCII');

% save initial segment for the Neuron 
initial_segment=[me_is,child_is,IS_diam,initial_segment_compartment_length,start_point_is,end_point_is];
name_file_is=strcat(path_current_name,'initialsegment.dat');
save(name_file_is,'number_of_initial_segment_compartments','initial_segment','-ASCII');

% save axon proper for the Neuron 
axon_proper=[me_ap,child_ap,ap_diam,axon_proper_compartment_length,start_point_ap,end_point_ap];
name_file_ap=strcat(path_current_name,'axonproper.dat');
save(name_file_ap,'number_of_axon_proper_compartments','axon_proper','-ASCII');

%save electrical properties
data = getappdata(gcbf, 'metricdata');
name_file_electrical=strcat(path_current_name,'electrical.dat');
neuron_characters=[number_of_proximal_dendrites,number_of_axon_hillock_compartments,number_of_initial_segment_compartments,number_of_axon_proper_compartments];
soma_elec_characters=[data.Vm,data.Cm,1/data.Rm,data.Ra,data.Na_soma_dens,data.Ka_soma_dens,data.Kdr_soma_dens];
prox_elec_characters=[data.Vm,data.Cm,1/data.Rm,data.Ra,data.Na_prox_dens,data.Ka_prox_dens,data.Kdr_prox_dens];
distal_elec_characters=[data.Vm,data.Cm,1/data.Rm,data.Ra,data.Na_distal_dens,data.Ka_distal_dens,data.Kdr_distal_dens];
AH_elec_characters=[data.Vm,data.Cm,1/data.Rm,data.Ra,data.Na_AH_dens,data.Ka_AH_dens,data.Kdr_AH_dens];
IS_elec_characters=[data.Vm,data.Cm,1/data.Rm,data.Ra,data.Na_IS_dens,data.Ka_IS_dens,data.Kdr_IS_dens];
proper_elec_characters=[data.Vm,data.Cm,1/data.Rm,data.Ra,data.Na_proper_dens,data.Ka_proper_dens,data.Kdr_proper_dens];
save(name_file_electrical,'neuron_characters','total_number_of_dendrites','soma_elec_characters','prox_elec_characters','distal_elec_characters','AH_elec_characters','IS_elec_characters','proper_elec_characters','-ASCII');



