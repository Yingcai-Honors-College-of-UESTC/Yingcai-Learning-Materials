%��Ƶ��
%��Ҫ˼·������һ�е�˼·��ͬ������ֻ�ǰѷ����ز������RRC����

%����RRC����
h_1 = rcosdesign(0.25,40,60);
M = 16;%���Ĳ���������4QAM����14QAM���ź�
h_1_origin = h_1;  %������ԭʼ��gt�ź�
fs = 10^10;

%�½�һ���յ�һά���飬��������1000*2401��Ԫ�أ����ڹ����弤��
chain_rcosdesign=zeros(1,58345);
for i= 0:1:999
    for j=1:1:2401
      chain_rcosdesign(i*56+j)=chain_rcosdesign(i*56+j)+h_1(j);                 
    end
end
%�������������ڳ弤���ĺ���,������Ҫ�����źŽ����������룬�����޷�ʹ��qammod����
chain_rcosdesign=round(chain_rcosdesign);
st = qammod( chain_rcosdesign,M);
L_1=length(st);  %�źŵ���ʱ��
L_2=length(h_1_origin);
Sf=fft(st);
y_SF=(abs(Sf)).^2;
f_1=(0:L_1-1)*fs/L_1;

%����|S( f )|^2
figure(1)
plot(f_1,y_SF) 
title('double-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|S(f)|^2')

%����Phi_s
figure(2)
Gf=fft(h_1_origin);
y_phiF=(10^10)*(abs(Gf)).^2;
f_2=(0:L_2-1)*fs/L_2;
plot(f_2,y_phiF) 
title('double-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('phi(f)')
