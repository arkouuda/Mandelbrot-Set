function drawMandelbrot
    n = 500;
    max = 250;
    x = linspace(-2,2,n);
    y = linspace(-2,2,n);
    color = colorPixels(x,y,n,max);
    image(x,y,color);
    colormap(pink);
    axis image;
end

function color = colorPixels(x,y,n,max)
    [x,y] = ndgrid(x,i*y);
    color = arrayfun(@colorCount,x + y);
    
    function col = colorCount(c)
        z = 0.0 + 0.0*i;
        for k = 1:max
            z = z^2 + c;
            if norm(z) >= 2
                col = k*300/max;
                return
            end
            col = 0;
        end
    end 
end
