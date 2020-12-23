input=[4 6 3 5 2 8 1 7 9];

current_cup=4;
for loop=1:100
    [ input,current_cup ] = advent_day_23_2020_game( input, current_cup, 1 );
end


input=[3 8  9  1  2  5  4  6  7];

current_cup=3;
    [ input,current_cup ] = advent_day_23_2020_game( input, current_cup, 10 );

idx=1;
disp(input(1,1))
idx=input(1,2);
for loop=1:length(input)-1
    disp(input(idx,1))
    idx=input(idx,2);
end

tic
input=[[4 6 3 5 2 8 1 7 9] 10:1:1000000];

current_cup=4;
    [ input,current_cup ] = advent_day_23_2020_game( input, current_cup, 10000000 );
toc










profile off
profile on
tic
input=[[4 6 3 5 2 8 1 7 9] 10:1:1000000];

current_cup=4;
[ input,current_cup ] = advent_day_23_2020_game( input, current_cup, 10000000 );
toc

idx_1=input(1,4);
cup1=input(input(idx_1,2),1);
cup2=input(input(cup1,2),1);

disp(vpa(cup1*cup2))
profile viewer