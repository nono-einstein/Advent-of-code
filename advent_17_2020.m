clear all
%case 1
data = zeros(2020,1);
input=[0 20 7 16 1 18 15];
data(1:length(input))=input;
for idx=length(input)+1:length(data)
  if  length(find(data(1:idx-1)==data(idx-1))) ==1 % new entry
      data(idx)=0;
  else
      t=diff(find(data(1:idx-1)==data(idx-1)));
      data(idx)=t(end);
  end
  disp(idx/length(data))
end

disp(sprintf('%10d',data(end)))


if 0
    %case 2 dom
    
    clear data
    data = zeros(30000000,1);
    input=[0 20 7 16 1 18 15];
    data(1:length(input))=input;
    for idx=length(input)+1:length(data)
        if  length(find(data(1:idx-1)==data(idx-1))) ==1 % new entry
            data(idx)=0;
        else
            t=diff(find(data(1:idx-1)==data(idx-1)));
            data(idx)=t(end);
        end
        disp(idx/length(data))
    end
    
    disp(sprintf('%10d',data(end)))
end

%case 2 minder dom

clear data
data = zeros(30000000,2);
input=[0 20 7 16 1 18 15];
temp=cumsum(ones(length(input),1));
data(input+1,1)=temp;
data(input+1,2)=temp;
last=input(end);
loop2=0;
for idx=length(input)+1:length(data)
  if  ~diff(data(last+1,:)) % new entry call '0'
      data(1,1)=data(1,2);
      data(1,2)=idx;
      last = 0;
  else
      last=diff(data(last+1,:));
      if all(data(last+1,:)==0) % new at this position
          data(last+1,1)=idx;
          data(last+1,2)=idx;
      else
          data(last+1,1)=data(last+1,2);
          data(last+1,2)=idx;
      end
  end
  if(loop2>(length(data)/100))
      disp(idx/length(data))
      loop2=0;
  end
  loop2=loop2+1;
end

disp(sprintf('%10d',data(end)))
