%4QAM����������
nuber_symbol = 10000;    %һ����1����������ڲ���
M = 4;    %��������ʾ4QAM
graycode = [0 1 2 3];    %����ӳ�䣬ʮ���Ʊ�ʾ
SNR = -20:1:20;    %���űȣ���λdb,���ò���Ϊ1��
ebn0 = 10 .^ (SNR / 10);    %��dbתΪ�����Եķ�ʽ
msg = randi([0,3], 1, nuber_symbol);    %�������0-3�ķ��ţ���nsymbol�õ�ԭʼ����
msg1 = graycode(msg+1);    %����ӳ��
msgmod = qammod(msg1,M);    %����qammod�������õ����ƺ�ķ���
spow = norm(msgmod) .^2 / nuber_symbol;    %a+bjȡģ��ƽ���������ʣ����ʳ����������ŵõ�ƽ������
for i = 1:length(SNR)
    sigma = sqrt(spow / (2*ebn0(i))); 
    rx = msgmod + sigma * (randn(1, length(msgmod)) + 1i * randn(1, length(msgmod)));    %������ͼ����������ȸ�˹������
    y = qamdemod(rx,M);    %תΪ��Ӧ�ĵ�
    decmsg = graycode(y + 1);    %������ӳ��
    [err, ser(i)] = symerr(msg, decmsg);    %�ȽϷ������
end

p_4QAM = 2 * (1 - 0.5 .* qfunc(sqrt(2 * ebn0))) .* qfunc(sqrt(2 * ebn0));    %������
ser1 = p_4QAM;

figure()
semilogy(SNR, ser, '*', SNR, ser1, '-');    %serʵ�ʴ�����ʣ�ser1���۷��Ŵ������
title('4QAM-AWGN���Ŵ�����ʷ���')
xlabel('SNR');
ylabel('����');
legend('����ֵ','����ֵ' );


%16QAM
nuber_symbol = 10000;    %һ����1����������ڲ���
M = 16;    %��������ʾ16QAM
graycode = [0 1 3 2 4 5 7 6 12 13 15 14 8 9 11 10];    %����ӳ�䣬ʮ���Ʊ�ʾ
SNR = -20:1:20;    %���űȣ���λdb,���ò���Ϊ1������semilogy���������ƣ���12��Ϊ20
ebn0 = 10 .^ (SNR / 10);    %��dbתΪ�����Եķ�ʽ
msg = randi([0,15], 1, nuber_symbol);    %�������0-15�ķ��ţ���nsymbol�õ�ԭʼ����
msg1 = graycode(msg + 1);    %����ӳ��
msgmod = qammod(msg1, M);    %����qammod�������õ����ƺ�ķ���
spow = norm(msgmod) .^2 / nuber_symbol;    %a+bjȡģ��ƽ���������ʣ����ʳ����������ŵõ�ƽ������
for i = 1:length(SNR)
    sigma = sqrt(spow / (2 * ebn0(i)));
    rx = msgmod + sigma * (randn(1, length(msgmod)) + 1i * randn(1, length(msgmod)));    %������ͼ����������ȸ�˹������
    y = qamdemod(rx, M);    %תΪ��Ӧ�ĵ�
    decmsg = graycode(y + 1);    %������ӳ��
    [err,ser(i)] = symerr(msg, decmsg);    %�ȽϷ������
end

p_16QAM = 2 * (1 - 1 / sqrt(M)) * qfunc(sqrt(3 * ebn0 / (M - 1)));    %����������
ser1 = 1 - (1 - p_16QAM) .^2;

figure()
semilogy( SNR,ser,'*',SNR,ser1,'-');    %serʵ�ʴ�����ʣ�ser1���۷��Ŵ������
title('16QAM-AWGN���Ŵ�����ʷ���')
xlabel('SNR');
ylabel('����');
legend('����ֵ','����ֵ' );
