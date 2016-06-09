block_size = 20;
space = 0;

W = pattern2D();
N = ones(16*block_size + 15*space, 64*block_size + 63*space,3);

blockA = zeros(block_size,block_size,3);
blockA(:,:,1) = 1;

blockB = zeros(block_size,block_size,3);
blockB(:,:,2) = 1;

blockC = zeros(block_size,block_size,3);
blockC(:,:,3) = 1;

blockD = zeros(block_size,block_size,3);
blockD(:,:,3) = 1;
blockD(:,:,2) = 1;

x = 0;
y = 0;
for i = 1:16
    i_space = (i-1)*block_size + 1 + space*x;
    y = 0;
    for j = 1:64
        j_space = (j-1)*block_size+1 + space*y;
        if W(i,j) == 1
            N(i_space:i_space + (block_size - 1), j_space:j_space+(block_size - 1),:) = blockA;
        elseif W(i,j) == 2 
            N(i_space:i_space + (block_size - 1),j_space:j_space+(block_size - 1),:) = blockB;
        elseif W(i,j) == 3
            N(i_space:i_space + (block_size - 1),j_space:j_space+(block_size - 1),:) = blockC;
        else N(i_space:i_space + (block_size - 1),j_space:j_space+(block_size - 1),:) = blockD;
        end
        y = y + 1;
    end
    x = x + 1;
end
[a,b,c]=size(N);

imshow(N);