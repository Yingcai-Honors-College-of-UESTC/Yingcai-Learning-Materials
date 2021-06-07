%�ο�˹��׼��

Fs = 10^9;    % ����Ƶ��                    
T = 1/Fs;    %��������       
L = 48;    %�źų���
t = (0:L-1)*T;    %ʱ��

%������������ϵ����ͬ�������Һ���
h_1 = rcosdesign(0.25,6,4);    %����ϵ��Ϊ0.25
fvtool(h_1,'Analysis','impulse');
h_2 = rcosdesign(0.5,6,4);    %����ϵ��Ϊ0.5
fvtool(h_2,'Analysis','impulse');
h_3 = rcosdesign(1,6,4);    %����ϵ��Ϊ1
fvtool(h_3,'Analysis','impulse');

%��h_1��Ƶ��
Y_1 = fft(h_1);
P2_1 = abs(Y_1/L);
P1_1 = P2_1(1:L/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1_1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
hold on

%��h_2��Ƶ��
Y_2 = fft(h_2);
P2_2 = abs(Y_2/L);
P1_2 = P2_2(1:L/2+1);
P1_2(2:end-1) = 2*P1_2(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1_2) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
hold on

%��h_3��Ƶ��
Y_3 = fft(h_3);
P2_3 = abs(Y_3/L);
P1_3 = P2_3(1:L/2+1);
P1_3(2:end-1) = 2*P1_3(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1_3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P(f)|')
hold on
