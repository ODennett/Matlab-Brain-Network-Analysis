%% Intro

clc
clear all
cd('');

%% Extract connectomes

scale = 3;

filelist = dir('sub-*');

counter=0;
for a = 1:length(filelist)
    temp = strjoin([filelist(a).name '\ses-preop\' filelist(a).name '_ses-preop_scale-' string(scale) '_connectome_sift2.csv'],'');

    if exist(temp,'file') ==0
        %do nothing
    else
        counter=counter+1;
        control(counter).name = filelist(a).name;
        control(counter).connectome = readmatrix(temp);
    end
end
clear a counter temp scale
%% Change all diagonal values in matrix to zero
   
   for a = 1:length(filelist)
    try
    M = control(a).connectome;
    
    M(1:1+size(M,1):end) = 0;

    control(a).connectome =M;
    
    end
   end

    clear a M

%% Save

save('control.mat')
clear all