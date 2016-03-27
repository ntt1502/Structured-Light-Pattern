function [x y] = xy_position(w1,w2,w3,w4,w5)
%Calculate the x and y coordinates of a word

m = 4;
load('pattern_W.mat','W');

s1 = w2 - w1;
if s1 <= 0
    s1 = s1 + m;
end

s2 = w3 - w2;
if s2 <= 0
    s2 = s2 + m;
end

x = x_g42(s1,s2) + 1;

%%%%%%%%%%%%%%%%%%%%%
t1 = w4 - W(x,1);
if t1 <= 0
    t1 = t1 + 4;
end

t2 = w2 - W(x,1);
if t2 <= 0
    t2 = t2+ 4;
end

t3 = w5 - W(x,1);
if t3 <= 0
    t3 = t3 + 4;
end

y = y_g43(t1,t2,t3)+1;

end

