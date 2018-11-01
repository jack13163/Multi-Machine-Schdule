function [ newstarttimes ] = optimalshedule( starttimes,m,g,r,u,p )
%% ��̨�ദ������ҵ�����Ż�
% starttimes�����еĵ���
% r����ҵ���ͷ�ʱ��
% u����ҵ����ٿ�ʼʱ��
% m��������̨��
% g��ÿ̨�����ϴ������ĸ���
% p����ҵ�Ĵ���ʱ�䣬���е���ҵ����ʱ����ͬ
    
    rmin = min(r);
    umax = max(u);
    %δ���ȵ���ҵ
    U=1:length(r);
    %�Ż���ĵ���ʱ��
    newstarttimes = zeros(1,length(r));
    K=[];
    P=[];
    t=rmin;
    while t <= umax && ~isempty(U)
        %�����ȵ���ҵ����¼���±�
        Stmp = [];
        s = max(t,starttimes);
        %����δ������ҵ�ļ��ϣ�ͳ����t��t+p֮�俪ʼ����ҵ�ĸ���
        count = 0;
        for i=1:length(U)
            %ע�⵽��ʱ�����ƽ������У����ܿ�ʼʱ��λ��t��t+2p֮�����ҵ����������2mg
            if s(U(i)) >= t && s(U(i)) < t + 2*p
                count = count + 1;
                Stmp = [Stmp i];
                newstarttimes(U(i)) = s(U(i));
            end
        end
        %������
        if count >= m*g
            %ɾ���Ѿ����ȵ���ҵ
            U(Stmp) = [];
            %����ʱ��
            for i=t:t+3*p
                if ~ismember(i,K)
                    K=[K i];
                end
            end
            t = t + 2*p;
        else
            %����Ƿ��м���Ҫ���е���ҵ
            flag = 0;
            for i=1:length(U)
                if u(U(i)) == t
                    flag = 1;
                    break;
                end
            end
            %�����ڼ���Ҫ���е���ҵ
            if flag
                Stmp = [];
                %�������δ������ҵ�Ŀ�ʼʱ���Ƿ���t��t+p֮�䣬���ǣ�������
                for i=1:length(U)
                    if s(U(i)) >= t && s(U(i)) < t + p
                        Stmp = [Stmp i];
                        newstarttimes(U(i)) = s(U(i));
                        P = [P U(i)];
                    end
                end
                %ɾ���Ѿ����ȵ���ҵ
                U(Stmp) = [];
                %����ʱ��
                 t = t + p;
            else
                %�����ڼ������е���ҵʱ����Ҫ��ʱ������ǰ�ƽ�
                t = t + 1;
            end
        end
    end
end