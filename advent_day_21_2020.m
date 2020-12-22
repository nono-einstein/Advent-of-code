clear all;
fid = fopen('advent_day_21_2020.txt');
idx=1;
clear input input_nbr
while ~feof(fid)
    temp = fgetl(fid);
    temp2=regexp(temp,'\(','split');
    input{idx}.ingredients=textscan(temp2{1}, '%s');
    input{idx}.allergens=textscan(strrep(strrep(strrep(temp2{2},')',''), 'contains',''),',',''), '%s');
    idx=idx+1;
end
fclose(fid);

%find each ingredient/allergen
ingredients={};
allergens={};
for idx=1:length(input)
    ingredients{end+1}=input{idx}.ingredients{1}(:)';
    allergens{end+1}=input{idx}.allergens{1}(:)';
end

%unique list of ingredients/allergen
uni_ingredients=unique([ingredients{:}]);
uni_allergens=unique([allergens{:}]);

allergens_list=zeros(length(uni_allergens),length(input));
for idx=1:length(uni_allergens)
    loop=0;
    for idx2=1:length(input)
        if any(cell2mat(strfind(input{idx2}.allergens{1},uni_allergens{idx})))
            allergens_list(idx,idx2)=1;
            loop=loop+1;
            list2{idx,loop}=input{idx2}.ingredients{1}(:)';
        end
    end
end

% % check unique amongst individual allergens lists
% % first addlists up
% %find each ingredient/allergen
% ingredients_per_allergen={};
% for idx2=1:size(list2,1)
%     for idx=1:size(list2,2)
%         ingredients_per_allergen{idx2,end+1}=list2{idx2,idx};
%     end
% end

for idx2=1:size(list2,1)
    for idx=2:size(list2,2)
        if idx==2
            if ~isempty(list2{idx2,2})
                temp=intersect(list2{idx2,1}, list2{idx2,2});
            else
                temp=intersect(list2{idx2,1}, list2{idx2,1});
            end
        elseif ~isempty(list2{idx2,idx})
            temp=intersect(temp, list2{idx2,idx});
        end
    end
    intersect_lists{idx2}=temp;
end

final_list = unique([intersect_lists{:}]);
% setje=setdiff(([ingredients{:}]),final_list);
% som=0;
% for idx=1:size(setje,2)
%     som=som+sum(cell2mat(strfind(([ingredients{:}]),setje{idx})));
% end
% 

% anders:
totaal=[ingredients{:}];
for idx=1:length(final_list)
    totaal=strrep(totaal,final_list{idx},'');
end
som=0;
for idx=1:length(totaal)
    som=som+1*(length(totaal{idx})>0);
end
disp(som)

final_intersect_list={};
for loop=1:8
    for idx=1:length(intersect_lists)
        if size(intersect_lists{idx},2)==1
            final_intersect_list{idx}=intersect_lists{idx};
            for idx1=1:length(intersect_lists)
                for idx2=1:length(intersect_lists{idx1})
                    if strcmp(char(intersect_lists{idx1}(idx2)), final_intersect_list{idx})
                        intersect_lists{idx1}(idx2)=[];
                    end
                end
            end
        end
    end
end

sprintf('%s,%s,%s,%s,%s,%s,%s,%s',char([final_intersect_list{1}]),char([final_intersect_list{2}]),char([final_intersect_list{3}]),char([final_intersect_list{4}]),char([final_intersect_list{5}]),char([final_intersect_list{6}]),char([final_intersect_list{7}]),char([final_intersect_list{8}]))
