buffer=load('data.mat');
%% ��ʼ������
[len,m]=size(buffer);
TECmem=0;% ֻ��¼TEC���ܹ�����
Pcritical=40;% W
minT=5; %����chiller��TEC��������,ʵ������ʱ�䲻Ӧ̫�󣬵��Ǳ����ݼ�һ�����ھ���5���ӣ�����ֻ������ʱ��ﵽ25����
chillerstat=0;
Etotal=zeros(len,1);
Twater=30;  
Twork=0;%chiller

for i=1:len;
    input=buffer(i,:);  %��ǰ����
    Tin=Tgenerate(input, Twater, 1, 1, 1, 0.5);
    % [ temperature ] = Tgenerate( data, Twater, k1, k2, b, threshold )
%% �����������ܺļ���
%1.�ж�TEC�Ĺ���״̬�Ƿ����Դ���chiller
% ����ͨ��浥��ϵͳ���д�chiller�ʹ�TEC���µĽ����������ܺĵ�ͼ�����ҽ��㣬���㴦TEC�ܹ���ΪPcritical
if chillerstat==0
    if length(TECmem)>minT
        if sum([TECmem>Pcritical])/length(TECmem)>0.7
            chillerstat=1;
            TECmem=0;
            deltaT=(Tgenerate(, Twater, 1, 1, 1, 0.5)-Twater); %chillerӦʹˮ���½��Ķ���
            Twater=Twater-deltaT;  %����һ�������ڿ�����chillerʹˮ���½����ȶ�
            Etotal(i)=Cwater**F*Terval*rou/cop_chiller;
            for j=1:m
                if Tin(j)>Tsafe+deltaT
                    Etotal=Etotal+k3*(Tin(j)-Tsafe-deltaT);
                end
            end
        end
    end
elseif chillerstat==1
    %�ж�chiller�Ĺ�Ч�Ƿ�ոպã����Ȼ���,��ͨ��Twater��
    
end
end
