function [ m ] = shedulebytable( g,s,p )
%% ͨ������ʱ�����ȼ�Ъ��ҵ
%s����ʼʱ��
%p������ʱ��
%g������������
%m����Ҫ�Ļ���̨��
    %��ҵ�ĸ���
    num=length(s);
    %��������
    m=1;
    %���ȱ�ÿg�д���һ��
    complete=s+p;
    scheduletable=zeros(num,g,max(complete)-min(s)+1);
    %�������ʣ��Ĳ��ȳ��ȵ���ҵ�����ͷ�ʱ��Ϊ��ʼʱ��
    if num>0
        for i=1:num
            %�����������Ƿ���Ե���
            j=1;
            while j<=m
                flag=0;
                for k=1:g
                    %��æʱ���
                    work=s(i):complete(i)-1;
                    if all(scheduletable(j,k,work)==0)
                        scheduletable(j,k,work)=1;
                        flag=1;
                        break;
                    end
                end
                %���ҵ�һ̨�������Ե��ȣ���ֹͣѰ��
                if flag
                    break;
                else
                    j=j+1;
                end
            end
            %��û���ҵ�һ̨�������Ե��ȣ��������һ̨����
            if flag==0
                m=m+1;
                scheduletable(m,1,work)=1;
            end
        end
    end
end

