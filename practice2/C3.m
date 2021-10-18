%某地区人口与时间的非线性回归系数
file=xlsread('非线性回归分析.xls'); %加载数据
a=file(:,2);%时间
b=file(:,3);%人口
scatter(a,b)%画散点图
x=exp(-a);
y=1./b;
X=[ones(size(x)),x];
[B,bint,r,rint,stats]=regress(y,X) %计算回归系数及F值

Y=1./(B(1)+B(2)*x);
hold on;
plot(a,Y)