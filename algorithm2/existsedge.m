function [ M ] = existsedge( M,r,u,p)
%�ж�ͼ���Ƿ���ڱ�
    rmin=min(r);
    umax=max(u);
	%% Լ��1
    for i=1:size(M,1)
        if i >= rmin && i <= umax-p
            M(i+p,i) = 1;
        end
    end
    
	%% Լ��2
	for i=1:size(M,1)
        if i >= rmin && i < umax
            M(i,i+1) = 1;
        end
    end
    
	%% Լ��3
    for i=1:length(r)
        for j=1:length(r)           
            if(r(i)<u(j))
                M(r(i),u(j)) = 1;
            end
        end
    end
end
