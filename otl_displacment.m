%��������λ�Ƽ����������
load('F:\work\��ȡ��������\tp_otl\��վ��γ����U����A��P.mat');     %���ز�վ�㡢��վγ�ȡ�8���ֳ�U�����������λ
prompt = {'�������վ�㺣������λ��ҪԤ���ʱ��:','�������վ����Ŀ��'};
dlg_title = 'ʱ�����վ��������';
num_lines = 2;
def={'2020��11��20','247'};
t_n=inputdlg(prompt,dlg_title,num_lines,def);          %ȷ��Ҫ�����Ԥ��ʱ��Ͳ�վ������
t=t_n{1};n=str2double(t_n{2});
u_displacement=zeros(n,1,'double');
for i=1:n
    A=UAP{i}(:,1);
    P=UAP{i}(:,2);
    L=position(i,2);
    upre=otl_compute(t,A,P,L);
    u_displacement(i)=upre;
end
save('F:\work\��ȡ��������\tp_otl\��վU���򺣳�λ��.mat','u_displacement');