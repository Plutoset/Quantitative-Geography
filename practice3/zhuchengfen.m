x=xlsread('���ɷ�����.xlsx');
X=(x-min(x))./(max(x)-min(x));%�����׼��
A=corrcoef(X); %���ϵ������

[vec,val]=eig(A); %��������ֵ����������
t=diag(val); %��ȡ�Խ���Ԫ��
[sval,I]=sort(t,'descend'); %����������������
v=fliplr(vec);%��������������Χ�ƴ�ֱ�����ҷ�ת

latent=sval/sum(sval); %�������ɷֹ�����
Latent=cumsum(latent);  %�������ɷ��ۼƹ�����
n=size(Latent);
%ȡ�ۼƹ����ʴ�85%������ֵ����Ӧ�����ɷ�
for i=1:n
     if Latent(i)>=0.85
      i
      break
     end
end

B=(sqrt(sval(1:i)').*v(:,1:i)); %���ɷ��غ�
C=x*B;  %���ɷֵ÷�