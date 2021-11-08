X=xlsread('聚类分析数据.xlsx');
BX=zscore(X,1);  % 标准差标准化数据矩阵

Y=pdist(BX); % 用欧氏距离计算两两之间的距离
%minkowski——明科夫斯基距离
%chebychev——切比雪夫距离
SF=squareform(Y);%转换成距离矩阵
%squareform将长度为m(m–1)/2 的向量转换成，m*m的对称矩阵，对角线为0

Z = linkage(Y,'single'); % 最短距离法定义构建具层次结构的聚类树
%complete——最大距离
T = cluster(Z,3);  % 创建聚类
H=dendrogram(Z); % 画聚类图
