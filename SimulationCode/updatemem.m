function [ tempmem ] = updatemem( tempmem, new , nTerval)
%UPDATEMEM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[l,m]=size(tempmem);
if l<nTerval
    tempmem=[tempmem; new];
else
    for i=1:nTerval-1
        tempmem(i,:)=tempmem(i+1,:);
    end
    tempmem(nTerval,:)=new;
end

end

