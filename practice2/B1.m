%甘肃省53个气象台站多年平均降水量和纬度的相关系数
file=xlsread('简单相关分析.xls');  %导入数据
x=file(:,1);   %降水量
y=file(:,2);    %纬度
X=mean(x); %求平均值
Y=mean(y);
A=x-X;  %求离差
B=y-Y;

Lxy=sum(A.*B);
Lxx=sum(A.^2);
Lyy=sum(B.^2);
R=Lxy/sqrt(Lxx*Lyy) %相关系数

Corr=corrcoef(file)


