%% Calculate Graph Metrics

clc
clear all
cd('E:\hamartomas\output\connectomes');
load('hh.mat');

%point script to bct code within Documents
addpath C:\Users\olive\OneDrive\Documents\MATLAB\bct


%% Calculate global & local metrics

for a = 1:length(hh)
   
    try

    disp(strcat('Working on:',hh(a).name));

    %name
    graph_metrics_outputs(a).name = hh(a).name;
    
    % degree
    display('degree')
    graph_metrics_outputs(a).degree = degrees_und(hh(a).connectome);
    
    % strength
    display('strength')
    graph_metrics_outputs(a).strength = strengths_und(hh(a).connectome);
    
    % eigen cent
    display('EC')
    graph_metrics_outputs(a).eigencent = eigenvector_centrality_und(hh(a).connectome);
    
    % global efficiency
    display('GE')
    graph_metrics_outputs(a).ge = efficiency_wei(weight_conversion(hh(a).connectome,'normalize'));
        
    % local efficiency
    display('LE')
    graph_metrics_outputs(a).le = efficiency_wei(weight_conversion(hh(a).connectome,'normalize'),2);
        
    % clustering coeff
    display('clustering')
    graph_metrics_outputs(a).clustering = clustering_coef_wu(weight_conversion(hh(a).connectome,'normalize'));
        
    % transitivity
    display('transitivity')
    graph_metrics_outputs(a).trans = transitivity_wu(weight_conversion(hh(a).connectome,'normalize'));
         
    % modularity
    display('modularity')
    [~, graph_metrics_outputs(a).modularity] = modularity_und(hh(a).connectome);

    end
    
    clear a

end

%% Save

save('hh.mat');

