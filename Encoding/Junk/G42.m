i = 1;
k = 1;
I = [4 4 4 4];
T = zeros(4);
S = [];
while length(S) < 16
    j = I(i) + (mod((i-1)*4 + 1,4)) - 1;
    k2 = mod(j,4); S = [S k2];
    T(i,k2+1) = k;
    I(i) = I(i) - 1;
    k = k+1;
    i = j;
end

for i = 1:length(S)
    if S(i) == 0;
        S(i) = 4;
    end
end

xlswrite('G42',S)