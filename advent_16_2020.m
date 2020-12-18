clear all
fid = fopen('advent_16_2020.txt');
idx=1;
mems=zeros(1e6,1);
bmask_b=bin2dec('000000000000000000000000000000000000');
bmask_a=bin2dec('111111111111111111111111111111111111');
while ~feof(fid)
    input{idx} = fgetl(fid);
    if strfind(input{idx},'mask')
        temp=textscan(input{idx},'mask = %s');
        st=char(temp{1});
        temp=bin2dec(strrep(strrep(st,'1','0'),'X','1'));
        command{idx}.type=2;
        command{idx}.a1=uint64(temp);  %maskak%
        bmask_a=temp;
        temp=bin2dec(strrep(st,'X','0'));
        command{idx}.a2=uint64(temp); %overrule%
        bmask_b=temp;
        temp=bin2dec(strrep(strrep(strrep(strrep(st,'0','A'),'X','0'),'1','0'),'A','1'));
        command{idx}.a3=uint64(temp); %overrule%
        
    elseif strfind(input{idx},'mem')
        temp=textscan(input{idx}, 'mem[%d] = %d');
        command{idx}.type=1;
        tempz=temp{1};
        command{idx}.a1=uint64(tempz);
        tempz=temp{2};
        command{idx}.a2=uint64(tempz);
        tempb=bitand(uint64(temp{2}),uint64(bmask_b));
        tempb=bitor(uint64(tempb),uint64(bmask_b));
        tempc=bitand(uint64(temp{2}),uint64(bmask_a));
        mems(temp{1}+1)=bitor(uint64(tempb),uint64(tempc));
    else
        disp('error parse')
    end
    idx=idx+1;
end
fclose(fid);
disp(sprintf('%20d',sum(mems)))


% part 2
% not enough mem,so let's check overlap first
zeros_=uint64(0);
ones_=uint64(0);
float_=uint64(0);
% mem_a=uint64(zeros(1000,1));
% mem_b=uint64(zeros(1000,1));
% mem_c=uint64(zeros(1000,1));
loop=1;
mem_list_cnt = 1;
mem_list=zeros(87026+1,2);
for idx=1:length(command)
    if command{idx}.type==1
        mem_a(loop)=bitor(uint64(command{idx}.a1),uint64(ones_));
        mem_b(loop)=uint64(float_);
        mem_bn(loop)=length(strrep(dec2bin(float_),'0',''));
        mem_c(loop)=uint64(command{idx}.a2);
%         mem_d(loop)=uint64((bitand(uint64(bitcmp(mem_b(loop))),uint64(bin2dec('111111111111111111111111111111111111')))));
        mem_d(loop)=uint64((bitand(uint64(bitcmp(mem_b(loop))),uint64(mem_a(loop)))));
        mem_e(loop)=uint64((bitor(uint64(mem_b(loop)),uint64(mem_a(loop)))));
        for idx2=1:length(float_arr)
            mem_final=mem_d(loop)+float_arr(idx2);
            mem_idx_n=find(mem_list(:,1)==mem_final);
            if(isempty(mem_idx_n))
                mem_list(mem_list_cnt,1)=mem_final;
                mem_list(mem_list_cnt,2)=mem_c(loop);
                mem_list_cnt=mem_list_cnt+1;
            else
                mem_list(mem_idx_n(1),2)=mem_c(loop); 
                disp('dubbel')
            end
        end
        loop=loop+1;
    else
        zeros_=uint64((command{idx}.a3));
        ones_=uint64((command{idx}.a2));
        float_=uint64((command{idx}.a1));
        stringetje=dec2bin(float_);
        indices=strfind(dec2bin(float_),'1');
        clear float_arr
        form=repmat('0',1,length(indices));
        for idx2=1:2^length(indices)
            temp=dec2bin(idx2-1);
            form(length(form)-length(temp)+1:end)=temp;
            stringetje(indices)=form;
            float_arr(idx2)=bin2dec(stringetje);
        end
    end
    disp(idx/length(command))
end
disp(sprintf('%20d',sum(mem_list(:,2))))

