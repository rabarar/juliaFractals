
function mandelbrot_set(xmin,xmax,ymin,ymax,width,height,maxiter)
    r1 = float_range(xmin, xmax, width)
    r2 = float_range(ymin, ymax, height)

    cartesian =  Array{Float64, 3}(undef, 3, height, width)   

    for y = 1:height, x = 1:width
	point = mandel(ComplexF64(r1[x], r2[y]), maxiter)
	if point == maxiter
		point = 0
	else
		point /= convert(Float64, maxiter)

	end

 	red_color, blue_color, green_color = 1.0, 1.0, 1.0
    	if point < 0.01
            red_color, blue_color, green_color = 1.0, 1.0, 1.0
    	else
            red_color = point * 0.80
            blue_color = point * 0.80
            green_color = point * 0.15
    	end

	cartesian[1,y,x] = red_color
	cartesian[2,y,x] = blue_color
	cartesian[3,y,x] = green_color
    end

    return cartesian
end

# the mandelbrot iteration function
function mandel(c, maxiter::Int64)
    z=0+0im
    for n = 1:maxiter
        if abs(z) > 2
            return n-1
        end
        z = z^2 + c
    end
    return maxiter
end

function float_range(xmin, xmax, width)
	r = Array{Float64, 1}(undef, width)

	delta = abs(xmax - xmin)/(width - 1)

	for i = 1:width
		r[i] = xmin + (i-1)*delta
	end

	return r
end

