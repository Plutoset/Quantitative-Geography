%2003���й���½��ʡ�����˿���GDP�������ϵ��
file=xlsread('����ط���.xls');  %��������
x=file(:,1); %GDP
y=file(:,2); %�˿�
[a,b]=sort(x,'descend'); %��ȡx��λ��
[e,f]=sort(y,'descend'); %��ȡy��λ��
D=b-f;   %��λ�β�
s=sum(D.^2);   %λ�β��ƽ����
n=size(x,1); 
r=1-(6*s)/(n*(n^2-1)) %�����ϵ��


