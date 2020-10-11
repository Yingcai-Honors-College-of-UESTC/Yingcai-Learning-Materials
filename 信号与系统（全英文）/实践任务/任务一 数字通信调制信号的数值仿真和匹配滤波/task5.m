%part1: �����µľ������������ź�
signal_In_part_1=randsrc(128,2);     %����In

t = 0:0.01:129;    %g(t)��ʱ�䳤��
t_1 = 0:0.01:2*129;    %�����Ҫ��ʱ�䳤��
w = 1;    %tripuls(t, w, s)�����Ĳ��������ǲ��Ŀ��w
tfutr = 0.5;
sfutr = 1;    %tripuls(t, w, s)�����Ĳ��������ǲ������ֵ������(w * s) / 2��
g_real=0;    %��ʼ��g()��ʵ��Ϊ0
g_imagine=0;    %��ʼ��g()���鲿Ϊ0
h = tripuls(-t+0.5,w,sfutr);    %�����µ������ź�g(t)

%����g(t)����
for i = 1:128
    g_real = g_real + signal_In_part_1(i, 1) * tripuls(t-tfutr-i+1, w, sfutr);
    g_imagine = g_imagine + signal_In_part_1(i, 2) * tripuls(t-tfutr-i+1, w, sfutr);
end 

%�����˹������
y_real = awgn(g_real, 10, 'measured');
y_imagine = awgn(g_imagine, 10, 'measured');

%���
z_real = conv(g_real+y_real, h);
z_imagine = conv(g_imagine+y_imagine, h);
plot(t_1, z_real, 'blue');
hold on
plot(t_1, z_imagine, 'red');



%part2: 4QAM�ź�
for SNR = -20:1:30
    count=0; 
    
signal_In_part_2 = randsrc(128,2);    %����In
signal_In_part_2_noisy = rand(128,2);    %��ʼ����ԭ�ź�
t01 = 0;    %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
t = 0:0.01:129;
t2 = 0:0.01:258;
w = 1;

%������g(t)��������part1��ͬ
tfutr = 0.5;
sfutr = 1;
g_real = 0;
g_imagine=0;
h = tripuls(-t+0.5, w, sfutr);   %�µ�h(t)

%����g(t)
for i = 1:128
    g_real = g_real + signal_In_part_2(i, 1) * tripuls(t-tfutr-i+1, w, sfutr);
    g_imagine = g_imagine + signal_In_part_2(i, 2) * tripuls(t-tfutr-i+1, w, sfutr);
end

%�����˹������
y_real = awgn(g_real, SNR);
y_imagine = awgn(g_imagine, SNR);

%���
z_real = conv(g_real+y_real, h);%z���µ�r(t)
z_imagine = conv(g_imagine+y_imagine, h);

%�źŵĲ���
for j = 1:128
   temp1 = (z_real(1, 10 * j) - 1) ^2 + (z_imagine(1, 10 * j) - 1) ^2;    %���㵽1+j����
   temp2 = (z_real(1, 10 * j) - 1) ^2 + (z_imagine(1, 10 * j) + 1) ^2;    %���㵽1-j����
   temp3 = (z_real(1, 10 * j) + 1) ^2 + (z_imagine(1, 10 * j) - 1) ^2;    %���㵽-1+j����
   temp4 = (z_real(1, 10 * j) + 1) ^2 + (z_imagine(1, 10 * j) + 1) ^2;    %���㵽-1-j����
   temp=[temp1 temp2 temp3 temp4];
   w=min(temp);
   if w==temp1
      signal_In_part_2_noisy(j,1) =1;
      signal_In_part_2_noisy(j,2) =1;
   end
   if w==temp2
      signal_In_part_2_noisy(j,1) =1;
      signal_In_part_2_noisy(j,2) =-1;           
   end
   if w==temp3
      signal_In_part_2_noisy(j,1) =-1;
      signal_In_part_2_noisy(j,2) =1; 
   end
   if w==temp4
      signal_In_part_2_noisy(j,1) =-1;
      signal_In_part_2_noisy(j,2) =-1; 
   end
end

for i = 1:128
   if (signal_In_part_2(i, 1) ~= signal_In_part_2_noisy(i, 1)) || (signal_In_part_2(i, 2) ~= signal_In_part_2_noisy(i, 2))
      count=count+1;  
   end  
end

%���
p=count/128.0;
%plot(SNR,p,'red');
%hold on
plot(SNR,p);
%ber����ֵ��ser���ط���ֵ��ber1����������ʣ�ser1����������
semilogy(SNR,p,'o' );
title('4QAM-AWGN ���źŵķ��Ŵ�����');
xlabel('SNR');
ylabel('probability');
legend('���ŷ���');
hold on
end



%�����������
for SNR = -20:1:30
    count=0; 
    
signal_In_part_2 = randsrc(128,2);  %����In
signal_In_part_2_noisy = rand(128,2);  %��ʼ����ԭ�ź�
t01 = 0;    %�趨t0Ϊ��Ծ��
t02 =t01 + 1;
t = 0:0.1:129;
t2 = 0:0.1:258;
w = 1;

%����g(t)
tfutr = 0.5;
sfutr = 1;
g_real = 0;
g_imagine = 0;
h = tripuls(-t + 0.5, w, sfutr);    %�µ�h(t)

%����g(t)����
for i = 1:128
   g_real = g_real + signal_In_part_2(i, 1) * tripuls(t-tfutr-i+1, w, sfutr);
   g_imagine = g_imagine + signal_In_part_2(i, 2) * tripuls(t-tfutr-i+1, w, sfutr);
end

%�����˹������
y_real = awgn(g_real, SNR);
y_imagine = awgn(g_imagine, SNR);

%���
z_real = conv(g_real + y_real, h);    %z���µ�r(t)�ź�
z_imagine = conv(g_imagine + y_imagine, h);    %z���µ�r(t)�ź�
for j = 1:128    %�źŵĲ���
   temp1 = (z_real(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) - 1) ^2 + (z_imagine(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) - 1) ^2;   %���㵽1+j����
   temp2 = (z_real(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) - 1) ^2 + (z_imagine(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) + 1) ^2;   %���㵽1-j����
   temp3 = (z_real(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) + 1) ^2 + (z_imagine(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) - 1) ^2;   %���㵽-1+j����
   temp4 = (z_real(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) + 1) ^2 + (z_imagine(1, 10 * j + randsrc(1, 1, [-2 -1 0 1 2])) + 1) ^2;   %���㵽-1-j����
   temp = [temp1 temp2 temp3 temp4];
   w = min(temp);
   if w == temp1
      signal_In_part_2_noisy(j, 1) = 1;
      signal_In_part_2_noisy(j, 2) = 1;
   end
   if w == temp2
      signal_In_part_2_noisy(j, 1) = 1;
      signal_In_part_2_noisy(j, 2) = -1;           
   end
   if w == temp3
      signal_In_part_2_noisy(j, 1) = -1;
      signal_In_part_2_noisy(j, 2) = 1; 
   end
   if w == temp4
      signal_In_part_2_noisy(j, 1) = -1;
      signal_In_part_2_noisy(j, 2) = -1; 
   end
end

for i = 1:128
   if (signal_In_part_2(i, 1) ~= signal_In_part_2_noisy(i, 1)) || (signal_In_part_2(i, 2) ~= signal_In_part_2_noisy(i, 2))
      count=count+1;  
   end  
end

%���
p = count / 128.0;
%plot(SNR,p,'red');
%hold on
plot(SNR, p);
%ber����ֵ��ser���ط���ֵ��ber1����������ʣ�ser1����������
semilogy(SNR,p,'o' );
title('4QAM-AWGN ���źŵķ��Ŵ����ʼ����������')
xlabel('SNR');ylabel('probability');
legend('���ŷ���');
hold on
end