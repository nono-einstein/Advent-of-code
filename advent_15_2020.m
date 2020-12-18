% 1001612
% 19,x,x,x,x,x,x,x,x,41,x,x,x,37,x,x,x,x,x,821,x,x,x,x,x,x,x,x,x,x,x,x,13,x,x,x,17,x,x,x,x,x,x,x,x,x,x,x,29,x,463,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,23

ids=[19 41 37 821 13 17 29 463 23];
deltas=[0 9 13 19 32 36 48 50  73];
tijd = 1001612;

for idx=1:length(ids)
    wacht(idx) = mod(ids(idx)*(floor(tijd/ids(idx))+1)-tijd,ids(idx));
end

[ii,jj]=min(wacht);
disp(wacht(jj)*ids(jj));

%deel 2
% mod(n*19+9, 41)=0 etc...
% echter, allen priem, dus ggd is veelvoud van getallen.
ids=    [19 41 37 821    13    17      29     463       23];
deltas= [0   9 13  19    32    36      48      50       73];

ddelta = (deltas(2:end));
clear p q
idx=2;
    x=1:ids(idx-1)*ids(idx);
        y=find((rem(x,ids(idx-1))-rem(x,ids(idx)))==-ids(idx)+ddelta(idx-1));
%     disp(y(find((y>max(ids(1),ids(idx))).*(mod(y,ids(1))==0),1)))  
    p(idx-1)=y(find((y>max(ids(idx-1),ids(idx))).*(mod(y,ids(idx-1))==0),1));
    q(idx-1)=ids(idx-1)*ids(idx);
idx=3;
    x=p(idx-2):q(idx-2):q(idx-2)*ids(idx);
        y=find((rem(x,ids(idx)))==ids(idx)-rem(ddelta(idx-1),ids(idx)));
    p(idx-1)=x(y);
    q(idx-1)=q(idx-2)*ids(idx);
idx=4;
    x=p(idx-2):q(idx-2):q(idx-2)*ids(idx);
        y=find((rem(x,ids(idx)))==ids(idx)-rem(ddelta(idx-1),ids(idx)));
    p(idx-1)=x(y);
    q(idx-1)=q(idx-2)*ids(idx);
idx=5;
    x=p(idx-2):q(idx-2):q(idx-2)*ids(idx);
        y=find((rem(x,ids(idx)))==ids(idx)-rem(ddelta(idx-1),ids(idx)));
    p(idx-1)=x(y);
    q(idx-1)=q(idx-2)*ids(idx);
idx=6;
    x=p(idx-2):q(idx-2):q(idx-2)*ids(idx);
        y=find((rem(x,ids(idx)))==ids(idx)-rem(ddelta(idx-1),ids(idx)));
    p(idx-1)=x(y);
    q(idx-1)=q(idx-2)*ids(idx);
idx=7;
    x=p(idx-2):q(idx-2):q(idx-2)*ids(idx);
        y=find((rem(x,ids(idx)))==ids(idx)-rem(ddelta(idx-1),ids(idx)));
    p(idx-1)=x(y);
    q(idx-1)=q(idx-2)*ids(idx);
idx=8;
    x=p(idx-2):q(idx-2):q(idx-2)*ids(idx);
        y=find((rem(x,ids(idx)))==ids(idx)-rem(ddelta(idx-1),ids(idx)));
    p(idx-1)=x(y);
    q(idx-1)=q(idx-2)*ids(idx);
idx=9;
    x=p(idx-2):q(idx-2):q(idx-2)*ids(idx);
        y=find((rem(x,ids(idx)))==ids(idx)-rem(ddelta(idx-1),ids(idx)));
    p(idx-1)=x(y);
    q(idx-1)=q(idx-2)*ids(idx);
    
    display(sprintf('%20d %20d \n',[p; q]))









% if 1
% ids=    [19 41 37 821    13    17      29     463       23];
% % deltas=[0  9 13  19    32    36      48      50       73];
% deltas=  [0  9 13  19 32-19 36-19 48-2*19 50-2*19  73-3*19];
%     loop=15580;
%     clear temp
%     klaar = 0;
%     while (~klaar)
%         temp(1)=mod(loop,ids(1));
%         for idx=2:length(ids)
%            temp(idx)=mod(loop,ids(idx))+deltas(idx)-ids(idx);    
%         end
%         if (~any(temp))
%             disp(loop)
%             klaar = 1;
%         end
%         loop=loop+30377;
%     end
%     
%     
%     
% end
% 
% if 1
%     ids=    [7 13 59 31 19];
%     deltas=  [0  1 4 6 7 ];
%     extra=   [0  0  0 0 0];
% %     ids=    [2 3 5];
% %     deltas=  [0  1 2 ];
% %     extra=   [0  0  0];
%     clear p q
%     for idx=2:length(ids)
%         x=1:ids(idx-1)*ids(idx);
%         p(idx-1)=find(((rem(x,ids(idx-1))-rem(x,ids(idx)))==deltas(idx-1)-deltas(idx))&(rem(x,ids(idx-1))==0));
% %              disp(y(find((y>max(ids(1),ids(idx))).*(mod(y,ids(1))==0),1)))
% %         if(length(y)>1)
% %             p(idx-1)=y(find((y>max(ids(idx-1),ids(idx))).*(mod(y,ids(idx-1))==0),1));
% %         else
% %             p(idx-1)=y;
% %         end
%         q(idx-1)=ids(idx-1)*ids(idx);
%     end
%     display(sprintf('%10d %10d \n',[p; q]))
% %      disp(vpa(prod(p)))
%     
% %     x=0:100;
% %     yy=repmat(p',1,length(x))+repmat(q',1,length(x)).*repmat(x, length(p),1);
% %     figure;hold all
% %     for idx=1:size(yy,1)
% %         plot(yy(idx,:),x)
% %     end
% loop=1e6;
% klaar = 0;
% while (~klaar)
%      if((rem(loop,91)==(19-14))+(rem(loop,767)==(767-416))+(rem(loop,1829)==(1829-1180))+(rem(loop,589))==(589-248))==1
% %    if((mod(loop,91)==14)+(mod(loop,767)==416)+(mod(loop,1829)==1180)+(mod(loop,589))==248)==1
%     disp(loop)
%     klaar = 1;
%     end
%     loop=loop+1;
% end
% 
% 
% end