m = 4; n = 3;

i = 1;
k = 1;
I = m*ones(m^(n-1),1);
T = zeros(m^(n-1),m);
S = [];
while length(S) < m^n
    j = I(i) + (mod((i-1)*m + 1,m^(n-1))) - 1;
    k2 = mod(j,m); S = [S k2];
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
xlswrite('G43',S)