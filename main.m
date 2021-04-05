%% input image 
clear all;
C=input('Enter Num of Class');
filepath=uigetdir(cd,'select image folder');
fileloc=dir(filepath);
index=1;    
for i=3:length(fileloc)
filename=fileloc(i).name;
if (strcmp(filename,'Thumbs.db')==0)
filedir=strcat(filepath,'\',filename);
img=imread(filedir);
end
%% feature extraction
F=Feature_Ext(img);
try
    load db3;
    db3=[db3;F];
    save db3.mat db3
catch
    db3=F;
    save db3.mat db3
end
end
load('db3.mat');
inputs = db3';
epochs = 5000;
net = competlayer(C);
net.performFcn = 'mse'; 
y1 = sim(net,inputs);
net.trainParam.epochs = epochs;
net.trainparam.showwindow=0;
net = train(net,inputs);
outputs = net(inputs);
save net.mat net
classes = vec2ind(outputs)