function [ filters, labels ] = get_filter_bank()
    filters = cell(8,1);
    i = 1;
    index = 1;
    cs_index = 7;
    previous_filter = NaN;
    while i <= 4
        gauss_filt = fspecial('gaussian', [ (6*i)+1 (6*i)+1 ], i);
        [ gauss_filtx, gauss_filty ] = gradient(gauss_filt);
        filters{index,1} = gauss_filtx;
        filters{index + 1, 1} = gauss_filty;
        index = index + 2;
        i = i * 2;
        
        if isnan(previous_filter) == 0
            filters{cs_index,1} = gauss_filt - imresize(previous_filter, size(gauss_filt));
            cs_index = cs_index + 1;
        end
        
        previous_filter = gauss_filt;
    end
    labels = {'Gx \sigma=1','Gy \sigma=1','Gx \sigma=2','Gy \sigma=2','Gx \sigma=4','Gy \sigma=4', 'G_2-G_1', 'G_4-G_2'};
end

