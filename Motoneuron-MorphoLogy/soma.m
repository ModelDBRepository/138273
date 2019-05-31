function [major, minor, mean_diameter, As]=soma(major_mean, major_sd, minor_mean, minor_sd)
% Model of motoneuron soma
%      soma(major_mean, major_sd, minor_mean, minor_sd)
% For an appropriate soma reconstruction we chose soma representation 
% as an ellipse rotated around its major axis (prolate spheroid).
% The membrane surface area of the soma (As) was calculated by 
%
%        As=(pi*minor^2)/2+(pi*major*minor*asin(epsilon))/2*epsilon
%
% where major and minor denote the length of the major and minor axis,
% respectively, epsilon=sqrt((major^2-minor^2))/major.
% Somatic membrane 3D surface and report text file are generated after each run.
rand('state',sum(100*clock));

if (major_mean<minor_mean)
    error('major<minor');
elseif -((major_mean<=0) | (minor_mean<=0) | (major_sd<0) | (minor_sd<0))
    error('incorrect soma argument');
end
major=(randn*major_sd+major_mean);
minor=(randn*minor_sd+minor_mean);
if (major<minor)
    major=(randn*major_sd+major_mean);
    minor=(randn*minor_sd+minor_mean);
end

mean_diameter=(major+minor)/2;
epsilon=sqrt((major^2-minor^2))/major;
As=(pi*minor^2)/2+(pi*major*minor*asin(epsilon))/2*epsilon;
soma_report=[major, minor, mean_diameter, As];
figure(1); 
[X_soma,Y_soma,Z_soma]=ellipsoid(0,0,0,minor/2,minor/2,major/2,100);
surf(X_soma,Y_soma,Z_soma);