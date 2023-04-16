

%%%����ǰ���carsim�ĳ��ٶ��Ƿ�Ϊ0
x=0;%��ʼ������
for i=1:21
    %�ó���ǳ���ʱ�������Ҫ������ܼ������ݣ����Ȳ���
    sim('calibration');
    v_temp(:,i)=vx.data;
    a_temp(:,i)=ax.data;
    thr_temp(:,i)=ones(length(vx.data),1)*x;        
    x=x+0.05;
end

%�ϲ�,һ��Ҫת���������ٺϲ�������ᵼ�ºϲ�ʧ��
 v=v_temp(:,1)';
 a=a_temp(:,1)';
 tr=thr_temp(:,1)';
for i=2:length(v_temp(1,:))
    v=[v,v_temp(:,i)'];
    a=[a,a_temp(:,i)'];
    tr=[tr,thr_temp(:,i)'];
end

        




    
    
    