function [ flag,starttimes ] = shedule( m,r,u,p )
%% ��̨��������ҵ�����Ż�
% starttimes�����еĵ���
% r����ҵ���ͷ�ʱ��
% u����ҵ����ٿ�ʼʱ��
% m��������̨��
% p����ҵ�Ĵ���ʱ�䣬���е���ҵ����ʱ����ͬ

    %��ҵ��ʱ��
    B=sort([r u]);
    rmin = min(B);
    umax = max(B);
    %��ʱ��Ϊ����
    T = rmin:umax;
    %ͼG�бߵ�Ȩ��
    G=ones(length(T))*inf;
    %��ʶͼG�еı�
    M=zeros(length(T));
    M = existsedge( M,rmin,umax,r,u,p)';
    for i=1:length(T)
        for j=1:length(T)
            %�ж��Ƿ���ڱߣ������ڣ������ߵ�Ȩ��
            if M(i,j) == 1
                if i < j
                    G(i,j)=m;
                else
                    count = 0;
                    for k = 1:length(r)
                        if r(k) >= j && u(k) <= i
                            count = count + 1;
                        end
                    end
                    G(i,j)=-count;
                end
            end
        end
    end

    %�������ͼ
    %graph(G);
    %�������
    [flag,dis] = bellmanford(G,umax);
    if flag
        %ȷ��������ҵ�Ŀ�ʼʱ��
        [~,ind]=sort(u);
        starttimes = zeros(1,length(u));
        k=1;
        for i=1:length(T)-1
            if dis(i) ~= dis(i+1)
                %��ǰʱ��i��ʼ����ҵ����
                tmp = dis(i+1) - dis(i);
                while(tmp > 0)
                    starttimes(ind(k)) = i;
                    k = k+1;
                    tmp = tmp - 1;
                end
            end
        end
    else
        starttimes=[];
    end
end