clear all
% mnemonics:
% acc: 1
% jmp: 2
% nop: 3
fid = fopen('advent_9_2020.txt');
idx=1;
while ~feof(fid)
    input{idx} = fgetl(fid);
    idx=idx+1;
end
fclose(fid);
list{1}.n=1;
list{1}.color='shiny gold';
% list{1}.color='faded tan';
% recursive function
[ list ] = advent_9b_2020_search_bags( input, list );
som=0;
[ som ] = advent_9c_2020_prune( list,1 );
display(som)
