X=xlsread('�����������.xlsx');
BX=zscore(X,1);  % ��׼���׼�����ݾ���

Y=pdist(BX); % ��ŷ�Ͼ����������֮��ľ���
%minkowski�������Ʒ�˹������
%chebychev�����б�ѩ�����
SF=squareform(Y);%ת���ɾ������
%squareform������Ϊm(m�C1)/2 ������ת���ɣ�m*m�ĶԳƾ��󣬶Խ���Ϊ0

Z = linkage(Y,'single'); % ��̾��뷨���幹���߲�νṹ�ľ�����
%complete����������
T = cluster(Z,3);  % ��������
H=dendrogram(Z); % ������ͼ
