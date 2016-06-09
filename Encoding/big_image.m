W = pattern2D();
block_size = 4;
big_block_size = 64;
N = zeros(16*big_block_size, 32*big_block_size,3);
W1 = zeros(16,32);
step1 = big_block_size/16;
step2 = big_block_size/32;

for i = 1:16
    for j = 1:32
        W1(i,j) = W(i,j);
    end
end

blockA = zeros(block_size,block_size,3);
blockA(:,:,1) = 1;

blockB = zeros(block_size,block_size,3);
blockB(:,:,2) = 1;

blockC = zeros(block_size,block_size,3);
blockC(:,:,3) = 1;

blockD = zeros(block_size,block_size,3);
blockD(:,:,2) = 1;
blockD(:,:,3) = 1;

for i = 1:16
    i_space = (i-1)*big_block_size + 1;
    for j = 1:32
        j_space = (j-1)*big_block_size + 1;
        if W1(i,j) == 1
            N(i_space + step1*(i-1) : i_space + step1*(i-1) + block_size - 1 , j_space + step2*(j-1) : j_space + step2*(j-1) + block_size - 1,:) = blockA;
        elseif W1(i,j) == 2 
            N(i_space + step1*(i-1) : i_space + step1*(i-1) + block_size - 1 , j_space + step2*(j-1) : j_space + step2*(j-1) + block_size - 1,:) = blockB;
        elseif W1(i,j) == 3
            N(i_space + step1*(i-1) : i_space + step1*(i-1) + block_size - 1 , j_space + step2*(j-1) : j_space + step2*(j-1) + block_size - 1,:) = blockC;
        else N(i_space + step1*(i-1) : i_space + step1*(i-1) + block_size - 1 , j_space + step2*(j-1) : j_space + step2*(j-1) + block_size - 1,:) = blockD;
        end
    end
end

[a,b,c]=size(N);
for i = 1:a
    for j = 1:b
        if rem(i,big_block_size) == 0
            N(i,:,:) = 1;
        end
        if rem(j,big_block_size) == 0
            N(:,j,:) = 1;
        end   
    end
end

imshow(N)
imwrite(N,'pattern4.jpg');