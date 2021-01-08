% A_NEU=table(C{1}(1),C{1}(2),C{1}(3),'VariableNames',{'N','E','U'});
% P_NEU=table(P{1}(1),P{1}(2),P{1}(3),'VariableNames',{'N','E','U'});
% AGEN=struct('M2',struct('A',table(C{1}(1),C{1}(2),C{1}(3),'VariableNames',{'N','E','U'})));
% AGEN=struct('M2',struct('A',A_NEU,'P',P_NEU));
%����ȡ��վ��������λ�Ʋ����������λ����
%��ȡ��վ��˷ֳ���ֱ�����������λUAPԪ��
%��ȡ��վ�㾭γ��position����
clear;
clc;
[filename,pathname]=uigetfile('*.txt','�򿪸���վ�����ļ�');
fid=fopen(strcat(pathname,filename),'r');
if fid==-1
    msgbox('�ļ�ѡȡ������ȡ�����޷�����','warning','warn');
    return;
end
prompt = '�����վ����:';
dlg_title = 'Input';
num_lines = 1;
def={'100'};
n=inputdlg(prompt,dlg_title,num_lines,def);
position=zeros(str2double(n{1}),2,'double');        %�����վ�㾭��γ�Ⱦ���
UAP=cell(str2double(n{1}),1);                  %�����վ��8���ֳ�U�����������λ���һ��double��Ԫ��
station = cell(str2double(n{1}),1);            %��վ��Ԫ��
k=1;
while k<=str2double(n)
    fline=fgetl(fid);
    st = fline(6:9);                 %��վ������
    long = str2double(fline(34:41));
    lat=str2double(fline(45:51));
    sline=fgetl(fid);
    C = textscan(fid,'%7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f',3);           %��ȡվ���������Ϣ
    P = textscan(fid,'%f %f %f %f %f %f %f %f %f %f %f',3);                                 %��ȡ��վ��λ��Ϣ
    %��ȡM2�������λ
    M2A=table(C{1}(1),C{1}(2),C{1}(3),'VariableNames',{'U','E','N'});                 
    M2P=table(P{1}(1),P{1}(2),P{1}(3),'VariableNames',{'U','E','N'});                  
    M2=struct('A',M2A,'P',M2P);
    %��ȡS2�������λ
    S2A=table(C{2}(1),C{2}(2),C{2}(3),'VariableNames',{'U','E','N'});
    S2P=table(P{2}(1),P{2}(2),P{2}(3),'VariableNames',{'U','E','N'});
    S2=struct('A',S2A,'P',S2P);
    %��ȡN2�������λ
    N2A=table(C{3}(1),C{3}(2),C{3}(3),'VariableNames',{'U','E','N'});
    N2P=table(P{3}(1),P{3}(2),P{3}(3),'VariableNames',{'U','E','N'});
    N2=struct('A',N2A,'P',N2P);
    %��ȡK2�������λ
    K2A=table(C{4}(1),C{4}(2),C{4}(3),'VariableNames',{'U','E','N'});
    K2P=table(P{4}(1),P{4}(2),P{4}(3),'VariableNames',{'U','E','N'});
    K2=struct('A',K2A,'P',K2P);
    %��ȡK1�������λ
    K1A=table(C{5}(1),C{5}(2),C{5}(3),'VariableNames',{'U','E','N'});
    K1P=table(P{5}(1),P{5}(2),P{5}(3),'VariableNames',{'U','E','N'});
    K1=struct('A',K1A,'P',K1P);
    %��ȡO1�������λ
    O1A=table(C{6}(1),C{6}(2),C{6}(3),'VariableNames',{'U','E','N'});
    O1P=table(P{6}(1),P{6}(2),P{6}(3),'VariableNames',{'U','E','N'});
    O1=struct('A',O1A,'P',O1P);
    %��ȡP1�������λ
    P1A=table(C{7}(1),C{7}(2),C{7}(3),'VariableNames',{'U','E','N'});
    P1P=table(P{7}(1),P{7}(2),P{7}(3),'VariableNames',{'U','E','N'});
    P1=struct('A',P1A,'P',P1P);
    %��ȡQ1�������λ
    Q1A=table(C{8}(1),C{8}(2),C{8}(3),'VariableNames',{'U','E','N'});
    Q1P=table(P{8}(1),P{8}(2),P{8}(3),'VariableNames',{'U','E','N'});
    Q1=struct('A',Q1A,'P',Q1P);
    otl_ap = struct('M2',M2,'S2',S2,'N2',N2,'K2',K2,'K1',K1,'O1',O1,'P1',P1,'Q1',Q1);     %�˸��ֳ��������λ
    eval([st,'=','otl_ap',';']);
    position(k,1)=long;position(k,2)=lat;         %��վ�㾭γ��
    station{k}=st;      %��վ��
    %��ÿ����վU����˸��ֳ��������λ��ȡ����
    for j=1:8
        UAP{k}(j,1)=C{j}(1);
        UAP{k}(j,2)=P{j}(1);
    end
    o_line = fgetl(fid);
    e =fgetl(fid);
    status = feof(fid);
    if status == 1
            break
    end
     k=k+1;
end
fclose(fid);
 %����
save('F:\work\��ȡ��������\tp_otl\��վ��γ����U����A��P.mat','station','position','UAP'); %�ñ����ļ��а������в�վ��ľ�γ�Ⱥ�U������������λ
    
