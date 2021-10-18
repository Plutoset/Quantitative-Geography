%甘肃省53个气象台站多年平均降水量和纬度的一元线性回归系数
file=xlsread('一元线性回归分析.xls');
[m,n]=size(file);
x=file(:,2); %自变量
y=file(:,1); %因变量
X=mean(x); %平均值
Y=mean(y);
A=x-X;
B=y-Y;
Lxy=sum(A.*B);
Lxx=sum(A.^2);
b=Lxy/Lxx   %求b的最小二乘估计值
a=Y-b*X  %求a的最小二乘估计值

%显著性检验
U=b*Lxy %回归平方和  
Lyy=sum(B.^2);
S=Lyy;
Q=S-U; %误差平方和
F=U/(Q/(m-2))

X=[ones(size(x)),x1] %构造一个新的矩阵X，它的左半部分是和矩阵x一样行列数的全1矩阵。ones是构造一个元素全是1的矩阵
[B,bint,r,rint,stats]=regress(y,X)  %计算回归系数及F值
%B是回归方程中的参数估计值，
%bint是b的置信区间，
%r和rint分别表示残差及残差对应的置信区间，
%stats用于检验回归模型的统计量。有4个数值：判定系数R^2，F统计量观测值，检验的p的值，误差方差的估计。


