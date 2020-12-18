function [ num1 ] = advent_day_18_parse_b( to_parse, do_plus )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%% parse single string %%
       bla=textscan(to_parse,'%s');
       cur_parse=bla{1}(:);
       if do_plus
           while any(any(char(cur_parse)=='+'))
               loop=find(char(cur_parse)=='+');
               loop=loop(end);
               cur_parse(loop-1)={num2str(str2num(char(cur_parse(loop-1)))+str2num(char(cur_parse(loop+1))))};
               cur_parse(loop)  = [];
               cur_parse(loop)  = [];
           end
       end
       num1=str2num(char(cur_parse(1)));
       if length(cur_parse)>1
           ope=char(cur_parse(2));
           for idx2=3:length(cur_parse)
               if rem(idx2,2) % odd, must be num
                   num2=str2num(char(cur_parse(idx2)));
                   switch(ope)
                       case('+')
                           num1=num1+num2;
                       case('-')
                           num1=num1-num2;
                       case('*')
                           num1=num1*num2;
                       case('/')
                           num1=num1/num2;
                   end
               else
                   ope=char(cur_parse(idx2));
               end
           end
       end

end

