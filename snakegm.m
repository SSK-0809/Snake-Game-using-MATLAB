function varargout = snakegm(varargin)
% SNAKEGM MATLAB code for snakegm.fig
%      SNAKEGM, by itself, creates a new SNAKEGM or raises the existing
%      singleton*.
%
%      H = SNAKEGM returns the handle to a new SNAKEGM or the handle to
%      the existing singleton*.
%
%      SNAKEGM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SNAKEGM.M with the given input arguments.
%
%      SNAKEGM('Property','Value',...) creates a new SNAKEGM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before snakegm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to snakegm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help snakegm

% Last Modified by GUIDE v2.5 04-Jul-2024 17:27:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @snakegm_OpeningFcn, ...
                   'gui_OutputFcn',  @snakegm_OutputFcn, ...
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


% --- Executes just before snakegm is made visible.
function snakegm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to snakegm (see VARARGIN)

% Choose default command line output for snakegm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes snakegm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = snakegm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
start_game_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if~(direction==4)
    direction=2;
    move_status=1;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if~(direction==3)
    direction=1;
      move_status=1;
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if~(direction==2)
    direction=4;
      move_status=1;
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if ~(direction==1)
    direction=3;
    move_status=1;
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global move_status;
move_status=0;

% --- Executes on button press in  pushbutton6.
function  pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global mat_r mat_g mat_b;
global direction;direction=2;
  global points;points=0;
global move_status; move_status=0;
t=0.1;  

locx = [50 50 50 50 50 50 50 50 50 50];
locy = [60 61 62 63 64 65 66 67 68 69]; 

mat_r = zeros(100, 100);
mat_g = zeros(100, 100);
mat_b = zeros(100, 100);
update_snake(locx,locy);

while(1)
    pt_x=randperm(size(mat_r,1),1);
    pt_y=randperm(size(mat_r,1),1);
    if sum(locx==pt_x & locy==pt_y)==0
        break;
         end
end
mat_r(pt_x,pt_y)=255;
mat_g(pt_x,pt_y)=255;
mat_b(pt_x,pt_y)=255;

imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
while(1)
    imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
    pause(t);
    if(move_status)
    len=length(locx);
    for i=1:len
        mat_r(locx(i), locy(i)) = 0;
        mat_g(locx(i), locy(i)) = 0;
        mat_b(locx(i), locy(i)) = 0;
    end
 if sum((locx(1)==pt_x) & (locy(1)==pt_y))==1
       locx(2:len+1)=locx(1:len);
            locy(2:len+1)=locy(1:len);
            while(1)
                 pt_x=randperm(size(mat_r,1),1);
                pt_y=randperm(size(mat_r,1),1);
                if sum(locx==pt_x & locy==pt_y)==0
                    break;
                end
                end
            mat_r(pt_x,pt_y)=255;
            mat_g(pt_x,pt_y)=255;
            mat_b(pt_x,pt_y)=255;
             points=points+1;
            set(handles.score,'String',num2str(points));
        else
            locx(2:len)=locx(1:len-1);
            locy(2:len)=locy(1:len-1);
        end
   
      if direction==1
             if locy(1)==100
                 locy(1)=1;
             else
                 locy(1)=locy(1)+1;
             end
         elseif direction==2
             if locx(1)==1
                 locx(1)=100;
             else 
                 locx(1)=locx(1)-1;
             end
         elseif direction==3
             if locy(1)==1
                 locy(1)=100;
             else
                 locy(1)=locy(1)-1;
             end
         elseif direction==4
             if locx(1)==100
                 locx(1)=1;
             else
                 locx(1)=locx(1)+1;
             end
         end
   if sum((locx(2:end)==locx(1)) & (locy(2:end)==locy(1)))
             mat_r(:,:)=255;
             mat_g(:,:)=0;
             mat_b(:,:)=0;
             imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             break;
         end
         update_snake(locx,locy);
         if points==5
             t=0.08;
         elseif points==10
             t=0.05;
         elseif points==15
             t=0.03;
         elseif points==30
             t=0.01;
         elseif points==50
             t=0.008;
         end
    end
end

% --- Executes on button press in E pushbutton7.
function  pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% Update snake function
function update_snake(locx,locy)
    global mat_r mat_g mat_b;
    mat_r(locx(1), locy(1)) = 255;
    mat_g(locx(1), locy(1)) = 0;
    mat_b(locx(1), locy(1)) = 0;

    for i = 2:length(locx)
        mat_r(locx(i), locy(i)) = 0;
        mat_g(locx(i), locy(i)) = 255;
        mat_b(locx(i), locy(i)) = 0;
    end

   % --- Executes on key release with focus on figure1 and none of its controls.
function figure1_KeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
switch(eventdata.Key)
    case 'uparrow'
        if ~(direction==4)
            direction=2;
            move_status=1;
        end
    case 'downarrow'
        if ~(direction==2)
            direction=4;
            move_status=1;
        end
    case 'rightarrow'
        if ~(direction==3)
            direction=1;
            move_status=1;
        end
    case 'leftarrow'
        if ~(direction==1)
            direction=3;
            move_status=1;
        end
          case 'return'
        move_status=0;
    otherwise
        direction=direction;
        move_status=1;
end