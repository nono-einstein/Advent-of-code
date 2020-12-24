clear all
fid = fopen('advent_24_2020.txt');
map=zeros(400)==0;
map_touched=1*(kron(ones(200),[0 1;1 0])==0);
sx=floor(size(map,1)/2);
sy=floor(size(map,2)/2);

idx=1;
while ~feof(fid)
    input{idx} = fgetl(fid);
    temp=textscan(input{idx},'%s');
    x=0;
    y=0;
    for idx2=1:length(temp{1})
        switch char(temp{1}(idx2))
            case 'e'
                x=x+2;
            case 'w'
                x=x-2;
            case 'ne'
                x=x+1;
                y=y+1;
            case 'nw'
                x=x-1;
                y=y+1;
            case 'se'
                x=x+1;
                y=y-1;
            case 'sw'
                x=x-1;
                y=y-1;
        end
    end
    map(sx+x,sy+y)=~map(sx+x,sy+y);
end
fclose(fid);
disp(sum(sum(map(map_touched==1)==0)))

kernel=[0 1 0 1 0; ...
        1 0 0 0 1; ...
        0 1 0 1 0;];
map=map*1;
% % figure(1);mesh(map);view(2)
for loop=1:100
   t1_map=(conv2(1*(map==0), kernel', 'same')==0).*(map==0).*(map_touched==1); 
   t2_map=(conv2(1*(map==0), kernel', 'same') >2).*(map==0).*(map_touched==1);
   t3_map=(conv2(1*(map==0), kernel', 'same')==2).*(map==1).*(map_touched==1);
   map(t1_map==1)=map(t1_map==1)*0+1;
   map(t2_map==1)=map(t2_map==1)*0+1;
   map(t3_map==1)=map(t3_map==1)*0;
%    figure(1);mesh(map);view(2);pause(0.02)
% disp(sum(sum(map==0)))
end
disp(sum(sum(map==0)))



