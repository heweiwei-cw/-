%�������ֳ���ʸ��ͼ
%���ȸ��ݷֳ����������λ�����ֳ�������ÿ����վ����8���ֳ�����
%����վ��γ�������о��ȴ���180�ȵ�ֵ��ȥ360�ȣ�ʹ�þ��ȱ�����[-180 180];
%ʹ��m_mapѡ��������������m_quiver(long,lat,U,V,S)���������ֳ����������ڲ�����
load('F:\work\��ȡ��������\tp_otl\���ֳ�����.mat');     %���ز�վ���ֳ�����
load('F:\work\��ȡ��������\tp_otl\��վ��γ����U����A��P.mat');%���ز�վ��γ��
long=position(:,1);lat=position(:,2);               %��վ�ľ�γ��
long(long>180)=long(long>180)-360;       %�������޶���[-180 180]��Χ��
min_long=floor(min(long));max_long=ceil(max(long));   
longitudes=[min_long max_long];                       %�������ȷ�Χ
min_lat=floor(min(lat));max_lat=ceil(max(lat));      
latitudes=[min_lat max_lat];                          %����γ�ȷ�Χ
%����M2�ֳ�ʸ��ͼ
C={'M2','S2','N2','K2','K1','O1','P1','Q1'};
color='mbgrmbgr';
 ln_sar=[0.10 4.70 4.70 0.10 0.10]; 
 lt_sar=[50.68 50.68 47.80 47.80 50.68];
for m=1:8
    subplot(2,4,m);
    m_proj('albers equal-area','longitudes',[-5 5],'latitudes',[42 52]);
    [CS,CH]=m_etopo2('contourf',[-7000:500:3000],'edgecolor','none');
    m_coast('patch',[0.7 0.7 0]);
    m_grid('box','fancy','tickdir','in');
    hold on
    m_quiver(long,lat, phasor{m}(:,1), phasor{m}(:,2),2,color(m));
    f_text = [C{m},'�ֳ���ʸ��ͼ'];
    m_line(ln_sar,lt_sar,'color','black','linewi',3);
    title(f_text,'fontsize',15);
    xlabel('����');ylabel('γ��');
end
 colormap([ m_colmap('blues')]);