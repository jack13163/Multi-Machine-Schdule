function [ m ] = getm( g,r,u,p )
%% ���ֲ���ȷ��ʹ�����ٵĻ�������
    m1=1;
    m2=length(r);
    flag=1;
    while flag
        n=fix((m1+m2)/2);
        [flag,~]=shedule(n * g,r,u,p);
        if flag
            m=n;
        end
        m2=n;
    end
end