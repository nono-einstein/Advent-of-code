close all
clear all
Player_1=[...
50 
14
10
17
38
40
3
46
39
25
18
2
41
45
7
47
36
1
30
32
8
31
12
5
28];

Player_2=[ ...
9
6
37
42
22
4
21
15
44
16
29
43
19
11
13
24
48
35
26
23
27
33
20
49
34];

while (~((isempty(Player_1)) || (isempty(Player_2))))
    if (Player_1(1)>Player_2(1))
       Player_1(end+1:end+2)=[Player_1(1) Player_2(1)];
       Player_1(1)=[];
       Player_2(1)=[];
    else
       Player_2(end+1:end+2)=[Player_2(1) Player_1(1)];
       Player_1(1)=[];
       Player_2(1)=[];
    end
end

if(~isempty(Player_1))
    winner=Player_1;
else
    winner=Player_2;
end
disp(sum(winner'.*fliplr(cumsum(ones(1,length(winner))))))


%% part two
Player_1=[...
50 
14
10
17
38
40
3
46
39
25
18
2
41
45
7
47
36
1
30
32
8
31
12
5
28];

Player_2=[ ...
9
6
37
42
22
4
21
15
44
16
29
43
19
11
13
24
48
35
26
23
27
33
20
49
34];

[winner, deck, d]=advent_day_22_2020_game(Player_1,Player_2,0);

disp(sum(deck(:)'.*fliplr(cumsum(ones(1,length(deck))))))


%test_input;
[winner, deck]=advent_day_22_2020_game([9 2 6 3 1],[5 8 4 7 10],0);
disp(sum(deck(:)'.*fliplr(cumsum(ones(1,length(deck))))))



