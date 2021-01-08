function upre = otl_compute(t,A,P,L)
%tΪ���㺣������λ�Ƶ�Ԥ��ʱ��
%�ú�������ÿ��ʱ���ĳ��վ��ĳһ����ĺ�������λ��
time=datenum(t);
tide_names=['M2';'S2';'N2';'K2';'K1';'O1';'P1';'Q1'];
FREQ=1./[12.421;12;12.658;11.967;23.934;25.819;24.066;26.868];
ERR=zeros(8,1);
TIDECON=[A,ERR,P,ERR];
upre=t_predic(time,tide_names,FREQ,TIDECON,L);
    