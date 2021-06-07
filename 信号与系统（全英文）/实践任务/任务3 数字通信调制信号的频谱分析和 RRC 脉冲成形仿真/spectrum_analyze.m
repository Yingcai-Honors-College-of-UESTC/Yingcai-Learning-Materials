%���ֵ����źŵ�Ƶ�׷���

fs = 10^10;
t = -10^-6:1/fs:10^-6;
w = 10^-9;
delay = 0.5 * w;

%������������
gt = rectpuls(t-delay,w);
M = 16; %��4��16��ѡ��4-QAM��16-QAM
gt_original = gt;  %�洢��ԭʼ�������ź�
st = qammod(gt,M);

%�����弤���ź�
for i = 1:1:999
    st=st+qammod(rectpuls(t-delay-i*w,w),M);  
end
L_1 = length(st);  %�źŵ���ʱ��
L_2 = length(gt_original);
Sf = fft(st);
y_SF = (abs(Sf)).^2;
f_1 = (0:L_1-1)*fs/L_1;

%����|S( f )|^2
figure(1)
plot(f_1,y_SF) 
xlabel('f (Hz)')
ylabel('|S(f)|^2')

%����Phi(f)
Gf = fft(gt_original);
y_PhiF = (10^10)*(abs(Gf)).^2;
f_2 = (0:L_2-1)*fs/L_2;
figure(2)
plot(f_2,y_PhiF) 
xlabel('f (Hz)')
ylabel('phi(f)')
