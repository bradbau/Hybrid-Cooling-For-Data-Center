function [ power ] = Etec(deltaT )
%E_TEC �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if deltaT<8
    power=0.0918*deltaT^2+0.034*deltaT;
else
    power=0.8941*deltaT^2-14.16*deltaT+65.43;
end
    


end

