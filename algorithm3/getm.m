function [ m ] = getm( g,r,u,p )
%% ���ֲ���ȷ��ʹ�����ٵĻ�������
    m1=1;
    m2=length(r);
    m=m2;
    flag=1;
    while flag
        n=fix((m1+m2)/2);
        [flag,~]=shedule(n * g,r,u,p);
        %���ڿ��н�
        if flag
            m=n;
            m2=n;
        else%�����ڿ��н�
            m1=n;
        end
        if m1==m2
            break;
        end
    end
end