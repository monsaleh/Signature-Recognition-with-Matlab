%% input image for testing
clc,close,clear all;
[fname path]=uigetfile('.png','select image fot testing');
fname=strcat(path,fname);
img=imread(fname);
imshow(img);
title('Tested Signture');

%% find out which class is belongs
Ftest=Feature_Ext(img);
F=Ftest;

%% compare with database
data= F';
load('net.mat');
out=net(data);
class = vec2ind(out);
msgbox(strcat('Detected Class = ',num2str(class)));
