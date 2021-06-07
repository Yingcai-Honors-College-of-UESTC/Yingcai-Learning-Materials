function[Xk]=my_fft(Xn,N)    %���������ٸ���Ҷ�任����������Xn�ͳ���N

    %���û������N����N��ΪXn�ĳ���
    if nargin < 2
        N = length(Xn);
    end

    %��������N����Xn�ĳ��ȣ�Xn���㣨0��Ӱ��fft�Ľ����
    Xn = [Xn, zeros(1, N-length(Xn))];

    %�����������ļ���M
    tempbinary = dec2bin(N);    %������ת��Ϊ��������
    M = length(tempbinary(2:end));  %����M���Ƕ���������λ��
    tempdata = zeros(N, M+1);   %�м�����洢����

    %�������������
    for n = 0 : N-1
        tempbinary = dec2bin(n, M);
        tempbinary = rot90(tempbinary, 2);    
        tempdata(n+1, 1) = Xn(bin2dec(tempbinary)+1); %���鶼��1��ʼ����
    end

    %��ʼfft
    for m = 0 : M-1
    %����W     
        for r = 1 : 2^m
            W(r) = cos((pi / 2^m) * (r - 1)) - 1j * sin((pi / 2^m) * (r - 1));  %W�����1��ʼ����
        end
        for i = 1 : r
            for groupseq = 1 : N/(2^(m+1))
                p = i + (groupseq - 1) * 2^(m + 1); %����ź�W���Ӻ�ȷ��P������
                q = p + 2^m;
                tempdata(p, m+2) = tempdata(p, m+1) + W(i) * tempdata(q, m+1); %������ε�Ԫ
                tempdata(q, m+2) = tempdata(p, m+1) - W(i) * tempdata(q, m+1); 
            end
        end
    end

    Xk = tempdata(:, M+1);
    m = size(Xk);
    m1 = size(Xn);
    if m ~= m1
        Xk = Xk';
    end
end