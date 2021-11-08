file=xlsread('降水数据.xls');
x=file(:,2);%坐标x
y=file(:,3);%坐标y
Z=file(:,1);%降水量
[r,c]=size(x);
a = ones(r,1);
%令x1=x,x2=y,x3=x^2,x4=xy,x5=y^2,........
x1 = x;
x2 = y;
x3=x.^2;
x4=x.*y;
x5=y.^2;
x6=x.^3;
x7=x.^2.*y;
x8=x.*y.^2;
x9=y.^3;
X = [a,x1,x2,x3,x4,x5,x6,x7,x8,x9];%用矩阵形式表示
A = inv(X'*X)*X'*Z;%三次多项式趋势面参数

%拟合适度的R^2检验
zg = X*A;
SSD=sum((Z-zg).^2);%剩余平方和
zmean=mean(Z);
SSR =sum((zg-zmean).^2);%回归平方和
R2 = SSR/(SSR+SSD) %拟合度系数
%显著性F检验
p = 9 ;
F=(SSR/p)/(SSD/(r-p-1))

[x,y]=meshgrid(0:0.25:4);%生成绘制3-D图形所需的网格数据
z=A(1,1)+A(2,1)*x+A(3,1)*y+A(4,1)*x.^2+A(5,1)*x.*y+A(6,1)*y.^2+A(7,1)*x.^3+A(8,1)*y.*x.^2+A(9,1)*x.*y.^2+A(10,1)*y.^3;
surf(x,y,z);