function [ winner, deck, d_ret ] = advent_day_22_2020_game( Player_1, Player_2, d )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
% display(Player_1')
% display(Player_2')
winner=-1;
loop=1;
d_ret=d+1;
try
    while ((~((isempty(Player_1)) || (isempty(Player_2)))) &&(winner~=0))
    op1{loop}=Player_1;
    op2{loop}=Player_2;
%     disp(loop)
%     if(loop==10)
%         keyboard
%     end
    for idx=1:loop-1
        if isequal(Player_1,op1{idx}) || isequal(Player_2,op2{idx})
            winner=1;
            deck=Player_1;
            return;
        end
    end
    loop=loop+1;
    if (winner~=0)
        if (((length(Player_1)-1)>=Player_1(1)) && ...
                ((length(Player_2)-1)>=Player_2(1)))
            [ winner, ~ ,d_ret_t] = advent_day_22_2020_game( Player_1(2:1+Player_1(1)), ...
                Player_2(2:1+Player_2(1)), d_ret);
            if d_ret_t>d_ret
                display(d_ret_t)
            end
            d_ret=max(d_ret,d_ret_t);
            if winner==1
                Player_1(end+1:end+2)=[Player_1(1) Player_2(1)];
                Player_1(1)=[];
                Player_2(1)=[];
            elseif winner==2
                Player_2(end+1:end+2)=[Player_2(1) Player_1(1)];
                Player_1(1)=[];
                Player_2(1)=[];
            else
                display('error')
            end
        elseif (Player_1(1)>Player_2(1))
            Player_1(end+1:end+2)=[Player_1(1) Player_2(1)];
            Player_1(1)=[];
            Player_2(1)=[];
        elseif (Player_2(1)>Player_1(1))
            Player_2(end+1:end+2)=[Player_2(1) Player_1(1)];
            Player_1(1)=[];
            Player_2(1)=[];
        elseif(Player_1(1)==Player_2(1))
            display('figure out how to handle equal cards!!')
        else
            % code for recursion limit
            disp('error')
        end
    end
    end
catch
    keyboard
end
if (winner==0)
    % handle inf recursion
    deck=Player_1;
    display('recursion')
elseif isempty(Player_1)
    winner=2;
    deck=Player_2;
elseif isempty(Player_2)
    winner=1;
    deck=Player_1;
else
    display('error!!!')
end
end

