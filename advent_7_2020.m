fid = fopen('advent_6_2020.txt');
idx=1;
while ~feof(fid)
    input{idx} = fgetl(fid);
    idx=idx+1;
end
fclose(fid);

for idx=1:length(input)
    ticket(idx).row=zeros(7,1);
    ticket(idx).row(regexp(input{idx},'B'))=ticket(idx).row(regexp(input{idx},'B'))+1;
    ticket(idx).rownbr=sum(ticket(idx).row'.*2.^([6 5 4 3 2 1 0]));
    ticket(idx).column=zeros(3,1);
    ticket(idx).column(regexp(input{idx},'R')-7)=ticket(idx).column(regexp(input{idx},'R')-7)+1;
    ticket(idx).columnnbr=sum(ticket(idx).column'.*2.^([ 2 1 0]));
    ticket(idx).seat = 8*ticket(idx).rownbr+ticket(idx).columnnbr;
end

disp(max([ticket(:).seat]))

seatlist = sort(([ticket(:).seat]));
[s,idx]=find(diff(seatlist)==2);