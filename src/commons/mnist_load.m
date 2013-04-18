% code=train:   training set
% code=t10k:    test set
function [data, label] = mnist_load(code)
    fileName = sprintf('data/mnist/%s-images.idx3-ubyte', code);   
    fdata = fopen(fileName, 'rb');
    buffer = fread(fdata);
    % size = 28*28 = 784
    data = reshape(buffer(17: length(buffer)), 784, floor(length(buffer)/784) )';
    fclose(fdata);
    
    fileName = sprintf('data/mnist/%s-labels.idx1-ubyte', code);
    flabel = fopen(fileName, 'rb');
    buffer = fread(flabel);
    label = buffer(9:length(buffer), 1);
    fclose(flabel);
    
    if (size(data, 1) ~= size(label, 1))
        error('Data size %d != Label size %d', size(data,1), size(label,1));
    end
    
    fprintf('MNIST training dataset loaded successfully, %d samples loaded.\n', size(data, 1));
