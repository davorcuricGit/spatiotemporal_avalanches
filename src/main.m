all_clusters = main;




function all_clusters = main()
    % MAIN - Entry point for avalanche extraction and analysis
    
    % --- User parameters ---
    data_file = '../data/ImgF3_sample.mat';
    mask_file = '../data/mask.mat';
    downsample = 2;   % Downsampling factor
    base_radius = 16;     % Pixel radius at full resolution
    
    % --- Load and preprocess ---
    ImgF = preprocess_data(data_file, mask_file, downsample);
    sz = size(ImgF(:,:,1));
    radius = base_radius / downsample;
    
    % --- Build network ---
    valid_pixels = find(~isnan(ImgF(:,:,1)));
    [~, network] = build_network(sz(1), valid_pixels, radius);
    
    % --- Extract clusters ---
    all_clusters = extract_clusters(ImgF, radius, network, 'validPixels', valid_pixels);
    
    % --- Plot example density map ---
    plot_density(all_clusters, valid_pixels, sz);
end