clc;
clear all;
close all;
warning off;
net=alexnet;
layers=net.Layers;
featureLayer='fc7';
imds=imageDatastore('Training','IncludeSubFolders',true,'LabelSource','foldernames');
trainingLabels=imds.Labels;       
inputSize = net.Layers(1).InputSize;
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imds);
featuresTrain = activations(net,augimdsTrain,featureLayer,'OutputAs','rows');
classifier=fitcecoc(featuresTrain,trainingLabels);
save classifier classifier