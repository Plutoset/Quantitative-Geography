xls=xlsread("GDP原始数据");%导入数据
[m,n]=size(xls);%获取行列数
per=xls(:,3);%人均GDP

%——————常用指标——————%
pj=mean(per);%平均值
zws=median(per);%中位数
zs=mode(per);%众数
jc=max(per)-min(per);%极差
lc=per-pj;%离差
lpf=sum(lc.^2);%离差平方和
fc=var(per);%方差
s=std(per);%标准差
c=s/pj%变异系数
%分布特征
g1=skewness(per)%偏度系数
g2=kurtosis(per)%峰度系数

%——————集中化与均衡度——————%
w=xls(:,1)/sum(xls(:,1));%GDP比重
p=xls(:,2)/sum(xls(:,2));%人口比重
wp=w./p;%w/p
[gdp,i]=sort(wp);%w/p排序
sw=w(i);%GDP比重排序
sp=p(i);%人口比重排序
W=cumsum(sw);%累计GDP比重
P=cumsum(sp);%累计人口比重

[gdp2,i2]=sort(wp,'descend');%w/p倒序排序
sw2=w(i2);%GDP比重排序
W2=cumsum(sw2);%累计GDP比重
R=100*sum(1/m:1/m:1);
I=(100*sum(W2)-R)/(m*100-R)%集中化指数

%洛伦兹曲线
plot(P,W,'o-k');%实际分布
hold on;
plot(P,P,'-sk');%均衡分布

G=1-sum(sp.*(2*W-sw))%基尼系数
T=sum(w.*log10(w./p))%锡尔系数T
L=sum(p.*log10(p./w))%锡尔系数L
