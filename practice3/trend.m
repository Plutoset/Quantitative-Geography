file=xlsread('��ˮ����.xls');
x=file(:,2);%����x
y=file(:,3);%����y
Z=file(:,1);%��ˮ��
[r,c]=size(x);
a = ones(r,1);
%��x1=x,x2=y,x3=x^2,x4=xy,x5=y^2,........
x1 = x;
x2 = y;
x3=x.^2;
x4=x.*y;
x5=y.^2;
x6=x.^3;
x7=x.^2.*y;
x8=x.*y.^2;
x9=y.^3;
X = [a,x1,x2,x3,x4,x5,x6,x7,x8,x9];%�þ�����ʽ��ʾ
A = inv(X'*X)*X'*Z;%���ζ���ʽ���������

%����ʶȵ�R^2����
zg = X*A;
SSD=sum((Z-zg).^2);%ʣ��ƽ����
zmean=mean(Z);
SSR =sum((zg-zmean).^2);%�ع�ƽ����
R2 = SSR/(SSR+SSD) %��϶�ϵ��
%������F����
p = 9 ;
F=(SSR/p)/(SSD/(r-p-1))

[x,y]=meshgrid(0:0.25:4);%���ɻ���3-Dͼ���������������
z=A(1,1)+A(2,1)*x+A(3,1)*y+A(4,1)*x.^2+A(5,1)*x.*y+A(6,1)*y.^2+A(7,1)*x.^3+A(8,1)*y.*x.^2+A(9,1)*x.*y.^2+A(10,1)*y.^3;
surf(x,y,z);