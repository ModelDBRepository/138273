function  [total_number_of_dendrites,number_of_proximal_dendrites,knots,number_of_distal_dendrites,number_of_sibling_dendrites,name_of_sibling_dendrites, parent, length, diam, start_point,end_point,Ad,order,n_end,total_dendritic_length,me]=dendrites(major,minor,As,n_Prox,n_Prox_sd,d_Prox,d_Prox_sd,bmo,bmo_sd,Rratio,Rratio_sd,proximal_dendrites_length,distal_1_group,distal_2_group,distal_3_group) 
% Dendritic tree modeling
% n_Prox and n_Prox_sd, mean number of proximal dendrites and it's standart deviation; 
% d_Prox and d_Prox_sd, mean diameter of proximal dendrites and it's standart deviation;
% bmo and bmo_sd, mean branching maximal order and it's standart deviation;
% Rratio and Rratio_sd, Rall's ratio and it's standart deviation.


if -((n_Prox<=0) | (n_Prox_sd<0) | (d_Prox<=0) | (d_Prox_sd<0) | (bmo<=0) |(bmo_sd<0) | (Rratio<=0) | (Rratio_sd<=0) | (proximal_dendrites_length<=0) | (distal_1_group<=0) | (distal_2_group<=0) | (distal_3_group<=0))
    error('incorrect dednrites argument');
end

rand('state',sum(100*clock));

% number of proximal dendrites
% diameter of proximal dendrites

req0=0;
req1=0;
while (req0==0 | req1==0)
    clear branching_points diam n_end number_of_proximal_dendrites;
    number_of_proximal_dendrites=round(randn*n_Prox_sd+n_Prox);
    branching_points(1,1:number_of_proximal_dendrites)=round((bmo_sd*randn([1,number_of_proximal_dendrites])+bmo-1).*rand(1,number_of_proximal_dendrites));
    diam(1,1:number_of_proximal_dendrites)=randn(1,number_of_proximal_dendrites)*d_Prox_sd+d_Prox;
    for npd=1:number_of_proximal_dendrites
        n_end(1,npd)=sum(branching_points(1,npd))+1;
    end
    %if number_of_proximal_dendrites==1
     %   req0=1;
      %  req1=1;
    if (number_of_proximal_dendrites>=2)&(sum(diam(1,:))>=(0.68*(major+minor)/2+6.24-5.4))&(sum(diam(1,:))<=(0.68*(major+minor)/2+6.24+5.4))&(diam(1,:)>0.5)&(branching_points(1,:)>0)&(n_end(1,:)>=(1.26*diam(1,:)-2.43-0.61*2.6))&(n_end(1,:)<=(1.26*diam(1,:)-2.43+0.61*2.6))
        req0=1; 
        req1=1;
    else req0=0;
        req1=0;
    end
    npd=number_of_proximal_dendrites;
end

% dendritic tree for each proximal dendrite     
for npd=1:number_of_proximal_dendrites
    
    % number of bifurcations 
    % choice between bifurcation or bias
    % naming of sibling dendrites and noting of parent dendrite.
    number_of_distal_dendrites(npd)=0;
    bp(npd)=0; 
    i=1;
    while (bp(npd)<branching_points(npd))
        knots(npd)=i;
        number_of_sibling_dendrites(i,npd)=round(rand)+1;
    %    number_of_sibling_dendrites(i,npd)=2;
        number_of_distal_dendrites(npd)=number_of_distal_dendrites(npd)+number_of_sibling_dendrites(i,npd);
        if (number_of_sibling_dendrites(i,npd)==1)
            bp(npd)=bp(npd);
        else bp(npd)=bp(npd)+1;
        end
        for j=1:number_of_sibling_dendrites(i,npd)
            name_of_sibling_dendrites(i,j,npd)=(sum(number_of_sibling_dendrites(:,npd))-number_of_sibling_dendrites(i,npd)+j+1);
            parent((name_of_sibling_dendrites(i,j,npd)),npd)=i;
        end
        i=i+1;
    end
    
    % calculation of total number of dendrites and dendritic terminals
    total_number_of_dendrites(npd)=number_of_distal_dendrites(npd)+1;
    dendritic_terminals(npd)=total_number_of_dendrites(npd)-max(parent(:,npd));
    
    num=0;
    for i=1:total_number_of_dendrites(npd)               
            if i~=parent(:,npd)
                num=num+1;
                terminal_name(num,npd)=i;
            end        
    end
    
    % coordinates of proximal dendrites
    for i=1         
	    for k=1:3
            start_point(i,k,npd)=0;
    		end_point(i,k,npd)=start_point(i,k,npd)+rand*proximal_dendrites_length/sqrt(3)+0.01;
    		coord(i,k,npd)=end_point(i,k,npd)-start_point(i,k,npd);
    	end
        
    	length(i,npd)=sqrt(coord(i,1,npd).^2+coord(i,2,npd).^2+coord(i,3,npd).^2);
    	cosa(i,npd)=coord(i,1,npd)/length(i,npd);
    	cosb(i,npd)=coord(i,2,npd)/length(i,npd);
    	cosg(i,npd)=coord(i,3,npd)/length(i,npd);
    	p(i,npd)=end_point(i,1,npd)*cosa(i,npd)+end_point(i,2,npd)*cosb(i,npd)+end_point(i,3,npd)*cosg(i,npd);
    end

    % coordinates of all distal dendrites in a tree
    i=2;
    while i<=total_number_of_dendrites(npd)
    	if (i*100/total_number_of_dendrites(npd))<=33
        	koeff=distal_1_group/sqrt(3);
	    elseif ((i*100/total_number_of_dendrites(npd))<=66) && ((i*100/total_number_of_dendrites(npd))>33)
        	koeff=distal_2_group/sqrt(3);
    	else
        	koeff=distal_3_group/sqrt(3);
    	end 

    	for k=1:3
    		start_point(i,k,npd)=end_point(parent(i,npd),k,npd);
    		end_point(i,k,npd)=rand*koeff+start_point(i,k,npd);
    		coord(i,k,npd)=end_point(i,k,npd)-start_point(i,k,npd);
    	end
 
    	length(i,npd)=abs(sqrt(coord(i,1,npd).^2+coord(i,2,npd).^2+coord(i,3,npd).^2));
    	cosa(i,npd)=coord(i,1,npd)/length(i,npd);
    	cosb(i,npd)=coord(i,2,npd)/length(i,npd);
    	cosg(i,npd)=coord(i,3,npd)/length(i,npd);
    	p(i,npd)=end_point(i,1,npd)*cosa(i,npd)+end_point(i,2,npd)*cosb(i,npd)+end_point(i,3,npd)*cosg(i,npd);
        distance_from_parent_plane(i,npd)=end_point(i,1,npd)*cosa((parent(i,npd)),npd)+end_point(i,2,npd)*cosb((parent(i,npd)),npd)+end_point(i,3,npd)*cosg((parent(i,npd)),npd)-p((parent(i,npd)),npd);

        % request for >=90 degrees between parent and sibling dendrites        
    	if (distance_from_parent_plane(i,npd)>=0) && (length(i,npd)>0)
    		n=1;
    	else n=0;
    	end
    i=i+1*n;
    end
    
       
   % dendritic diameters following the Rall's ratio. 
    for i=1:knots(npd)
        maxn(i,npd)=max(name_of_sibling_dendrites(i,:,npd));    
        minn(i,npd)=maxn(i,npd)-number_of_sibling_dendrites(i,npd)+1;
        req=0;
        while req==0
            for n=minn(i,npd):maxn(i,npd)                
                diam(n,npd)=diam((parent(n,npd)),npd)*0.4+rand*0.6;
                diam_Rall(n,npd)=(diam(n,npd)).^(3/2);
            end
            if number_of_sibling_dendrites(i,npd)==1
                req=1;
            elseif number_of_sibling_dendrites(i,npd)==2
                Ralls_ratio(i,npd)=sum(diam_Rall((minn(i,npd):maxn(i,npd)),npd))/(diam((parent(maxn(i,npd),npd)),npd)).^(3/2);
                if (Ralls_ratio(i,npd)>=(Rratio-2.6*Rratio_sd)) & (Ralls_ratio(i,npd)<=(Rratio+2.6*Rratio_sd)) & diam(minn(i,npd):maxn(i,npd),npd)>0               
                    req=1;                
                else
                    req=0;
                end
            end
        end
    end
end


% 3D motoneuron

% dendritic trees direction
shift_koeff=(number_of_proximal_dendrites)/2;    


for npd=1:number_of_proximal_dendrites
    for j=1:total_number_of_dendrites(npd)  
        start_point(j,4,npd)=1;
        end_point(j,4,npd)=2;
        theta_z(npd)=2*pi*(npd-1)/shift_koeff;
        theta_x(npd)=pi*(npd-1)/shift_koeff;
        R_z_theta=[cos(theta_z(npd)) sin(theta_z(npd)) 0 0; -sin(theta_z(npd)) cos(theta_z(npd)) 0 0; 0 0 1 0; 0 0 0 1];
        R_x_theta=[1 0 0 0; 0 cos(theta_x(npd)) sin(theta_x(npd)) 0; 0 -sin(theta_x(npd)) cos(theta_x(npd)) 0; 0 0 0 1];
        start_point(j,:,npd)=start_point(j,:,npd)*R_z_theta*R_x_theta;
        end_point(j,:,npd)=end_point(j,:,npd)*R_z_theta*R_x_theta;
    end
end

for npd=1:number_of_proximal_dendrites
    [theta(npd),phi(npd),R(npd)]=cart2sph(end_point(1,1,npd),end_point(1,2,npd),end_point(1,3,npd));
    Ellipsoid_surph(1:3,npd)=[(minor/2)*cos(theta(npd))*sin(phi(npd));(minor/2)*sin(theta(npd))*sin(phi(npd));(major/2)*cos(phi(npd))];
end

for npd=1:number_of_proximal_dendrites
    for j=1:total_number_of_dendrites(npd)
        start_point(j,1,npd)=start_point(j,1,npd)+(minor/2)*cos(theta(npd))*sin(pi/2-phi(npd));
        start_point(j,2,npd)=start_point(j,2,npd)+(minor/2)*sin(theta(npd))*sin(pi/2-phi(npd));
        start_point(j,3,npd)=start_point(j,3,npd)+(major/2)*cos(pi/2-phi(npd));
        end_point(j,1,npd)=end_point(j,1,npd)+(minor/2)*cos(theta(npd))*sin(pi/2-phi(npd));
        end_point(j,2,npd)=end_point(j,2,npd)+(minor/2)*sin(theta(npd))*sin(pi/2-phi(npd));
        end_point(j,3,npd)=end_point(j,3,npd)+(major/2)*cos(pi/2-phi(npd));
        
        coord_x(1:2,1,j,npd)=[start_point(j,1,npd);end_point(j,1,npd)];
	    coord_y(1:2,1,j,npd)=[start_point(j,2,npd);end_point(j,2,npd)];
	    coord_z(1:2,1,j,npd)=[start_point(j,3,npd);end_point(j,3,npd)];
        
        [X,Y,Z]=cylinder(1000*diam(j,npd)/2);
        X=X/1000; Y=Y/1000; Z=Z/1000;
        X(1:2,:)=[X(1,:)+coord_x(1,1,j,npd);X(2,:)+coord_x(2,1,j,npd)];
        Y(1:2,:)=[Y(1,:)+coord_y(1,1,j,npd);Y(2,:)+coord_y(2,1,j,npd)];
        Z(1:2,:)=[Z(1,:)+coord_z(1,1,j,npd);Z(2,:)+coord_z(2,1,j,npd)];
        me(j,npd)=j;
        % 3D tree surfaces        
        figure(1);
        axis square;
        hold on;
        surf(X,Y,Z);
        grid on;
        axis square;
     end    
end    

for npd=1:number_of_proximal_dendrites    
    for i=1:total_number_of_dendrites(npd)
        dendritic_membrane_surface(i,npd)=(2*pi*length(i,npd)*diam(i,npd)/2);
    end
    dendritic_membrane_surface_area_per_stem(npd)=sum(dendritic_membrane_surface(:,npd));
    dendritic_length_per_stem(npd)=sum(length(:,npd));
end

Ad=sum(dendritic_membrane_surface_area_per_stem(:));
n_end=sum(dendritic_terminals(:));
total_dendritic_length=sum(dendritic_length_per_stem(:));

% calculation of dendritic order
for npd=1:number_of_proximal_dendrites
    for nt=min(terminal_name(:,npd)):max(terminal_name(:,npd))
        i=1;
        dend_term=nt;
        while dend_term>1
            dend_term=parent(dend_term,npd);
            if (number_of_sibling_dendrites(dend_term,npd)==2)
            i=i+1;            
            end
        end
        order_all(nt+1-min(terminal_name(:,npd)),npd)=i;
    end
order_npd(npd)=max(order_all(:,npd));
end
order=max(order_npd(:));