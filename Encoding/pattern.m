S1 = Gmn(4,3);
S2 = Gmn(4,2);
W = zeros(length(S2), length(S1));
W(1,:) = S1;
for i = 2:16
    for j = 1:64
        W(i,j) = mod(W(i-1,j) + S2(i-1), 4);
    end
end

for i = 1:16
    for j = 1:64
        if W(i,j) == 0
            W(i,j) = 4;
        end
    end
end

%xlswrite('2D_Bruijn',W)
save('pattern_W','W')