data=load('advent_13_2020.txt');
seats = zeros(size(data));
seats_t = zeros(size(data));

kernel=ones(3,3);
% kernel_1=kernel;
% kernel_1(2,2)=0;

taken = sum(sum(seats));
taken_old = -1;
while taken ~= taken_old
    seats_t = seats_t+(data).*(conv2(seats, kernel, 'same')==0);
    seats_t = seats_t-(data).*(conv2(seats, kernel, 'same')>4).*(seats==1);
    seats=seats_t;

    taken_old = taken;
    taken = sum(sum(seats));
%     figure(1);surf(seats); view(3);
end

display(taken)

% part 2 test
if 0
    kernel=zeros(ceil(sum(size(data).^2).^0.5)+double(~(rem(ceil(sum(size(data).^2).^0.5),2))));
    kernel=kernel+eye(size(kernel));
    kernel=kernel+fliplr(eye(size(kernel)));
    kernel(ceil(size(kernel,1)/2),:)=kernel(ceil(size(kernel,1)/2),:)+1;
    kernel(:,ceil(size(kernel,2)/2))=kernel(:,ceil(size(kernel,2)/2))+1;
    kernel=double(kernel>=1);
    
    seats = zeros(size(data));
    seats_t = zeros(size(data));
    
    kernel=ones(3,3);
    % kernel_1=kernel;
    % kernel_1(2,2)=0;
    
    taken = sum(sum(seats));
    taken_old = -1;
    while taken ~= taken_old
        seats_t = seats_t+(data).*(conv2(seats, kernel, 'same')==0);
        seats_t = seats_t-(data).*(conv2(seats, kernel, 'same')>5).*(seats==1);
        seats=seats_t;
        
        taken_old = taken;
        taken = sum(sum(seats));
        figure(1);surf(seats); view(2);
    end
    
    display(taken)
end


% part 2 real
% need 8 kernels (one for each direction, determine in each direction
% position of lowest occupied and lowest unoccupied chair. f same or 
% occupied smaller --> +1 else 0

notdata=data==0;
longest=0;
for idx=1:size(data,2)
    longest=max(longest,max(accumarray(nonzeros((cumsum(~notdata(:,idx))+1).*notdata(:,idx)),1)));
end
for idx=1:size(data,1)
    longest=max(longest,max(accumarray(nonzeros((cumsum(~notdata(idx,:))+1).*notdata(idx,:)),1)));
end
longest=longest+1;
kernel=zeros(ceil(longest*2^0.5)+double(~(rem(ceil(longest*2^0.5),2))));
tot_kernel=zeros(size(kernel,1)*2+1,size(kernel,2)*2+1);
kernpow=fliplr(2.^[0:size(kernel,1)-1]);
% kernpow=(2.^[0:size(kernel,1)-1]);
kern{1}=tot_kernel;
kern{1}(end-size(kernel,1)+1:end,end-size(kernel,2)+1:end)=eye(size(kernel)).*repmat(kernpow, size(kernel,2),1);
kern{2}=flipud(kern{1});
kern{3}=fliplr(kern{1});
kern{4}=rot90(kern{1},2);
kern{5}=tot_kernel;
kern{5}(size(kernel,1)+1,end-size(kernel,2)+1:end)=kernpow;
kern{6}=fliplr(kern{5});
kern{7}=tot_kernel;
kern{7}(end-size(kernel,2)+1:end,size(kernel,1)+1)=kernpow;
kern{8}=flipud(kern{7});



seats = zeros(size(data));
seats_t = zeros(size(data));


taken = sum(sum(seats));
taken_old = -1;
temp_seats=zeros(size(data));
while taken ~= taken_old
    temp_seats=temp_seats*0;
    for idx=1:length(kern)
        a=floor(log(conv2(seats, kern{idx}, 'same'))/log(2));
        b=floor(log(conv2(data, kern{idx}, 'same'))/log(2));
        temp_seats=temp_seats+double(a>=b).*double(a>=1);
    end
    seats_t = seats_t+data.*(temp_seats==0).*(seats==0);
    seats_t = seats_t-data.*(temp_seats>=5).*(seats==1);
    seats=seats_t;
    
    taken_old = taken;
    taken = sum(sum(seats));
    figure(1);surf(seats); view(2);
    figure(2);surf(temp_seats); view(2);
    pause(0.2)
end

display(taken)

