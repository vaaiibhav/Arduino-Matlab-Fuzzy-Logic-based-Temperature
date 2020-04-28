function [ output ] = fuzzy_logic( ip,minValue1,minValue2,maxValue1, maxValue2 )
%FUZZY_LOGIC Summary of this function goes here
%   Detailed explanation goes here
Temp = ip;

minrule1 = minValue1;
minrule2 = minValue2;
maxrule1 = maxValue1;
maxrule2 = maxValue2;
tempout = 0;
if (Temp < minrule1)
    tempout = 'e';
elseif(Temp < minrule2)
    tempout = 'f';
elseif(Temp < maxrule1)
    tempout = 'g';
elseif(Temp < maxrule2)
    tempout = 'h';
end;
tempout = 'e';
output = tempout;


end

