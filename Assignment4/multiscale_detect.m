function [ x, y, score ] = multiscale_detect( I, template, number_of_detections )
    
    % Finding the image pyramid until the image is bigger than the template
    % itself
    resized_image = I;
    i = 1;
    image_pyramid{i,1} = resized_image;
    [ x, y, score ] = detect(image_pyramid{i,1}, template, number_of_detections);
    image_pyramid{i,2} = x;
    image_pyramid{i,3} = y;
    image_pyramid{i,4} = score;
    scale = 1;
    while 1
        i = i + 1;
        scale = scale * 0.7;
        resized_image = imresize(resized_image, 0.7);
        if(sum(size(resized_image) > [size(template, 1) size(template,2)]) == 2)
            image_pyramid{i,1} = resized_image;
            
            [ x_temp, y_temp, score_temp ] = ...
                detect(image_pyramid{i, 1}, template, number_of_detections);
            image_pyramid{i,2} = x_temp;
            image_pyramid{i,3} = y_temp;
            image_pyramid{i,4} = score_temp;
            x = horzcat(x,x_temp/scale);
            y = horzcat(y,y_temp/scale);
            score = horzcat(score,score_temp);
        else
            break;
        end
    end
    
    x_temp = x;
    y_temp = y; 
    score_temp = score;
    clear x;
    clear y;
    clear score;
    
    % sort response from high to low
    [ val, ind ] = sort(score_temp(:),'descend');

    % work down the list of responses, removing overlapping detections as we go
    i = 1;
    detcount = 0; 
    
    while ((detcount < number_of_detections) && (i < length(ind)))
      % now convert yblock,xblock to pixel coordinates 
      ypixel = y_temp(ind(i));
      xpixel = x_temp(ind(i));

      % check if this detection overlaps any detections which we've already added to the list
      overlap = false;
      distance = 23;
      for j = 1:detcount
          if ((x(j)-xpixel)^2 +(y(j)-ypixel)^2)^0.5 < distance
              overlap = true;
          end
      end

      % if not, then add this detection location and score to the list we return
      if (~overlap)
        x(detcount+1) = xpixel;
        y(detcount+1) = ypixel;
        score(detcount+1) = val(i);
        detcount = detcount+1;
      end
      i = i + 1;
    end
end

