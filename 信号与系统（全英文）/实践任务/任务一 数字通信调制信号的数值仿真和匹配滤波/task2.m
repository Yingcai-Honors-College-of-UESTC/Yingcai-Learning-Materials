%�����ź�Ϊ4-QAM�ź�
%����������Եõ�Eb=1,��N0=1/10������=N0/2=1/20
%�ڵ�һ��������ź��м����˹������
%��ͼʱ������Ҫ���Ĳ���ע�ͻ�����

signal_In=randsrc(128,2);    %����һ��128*2�ľ��󣬴�����Ϊ128������ź�In������ʵ�����鲿��
signal_In_noisy=awgn(signal_In,10);    %�����ɵ��ź��м����˹��������SNR=10

%s(t)��ʵ���źżӰ�������ͼ
real_part=0;    %��ʼ���źŵ�ʵ��
time=0:0.1:129;    %����t��ȡֵ��Χ��0��129������Ϊ0.1
t01=0;  %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
g=stepfun(time,t01)-stepfun(time,t02);  %����g(t)����
for i=1:128
    real_part=real_part+signal_In_noisy(i,1)*(stepfun(time,t01+i)-stepfun(time,t02+i));   %ʵ�����ۼ�
    plot(real_part,'-+r');   %����ʵ��
    hold on    %��������壬׼���������鲿
end

%s(t)���鲿�źżӰ�������ͼ
imagine_part=0;    %��ʼ���źŵ��鲿
time=0:0.1:129;    %����t��ȡֵ��Χ��0��129������Ϊ0.1
t01=0;  %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
g=stepfun(time,t01)-stepfun(time,t02);  %����g(t)����
for i=1:128
    imagine_part=imagine_part+signal_In_noisy(i,2)*(stepfun(time,t01+i)-stepfun(time,t02+i));    %�鲿���ۼ�
    %plot(imagine_part,'-*b');    %�����鲿
    hold on    %���������
end

%s(t)ʵ���źŵİ�������ͼ
real_part=0;    %��ʼ���źŵ�ʵ��
time=0:0.1:129;    %����t��ȡֵ��Χ��0��129������Ϊ0.1
t01=0;  %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
g=stepfun(time,t01)-stepfun(time,t02);  %����g(t)����
for i=1:128
    real_part=real_part+(signal_In_noisy(i,1)-signal_In(i,1))*(stepfun(time,t01+i)-stepfun(time,t02+i));   %ʵ���������ۼ�
    plot(real_part,'-+y');   %����ʵ������
    hold on    %��������壬׼���������鲿
end

%s(t)�鲿�źŵİ�������ͼ
imagine_part=0;    %��ʼ���źŵ��鲿
time=0:0.1:129;    %����t��ȡֵ��Χ��0��129������Ϊ0.1
t01=0;  %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
g=stepfun(time,t01)-stepfun(time,t02);  %����g(t)����
for i=1:128
    imagine_part=imagine_part+signal_In_noisy(i,2)*(stepfun(time,t01+i)-stepfun(time,t02+i));    %�鲿�������ۼ�
    %plot(imagine_part,'-*k');    %�����鲿����
    hold on    %���������
end
