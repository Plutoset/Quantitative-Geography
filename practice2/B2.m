%2003年中国大陆各省份总人口与GDP的秩相关系数
file=xlsread('秩相关分析.xls');  %加载数据
x=file(:,1); %GDP
y=file(:,2); %人口
[a,b]=sort(x,'descend'); %获取x的位次
[e,f]=sort(y,'descend'); %获取y的位次
D=b-f;   %求位次差
s=sum(D.^2);   %位次差的平方和
n=size(x,1); 
r=1-(6*s)/(n*(n^2-1)) %秩相关系数


