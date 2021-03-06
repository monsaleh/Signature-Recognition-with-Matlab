function [F]=Feature_Ext(img)
img=rgb2gray(img);
r = imresize (img,[128 ,128]);
[sd,skew,kurtosis]=prop(r);
b = imcomplement(im2bw(r,0.9));
h_projection = sum(b, 2);
v_projection = sum(b, 1);
cat_projection = cat(1, h_projection, v_projection(:));
t = bwmorph (b, 'thin', inf);
pic=cut_edge(t); 
% [tl,tr,bl,br]=dvid_image(pic);
hu_moments=invmoments(pic);
[h,w]=size(pic);
sig_ratio=h/w;
theta=0:45:135;
R=radon(pic,theta);
hu_1=invmoments(R(:,1));
hu_2=invmoments(R(:,2));
hu_3=invmoments(R(:,3));
hu_4=invmoments(R(:,4));
hu_seg=[hu_1,hu_2,hu_3,hu_4];
J1 = std(R(:,1)); 
J2 = std(R(:,2));
J3 = std(R(:,3));
J4 = std(R(:,4));
J_seg=[J1,J2,J3,J4];
Ar=regionprops(pic,'Area','Centroid','Eccentricity','Orientation','Extent');
F =[Ar.Area,Ar.Centroid, Ar.Eccentricity,Ar.Extent,Ar.Orientation,sig_ratio,hu_moments,hu_seg,J_seg,kurtosis,cat_projection',sd,skew];
end