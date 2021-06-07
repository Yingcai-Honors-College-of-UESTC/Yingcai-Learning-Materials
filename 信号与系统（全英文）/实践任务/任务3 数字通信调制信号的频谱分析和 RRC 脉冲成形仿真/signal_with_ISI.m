clc
clear variables
close all

%% ����źŵ�����
%=====������������е�ά��
global N
N=10000;
%=====���������1���ĸ���Ϊp
global p
p=0.5;
%==========================
%���Ȳ����������������
source=randsrc(1,N,[1,0;p,1-p]);
%===========================
%��������������
figure(1)
stem(source(1,1:50),'filled');
title('�������������');
%=============================
%�Բ����Ķ��������н���QAM����
[source1,source2]=Qam_modulation(source);
%=============================
%��������ͼ
figure(2)
scatter(source1,source2,'b*');
title('16QAM����ͼ');
axis([-5 5 -5 5])
%==============================
%����·�źŽ��в�ֵ
sig_insert1=insert_value(source1,8);
sig_insert2=insert_value(source2,8);
%===============================
%������ֵ����·�źŵĲ���ͼ
figure(3)
subplot(2,1,1);
plot(sig_insert1(1,1:80));
title('��ֵ����·�źŵĲ���ͼ��ʵ���ź�');
subplot(2,1,2);
plot(sig_insert2(1,1:80));
title('��ֵ����·�źŵĲ���ͼ���鲿�ź�');
%===============================
%ͨ����ͨ�˲���
rolloff = 0.25;  % Filter rolloff
span = 6;        % Filter span
sps = 4;         % Samples per symbol
[sig_rcos1,sig_rcos2]=rise_cos(sig_insert1,sig_insert2,rolloff,span,sps);
%===============================
%����ͨ����ͨ�˲�������·����ͼ
figure(4)
subplot(2,1,1);
plot(sig_rcos1(1,1:80));
title('ͨ����ͨ�˲�������·����ͼ��ʵ���ź�');
subplot(2,1,2);
plot(sig_rcos2(1,1:80));
title('ͨ����ͨ�˲�������·����ͼ���鲿�ź�');
%=================================
%10���ز�����
[t,sig_modulate]=modulate_to_high(sig_rcos1,sig_rcos2,0.25,2);
%=================================
%���������ʵ�ź�ͼ��
figure(5)
plot(t(1:500),sig_modulate(1:500));
title('�����ʵ�ź�ͼ��');
%=================================
%���˲�����źż����˹������
snr=10;
[x1,x2]=generate_noise(sig_rcos1,sig_rcos2,snr);
sig_noise1=x1.';
sig_noise2=x2.';
%=================================
%���������˹�������Ĳ���
figure(6)
subplot(2,1,1);
plot(sig_noise1(1:80));
title('�����˹���������źŲ���:ʵ���ź�');
subplot(2,1,2);
plot(sig_noise2(1:80));
title('�����˹���������źŲ���:�鲿�ź�');
%==================================
%����ƥ���˲���
[sig_match1,sig_match2]=filt_match(sig_noise1,sig_noise2,rolloff,span,sps);
%===============================
%����ͨ��ƥ���˲�������·����ͼ
figure(7)
subplot(2,1,1);
plot(sig_match1(1:80));
title('ͨ��ƥ���˲�������·����ͼ��ʵ���ź�');
subplot(2,1,2);
plot(sig_match2(1:80));
title('ͨ��ƥ���˲�������·����ͼ���鲿�ź�');
%================================
%����
% sample=8;
[x1,x2]=pick_sig(sig_match1,sig_match2,8);
sig_pick1=x1.';
sig_pick2=x2.';
%================================
%���������������ͼ
figure(8)
scatter(sig_pick1,sig_pick2,'b*');
title('�������16QAM����ͼ');
axis([-5 5 -5 5])
%=================================
%���
signal=demodulate_sig(sig_pick1,sig_pick2);
%================================
%���������Ķ������ź�
figure(9)
stem(signal(1,1:50));
title('�����Ķ������ź�');
% %������bit��
% error_b=length(find(signal~=source))/N;


%% �����ʼ���
% =======������bit��
snr=1:1:11;
error_theory=(1-(1-(2*(1-1/sqrt(16))*1/2*erfc(1/sqrt(2)*sqrt(3*4*10.^(snr/10)/(16-1))))).^2)/4;
% =======�����۵���bit����������Ҫ����ĵ���
n=floor(1./error_theory)*1000+100;
n(n<5000)=5000;
% ��ʼ����
for i=1:length(n)
% ���Ȳ����������������
source=randsrc(1,n(i),[1,0;p,1-p]);    
% �Բ����Ķ��������н���QAM����
[source1,source2]=Qam_modulation(source);
% ����·�źŽ��в�ֵ
sig_insert1=insert_value(source1,8);
sig_insert2=insert_value(source2,8);
% ͨ����ͨ�˲���
rolloff = 0.25;  % Filter rolloff
span = 6;        % Filter span
sps = 4;         % Samples per symbol
[sig_rcos1,sig_rcos2]=rise_cos(sig_insert1,sig_insert2,rolloff,span,sps);
% ���˲�����źż����˹������
[x1,x2]=generate_noise(sig_rcos1,sig_rcos2,snr(i));
sig_noise1=x1.';
sig_noise2=x2.';
% ����ƥ���˲���
[sig_match1,sig_match2]=filt_match(sig_noise1,sig_noise2,rolloff,span,sps);
% ����
[x1,x2]=pick_sig(sig_match1,sig_match2,8);
sig_pick1=x1.';
sig_pick2=x2.';
% ���
signal=demodulate_sig(sig_pick1,sig_pick2);
% ������bit��
error_bit(i)=length(find(signal-source)~=0)/n(i);
end
figure(10)
semilogy(snr,error_theory,'r-');
hold on
semilogy(snr,error_bit,'b-');
xlabel('�����SNR')
ylabel('��bit��')
title('�����������������������')
legend('�����������','�����������')


%% ����ͼӳ��
function[y1,y2]=Qam_modulation(x)
%Qam_modulation
%===================================
%�Բ����Ķ��������н���QAM����
    %=======���Ƚ��д���ת������ԭ����������ת������·�ź�
N=length(x);
a=1:2:N;
y1=x(a);
y2=x(a+1);
    %=======�ֱ����·�źŽ���16QAM����
        %======����·�źŽ���2-4��ƽ�任
a=1:2:N/2;
temp1=y1(a);
temp2=y1(a+1);
y11=temp1*2+temp2;

temp1=y2(a);
temp2=y2(a+1);
y22=temp1*2+temp2;
        %======����·�źŷֱ������λ����
a=1:N/4;
y1=(y11*2-1-4)*1.*cos(2*pi*a);
y2=(y22*2-1-4)*1.*cos(2*pi*a);
        %======���ո�����Ĺ������ӳ��
y1(y11==0)=-3;
y1(y11==1)=-1;
y1(y11==2)=3;
y1(y11==3)=1;

y2(y22==0)=-3;
y2(y22==1)=-1;
y2(y22==2)=3;
y2(y22==3)=1;
end

%% ��ֵ
function y=insert_value(x,ratio)
%============================
%=======x�Ǵ���ֵ���У�ratio�ǲ�ֵ����
%=======��·�źŽ��в�ֵ
%=======���Ȳ���һ�����ȵ���ratio��ԭ�źų��ȵ�������
y=zeros(1,ratio*length(x));
%========�ٰ��źŷ��ڶ�Ӧ��λ��
a=1:ratio:length(y);
y(a)=x;
end

%% ���γ���
%=========x1��x2����·�����ź�
function[y1,y2]=rise_cos(x1,x2,rolloff,span,sps)
%========����ƽ�����������˲���
rrcFilter=rcosdesign(rolloff,span,sps,'sqrt');
%=======����·�źŽ����˲�
y1=upfirdn(x1,rrcFilter,sps);
y2=upfirdn(x2,rrcFilter,sps);
end

%% 10���ز�����
%=====x1��x2������·�����źţ�f�������źŵ�Ƶ�ʣ�hf���ز�Ƶ��
function [t,y]=modulate_to_high(x1,x2,f,hf)
%=====���������м�����������洢��ֵ��������ź�
yo1=zeros(1,length(x1)*hf/f*10);
yo2=zeros(1,length(x2)*hf/f*10);
n=1:length(yo1);
%=======�������źŷֱ���в�ֵ�����ڵ�������֮�����9���㣬����9�����ֵͬ��0�����ֵ
yo1(n)=x1(floor((n-1)/(hf/f*10))+1);
yo2(n)=x2(floor((n-1)/(hf/f*10))+1);
%======��������źŵ�ʱ������
t=(1:length(yo1))/hf*f/10;
%======�����ز������ź�
y=yo1.*cos(2*pi*hf*t)-yo2.*sin(2*pi*hf*t);
end

%% �����˹������
%======���������·�źżӸ�˹�����������ش�������·�źţ���Ϣ���Чbit�����Ϊsnr��ֵ
function[y1,y2]=generate_noise(x1,x2,snr)
%=======snr1����snr���ڵķ��������
snr1=snr+10*log10(4);
%=======��������źŵ�ƽ������
ss=var(x1+1i*x2,1);
%=======�����˹������
y=awgn(x1+1i*x2,snr1+10*log10(ss/10),'measured');
y1=real(y);
y2=imag(y);
end

%% ƥ���˲���
%=========x1��x2����·�����ź�
function[y1,y2]=filt_match(x1,x2,rolloff,span,sps)
%========����ƽ�����������˲���
rrcFilter=rcosdesign(rolloff,span,sps,'sqrt');
%=======����·�źŽ����˲�
y1=upfirdn(x1,rrcFilter,1,sps);
y2=upfirdn(x2,rrcFilter,1,sps);
end


%% ����
function[y1,y2]=pick_sig(x1,x2,ratio)
y1=x1(3*2+1:ratio:length(x1)-ratio);
y2=x2(3*2+1:ratio:length(x2)-ratio);
end

%% �о����
function y=demodulate_sig(x1,x2)
%=======��x1·�źŽ����о�
xx1(x1>2)=3;
xx1((x1<2)&(x1>=0))=1;
xx1((x1>=-2)&(x1<0))=-1;
xx1(x1<-2)=-3;
%=======��x2·�źŽ����о�
xx2(x2>2)=3;
xx2((x2<2)&(x2>=0))=1;
xx2((x2>=-2)&(x2<0))=-1;
xx2(x2<-2)=-3;
%========��x1·�źŰ����������ԭ��0,1�ź�
temp1=zeros(1,length(xx1)*2);
temp1(find(xx1==-1)*2)=1;
temp1(find(xx1==1)*2-1)=1;
temp1(find(xx1==1)*2)=1;
temp1(find(xx1==3)*2-1)=1;
%========��x2·�źŰ����������ԭ��0,1�ź�
temp2=zeros(1,length(xx2)*2);
temp2(find(xx2==-1)*2)=1;
temp2(find(xx2==1)*2-1)=1;
temp2(find(xx2==1)*2)=1;
temp2(find(xx2==3)*2-1)=1;
%========����·�źźϳ�1·
y=zeros(1,length(temp1)*2);
y(1:2:length(y))=temp1;
y(2:2:length(y))=temp2;
end
