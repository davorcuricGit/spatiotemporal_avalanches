function ImgF = preprocess_data(data_file, mask_file, downsamplesize)
% PREPROCESS_DATA Load imaging data and apply mask/downsampling
%
% Inputs:
%   data_file     - path to .mat file with ImgF variable
%   mask_file     - path to .mat file with mask
%   downsamplesize - factor to downsample (e.g., 2)
%
% Output:
%   ImgF          - preprocessed imaging data
    
    data = load(data_file);
    if isfield(data, 'ImgF2')
        ImgF = data.ImgF2;
    elseif isfield(data, 'ImgF')
        ImgF = data.ImgF;
    else
        error('Input data file does not contain ImgF variable.');
    end
    
    m = load(mask_file);
    mask = single(m.mask ./ max(m.mask(:)));
    
    % downsample mask (non-native function)
    mask = spatial_block_downsample(mask, downsamplesize, mask);
    
    % apply mask
    ImgF = ImgF .* mask;
end