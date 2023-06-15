%% Control Average and Modal Controllability

clc
clear all
cd('');
load('control.mat');

for a = 1:length(control)

    try
        disp(strcat('Working on Subject:',string(a)));

    A = control(a).connectome;
    NormA = A./(1+svds(A,1));     % Matrix normalization 
    [U, T] = schur(NormA,'real'); % Schur stability

     %name
    control_controllability_outputs(a).name = control(a).name;  
    
    % Calculate avecont 
    
    midMat = (U.^2)';
    v = diag(T);
    P = repmat(diag(1 - v*v'),1,size(NormA,1));
    control_controllability_outputs(a).avecont = sum(midMat./P)';

    % Calculate modalcont 
    
    eigVals = diag(T);
    N = size(NormA,1);
    phi = zeros(N,1);
    for i = 1 : N
        phi(i) = (U(i,:).^2) * (1 - eigVals.^2);
    end
    control_controllability_outputs(a).modalcont = phi;
    end
end

clear a A eigVals i midMat N NormA P phi T U v

%% Save

save('control.mat');