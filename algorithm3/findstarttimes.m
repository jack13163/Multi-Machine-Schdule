%% ��̨�ദ�����ϵ���ҵ��æʱ���������
%��һ�����Ȳ��ȵĶ����������ת��Ϊ������ȵĶ����������
%ÿ̨�����ϵĴ���������
g = 2;
%��ҵ���ͷ�ʱ��
r = [1 2 2 3 4 5 3 4 6 7 4 5 9 7 3 4];
%��ҵ����ٿ�ʼʱ��
u = [9 4 7 5 6 8 10 15 12 10 9 7 10 9 5 6];
%��ҵ����ʱ��
p = [6 2 1 3 4 5 3 4 6 10 4 5 6 4 3 8];
%ʹ�õĻ�������
totalm = 0;
%������ҵ����ʱ�佫��ҵ���
tmp=zeros(1,length(p));
for i=1:length(p)
    tmp(i) = getregion(p,i);
end
%��ɾ����ҵ����
JD=[];
%ʣ����ҵ����
JR=1:length(r);
%��ʼʱ��
starttimes = zeros(1,length(u));
%��ÿ����ҵ�ֱ���
for i=1:max(tmp)
    %��i����ҵ
    bag = find(tmp==i);
    %��һ����ҵ���Ȳ��ȵĶ����������ת��Ϊ������ȵ���ҵ�Ķ���������⣬����һ�����е���
    [ tmpstarttime,rn,un ] = change(g,r(bag),u(bag),p(bag));
    %���¿�ʼʱ��
    for j=1:length(bag)
        starttimes(bag(j))=tmpstarttime(j);
    end
    %ִ��runheavy����
    [U,m]=runheavy(bag,starttimes,r,u,min(rn),max(un),max(p(bag)),g);
    %ʹ�õĻ�������m
    totalm=totalm+m;
    %ִ�й�����ҵ
    JD=[JD U];
end
%ɾ���Ѿ����ȵ���ҵ
JR(JD)=[];
%��ҵ����˳��
JD=[JD JR];
%��Ҫ�����ĸ���
m=shedulebytable(g,starttimes(JR),p(JR));
%�ܹ�ʹ�õĻ�������
totalm=totalm+m
%������ҵ�Ŀ�ʼʱ��
starttimes