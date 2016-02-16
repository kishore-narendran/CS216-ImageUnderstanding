function [ a ] = non_maximal_supression( a )
    for i = 2:size(a,1)-1
        for j = 2:size(a,2)-1
            x = a(i,j);
            if(a(i-1,j-1) > x || a(i-1,j) > x || a(i-1,j+1) > x || a(i,j-1) > x...
                    || a(i,j+1) > x || a(i+1,j-1) > x || a(i+1,j) > x || a(i,j+1) > x) 
                a(i,j) = 0;
            end
        end
    end
end

 