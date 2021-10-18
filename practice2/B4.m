%甘肃省53个气象台站多年平均降水量、蒸发量、纬度和海拔四个要素的偏相关系数及复相关系数
file=xlsread('偏相关分析与复相关分析.xls');
[m,n]=size(file);
a=file(:,1);  %年降水量
b=file(:,2);  %年蒸发量
c=file(:,3);  %纬度
d=file(:,4); %海拔

%一级偏相关系数
r=corrcoef(file);%相关系数
r123=(r(1,2)-r(1,3)*r(2,3))/(sqrt((1-r(1,3)^2)*(1-r(2,3)^2))) % r12.3

r123=partialcorr(a,b,c)  % r12.3
r132=partialcorr(a,c,b)  % r13.2
r231=partialcorr(b,c,a)  % r23.1

A=file(:,1:3);
r1=partialcorr(A)

%二级偏相关系数
r123=partialcorr(a,b,c);  
r143=partialcorr(a,d,c);  
r243=partialcorr(b,d,c); 
r1234=(r123-r143*r243)/(sqrt((1-r143^2)*(1-r243^2)))  % r12.34

r2=partialcorr(file)

%显著性检验
t=r1234/sqrt(1-r1234^2)*sqrt(m-3-1)

R1234=sqrt(1-(1-r(1,2)^2)*(1-r1(1,3)^2)*(1-r2(1,4)^2)) % r1.234  %求复相关系数
F=(R1234^2/(1-R1234^2))*((m-3-1)/3)   %显著性检验