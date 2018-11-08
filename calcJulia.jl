using Images
using FileIO

# load our julia function
include("julia.jl")
  
h = 2500
w = 5000
iter = 10000
m = Array{Float64, 3}(undef, 3, h, w)
m = fill!(m, 0.0)
  
# time measurements
print("starting...\n")
tStart=time()
  
# for every pixel
for y=1:h, x=1:w
    # translate numbers [1:w, 1:h] -> -2:2 + -1:1 im
    c = complex((x-w/2)/(h/2), (y-h/2)/(h/2))
    # call our julia function
    color = julia(c, iter)/convert(Float64, iter)

    # color adjust weights
    red_color, blue_color, green_color = 1.0, 1.0, 1.0
    if color < 0.01
	    red_color, blue_color, green_color = 1.0, 1.0, 1.0
    else
	    red_color = color * 0.80
	    blue_color = color * 0.80
	    green_color = color * 0.15
    end

     m[1, y,x]  = red_color
     m[2, y,x]  = blue_color
     m[3, y,x]  = green_color
end
  
tStop = time()
print("done. took ", tStop-tStart, " seconds\n");
  
img = colorview(RGB, m)
save("julia.jpg", img)
  
