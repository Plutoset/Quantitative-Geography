x=xlsread('主成分数据.xlsx');
X=(x-min(x))./(max(x)-min(x));%极差标准化
A=corrcoef(X); %相关系数矩阵

[vec,val]=eig(A); %计算特征值和特征向量
t=diag(val); %提取对角线元素
[sval,I]=sort(t,'descend'); %对特征根进行排序
v=fliplr(vec);%对特征向量排序，围绕垂直轴左右翻转

latent=sval/sum(sval); %计算主成分贡献率
Latent=cumsum(latent);  %计算主成分累计贡献率
n=size(Latent);
%取累计贡献率达85%的特征值所对应的主成分
for i=1:n
     if Latent(i)>=0.85
      i
      break
     end
end

B=(sqrt(sval(1:i)').*v(:,1:i)); %主成分载荷
C=x*B;  %主成分得分