clear all
% mnemonics:
% acc: 1
% jmp: 2
% nop: 0

data = load('advent_10_2020.txt');

acc=0;
visit = zeros(size(data));
ptr=1;
while ~(any(visit(:,1)>1))
  visit(ptr,1)=visit(ptr,1)+1;
  acc_old = acc;
  if data(ptr,1)==1 %acc
      acc=acc+data(ptr,2);
      ptr=ptr+1;
  elseif data(ptr,1)==2
      ptr=ptr+data(ptr,2);
  elseif data(ptr,1)==0
      ptr=ptr+1;
  else
      display('error')
  end
end

display(acc_old)

dataold = data;
jmps=find(data(:,1)==2);
for idx=1:length(jmps)
    acc=0;
    visit = zeros(size(data));
    ptr=1;
    data(jmps(idx),1)=0;
    while ~(any(visit(:,1)>1)) && (ptr~=(length(data)+1))
        visit(ptr,1)=visit(ptr,1)+1;
        acc_old = acc;
        if data(ptr,1)==1 %acc
            acc=acc+data(ptr,2);
            ptr=ptr+1;
        elseif data(ptr,1)==2
            ptr=ptr+data(ptr,2);
        elseif data(ptr,1)==0
            ptr=ptr+1;
        else
            display('error')
        end
    end
    data = dataold;
    if (ptr==length(data)+1)
        display('HIT')
        break;
    end
end

acc=0;
visit = zeros(size(data));
jmps=find(data(:,1)==0);
for idx=1:length(jmps)
    acc=0;
    visit = zeros(size(data));
    ptr=1;
    data(jmps(idx),1)=2;
    while ~(any(visit(:,1)>1)) && (ptr~=(length(data)+1))
        visit(ptr,1)=visit(ptr,1)+1;
        acc_old = acc;
        if data(ptr,1)==1 %acc
            acc=acc+data(ptr,2);
            ptr=ptr+1;
        elseif data(ptr,1)==2
            ptr=ptr+data(ptr,2);
        elseif data(ptr,1)==0
            ptr=ptr+1;
        else
            display('error')
        end
    end
    data = dataold;
    if (ptr==length(data)+1)
        display('HIT')
        break;
    end
end



