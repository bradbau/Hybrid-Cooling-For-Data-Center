function [ E , E_chiller, E_tec] = Ehybrid( oc, Tin ,F,  Terval, cop_chiller, Tsafe)
%EHYBRID �˴���ʾ�йش˺�����ժҪ
%   oc����chiller�����¶�ֵ�� Tin�Ǹ�ʱ�������cpu�����¶�ֵ

Cwater=4200;

rou=1000;%ˮ���ܶ�

E_chiller=Cwater*(oc)*F*Terval*rou/cop_chiller;
E_tec=0;
for i=1:length(Tin)
    if Tin(i)-oc>Tsafe
        E_tec=E_tec+Etec(Tin(i)-Tsafe-oc);
    end
end
E_tec=E_tec*300;
E=E_chiller+E_tec;

end

