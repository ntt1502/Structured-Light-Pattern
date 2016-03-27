function [x] = x_g42(s1,s2)
%Compute the position of word s_1 s_2 in G(m,2)

m = 4;
if s1 >= s2
    x = m^2 - s1^2 + 2*(s1 - s2);
elseif s1 > 1 
    x = m^2 - s2^2 + 2*(s2 - s1);
    x = x + 1;
else x = m^2 - (1 + s2)^2 + 2*((1 + s2) - s1);
    x = x + 1;
end

