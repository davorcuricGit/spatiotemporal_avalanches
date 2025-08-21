function all_clusters = extract_clusters(ImgF, radius, network, varargin)
% EXTRACT_CLUSTERS Identify spatiotemporal clusters in data
%
% Inputs:
%   ImgF        - imaging data (HxWxT)
%   radius      - neighborhood radius
%   network     - pixel adjacency network
%   validPixels(optional) - linear indices of post-mask pixels, default
%   ones(H, W)
%   T0 (optional) - % offset for cluster start times, useful if working with recordings where frames have been removed
%
% Output:
%   all_clusters - struct array with cluster stats
    

    p = inputParser;
    addRequired(p, 'ImgF');
    addRequired(p, 'radius');
    addRequired(p, 'network');
    addParameter(p, 'validPixels', ones(size(ImgF(:,:,1))));
    addParameter(p, 'T0', 0, @issingle); 
    
    parse(p, ImgF, radius, network, varargin{:});
    
    
    T0 = p.Results.T0;
    validPixels = p.Results.validPixels;
    
    sz = size(ImgF(:,:,1));


    mask = embed_Into_FOV(validPixels, validPixels, sz);
    mask = single(mask > 0);

    all_clusters = [];
    next_id_offset = 0;
    

    f = imdilate(ImgF, strel('disk', radius));
    f = f .* mask;
    
    CC = bwconncomp(f, 6);
    labels3D = labelmatrix(CC);     
    labeled = single(labels3D) .* single(ImgF); 
    labeled = reshape(labeled, prod(sz), size(ImgF, 3));
    labeled = labeled(validPixels, :);

    clusters = get_cluster_stats(labeled, network);

    % Offset IDs to avoid collisions
    for i = 1:numel(clusters)
        clusters(i).id = clusters(i).id + next_id_offset;
        clusters(i).start_time = clusters(i).start_time + T0;
    end

    all_clusters = [all_clusters, clusters];
end
