function [ list,current_cup ] = advent_day_23_2020_game( input, current_cup, loop )
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
l=length(input);
l3=length(input)-3;
% m=max(input);
% linked list so I do not need to shift and copy anymore...
list(:,1)=input;
list(:,2)=(1:length(input))+1;
list(end,2)=1;
list(:,3)=(1:length(input));
[~,jj]=sort(list(:,1));
list(:,4)=jj;
idx_cur=find(list(:,1)==current_cup);
idx_cur_1=list(idx_cur,1);
idx_cur_1l=list(idx_cur,2);

for i=1:loop
    draw(1,:)=list(idx_cur_1l,:);
    draw(2,:)=list(draw(1,2),:);
    draw(3,:)=list(draw(2,2),:);
    list(idx_cur,2)=draw(3,2);
    insert_card=idx_cur_1-1;
    if insert_card==0
        insert_card=l;
    end
    while any([draw(:,1)]==insert_card)
        insert_card=(insert_card-1)+(insert_card==1)*l;
    end
    idx_ins=list(insert_card,4);
    t=list(idx_ins,2);
    list(idx_ins,2)=draw(1,3);
    list(draw(3,3),2)=t;
    idx_cur=list(idx_cur,2);
    idx_cur_1=list(idx_cur,1);
    idx_cur_1l=list(idx_cur,2);
%     sortrows(list,2) % quick check
end
end

