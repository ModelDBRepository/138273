function [me_ah, child_ah, axon_hillock_compartment_length, diam_ah_segment, start_point_ah, end_point_ah, number_of_axon_hillock_compartments, number_of_initial_segment_compartments, me_is, child_is, start_point_is, end_point_is, IS_diam, initial_segment_compartment_length, me_ap, child_ap, ap_diam, axon_proper_compartment_length, start_point_ap, end_point_ap, number_of_axon_proper_compartments]=axon(major,minor,AH_base_diam, AH_length, IS_d, IS_length, proper_diam, proper_length)


% Model of the axon
%    axon(AH_base_diam, AH_length, IS_diam, IS_length, proper_diam, proper_length)
% The axon was simulated as a series of cylindrical compartments 
% (0.1 mkm length for the axon hillock and the initial segment and 10 mkm  
% length for the axon itself) attached to the soma surface.

if -((AH_base_diam<0) | (AH_length<0) | (IS_d<0) | (IS_length<0) | (proper_diam<0) | (proper_length<0))
    error('incorrect axon argument')
end

% Axon hillock
if (AH_length<0.1)
    number_of_axon_hillock_compartments=1;
    axon_hillock_compartment_length(1:number_of_axon_hillock_compartments)=0.1;
else number_of_axon_hillock_compartments=round(AH_length/0.1);
    axon_hillock_compartment_length(1:number_of_axon_hillock_compartments)=0.1;
end

for i=1:number_of_axon_hillock_compartments
    me_ah(i)=i;
    child_ah(i)=i+1;
    child_ah(number_of_axon_hillock_compartments)=0;

    if i==1
        start_point_ah(i,:)=[0,0,major/2];
        end_point_ah(i,:)=[0,0,major/2+axon_hillock_compartment_length(1)];
        diam_ah_segment(1)=AH_base_diam;
    else
        for k=1:3
            start_point_ah(i,k)=end_point_ah(i-1,k);
            end_point_ah(i,k)=start_point_ah(i,k);
        end
            end_point_ah(i,3)=start_point_ah(i,3)+axon_hillock_compartment_length(i);
            diam_ah_segment(i)=diam_ah_segment(i-1)-((AH_base_diam-IS_d)/number_of_axon_hillock_compartments);
    end        
end

for i=1:number_of_axon_hillock_compartments
    coord_x_ah(1:2,1,i)=[start_point_ah(i,1);end_point_ah(i,1)];
    coord_y_ah(1:2,1,i)=[start_point_ah(i,2);end_point_ah(i,2)];
    coord_z_ah(1:2,1,i)=[start_point_ah(i,3);end_point_ah(i,3)];
    [X_ah,Y_ah,Z_ah]=cylinder(diam_ah_segment(i)*1000);
    X_ah=X_ah/1000; Y_ah=Y_ah/1000; Z_ah=Z_ah/1000;
    X_ah(1:2,:)=[X_ah(1,:)+coord_x_ah(1,1,i);X_ah(2,:)+coord_x_ah(2,1,i)];
    Y_ah(1:2,:)=[Y_ah(1,:)+coord_y_ah(1,1,i);Y_ah(2,:)+coord_y_ah(2,1,i)];
    Z_ah(1:2,:)=[Z_ah(1,:)*axon_hillock_compartment_length(i)+coord_z_ah(1,1,i);Z_ah(2,:)*axon_hillock_compartment_length(i)+coord_z_ah(2,1,i)]; 
    hold on;
    surf(X_ah,Y_ah,Z_ah);
    grid on;
end

me_ah=flipud(rot90(me_ah));
child_ah=flipud(rot90(child_ah));
diam_ah_segment=flipud(rot90(diam_ah_segment));
axon_hillock_compartment_length=flipud(rot90(axon_hillock_compartment_length));

% Axon initial segment
if (IS_length<0.1)
    number_of_initial_segment_compartments=1;
    initial_segment_compartment_length(1:number_of_initial_segment_compartments)=0.1;
else number_of_initial_segment_compartments=round(IS_length/0.1);
    initial_segment_compartment_length(1:number_of_initial_segment_compartments)=0.1;
end
diam_is=IS_d;
for i=1:number_of_initial_segment_compartments;
    IS_diam(i)=diam_is;
    me_is(i)=i;
    child_is(i)=i+1;
    child_is(number_of_initial_segment_compartments)=0;
    if i==1
        start_point_is(i,:)=end_point_ah(number_of_axon_hillock_compartments,:);
        end_point_is(i,:)=[0,0,0];
        end_point_is(i,3)=start_point_is(i,3)+initial_segment_compartment_length(1);
    else
        for k=1:3
            start_point_is(i,k)=end_point_is(i-1,k);
            end_point_is(i,k)=start_point_is(i,k);
        end
            end_point_is(i,3)=start_point_is(i,3)+initial_segment_compartment_length(i);
    end        
end

for i=1:number_of_initial_segment_compartments;
    coord_x_is(1:2,1,i)=[start_point_is(i,1);end_point_is(i,1)];
    coord_y_is(1:2,1,i)=[start_point_is(i,2);end_point_is(i,2)];
    coord_z_is(1:2,1,i)=[start_point_is(i,3);end_point_is(i,3)];
    [X_is,Y_is,Z_is]=cylinder(IS_d*1000);
    X_is=X_is/1000;    Y_is=Y_is/1000;    Z_is=Z_is/1000;
    X_is(1:2,:)=[X_is(1,:)+coord_x_is(1,1,i);X_is(2,:)+coord_x_is(2,1,i)];
    Y_is(1:2,:)=[Y_is(1,:)+coord_y_is(1,1,i);Y_is(2,:)+coord_y_is(2,1,i)];
    Z_is(1:2,:)=[Z_is(1,:)*initial_segment_compartment_length(1)+coord_z_is(1,1,i);Z_is(2,:)*initial_segment_compartment_length(1)+coord_z_is(2,1,i)]; 
    hold on;
    surf(X_is,Y_is,Z_is);
    grid on;   
end

me_is=flipud(rot90(me_is));
child_is=flipud(rot90(child_is));
IS_diam=flipud(rot90(IS_diam));
initial_segment_compartment_length=flipud(rot90(initial_segment_compartment_length));


% Axon proper
if (proper_length<10)
    number_of_axon_proper_compartments=1;
    axon_proper_compartment_length(1:number_of_axon_proper_compartments)=10;
else number_of_axon_proper_compartments=round(proper_length/10);
    axon_proper_compartment_length(1:number_of_axon_proper_compartments)=10;
end

diam_proper=proper_diam;
for i=1:number_of_axon_proper_compartments;
    me_ap(i)=i;
    child_ap(i)=i+1;
    child_ap(number_of_axon_proper_compartments)=0;
    ap_diam(i)=diam_proper;
    if i==1
        start_point_ap(i,:)=end_point_is(number_of_initial_segment_compartments,:);
        end_point_ap(i,:)=[0,0,0];
        end_point_ap(i,3)=start_point_ap(i,3)+axon_proper_compartment_length(i);
    else
        for k=1:3
            start_point_ap(i,k)=end_point_ap(i-1,k);
            end_point_ap(i,k)=start_point_ap(i,k);
        end
            end_point_ap(i,3)=start_point_ap(i,3)+axon_proper_compartment_length(i);
    end        
end

for i=1:number_of_axon_proper_compartments;
    coord_x_ap(1:2,1,i)=[start_point_ap(i,1);end_point_ap(i,1)];
    coord_y_ap(1:2,1,i)=[start_point_ap(i,2);end_point_ap(i,2)];
    coord_z_ap(1:2,1,i)=[start_point_ap(i,3);end_point_ap(i,3)];
    [X_ap,Y_ap,Z_ap]=cylinder(proper_diam*1000);
    X_ap=X_ap/1000;    Y_ap=Y_ap/1000;    Z_ap=Z_ap/1000;
    X_ap(1:2,:)=[X_ap(1,:)+coord_x_ap(1,1,i);X_ap(2,:)+coord_x_ap(2,1,i)];
    Y_ap(1:2,:)=[Y_ap(1,:)+coord_y_ap(1,1,i);Y_ap(2,:)+coord_y_ap(2,1,i)];
    Z_ap(1:2,:)=[Z_ap(1,:)*axon_proper_compartment_length(1)+coord_z_ap(1,1,i);Z_ap(2,:)*axon_proper_compartment_length(1)+coord_z_ap(2,1,i)]; 
    hold on;
    surf(X_ap,Y_ap,Z_ap);
    grid on;   
end

me_ap=flipud(rot90(me_ap));
child_ap=flipud(rot90(child_ap));
ap_diam=flipud(rot90(ap_diam));
axon_proper_compartment_length=flipud(rot90(axon_proper_compartment_length));