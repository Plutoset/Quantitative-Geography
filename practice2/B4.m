%����ʡ53������̨վ����ƽ����ˮ������������γ�Ⱥͺ����ĸ�Ҫ�ص�ƫ���ϵ���������ϵ��
file=xlsread('ƫ��ط����븴��ط���.xls');
[m,n]=size(file);
a=file(:,1);  %�꽵ˮ��
b=file(:,2);  %��������
c=file(:,3);  %γ��
d=file(:,4); %����

%һ��ƫ���ϵ��
r=corrcoef(file);%���ϵ��
r123=(r(1,2)-r(1,3)*r(2,3))/(sqrt((1-r(1,3)^2)*(1-r(2,3)^2))) % r12.3

r123=partialcorr(a,b,c)  % r12.3
r132=partialcorr(a,c,b)  % r13.2
r231=partialcorr(b,c,a)  % r23.1

A=file(:,1:3);
r1=partialcorr(A)

%����ƫ���ϵ��
r123=partialcorr(a,b,c);  
r143=partialcorr(a,d,c);  
r243=partialcorr(b,d,c); 
r1234=(r123-r143*r243)/(sqrt((1-r143^2)*(1-r243^2)))  % r12.34

r2=partialcorr(file)

%�����Լ���
t=r1234/sqrt(1-r1234^2)*sqrt(m-3-1)

R1234=sqrt(1-(1-r(1,2)^2)*(1-r1(1,3)^2)*(1-r2(1,4)^2)) % r1.234  %�����ϵ��
F=(R1234^2/(1-R1234^2))*((m-3-1)/3)   %�����Լ���