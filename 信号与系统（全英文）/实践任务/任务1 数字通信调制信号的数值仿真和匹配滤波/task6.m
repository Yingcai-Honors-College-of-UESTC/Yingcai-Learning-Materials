%����ӳ��
nsymbol= 10000;%һ����1�������
M=16;%��������ʾ16QAM
graycode=[0 1 3 2 4 5 7 6 12 13 15 14 8 9 11 10];%����ӳ�䣬ʮ���Ʊ�ʾ
SNR=5:20;%���űȣ���λdb
esn0=10.^(SNR/10);%��dbתΪ�����Եķ�ʽ
msg=randi([0,15],1,nsymbol);%�������0-15�ķ��ţ���nsymbol�õ�ԭʼ����
msg1=graycode(msg+1);%����ӳ��
msgmod=qammod(msg1,M);%����qammod�������õ����ƺ�ķ���
spow=norm(msgmod).^2/nsymbol;%a+bjȡģ��ƽ�������ʣ����ʳ����������ŵõ�ƽ������
for i= 1:length(SNR)
    sigma=sqrt(spow/(2*esn0(i))); 
    rx=msgmod+sigma*(randn(1,length(msgmod))+1i*randn(1,length(msgmod))); %������ͼ����������ȸ�˹������
    y=qamdemod(rx,M);%תΪ��Ӧ�ĵ�
    decmsg=graycode(y+1);%������ӳ��
    [err1 ,ber(i)]=biterr(msg,decmsg,log2(M));
    [err2,ser(i)]=symerr(msg,decmsg);%�ȽϷ������
end

p16=2*(1-1/sqrt(M))*qfunc(sqrt(3*esn0/(M-1)));%������
ser1=1-(1-p16).^2;
ber1=1/log2(M)*ser1;%�������
figure()
%ber����ֵ��ser���ط���ֵ��ber1����������ʣ�ser1����������
semilogy(SNR,ber,'o' ,SNR,ser,'*',SNR,ser1,'-',SNR,ber1,'-.');
title('16QAM-AWGN���ش���������Ŵ����ʸ���ӳ��')
xlabel('SNR');ylabel('probability');
legend('���ط���','���ŷ���','�����������' ,'���۷��Ŵ�����');


%��Ȼӳ�䣬������

a=sqrt(1/10);

%�������4000��0/1��Ϊ��ʼ�ź�
raw=rand(1,4000);
s=round(raw);

%�ֳ�4��
B = reshape(s,4,1000);
C = B;
B1 = B(1,:);
B2 = B(2,:);
B3 = B(3,:);
B4 = B(4,:);
            %M=16;%��������ʾ16QAM
            %esn0=10.^(snrdb/10);
%������������Ȼ���ø���ӳ��ĵ��ƹ�ʽ
%���ڵ���ǰ����ͬ����λ�û���
for i=1:1000
    if B1(i)==0 && B2(i)==0 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
    if B1(i)==0 && B2(i)==0 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==1 && B2(i)==0 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==1 && B2(i)==0 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
    if B1(i)==1 && B2(i)==1 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==1 && B2(i)==1 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
    if B1(i)==0 && B2(i)==1 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==0 && B2(i)==1 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
end

%��������ͼ�����ź�
tx = a*(-2*(B3-0.5).*(3-2*B4)-j*2*(B1-0.5).*(3-2*B2));

for snrdb = 1:1:20
    
    %���ź��м�������
    rx = awgn(tx,snrdb);
    
    %����ź�
    B5 = imag(rx)<0;
    B6 = (imag(rx)<2*a) & (imag(rx)>-2*a);
    B7 = real(rx)<0;
    B8 = (real(rx)<2*a) & (real(rx)>-2*a);
    
    %�����ԭ�ź�
    for i=1:1000
    if B5(i)==0 && B6(i)==0 && B7(i)==1 && B8(i)==0
        B4(i)=1;
    end
    if B5(i)==0 && B6(i)==0 && B7(i)==1 && B8(i)==1
        B4(i)=0;
    end
    if B5(i)==1 && B6(i)==0 && B7(i)==1 && B8(i)==1
        B8(i)=0;
    end
    if B5(i)==1 && B6(i)==0 && B7(i)==1 && B8(i)==0
        B8(i)=1;
    end
    if B5(i)==1 && B6(i)==1 && B7(i)==1 && B8(i)==1
        B8(i)=0;
    end
    if B5(i)==1 && B6(i)==1 && B7(i)==1 && B8(i)==0
        B8(i)=1;
    end
    if B5(i)==0 && B6(i)==1 && B7(i)==1 && B8(i)==1
        B8(i)=0;
    end
    if B5(i)==0 && B6(i)==1 && B7(i)==1 && B8(i)==0
        B8(i)=1;
    end
    end
    
    rs = [B5;B6;B7;B8];
    
    %����BER
    error = rs~=C;
    BER(snrdb) = sum(sum(error)) / 4000;
end
            %p16=2*(1-1/sqrt(M))*qfunc(sqrt(3*esn0/(M-1)));%������
            %ser1=1-(1-p16).^2;
            %ber1=1/log2(M)*ser1;%�������
snrdb = 1:1:20;
figure()
semilogy(snrdb,BER,'o');
title('16QAM-AWGN���ش�������Ȼӳ��');
xlabel('SNR');
ylabel('probability');

%��Ȼӳ�䣬����ֵ
a=sqrt(1/10);

%�������4000��0/1��Ϊ��ʼ�ź�
raw=rand(1,4000);
s=round(raw);

%�ֳ�4��
B = reshape(s,4,1000);
C = B;
B1 = B(1,:);
B2 = B(2,:);
B3 = B(3,:);
B4 = B(4,:);
            M=16;%��������ʾ16QAM
            esn0=10.^(snrdb/10);
%������������Ȼ���ø���ӳ��ĵ��ƹ�ʽ,�ڵ���ǰ����ͬ����λ�û���

for i=1:1000
    if B1(i)==0 && B2(i)==0 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
    if B1(i)==0 && B2(i)==0 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==1 && B2(i)==0 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==1 && B2(i)==0 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
    if B1(i)==1 && B2(i)==1 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==1 && B2(i)==1 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
    if B1(i)==0 && B2(i)==1 && B3(i)==1 && B4(i)==1
        B4(i)=0;
    end
    if B1(i)==0 && B2(i)==1 && B3(i)==1 && B4(i)==0
        B4(i)=1;
    end
end

%��������ͼ�����ź�
tx = a*(-2*(B3-0.5).*(3-2*B4)-j*2*(B1-0.5).*(3-2*B2));

for snrdb = 1:1:20
    
    %���ź��м�������
    rx = awgn(tx,snrdb);
    
    %����ź�
    B5 = imag(rx)<0;
    B6 = (imag(rx)<2*a) & (imag(rx)>-2*a);
    B7 = real(rx)<0;
    B8 = (real(rx)<2*a) & (real(rx)>-2*a);
    
    %�����ԭ�ź�
    for i=1:1000
    if B5(i)==0 && B6(i)==0 && B7(i)==1 && B8(i)==0
        B4(i)=1;
    end
    if B5(i)==0 && B6(i)==0 && B7(i)==1 && B8(i)==1
        B4(i)=0;
    end
    if B5(i)==1 && B6(i)==0 && B7(i)==1 && B8(i)==1
        B8(i)=0;
    end
    if B5(i)==1 && B6(i)==0 && B7(i)==1 && B8(i)==0
        B8(i)=1;
    end
    if B5(i)==1 && B6(i)==1 && B7(i)==1 && B8(i)==1
        B8(i)=0;
    end
    if B5(i)==1 && B6(i)==1 && B7(i)==1 && B8(i)==0
        B8(i)=1;
    end
    if B5(i)==0 && B6(i)==1 && B7(i)==1 && B8(i)==1
        B8(i)=0;
    end
    if B5(i)==0 && B6(i)==1 && B7(i)==1 && B8(i)==0
        B8(i)=1;
    end
    end
    
    rs = [B5;B6;B7;B8];
    
    %����BER
    error = rs~=C;
    BER(snrdb) = sum(sum(error)) / 4000;
end
            p16=2*(1-1/sqrt(M))*qfunc(sqrt(3*esn0/(M-1)));%������
            ser1=1-(1-p16).^2;
            ber1=1/log2(M)*ser1;%�������
snrdb = 1:1:20;
figure()
semilogy(snrdb,ber1,'-');
title('16QAM-AWGN���ش�������Ȼӳ��');
xlabel('SNR');
ylabel('probability');