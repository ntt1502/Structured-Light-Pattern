
block_size = 100;
space = 20;

W = pattern2D();
N = ones(16*block_size + 15*space, 64*block_size + 63*space);

blockA = 191*ones(block_size)/255;
blockB = 127*ones(block_size)/255;
blockC = 63*ones(block_size)/255;
blockD = 0*ones(block_size)/255;

x = 0;
y = 0;
for i = 1:16
    i_space = (i-1)*block_size + 1 + space*x;
    y = 0;
    for j = 1:64
        j_space = (j-1)*block_size+1 + space*y;
        if W(i,j) == 1
            N(i_space:i_space + (block_size - 1), j_space:j_space+(block_size - 1)) = blockA;
        elseif W(i,j) == 2 
            N(i_space:i_space + (block_size - 1),j_space:j_space+(block_size - 1)) = blockB;
        elseif W(i,j) == 3
            N(i_space:i_space + (block_size - 1),j_space:j_space+(block_size - 1)) = blockC;
        else N(i_space:i_space + (block_size - 1),j_space:j_space+(block_size - 1)) = blockD;
        end
        y = y + 1;
    end
    x = x + 1;
end

imshow(N);