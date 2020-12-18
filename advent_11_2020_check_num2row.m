function [ ok ] = advent_11_2020_check_num2row(list,number)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
ok=any(sum(npermutek(list,2),2)==number);

end

