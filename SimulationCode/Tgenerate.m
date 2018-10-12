function [ temperature ] = Tgenerate( data, Twater, k1, k2, b1,b2,  threshold )
%TGENERATE �����ÿ��ʱ�̣�ÿ����������cpu�¶�
%   �˴���ʾ��ϸ˵��
[l, m]=size(data);
temperature=zeros(l,m);
for i=1:l
    for j=1:m
        if data(i,j)<threshold
            temperature(i,j)=Twater-50+k1*data(i,j)+b1;
        else
            temperature(i,j)=Twater-50+k2*data(i,j)+b2;
        end
    end
 end
% temprature(data<=threshold)=Twater+k1*data(data<threshold)+b;
% temprature(data>threshold)=Twater+k2*data(data<threshold)+b;
end

