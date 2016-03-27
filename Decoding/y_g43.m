function [y] = y1(s1,s2,s3)
%Compute the position of word s_1 s_2 s_3 in G(m,3)
m = 4;
if s1 == 1 && s2 == m && s3 == m
    y = m^3;
end
if s1 == 1 && s2 == 1 && s3 == m
    y = m^3 - 1;
end
if (s1 == s2 && s1 == s3) || ((s1 >= s2) && (s1 > s3))
    y = (m*(m + 1)*(2*m + 1) - s1*(s1 + 1)*(2*s1 + 1))/2 - (m - s1)*(3*m + 3*s1 + 1)/2 + 3*(s1 - s2)*(s1 - 1)+(3*(s1 - s3 - 1) + 1) + 1;
end
if (s2 >= s3) && (s2 > s1)
    if s1 == 1
        if s2 == s3
            s1 = s2 + 1;
            s2 = 1;
            s3 = 1;
            y = (m*(m + 1)*(2*m + 1) - s1*(s1 + 1)*(2*s1 + 1))/2 - (m - s1)*(3*m + 3*s1 + 1)/2 + 3*(s1 - s2)*(s1 - 1)+(3*(s1 - s3 - 1) + 1) + 1;
            y = y + 2;
        else s1 = s2;
            s2 = s3 + 1;
            s3 = 1;
            y = (m*(m + 1)*(2*m + 1) - s1*(s1 + 1)*(2*s1 + 1))/2 - (m - s1)*(3*m + 3*s1 + 1)/2 + 3*(s1 - s2)*(s1 - 1)+(3*(s1 - s3 - 1) + 1) + 1;
            y = y + 2;
        end
    else temp = s1;
        s1 = s2;
        s2 = s3;
        s3 = temp;
        y = (m*(m + 1)*(2*m + 1) - s1*(s1 + 1)*(2*s1 + 1))/2 - (m - s1)*(3*m + 3*s1 + 1)/2 + 3*(s1 - s2)*(s1 - 1)+(3*(s1 - s3 - 1) + 1) + 1;
        y = y + 2;
    end
end

if s3 >= s1 && s3 > s2
    if s1 == 1 && s2 == 1
        s1 = s3 + 1;
        s2 = 1;
        s3 = 1;
        y = (m*(m + 1)*(2*m + 1) - s1*(s1 + 1)*(2*s1 + 1))/2 - (m - s1)*(3*m + 3*s1 + 1)/2 + 3*(s1 - s2)*(s1 - 1)+(3*(s1 - s3 - 1) + 1) + 1;
        y = y + 1;
    else temp = s2;
        s2 = s1;
        s1 = s3;
        s3 = temp;
        y = (m*(m + 1)*(2*m + 1) - s1*(s1 + 1)*(2*s1 + 1))/2 - (m - s1)*(3*m + 3*s1 + 1)/2 + 3*(s1 - s2)*(s1 - 1)+(3*(s1 - s3 - 1) + 1) + 1;
        y = y + 1;
    end
end

end

