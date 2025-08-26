function xdec = grayToDec(gray_vector)
    xbin(1)=gray_vector(1);
    size_bits = size(gray_vector);
    n_bits = size_bits(2);
    for i=1:n_bits-1
        xbin(i+1)=xor(xbin(i),gray_vector(i+1));
    end

    xdec=xbin(n_bits);
    for i=1:n_bits-1
        xdec=xdec+xbin(n_bits-i)*2^i;
    end
end