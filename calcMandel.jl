using Images
using FileIO

# load our mandel functions
include("mandel.jl")
  
# set parameters
h = 2500
w = 5000
iter = 10000
  
# time measurements
print("starting...\n")
tStart=time()
  
m_set = mandelbrot_set(-2.5,1.5,-1.25,1.25,w,h,iter)

tStop = time()
  
# write the image-file
img = colorview(RGB, m_set)
save("mandel.jpg", img)
  
print("done. took ", tStop-tStart, " seconds\n");
