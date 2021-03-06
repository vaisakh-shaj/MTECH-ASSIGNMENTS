clear;clc;
load('ex7data1.mat');
prompt='enter size of the population';
p=input(prompt);
initial_popu=popu_init(X,p); %obtained initial population
popu=initial_popu
centroids=initial_popu(:,:,1);
previous_centroids = centroids;
K=3;
figure;
hold on;
for iter= 1: 5
    [fittest_indi(:,:,iter),new_popu,cpopu,idx]=fittest(X,popu)
    plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
        centroids = computeCentroids(X, idx, K);
    [fit_popu]=fit(new_popu,fittest_indi(:,:,iter),cpopu.^-1)
     [cross_popu]=crossover(fit_popu)
     [mut_popu]=mutation(cross_popu)
      popu=mut_popu;
end

        