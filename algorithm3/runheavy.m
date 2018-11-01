function [ U,m ] = runheavy( jid,starttimes,r,u,rmin,umax,p,g )
%% ��������ҵ
%U��ִ�й�����ҵ����ż���
%m��ʹ�õĻ�������
    U=[];%Ҫɾ������ҵ����
    k=0;
    t=0;
    m=0;
    while t < rmin
        k=k+1;
        t=k*p;
    end
    while t >= rmin && t <= umax
        Jt1=[];
        Jt2=[];
        %��һ��
        for i=1:length(jid)
            if starttimes(jid(i))==t
                Jt1=[Jt1 jid(i)];%������ҵ���
            end
        end
        k1=floor(length(Jt1)/g);
        if k1>0
            for i=1:k1*g
                no = Jt1(i);
                U=[U no];%��¼Ҫɾ������ҵ
                starttimes(Jt1(i))=max(starttimes(no),r(no));%���¿�ʼʱ��
            end
        end
        
        %�ڶ���
        for i=1:length(jid)
            if starttimes(jid(i)) <= t && t <= u(jid(i))
                Jt2=[Jt2 jid(i)];%������ҵ���
            end
        end
        k2=floor(length(Jt2)/g);
        if k2>0
            for i=1:k2*g
                no = Jt2(i);
                U=[U Jt2(i)];%��¼Ҫɾ������ҵ
                starttimes(no)=max(starttimes(no),r(no));%���¿�ʼʱ��
            end
        end
        k=k+1;
        t=k*p;
        m=m+k1+k2;
    end
end