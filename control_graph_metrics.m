%% Calculate Control Graph Metrics

clc
clear all
cd('');
load('control.mat');

%point script to bct code within Documents
addpath C:\Users\olive\OneDrive\Documents\MATLAB\bct


%% Calculate Control Global & Local Metrics

for a = 1:length(control)
   
    try

    disp(strcat('Working on:',control(a).name));

    %name
    control_graph_metrics_outputs(a).name = control(a).name;
    
    % degree
    display('degree')
    control_graph_metrics_outputs(a).degree = degrees_und(control(a).connectome);
    
    % strength
    display('strength')
    control_graph_metrics_outputs(a).strength = strengths_und(control(a).connectome);
    
    % eigen cent
    display('EC')
    control_graph_metrics_outputs(a).eigencent = eigenvector_centrality_und(control(a).connectome);
    
    % global efficiency
    display('GE')
    control_graph_metrics_outputs(a).ge = efficiency_wei(weight_conversion(control(a).connectome,'normalize'));
        
    % local efficiency
    display('LE')
    control_graph_metrics_outputs(a).le = efficiency_wei(weight_conversion(control(a).connectome,'normalize'),2);
        
    % clustering coeff
    display('clustering')
    control_graph_metrics_outputs(a).clustering = clustering_coef_wu(weight_conversion(control(a).connectome,'normalize'));
        
    % transitivity
    display('transitivity')
    control_graph_metrics_outputs(a).trans = transitivity_wu(weight_conversion(control(a).connectome,'normalize'));
         
    % modularity
    display('modularity')
    [~, control_graph_metrics_outputs(a).modularity] = modularity_und(control(a).connectome);

    end
    
    clear a

end

%% Save

save('control.mat');

