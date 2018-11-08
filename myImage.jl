function myppmwrite(img, file::String)
    s = open(file, "w")
    write(s, "P6\n")    
    n, m = size(img)
    write(s, "$m $n 255\n")
    for i=1:n, j=1:m
        p = img[i,j]
        write(s, UInt64(p))
        write(s, UInt64(p))
        write(s, UInt64(p))
    end
    close(s)
end
