%�ĳ���Ŀ������ȡÿ����վͬһ�ֳ���U������������λ���൱�ڶ�u_A_P.mat�е�UAP��������
%�ó�����һ���ṹ����ȡ�˸��ֳ���U�����������λ
%�������в�վ�ĸ����ֳ������������������Ʒֳ���ʸ��ͼ
load('F:\work\��ȡ��������\tp_otl\��վ��γ����U����A��P.mat');  %����ͨ��readOTL����õ��ĸ���վ��U������������λ
U=zeros(149,2,'double');
all={U,U,U,U,U,U,U,U};
phasor={U,U,U,U,U,U,U,U};
%��forѭ����ȡ���в�վ���ֳ��������λ
for i=1:149
    for j=1:8
        all{j}(i,1)=UAP{i}(j,1);all{j}(i,2)=UAP{i}(j,2);
    end
end
otlVector=struct('M2',all{1},'S2',all{2},'N2',all{3},'K2',all{4},'K1',all{5},'O1',all{6},'P1',all{7},'Q1',all{8});
save('F:\work\��ȡ��������\tp_otl\���ֳ��������λ.mat','otlVector');
%�������в�վ��8���ֳ�����
for k=1:8
    A=all{k}(:,1);P=all{k}(:,2);   %���е�i���ֳ��������λ
    phasor{k}=[A.*cosd(P),A.*sind(P)]; %���е�i���ֳ�������
end
save('F:\work\��ȡ��������\tp_otl\���ֳ�����.mat','phasor');