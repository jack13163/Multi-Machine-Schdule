function [ id ] = getregion( p,i )
%% �жϴ���ʱ��������������
%p������ʱ������
%i����ǰԪ�����������λ��
    %�������
    q=ceil(log2(max(p)/min(p)));
    m=min(p);
    count=1;
    while count<=q
        if p(i) >= m*power(2,count-1) && p(i) < m*power(2,count)
            break;
        elseif p(i) >= m*power(2,count)
            count = count + 1;
        end
    end
    id = count;
end

