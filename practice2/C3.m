%ĳ�����˿���ʱ��ķ����Իع�ϵ��
file=xlsread('�����Իع����.xls'); %��������
a=file(:,2);%ʱ��
b=file(:,3);%�˿�
scatter(a,b)%��ɢ��ͼ
x=exp(-a);
y=1./b;
X=[ones(size(x)),x];
[B,bint,r,rint,stats]=regress(y,X) %����ع�ϵ����Fֵ

Y=1./(B(1)+B(2)*x);
hold on;
plot(a,Y)