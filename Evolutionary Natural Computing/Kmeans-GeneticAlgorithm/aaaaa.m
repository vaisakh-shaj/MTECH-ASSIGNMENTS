plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
         centroids = computeCentroids(X, idx, K);
         popu=new_popu;