%����ʡ53������̨վ����ƽ����ˮ����γ�ȵ����ϵ��
file=xlsread('����ط���.xls');  %��������
x=file(:,1);   %��ˮ��
y=file(:,2);    %γ��
X=mean(x); %��ƽ��ֵ
Y=mean(y);
A=x-X;  %�����
B=y-Y;

Lxy=sum(A.*B);
Lxx=sum(A.^2);
Lyy=sum(B.^2);
R=Lxy/sqrt(Lxx*Lyy) %���ϵ��

Corr=corrcoef(file)


