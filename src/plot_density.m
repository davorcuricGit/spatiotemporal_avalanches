function plot_density(all_clusters, validPixels, sz)

density = zeros(sz);
for i =1:length(all_clusters)
    frame = zeros(1, length(validPixels));
    frame([all_clusters(i).roots]) = 1;
    frame = embeddIntoFOV(frame', validPixels, sz);
    density = density + frame;
end

imagesc(density)

end