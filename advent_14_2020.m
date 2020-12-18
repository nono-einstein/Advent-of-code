data=load('advent_14_2020.txt');
% north = 0;
% east = 1;
% south = 2;
% west = 3;
% forward = 4;
% right rotate = 5;
% left rotate = 6;

clear pos
pos.h(1)=1;
pos.x(1)=0;
pos.y(1)=0;
for idx=2:length(data)+1
    pos.h(idx)=pos.h(idx-1);
    pos.x(idx)=pos.x(idx-1);
    pos.y(idx)=pos.y(idx-1);
    switch data(idx-1,1)
        case 0
            pos.y(idx)=pos.y(idx)+data(idx-1,2);
        case 1
            pos.x(idx)=pos.x(idx)+data(idx-1,2);
        case 2
            pos.y(idx)=pos.y(idx)-data(idx-1,2);
        case 3
            pos.x(idx)=pos.x(idx)-data(idx-1,2);
        case 4
            switch pos.h(idx)
                case 0
                    pos.y(idx)=pos.y(idx)+data(idx-1,2);
                case 1
                    pos.x(idx)=pos.x(idx)+data(idx-1,2);
                case 2
                    pos.y(idx)=pos.y(idx)-data(idx-1,2);
                case 3
                    pos.x(idx)=pos.x(idx)-data(idx-1,2);
            end
        case 5
            switch(data(idx-1,2))
                case 0
                    % do nothing
                case 90
                    pos.h(idx)=pos.h(idx)+1;
                case 180
                    pos.h(idx)=pos.h(idx)+2;
                case 270
                    pos.h(idx)=pos.h(idx)+3;
                otherwise
                    disp('Unknown method.R')
            end
        case 6
            switch(data(idx-1,2))
                case 0
                    % do nothing
                case 90
                    pos.h(idx)=pos.h(idx)-1;
                case 180
                    pos.h(idx)=pos.h(idx)-2;
                case 270
                    pos.h(idx)=pos.h(idx)-3;
                otherwise
                    disp('Unknown method.L')
            end
        otherwise
            disp('Unknown method.')
    end
    pos.h(idx)=mod(pos.h(idx),4);
end
figure
plot(pos.x,pos.y)

disp(abs(pos.x(end))+abs(pos.y(end)))


clear pos way
pos.x(1)=0;
pos.y(1)=0;
way.x(1)=10;
way.y(1)=1;
for idx=2:length(data)+1
    pos.x(idx)=pos.x(idx-1);
    pos.y(idx)=pos.y(idx-1);
    way.x(idx)=way.x(idx-1);
    way.y(idx)=way.y(idx-1);
    switch data(idx-1,1)
        case 0
            way.y(idx)=way.y(idx)+data(idx-1,2);
        case 1
            way.x(idx)=way.x(idx)+data(idx-1,2);
        case 2
            way.y(idx)=way.y(idx)-data(idx-1,2);
        case 3
            way.x(idx)=way.x(idx)-data(idx-1,2);
        case 4
            pos.y(idx)=pos.y(idx)+data(idx-1,2)*way.y(idx);
            pos.x(idx)=pos.x(idx)+data(idx-1,2)*way.x(idx);
            
        case 5
            switch(data(idx-1,2))
                case 0
                    % do nothing
                case 90
                    temp=way.x(idx);
                    way.x(idx)=way.y(idx);
                    way.y(idx)=-temp;
                case 180
                    way.x(idx)=-way.x(idx);
                    way.y(idx)=-way.y(idx);
                case 270
                    temp=way.x(idx);
                    way.x(idx)=-way.y(idx);
                    way.y(idx)=temp;
                otherwise
                    disp('Unknown method.R')
            end
        case 6
            switch(data(idx-1,2))
                case 0
                    % do nothing
                case 90
                    temp=way.x(idx);
                    way.x(idx)=-way.y(idx);
                    way.y(idx)=temp;
                case 180
                    way.x(idx)=-way.x(idx);
                    way.y(idx)=-way.y(idx);
                case 270
                    temp=way.x(idx);
                    way.x(idx)=way.y(idx);
                    way.y(idx)=-temp;
                otherwise
                    disp('Unknown method.L')
            end
        otherwise
            disp('Unknown method.')
    end
end
figure
plot(pos.x,pos.y)

disp(abs(pos.x(end))+abs(pos.y(end)))

