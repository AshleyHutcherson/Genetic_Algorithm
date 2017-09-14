% ��������������Ŵ��㷨
% 20�����У�2����·
clear,clc
close all
load city_distance.mat
load city_location.mat
City_Number=21;         %��������
Race_Number=200;        %��Ⱥ����
Iteration=200;          %��������
P_Cross=0.6;            %�������
P_Mutation=0.2;         %�������
race=zeros(Race_Number,City_Number+2);

for i=1:Race_Number                         %��ʼ����Ⱥ
    temp=randperm(City_Number);
    route=[City_Number+1,temp,City_Number+1];
    route=ga_hamilton(route);         %ʹ�ø���Ȧ�㷨�Ż���ʼ��Ⱥ
    race(i,:)=route;
end
for t=1:Iteration
    adaptation=ga_adaptation(race);
    race=ga_choose(race,adaptation);
    race=ga_cross(race,P_Cross);
    race=ga_mutation(race,P_Mutation);
    race=ga_exchange(race,P_Cross);
    race=ga_invert(race,P_Cross);
    [path,val]=ga_plot(race);
    best_path=path;
    best_value=val;
    pause(0.1);
end

