fs = 100; %���ò���Ƶ��Ϊ100
N = 256; %�������ݵ���Ϊ256

%�õ�ʱ������
n = 0 : N - 1;
t = n / fs;

%�������ź�
x = sin(2 * pi * 10 * t) + 2 * sin(2 * pi * 40 * t);

%���źŽ���fft
y = fft(x, N); 

%��fft������
mag = abs(y); 

%Ƶ������
f = n * fs / N;

%�����-Ƶ��ͼ
subplot(2,2,1),plot(f,mag); 
xlabel('Ƶ��/Hz');
ylabel('���');
title('N=256');
grid on;
