function [  stat, set ] = act_simple(datainT,Tsafe, activ, cpuJudge,nTerval )
% %{ ACT �ж���T�ڵķ������¶ȷֲ��Ƿ���������chiller��Ҫ��,
% stat��ֵ����chiller��Ҫ���е�������
% �����ͽ�set��Ϊ��Ҫ���͵��¶�

[l, m]=size(datainT);
test=zeros(1,m);

   score=sum(sum(datainT>Tsafe))/l/m;
   
    if score>activ*cpuJudge

        set=mean(datainT(datainT>Tsafe))-Tsafe;
        %��ƽ���¶���͵�cpu(�����ڰ�ȫ�¶�)��ƽ���¶ȼ�ȥ��ȫ�¶���Ϊchiller��Ӧ����ֵ
        stat=nTerval;
    else
        stat=0;
        set=0;
    end
    if isempty(set)
        set=0;
    end

end



