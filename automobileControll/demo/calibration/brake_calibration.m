%����ǰ��鳵�ĳ��ٶ��Ƿ�Ϊ180
x=0;%��ʼ��ɲ��
%%ɲ���ĳ��ٶ�һ��Ҫ�Ƚϸߣ�180km/h��144km/h
for i=1:81
    %�ó���ǳ���ʱ�������Ҫ������ܼ������ݣ����Ȳ���
    sim('calibration');
    v_temp1(:,i)=vx.data;
    a_temp1(:,i)=ax.data;
    brake_temp1(:,i)=ones(length(vx.data),1)*x;
    %%%%���������������ԣ���Ϊ����brake=1����2����󶼻ᵼ�³���v��a=0���⽫���¶�ֵ��
    for j=1:length(v_temp1(:,i))
        if v_temp1(j,i)<0.01
            brake_temp1(j,i)=0;
        end        
    end
  
    x=x-0.1;   
end
a_temp1(1,:)=a_temp1(2,:);

%�ϲ�,һ��Ҫת���������ٺϲ�������ᵼ�ºϲ�ʧ��
vbr=v_temp1(:,1)';
abr=a_temp1(:,1)';
br=brake_temp1(:,1)';
for i=2:length(v_temp1(1,:))
    vbr=[vbr,v_temp1(:,i)'];
    abr=[abr,a_temp1(:,i)'];
    br=[br,brake_temp1(:,i)'];
end







    
    
    