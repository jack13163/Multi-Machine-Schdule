function graph(cm)
%% ��ͼ

    %% ȥ��ͼ�е�Ȩ��Ϊinf�ı�
    for i=1:size(cm,1)
        for j=1:size(cm,2)
            if cm(i,j) == inf
                cm(i,j) = 0;
            end
        end
    end
    
    %% ����ͼ��ʾȨ�ز����ӻ�
     bg=biograph(cm);
     bg.showWeights='on';
     view(bg);
end