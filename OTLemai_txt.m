close all; clear ; clc;
[filename,pathname]=uigetfile('*.txt','�򿪸����������ļ�');
fid1=fopen(strcat(pathname,filename),'r');
if fid1==-1
    msgbox('�ļ�ѡȡ������ȡ�����޷�����','warning','warn');
    return;
end
fid2=fopen('F:\work\��ȡ��������\tp_otl\�ʼ���������.txt','w');    %�����޸�tp_otl�ļ���
while 1
line1 = fgets(fid1);
line2=fgetl(fid1);
line3 = fgetl(fid1);
tline = fgetl(fid1);
fprintf(fid2,'վ�����ƣ�%s %50s\n',tline(2:5),tline(29:76));
fprintf(fid2,'%7s %7s %7s %7s %7s %7s %7s %7s %7s %7s %7s\n','M2','S2','N2','K2','K1','O1','P1','Q1','MF','MM','SSA');
for i=1:3
    line = fgetl(fid1);
    fprintf(fid2,'%6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f %6.5f\n',str2double(line(3:8)),str2double(line(10:15)),str2double(line(17:22)),str2double(line(24:29)),str2double(line(31:36)),str2double(line(38:43)),str2double(line(45:50)),str2double(line(52:57)),str2double(line(59:64)),str2double(line(66:71)),str2double(line(73:78)));
end
for j=1:3
   line = fgetl(fid1);
   fprintf(fid2,'%7.1f %7.1f %7.1f %7.1f %7.1f %7.1f %7.1f %7.1f %7.1f %7.1f %7.1f\n',str2double(line(3:8)),str2double(line(10:15)),str2double(line(17:22)),str2double(line(24:29)),str2double(line(31:36)),str2double(line(38:43)),str2double(line(45:50)),str2double(line(52:57)),str2double(line(59:64)),str2double(line(66:71)),str2double(line(73:78)));
end
o_line = fgetl(fid1);
fprintf(fid2,'\n');
status = feof(fid1);
if status==1
    break
else
    continue
end
end
fclose all;
