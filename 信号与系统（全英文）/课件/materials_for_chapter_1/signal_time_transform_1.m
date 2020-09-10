y = audioread('Q2.wav'); % �����������źű��������� y ��
Fs = 44.1e+3; % �����źŵĲ����ʣ�44.1kHz
audiowrite('t1.wav',y,Fs);
sound(y,Fs);
pause

y_reverse = y(length(y):-1:1); % �����źŵ�ʱ�䷴��
audiowrite('t2.wav',y_reverse,Fs);
sound(y_reverse,Fs); 
pause

y_compress = y(1:2:length(y)); % �����źŵ�ʱ��ѹ��
audiowrite('t3.wav',y_compress,Fs);
sound(y_compress,Fs);
pause

y_extend = zeros(1,2*length(y));
y_extend(1:2:2*length(y)) = y;
y_extend(2:2:2*length(y)) = y; % �����źŵ�ʱ����չ
audiowrite('t4.wav',y_extend,Fs);
sound(y_extend,Fs);
