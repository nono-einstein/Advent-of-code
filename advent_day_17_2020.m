if 1
    clear all
    
    input = [ ...
        0 0 1 1 0 1 0 1; ...
        0 1 1 1 1 1 0 0; ...
        1 0 0 0 0 0 1 1; ...
        1 1 0 1 1 0 1 0; ...
        0 0 1 0 0 0 1 0; ...
        0 1 0 0 1 1 0 0; ...
        0 1 0 0 0 1 0 1; ...
        1 0 0 1 1 0 1 1];
    
%     input = [ ...
%         0 0 0 1 1 0 1 1; ...
%         0 0 1 0 0 1 0 1; ...
%         0 1 1 0 0 0 1 0; ...
%         1 0 0 1 0 0 0 1; ...
%         0 1 0 0 1 0 1 0; ...
%         0 0 1 0 0 1 0 0; ...
%         0 0 0 1 1 0 0 0; ...
%         0 0 0 0 0 0 0 0];
    
    cycles = 200;
    
    data = zeros(max(size(input))+cycles, max(size(input))+cycles);
    
    data(floor(size(data,1)/2)-floor(size(input,1)/2)+1:floor(size(data,1)/2)-floor(size(input,1)/2)+size(input,1), ...
        floor(size(data,2)/2)-floor(size(input,2)/2)+1:floor(size(data,2)/2)-floor(size(input,2)/2)+size(input,2)) = ...
        input ;
    
    kernel=ones(3,3);
    kernel(2,2)=0;
    kernel2=ones(5,5);
    kernel2(3,3)=[0];
%     kernel2(2:4,2:4)=[0 1 0;1 0 1; 0 1 0];
    kernel3=2*ones(7,7);
%     kernel3(4,4)=[0];
    kernel2(2:4,2:4)=[0 1 0;1 0 1; 0 1 0];
    
    datan=data*0;
    figure(1);surf(data);view(2);pause(0.1)
    for idx=1:cycles*20
        datan =conv2(data,kernel, 'same');
        datan2=conv2(data,kernel2, 'same');
        datan3=conv2(data,kernel3, 'same');
        dataold=data*0;
        dataold=dataold+(data==1).*(datan==3);
        dataold=dataold+(data==1).*(datan==2);
        data   =dataold+(data==0).*(datan==3);
        data = 1*(data>0);   
%         data   =dataold+(data==0).*(datan==3)+(data==0).*(datan2<=18).*(datan2>=8)-(data==1).*(datan3<=50).*(datan3>=29);
%         data = 1*(data>0);   
        figure(1);surf(data);view(2);pause(0.02)
    end
    
    disp(sum(sum(data)))
end

if 0
    clear all
    
    input = [ ...
        0 0 1 1 0 1 0 1; ...
        0 1 1 1 1 1 0 0; ...
        1 0 0 0 0 0 1 1; ...
        1 1 0 1 1 0 1 0; ...
        0 0 1 0 0 0 1 0; ...
        0 1 0 0 1 1 0 0; ...
        0 1 0 0 0 1 0 1; ...
        1 0 0 1 1 0 1 1];
    
    input = [ ...
        0 0 0 1 1 0 0 0; ...
        0 0 1 0 0 1 0 0; ...
        0 1 0 0 0 0 1 0; ...
        1 0 0 0 0 0 0 1; ...
        0 1 0 0 0 0 1 0; ...
        0 0 1 0 0 1 0 0; ...
        0 0 0 1 1 0 0 0; ...
        0 0 0 0 0 0 0 0];
    
    cycles = 20;
    
    data = zeros(max(size(input))+4*cycles, max(size(input))+4*cycles, 1+2*cycles);
    
    data(floor(size(data,1)/2)-floor(size(input,1)/2)+1:floor(size(data,1)/2)-floor(size(input,1)/2)+size(input,1), ...
        floor(size(data,2)/2)-floor(size(input,2)/2)+1:floor(size(data,2)/2)-floor(size(input,2)/2)+size(input,2), ...
        floor(size(data,3)/2)+1) = ...
        input ;
    
    kernel=ones(3,3,3);
    kernel(2,2,2)=0;
    
    datan=data*0;
    figure(1);surf(sum(data,3));view(2);pause(0.1)
    for idx=1:cycles
        datan=convn(data,kernel, 'same');
        dataold=data*0;
        dataold=dataold+(data==1).*(datan==3);
        dataold=dataold+(data==1).*(datan==2);
        data   =dataold+(data==0).*(datan==3);
        figure(1);surf(sum(data,3));view(2);pause(0.1)
    end
    
    disp(sum(sum(sum(data))))
end




if 0
    %part two
    clear all
    
    input = [ ...
        0 0 1 1 0 1 0 1; ...
        0 1 1 1 1 1 0 0; ...
        1 0 0 0 0 0 1 1; ...
        1 1 0 1 1 0 1 0; ...
        0 0 1 0 0 0 1 0; ...
        0 1 0 0 1 1 0 0; ...
        0 1 0 0 0 1 0 1; ...
        1 0 0 1 1 0 1 1];
    %     input = [ ...
    %         0 0 0 1 1 0 0 0; ...
    %         0 0 1 0 0 1 0 0; ...
    %         0 1 0 0 0 0 1 0; ...
    %         1 0 0 0 0 0 0 1; ...
    %         0 1 0 0 0 0 1 0; ...
    %         0 0 1 0 0 1 0 0; ...
    %         0 0 0 1 1 0 0 0; ...
    %         0 0 0 0 0 0 0 0];
    
    cycles = 6;
    
    data = zeros(max(size(input))+2*cycles, max(size(input))+2*cycles, 1+2*cycles, 1+2*cycles);
    
    data(floor(size(data,1)/2)-floor(size(input,1)/2)+1:floor(size(data,1)/2)-floor(size(input,1)/2)+size(input,1), ...
        floor(size(data,2)/2)-floor(size(input,2)/2)+1:floor(size(data,2)/2)-floor(size(input,2)/2)+size(input,2), ...
        floor(size(data,3)/2)+1, ...
        floor(size(data,3)/2)+1) = ...
        input ;
    
    kernel=ones(3,3,3,3);
    kernel(2,2,2,2)=0;
    
    datan=data*0;
    figure(1);surf(sum(sum(data,4),3));view(2);pause(0.3)
    for idx=1:cycles
        datan=convn(data,kernel, 'same');
        dataold=data*0;
        dataold=dataold+(data==1).*(datan==3);
        dataold=dataold+(data==1).*(datan==2);
        data   =dataold+(data==0).*(datan==3);
        figure(1);surf(sum(sum(data,4),3));view(2);pause(0.3)
    end
    
    disp(sum(squeeze(sum(squeeze(sum(squeeze(sum(data))))))))
end