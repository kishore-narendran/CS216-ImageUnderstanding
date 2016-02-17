function [ color ] = get_average_color( img, y, x )
    
    y = uint8(y);
    x = uint8(x);
    temp = ( img(y-1,x-1,:) + img(y-1,x,:) + img(y-1,x+1,:) + img(y,x-1,:) + img(y,x,:) + img(y,x+1,:) + img(y+1,x-1,:) + img(y+1,x,:) + img(y+1,x+1,:) ) / 9;
    color(1) = temp(1,1,1);
    color(2) = temp(1,1,2);
    color(3) = temp(1,1,3);
end

