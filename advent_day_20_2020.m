clear all;
if 1
    fid = fopen('advent_day_20_2020.txt');
    idx=1;
    clear input input_nbr
    while ~feof(fid)
        temp = fgetl(fid);
        if ~isempty(strfind(temp,'Tile'))
            i=textscan(temp, '%s %d%s');
            input_nbr(idx)=i{2};
            input(idx,:,:)=zeros(10,10);
            for idx2=1:10
                temp = fgetl(fid);
                input(idx,idx2,strfind(temp,'#'))=input(idx,idx2,strfind(temp,'#'))+1;
            end
        end
        fgetl(fid);
        idx=idx+1;
    end
    fclose(fid);
    last_results=[];
    matching_corners = zeros(size(input,1),1);
    
    side1 = sum(squeeze(input(:,1,:)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
    side2 = sum(squeeze(input(:,:,1)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
    side3 = sum(squeeze(input(:,10,:)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
    side4 = sum(squeeze(input(:,:,10)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
    
    %find which cubes have 2 non matching corners
    idx_help=cumsum(ones(size(input,1),1));
    for idx=1:size(input,1)
        matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side1(idx_help~=idx));
        matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side2);
        matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side3);
        matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side4);
        matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side2(idx_help~=idx));
        matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side1);
        matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side3);
        matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side4);
        matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side3(idx_help~=idx));
        matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side1);
        matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side2);
        matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side4);
        matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side4(idx_help~=idx));
        matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side1);
        matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side2);
        matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side3);
    end
    
    % Assumption: tiles with <2 matches must be flipped.Lets flip just these
    % 12 by 12 matrix, so total corners matching must be 4*10^2+ 4*10*3+2*4
    loop=1;
    check=sum(matching_corners);
    last_results(end+1)=check;
    while(sum(matching_corners)<528)
        input(loop,:,:)=fliplr(squeeze(input(loop,:,:)));
        
        % and now do the exercise again...
        
        matching_corners = zeros(size(input,1),1);
        
        side1 = sum(squeeze(input(:,1,:)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
        side2 = sum(squeeze(input(:,:,1)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
        side3 = sum(squeeze(input(:,10,:)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
        side4 = sum(squeeze(input(:,:,10)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
        
        %find which cubes have 2 non matching corners
        idx_help=cumsum(ones(size(input,1),1));
        for idx=1:size(input,1)
            matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side1(idx_help~=idx));
            matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side2);
            matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side3);
            matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side4);
            matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side2(idx_help~=idx));
            matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side1);
            matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side3);
            matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side4);
            matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side3(idx_help~=idx));
            matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side1);
            matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side2);
            matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side4);
            matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side4(idx_help~=idx));
            matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side1);
            matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side2);
            matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side3);
        end
        if (check>sum(matching_corners)) % rollback
            input(loop,:,:)=fliplr(squeeze(input(loop,:,:)));
            matching_corners = zeros(size(input,1),1);
            
            side1 = sum(squeeze(input(:,1,:)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
            side2 = sum(squeeze(input(:,:,1)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
            side3 = sum(squeeze(input(:,10,:)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
            side4 = sum(squeeze(input(:,:,10)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
            
            %find which cubes have 2 non matching corners
            idx_help=cumsum(ones(size(input,1),1));
            for idx=1:size(input,1)
                matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side1(idx_help~=idx));
                matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side2);
                matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side3);
                matching_corners(idx)=matching_corners(idx)+any(side1(idx)==side4);
                matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side2(idx_help~=idx));
                matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side1);
                matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side3);
                matching_corners(idx)=matching_corners(idx)+any(side2(idx)==side4);
                matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side3(idx_help~=idx));
                matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side1);
                matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side2);
                matching_corners(idx)=matching_corners(idx)+any(side3(idx)==side4);
                matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side4(idx_help~=idx));
                matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side1);
                matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side2);
                matching_corners(idx)=matching_corners(idx)+any(side4(idx)==side3);
            end
        end
        check=sum(matching_corners);
        last_results(end+1)=check;
        if (length(last_results)>100)
            last_results(1:100)=last_results(2:101);
        end
        loop=loop+1;
        if loop>size(input,1)
            loop=1;
        end
        figure(1)
        plot(last_results)
        pause(0.01)
    end
    disp(vpa(prod(input_nbr(find(matching_corners==2)))))
    
    save('advent_day_20.mat')
end
load('advent_day_20.mat')

% Deel 2,we now have the correct mirroring, but not the order nr the
% rotation. Given the fact that the match is exact, we can just start in a
% corner and find the matching tiles etc.

% just pin the left upper corner

tiles = zeros(12); % after 20 days no defensive programming anymore
corners=find(matching_corners==2);
inners=find(matching_corners==4);
borders=find(matching_corners==3);

for idx=1:length(corners) % mind they still need to be rotated!!
    b13(idx)=any(side1(corners(idx))==side3(borders)) | ...
        any(side1(corners(idx))==side3(borders)) | ...
        any(side1(corners(idx))==side4(borders)) | ...
        any(side1(corners(idx))==side1(borders));
    b31(idx)=any(side3(corners(idx))==side1(borders)) | ...
        any(side3(corners(idx))==side3(borders)) | ...
        any(side3(corners(idx))==side4(borders)) | ...
        any(side3(corners(idx))==side1(borders));
    b24(idx)=any(side2(corners(idx))==side4(borders)) | ...
        any(side2(corners(idx))==side3(borders)) | ...
        any(side2(corners(idx))==side4(borders)) | ...
        any(side2(corners(idx))==side1(borders));
    b42(idx)=any(side4(corners(idx))==side2(borders)) | ...
        any(side4(corners(idx))==side3(borders)) | ...
        any(side4(corners(idx))==side4(borders)) | ...
        any(side4(corners(idx))==side1(borders));
end

if (any((b42&b31)))
    first = find(b42&b31,1);
else
    display('turn blocks')
end
idx=(1:length(side1))';
side1=repmat(side1,1,2);
side1(:,2)=idx;
side2=repmat(side2,1,2);
side2(:,2)=idx;
side3=repmat(side3,1,2);
side3(:,2)=idx;
side4=repmat(side4,1,2);
side4(:,2)=idx;

tiles(1,1)=corners(first);
image_w=zeros(96);
image_w(1:8,1:8)=squeeze(input(tiles(1,1),2:9,2:9));
image_wf=zeros(120);
image_wf(1:10,1:10)=squeeze(input(tiles(1,1),:,:));
for ii=1:12
    for jj=1:12
        if ~((ii==1) && (jj==1)) % this one is a given
            %           if jj==10
            %               keyboard
            %           end
            if jj>1 % match 4->2
                match_from = side4(tiles(ii,jj-1),1);
                side1_t=side1;
                side2_t=side2;
                side3_t=side3;
                side4_t=side4;
                %remove tile to search from from temp list
                side1_t(tiles(ii,jj-1),:)=[];
                side2_t(tiles(ii,jj-1),:)=[];
                side3_t(tiles(ii,jj-1),:)=[];
                side4_t(tiles(ii,jj-1),:)=[];
                found=0;
                if ~isempty(find(match_from == side1_t(:,1)))
                    tiles(ii,jj)=side1_t(find(match_from == side1_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=fliplr(rot90(rot90(rot90(squeeze(input(tiles(ii,jj),:,:))))));
                    found=1;
                elseif ~isempty(find(match_from == side2_t(:,1)))
                    % correct orientation
                    tiles(ii,jj)=side2_t(find(match_from == side2_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=flipud(squeeze(input(tiles(ii,jj),:,:)));
                    found=1;
                elseif ~isempty(find(match_from == side3_t(:,1)))
                    tiles(ii,jj)=side3_t(find(match_from == side3_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=fliplr(rot90(squeeze(input(tiles(ii,jj),:,:))));
                    found=1;
                elseif ~isempty(find(match_from == side4_t(:,1)))
                    tiles(ii,jj)=side4_t(find(match_from == side4_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=fliplr(squeeze(input(tiles(ii,jj),:,:)));
                    found=1;
                end
                if ~found % flipped,so flip all tiles again...except the ones matched
                    for idx=1:size(input,1)
                        if ~any(any(tiles==idx))
                            input(idx,:,:)=fliplr(squeeze(input(idx,:,:)));
                        end
                    end
                    % now again recalculate sum of corners etc...
                    side1 = sum(squeeze(input(:,1,:)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                    side2 = sum(squeeze(input(:,:,1)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                    side3 = sum(squeeze(input(:,10,:)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                    side4 = sum(squeeze(input(:,:,10)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                    idx=(1:length(side1))';
                    side1=repmat(side1,1,2);
                    side1(:,2)=idx;
                    side2=repmat(side2,1,2);
                    side2(:,2)=idx;
                    side3=repmat(side3,1,2);
                    side3(:,2)=idx;
                    side4=repmat(side4,1,2);
                    side4(:,2)=idx;
                    % and again determine matchinng tile (there should be one
                    % now...)
                    side1_t=side1;
                    side2_t=side2;
                    side3_t=side3;
                    side4_t=side4;
                    %remove tile to search from from temp list
                    side1_t(tiles(ii,jj-1),:)=[];
                    side2_t(tiles(ii,jj-1),:)=[];
                    side3_t(tiles(ii,jj-1),:)=[];
                    side4_t(tiles(ii,jj-1),:)=[];
                    found=0;
                    if ~isempty(find(match_from == side1_t(:,1)))
                        tiles(ii,jj)=side1_t(find(match_from == side1_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=fliplr(rot90(rot90(rot90(squeeze(input(tiles(ii,jj),:,:))))));
                        found=1;
                    elseif ~isempty(find(match_from == side2_t(:,1)))
                        % correct orientation
                        tiles(ii,jj)=side2_t(find(match_from == side2_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=flipud(squeeze(input(tiles(ii,jj),:,:)));
                        found=1;
                    elseif ~isempty(find(match_from == side3_t(:,1)))
                        tiles(ii,jj)=side3_t(find(match_from == side3_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=fliplr(rot90(squeeze(input(tiles(ii,jj),:,:))));
                        found=1;
                    elseif ~isempty(find(match_from == side4_t(:,1)))
                        tiles(ii,jj)=side4_t(find(match_from == side4_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=fliplr(squeeze(input(tiles(ii,jj),:,:)));
                        found=1;
                    end
                end
                side1 = sum(squeeze(input(:,1,:)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                side2 = sum(squeeze(input(:,:,1)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                side3 = sum(squeeze(input(:,10,:)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                side4 = sum(squeeze(input(:,:,10)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                idx=(1:length(side1))';
                side1=repmat(side1,1,2);
                side1(:,2)=idx;
                side2=repmat(side2,1,2);
                side2(:,2)=idx;
                side3=repmat(side3,1,2);
                side3(:,2)=idx;
                side4=repmat(side4,1,2);
                side4(:,2)=idx;
                image_w((ii-1)*8+1:ii*8,(jj-1)*8+1:jj*8)=squeeze(input(tiles(ii,jj),2:9,2:9));
                image_wf((ii-1)*10+1:ii*10,(jj-1)*10+1:jj*10)=squeeze(input(tiles(ii,jj),:,:));
            else % match 3->1
                match_from = side3(tiles(ii-1,jj));
                %% more or less repeat the same...
                side1_t=side1;
                side2_t=side2;
                side3_t=side3;
                side4_t=side4;
                %remove tile to search from from temp list
                side1_t(tiles(ii-1,jj),:)=[];
                side2_t(tiles(ii-1,jj),:)=[];
                side3_t(tiles(ii-1,jj),:)=[];
                side4_t(tiles(ii-1,jj),:)=[];
                found=0;
                if ~isempty(find(match_from == side1_t(:,1))) %fixed
                    tiles(ii,jj)=side1_t(find(match_from == side1_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=flipud(rot90(rot90(squeeze(input(tiles(ii,jj),:,:)))));
                    found=1;
                elseif ~isempty(find(match_from == side2_t(:,1)))
                    tiles(ii,jj)=side2_t(find(match_from == side2_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=flipud(squeeze(input(tiles(ii,jj),:,:)));
                    found=1;
                elseif ~isempty(find(match_from == side3_t(:,1))) %fixed
                    tiles(ii,jj)=side3_t(find(match_from == side3_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=flipud(squeeze(input(tiles(ii,jj),:,:)));
                    found=1;
                elseif ~isempty(find(match_from == side4_t(:,1))) %fixed
                    tiles(ii,jj)=side4_t(find(match_from == side4_t(:,1)),2);
                    input(tiles(ii,jj),:,:)=fliplr(rot90(squeeze(input(tiles(ii,jj),:,:))));
                    found=1;
                end
                if ~found % flipped,so flip all tiles again...except the ones matched
                    for idx=1:size(input,1)
                        if ~any(any(tiles==idx))
                            input(idx,:,:)=fliplr(squeeze(input(idx,:,:)));
                        end
                    end
                    % now again recalculate sum of corners etc...
                    side1 = sum(squeeze(input(:,1,:)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                    side2 = sum(squeeze(input(:,:,1)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                    side3 = sum(squeeze(input(:,10,:)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                    side4 = sum(squeeze(input(:,:,10)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                    idx=(1:length(side1))';
                    side1=repmat(side1,1,2);
                    side1(:,2)=idx;
                    side2=repmat(side2,1,2);
                    side2(:,2)=idx;
                    side3=repmat(side3,1,2);
                    side3(:,2)=idx;
                    side4=repmat(side4,1,2);
                    side4(:,2)=idx;
                    % and again determine matchinng tile (there should be one
                    % now...)
                    side1_t=side1;
                    side2_t=side2;
                    side3_t=side3;
                    side4_t=side4;
                    %remove tile to search from from temp list
                    side1_t(tiles(ii-1,jj),:)=[];
                    side2_t(tiles(ii-1,jj),:)=[];
                    side3_t(tiles(ii-1,jj),:)=[];
                    side4_t(tiles(ii-1,jj),:)=[];
                    found=0;
                    if ~isempty(find(match_from == side1_t(:,1))) %fixed
                        tiles(ii,jj)=side1_t(find(match_from == side1_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=flipud(rot90(rot90(squeeze(input(tiles(ii,jj),:,:)))));
                        found=1;
                    elseif ~isempty(find(match_from == side2_t(:,1)))
                        % correct orientation
                        tiles(ii,jj)=side2_t(find(match_from == side2_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=flipud(squeeze(input(tiles(ii,jj),:,:)));
                        found=1;
                    elseif ~isempty(find(match_from == side3_t(:,1))) %fixed
                        tiles(ii,jj)=side3_t(find(match_from == side3_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=flipud(squeeze(input(tiles(ii,jj),:,:)));
                        found=1;
                    elseif ~isempty(find(match_from == side4_t(:,1))) %fixed
                        tiles(ii,jj)=side4_t(find(match_from == side4_t(:,1)),2);
                        input(tiles(ii,jj),:,:)=fliplr(rot90(squeeze(input(tiles(ii,jj),:,:))));
                        found=1;
                    end
                end
                side1 = sum(squeeze(input(:,1,:)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                side2 = sum(squeeze(input(:,:,1)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                side3 = sum(squeeze(input(:,10,:)).*repmat(fliplr(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1)),144,1),2);
                side4 = sum(squeeze(input(:,:,10)).*repmat(2.^(cumsum([1 1 1 1 1 1 1 1 1 1])-1),144,1),2);
                idx=(1:length(side1))';
                side1=repmat(side1,1,2);
                side1(:,2)=idx;
                side2=repmat(side2,1,2);
                side2(:,2)=idx;
                side3=repmat(side3,1,2);
                side3(:,2)=idx;
                side4=repmat(side4,1,2);
                side4(:,2)=idx;
                image_w((ii-1)*8+1:ii*8,(jj-1)*8+1:jj*8)=squeeze(input(tiles(ii,jj),2:9,2:9));
                image_wf((ii-1)*10+1:ii*10,(jj-1)*10+1:jj*10)=squeeze(input(tiles(ii,jj),:,:));                
            end
        end
    end
end

%image made (image_w), now find monsters

% monster:
%                   # 
% #    ##    ##    ###
%  #  #  #  #  #  #   

monster = ...
    [ ...
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0; ...
1 0 0 0 0 1 1 0 0 0 0 1 1 0 0 0 0 1 1 1 0; ...
0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 0; ...
    ];


% only the following combination of rotation and mirroring will yied monsters:
monster_map=conv2((fliplr(rot90(image_w))),monster,'same')==sum(sum(monster));
sea=fliplr(rot90(image_w));
% % [xc_mon,yc_mon]=find(monster_map==1);
% % % for idx=1:length(xc_mon)
% % %    sea(xc_mon(idx),yc_mon(idx))=sea(xc_mon(idx),yc_mon(idx))+2;
% % % end
% % for idx=1:length(xc_mon)
% %    sea(xc_mon(idx)-1:xc_mon(idx)+1,yc_mon(idx)-10:yc_mon(idx)+10)=sea(xc_mon(idx)-1:xc_mon(idx)+1,yc_mon(idx)-10:yc_mon(idx)+10)+monster*2;
% % end
sea_no_monster=sea;
sea_monster=sea;
monster=fliplr(flipud(monster));
for idx1=1:size(sea,1)-size(monster,1)
    for idx2=1:size(sea,2)-size(monster,2)
%         sea_no_monster(idx1,idx2) = sum(sum(sea(idx1:idx1+size(monster,1)-1,idx2:idx2+size(monster,2)-1).*monster));
        if (sum(sum(sea(idx1:idx1+size(monster,1)-1,idx2:idx2+size(monster,2)-1).*monster)) == sum(sum(monster)))
            sea_no_monster(idx1:idx1+size(monster,1)-1,idx2:idx2+size(monster,2)-1) = sea_no_monster(idx1:idx1+size(monster,1)-1,idx2:idx2+size(monster,2)-1)-monster;
            sea_monster(idx1:idx1+size(monster,1)-1,idx2:idx2+size(monster,2)-1) = sea_monster(idx1:idx1+size(monster,1)-1,idx2:idx2+size(monster,2)-1)+monster;
        end
    end
end

surf(sea_no_monster)

figure
surf(sea_monster)

disp(sum(sum(sea_no_monster)))