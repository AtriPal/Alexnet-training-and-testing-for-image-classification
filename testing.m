clc
clear all
close all
warning off
load classifier;
net=alexnet;
featureLayer='fc7';
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
if isequal(filename,0) || isequal(pathname,0)
    %disp('User pressed cancel')
else
    filename=strcat(pathname,filename);
    ab=imread(filename);
    ab=imresize(ab,[227 227]);
    featuresTrain = activations(net,ab,featureLayer,'OutputAs','rows');
    gs=predict(classifier,featuresTrain);
    disp(char(gs));
    imshow(ab);
    title(char(gs));
end
