function [  stat, set ] = act(datainT,Tsafe, activ, cpuJudge,nTerval )
% %{ ACT �ж���T�ڵķ������¶ȷֲ��Ƿ���������chiller��Ҫ��,
% stat��ֵ����chiller��Ҫ���е�������
% �����ͽ�set��Ϊ��Ҫ���͵��¶�

[l, m]=size(datainT);
test=zeros(1,m);

   score=sum(sum(datainT>Tsafe))/l/m;
   
    if score>activ*cpuJudge

       % set=mean(datainT(datainT>Tsafe))-Tsafe;
        line=mean(datainT,2);
        set=min(line)-Tsafe;
        stat=nTerval;
    else
        stat=0;
        set=0;
    end
    if isempty(set)||set<0
        set=0;
    end

end



