fid = fopen('F:\work\��ȡ��������\tp_otl\long_lat.txt','w');
for i = 1:size(long,1)
fprintf(fid,'%f\t%f\n',long(i),lat(i));
end
fclose all;