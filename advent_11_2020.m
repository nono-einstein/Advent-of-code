data=load('advent_12_2020.txt');
data(end+1)=0;
data(end+1) = max(data)+3;

data=sort(data);
ddata=diff(data);
disp(sum(ddata==1)*sum(ddata==3))

% deel2
disp(sum(ddata==1))
disp(sum(ddata==2))
disp(sum(ddata==3))

% find groups of n 1 delta consequtive adapters
ddata(find(ddata == 3)) =ddata(find(ddata == 3))*0; 
totals=zeros(5,1);
idx=1;
% first isfixed
while idx<length(ddata)
   loop=1;
   while (ddata(idx)~=0) && (idx<length(ddata))
       loop=loop+1;
       idx=idx+1;
   end
   totals(loop)=totals(loop)+1;
   idx=idx+1;
end
totals(1:end-1) = totals(2:end);
% combinations
% one adapter with 3 steps between: one choice only
mul_tot(1)=1;
% two adapters: 
mul_tot(2)=2;
% three adapters: 
mul_tot(3)=4;
% four adapters: (1 1 1 1) (0 1 1 1) (1 0 1 1) (0 0 1 1) (1 0 0 1) (1 1 0
% 1) (0 1 0 1)
mul_tot(4)=7;

disp(sprintf('%12d',prod(mul_tot.^(totals(1:4)'))))
