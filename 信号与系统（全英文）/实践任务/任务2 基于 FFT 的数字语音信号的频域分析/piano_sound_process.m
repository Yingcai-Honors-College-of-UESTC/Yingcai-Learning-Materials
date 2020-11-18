%��ȡ���������ļ�
[xx,fs] = audioread('la.wav');

%����ȡ�����������ݣ����������ݸ������źų���ʱ��
x = xx(:, 1);
N = length(x);    %���ݸ���
time = (0 : N-1) / fs;    %�źų���ʱ��

%��������������
plot(x);

%����������fft
M = 2048;
nfft = 8192;
win = hanning(M);
freq = (0 : nfft/2) * fs / nfft;
y = x(9001 : 9000+M);
y = y - mean(y);
Y = fft(y.*win,nfft);

%��ͼ
subplot 211;plot(y);
xlim([0 M]);
title('�źŲ���');
xlabel('����');
ylabel('��ֵ');
subplot 212;
plot(freq,20*log10(abs(Y(1:nfft/2+1))));
grid;
axis([0 max(freq) -60 55]);
title('Ƶ��');
xlabel('Ƶ��(Hz)');
ylabel('��ֵdB');
