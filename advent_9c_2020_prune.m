function [ som ] = advent_9c_2020_prune( list ,level)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

som=0;
for idx=1:length(list)
    somoud=som;
    try
        som = som+list{idx}.n*(advent_9c_2020_prune(list{idx}.list, level+1));
    catch
        som=som+ list{idx}.n;   
    end
    disp(sprintf('%s %s,%d = %d',char(ones(level*2,1)*32), list{idx}.color,list{idx}.n,som-somoud))
end
if(level>1)
    som=som+1;
end
end

