function drawMandelbrot %builds an image pixel by pixel.
    n = 500; %size of the image.
    max = 250; %maximum number of iterations that will be computed.
    x = linspace(-2,2,n); %size of the plot space.
    y = linspace(-2,2,n);
    color = colorPixels(x,y,n,max); %color matrix for every pixel.
    image(x,y,color); %build the image.
    colormap(pink); %chose a colormap for the pixels.
    axis image; %show the axis of the plot space.
end

function color = colorPixels(x,y,n,max) %builds color matrix for every pixel.
    [x,y] = ndgrid(x,i*y); %create a complex grid from plot space.
    color = arrayfun(@colorCount,x + y); %call colorCount for every point.
    
    function col = colorCount(c) %distribute colors amongs the points.
        z = 0.0 + 0.0*i; %initialize the variable over which we iterate.
        for k = 1:max %iterate at most up to the given maximum.
            z = z^2 + c; %iterate over z.
            if norm(z) >= 2 %verify that the values stay bounded by 2.
                col = k*300/max; %give a color value to the point given by c.
                return
            end
            col = 0; %erase the previous color value to proceed.
        end
    end 
end