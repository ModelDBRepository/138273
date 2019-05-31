function [x,y,radius,relative_complexity]=dendrogram(total_number_of_dendrites,number_of_proximal_dendrites,knots,number_of_distal_dendrites,number_of_sibling_dendrites, name_of_sibling_dendrites, parent, length, diam,start_point, end_point)


for j=1:number_of_proximal_dendrites
    number_of_sibling_dendrites(number_of_distal_dendrites(j)+1:total_number_of_dendrites(j),j)=0;
    name_of_sibling_dendrites(number_of_distal_dendrites(j)+1:total_number_of_dendrites(j),:,j)=0;
    
for i=1:knots(j)
    dend_name(i,j)=max(name_of_sibling_dendrites(i,:,j))-number_of_sibling_dendrites(i,j)+1;
    x(1,j)=0;
    y(1,j)=0;    
    if number_of_sibling_dendrites(parent(dend_name(i,j),j),j)==1
        x(dend_name(i,j),j)=x(parent(dend_name(i,j),j),j)+length(parent(dend_name(i,j),j),j);
        y(dend_name(i,j),j)=y(parent(dend_name(i,j),j),j)+0.5*diam(parent(dend_name(i,j),j),j)-0.5*diam(dend_name(i,j),j);
    elseif number_of_sibling_dendrites(parent(dend_name(i,j),j),j)==2
        if number_of_sibling_dendrites(dend_name(i,j),j)>1
            dend_name_next_min(dend_name(i,j),j)=max(name_of_sibling_dendrites(dend_name(i,j),:,j)-number_of_sibling_dendrites(dend_name(i,j),j)+1);
            dend_name_next_max(dend_name(i,j),j)=max(name_of_sibling_dendrites(dend_name(i,j),:,j));
            max_diam(dend_name(i,j),j)=max(diam(dend_name_next_min(dend_name(i,j),j):dend_name_next_max(dend_name(i,j),j),j));
        else
            max_diam(dend_name(i,j),j)=0;
        end
        if number_of_sibling_dendrites(dend_name(i,j)+1,j)>1
            dend_name_next_min(dend_name(i,j)+1,j)=max(name_of_sibling_dendrites(dend_name(i,j)+1,:,j)-number_of_sibling_dendrites(dend_name(i,j)+1,j)+1);
            dend_name_next_max(dend_name(i,j)+1,j)=max(name_of_sibling_dendrites(dend_name(i,j)+1,:,j));
            max_diam(dend_name(i,j)+1,j)=max(diam(dend_name_next_min(dend_name(i,j)+1,j):dend_name_next_max(dend_name(i,j)+1,j),j));
        else
            max_diam(dend_name(i,j)+1,j)=0;
        end
        x(dend_name(i,j),j)=x(parent(dend_name(i,j),j),j)+length(parent(dend_name(i,j),j),j);
        y(dend_name(i,j),j)=y(parent(dend_name(i,j),j),j)-2.5*diam(dend_name(i,j),j)-max_diam(dend_name(i,j),j)/2;
        x(dend_name(i,j)+1,j)=x(parent(dend_name(i,j),j),j)+length(parent(dend_name(i,j),j),j);
        y(dend_name(i,j)+1,j)=y(parent(dend_name(i,j),j),j)+2.5*diam(parent(dend_name(i,j),j),j)+max_diam(dend_name(i,j)+1,j)/2;
    end    
end
end

for j=1:number_of_proximal_dendrites
y(:,j)=y(:,j)+abs(min(y(:,j)))+5;
max_y(j)=max(y(:,j));
end

for j=2:number_of_proximal_dendrites
    y(:,j)=y(:,j)+max_y(j-1)+max(diam(:,j));
    max_y(j)=max(y(:,j));
end

for nsd=1:number_of_proximal_dendrites
    j=1;
    for i=1:number_of_distal_dendrites(nsd)+1
        if number_of_sibling_dendrites(i,nsd)==0
            name_terminal(j,nsd)=i;
            n=1;
        else
            n=0;
        end
        j=j+1*n;
    end
end

for npd=1:number_of_proximal_dendrites
    for i=1:total_number_of_dendrites(npd)
        start_point_R(i,npd)=sqrt(start_point(i,1,npd)^2+start_point(i,2,npd)^2+start_point(i,3,npd)^2);
        end_point_R(i,npd)=sqrt(end_point(i,1,npd)^2+end_point(i,2,npd)^2+end_point(i,3,npd)^2);
    end
end
all_dendrites=sum(total_number_of_dendrites(:));
max_x_relative=max(abs(end_point_R(:,npd)));
max_y_relative=max(abs(end_point_R(:,npd)));
max_z_relative=max(abs(end_point_R(:,npd)));
max_distance=sqrt(max_x_relative^2+max_y_relative^2+max_z_relative^2);

for r=1:20:max_distance*2
relative(r)=0;
    for npd=1:number_of_proximal_dendrites
        for i=1:total_number_of_dendrites(npd)
            if (start_point_R(i,npd)<=r) && (end_point_R(i,npd)>r)
                relative(r)=relative(r)+1;
            end
        end
    end
    radius(r)=r;
    relative_complexity(r)=relative(r)*100/all_dendrites;
end