function [  stat, set ] = act_tLock(datainT,Tsafe, activ, cpuJudge,nTerval )
% %{ ACT �ж���T�ڵķ������¶ȷֲ��Ƿ���������chiller��Ҫ��,
% stat��ֵ����chiller��Ҫ���е�������
% �����ͽ�set��Ϊ��Ҫ���͵��¶�

[l, m]=size(datainT);
test=zeros(1,m);

    for i=1:m
        test(i)=sum(datainT(:,m)>Tsafe)/l;
    end
    score=sum(test>cpuJudge)/m;%�����ȵı�׼��Ϊ��chiller����С���������ڹ��ȵ�ʱ��ٷֱ�
    if score>activ
        sumT=sum(datainT,2);
        %set=min(sumT(sumT>Tsafe*m))/m-Tsafe;
        %��ƽ���¶���͵�cpu(�����ڰ�ȫ�¶�)��ƽ���¶ȼ�ȥ��ȫ�¶���Ϊchiller��Ӧ����ֵ
        set=median(sumT(sumT>Tsafe*m))/m-Tsafe;
        stat=nTerval;
    else
        stat=0;
        set=0;
   
    end
    if isempty(set)
        set=0;
    end

end


