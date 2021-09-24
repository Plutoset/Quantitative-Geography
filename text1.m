xls=xlsread("GDPԭʼ����");%��������
[m,n]=size(xls);%��ȡ������
per=xls(:,3);%�˾�GDP

%����������������ָ�ꡪ����������%
pj=mean(per);%ƽ��ֵ
zws=median(per);%��λ��
zs=mode(per);%����
jc=max(per)-min(per);%����
lc=per-pj;%���
lpf=sum(lc.^2);%���ƽ����
fc=var(per);%����
s=std(per);%��׼��
c=s/pj%����ϵ��
%�ֲ�����
g1=skewness(per)%ƫ��ϵ��
g2=kurtosis(per)%���ϵ��

%���������������л������ȡ�����������%
w=xls(:,1)/sum(xls(:,1));%GDP����
p=xls(:,2)/sum(xls(:,2));%�˿ڱ���
wp=w./p;%w/p
[gdp,i]=sort(wp);%w/p����
sw=w(i);%GDP��������
sp=p(i);%�˿ڱ�������
W=cumsum(sw);%�ۼ�GDP����
P=cumsum(sp);%�ۼ��˿ڱ���

[gdp2,i2]=sort(wp,'descend');%w/p��������
sw2=w(i2);%GDP��������
W2=cumsum(sw2);%�ۼ�GDP����
R=100*sum(1/m:1/m:1);
I=(100*sum(W2)-R)/(m*100-R)%���л�ָ��

%����������
plot(P,W,'o-k');%ʵ�ʷֲ�
hold on;
plot(P,P,'-sk');%����ֲ�

G=1-sum(sp.*(2*W-sw))%����ϵ��
T=sum(w.*log10(w./p))%����ϵ��T
L=sum(p.*log10(p./w))%����ϵ��L
