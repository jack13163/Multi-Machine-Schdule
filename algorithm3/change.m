function [ starttimes,rn,un ] = change( g,r,u,p )
%% ��һ����ҵ���Ȳ��ȵĶ����������ת��Ϊ������ȵ���ҵ�Ķ����������
    %ʣ����ҵ�������ʱ�䣬�µĴ���ʱ��
    pmax = max(p);
    %�µ��ͷ�ʱ�������ʼʱ��
    rn=pmax*floor(r/pmax);
    un=pmax*floor(u/pmax);
    %���ֲ���ȷ��ʹ�����ٵĻ�������
    if all(rn)==0%rn�д���0
        rn=rn+1;
        un=un+1;
    end
    m = getm(g,rn,un,pmax);
    %����һ�����е���
    [~,starttimes] = shedule(m * g,rn,un,pmax);
end