%����һ���������һ�� 4-QAM ���� 16-QAM �� In ���У����糤��Ϊ 128 �����У���
%�� MATLAB �л�����Ӧ�����ź� s(t)��ʵ�����鲿�źš�
%ͬʱ�������ϵͳ��ƽ�����������������ۼ��������жԱ���֤

signal_In=randsrc(128,2);    %����һ��128*2�ľ��󣬴�����Ϊ128������ź�In������ʵ�����鲿��

%s(t)��ʵ���ź�
real_part=0;    %��ʼ���źŵ�ʵ��
time=0:0.1:129;    %����t��ȡֵ��Χ��0��129������Ϊ0.1
t01=0;  %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
g=stepfun(time,t01)-stepfun(time,t02);  %����g(t)����
for i=1:128
    real_part=real_part+signal_In(i,1)*(stepfun(time,t01+i)-stepfun(time,t02+i));   %ʵ�����ۼ�
    plot(real_part,'-+r');   %����ʵ��
    hold on    %��������壬׼���������鲿
end

%s(t)���鲿�ź�
imagine_part=0;    %��ʼ���źŵ��鲿
time=0:0.1:129;    %����t��ȡֵ��Χ��0��129������Ϊ0.1
t01=0;  %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
g=stepfun(time,t01)-stepfun(time,t02);  %����g(t)����
for i=1:128
    imagine_part=imagine_part+signal_In(i,2)*(stepfun(time,t01+i)-stepfun(time,t02+i));    %�鲿���ۼ�
    plot(imagine_part,'-*b');    %�����鲿
    hold on    %���������
end

%�������ۼ��㣬ƽ������������1
%ʵ�ʼ���Ϊ2*128/2*128=1