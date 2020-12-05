%���� RRC ��������ֵ����źŵ����ܷ����Ƶ�׷���
%���¾�Ϊ�ο�����

T_start=0;%��ʼʱ��
T_stop=10;%��ֹʱ��
T=T_stop-T_start;%�������ʱ��
T_sample=1/1000;%�������
f_sample=1/T_sample; % ��������
N_sample=T/T_sample;% ��������
n=0:N_sample-1;
r_s=100;%��Ԫ��������
alpha=0.25;%df=alpha*rs=25Hz
NumBits=T*r_s;%������Ÿ���
NumCoff=10;%number of coefficients of RRC
Tb=f_sample/r_s;
%-------------------------------
%Transmitter
%-------------------------------
g_T=boxcar(Tb);%�����˲���--�������˲���


b=rand(1,4000);b(b>0.5)=1;b(b<=0.5)=0;
a_2n=b(:,2:2:end);
a_2n_1=b(:,1:2:end);
a_2n_r1=reshape(a_2n,2,length(a_2n)/2);
a_2n_r2=reshape(a_2n_1,2,length(a_2n_1)/2);
b_r2n_1=rand(2,1000);
x2=rand(2,1000);
for i=1:1000
    sym m;
    m=a_2n_r1(1,i);
    b_r2n_1(1,i)=m*(2.^m);
end
for i=1:1000
    sym m;
    m=a_2n_r1(2,i);
    b_r2n_1(2,i)=m;
end
b_2n=sum(b_r2n_1);
for i=1:1000
    sym m;
    m=a_2n_r2(1,i);
    x2(1,i)=m*(2.^m);
end
for i=1:1000
    sym m;
    m=a_2n_r2(2,i);
    x2(2,i)=m;
end
b_2n_1=sum(x2);
b_t(2,:)=b_2n;%b1��ֵ�ĸ���b2�ĵ�һ�дӿ�ʼ��������
b_t(1,:)=b_2n_1;
b_t1=reshape(b_t,1,length(b)/2);
%b_2n
b2=zeros(f_sample/r_s,NumBits);
b2(1,:)=b_2n;%b1��ֵ�ĸ���b2�ĵ�һ�дӿ�ʼ��������
b3=reshape(b2,1,f_sample/r_s*NumBits);%reshape�����任�ض����󣬴˴��ǰ�b2ת������һά����
s_2n=conv(b3,g_T);%�����ź�1
fc=100;
k=0:N_sample-1+NumCoff-1;
c1=cos(2*pi*fc*k*T_sample);
s_2n=s_2n.*c1;
%--------------------------------
%b_2n_1

b2=zeros(f_sample/r_s,NumBits);
b2(1,:)=b_2n_1;%b1��ֵ�ĸ���b2�ĵ�һ�дӿ�ʼ��������
b3=reshape(b2,1,f_sample/r_s*NumBits);%reshape�����任�ض����󣬴˴��ǰ�b2ת������һά����
s_2n_1=conv(b3,g_T);%�����ź�1
fc=100;
k=0:N_sample-1+NumCoff-1;
c2=-sin(2*pi*fc*k*T_sample);
s_2n_1=s_2n_1.*c2;
%--------------------------------
s=s_2n+s_2n_1;
%AWGN channel
%--------------------------------
N_0=10^(-5);
noise_w=wgn(1,length(s),N_0*f_sample,'linear');%����һ��m��n�еĸ�˹�������ľ���p��dBWΪ��λָ�����������ǿ�ȡ�
r=s+noise_w;
%figure(1)
%plot(s)
%hold on
%plot(r)
%--------------------------------
%receiver
%--------------------------------(1:length(y1))
g_R=boxcar(Tb);%�����˲���

%2n
x_2n=r.*c1;
x_2n=conv(x_2n,g_R);



%2n-11
x_2n_1=r.*c2;
x_2n_1=conv(x_2n_1,g_R);



NumCoff=10;%number of coefficients of RRC
SamplingIns=NumCoff/2;
SamplingStart=NumCoff;

sample1=zeros(f_sample/r_s,NumBits);%�������Ϊf_sample/r_s������
sample1(1,:)=ones(1,NumBits);
sample2=reshape(sample1,1,f_sample/r_s*NumBits);
sample3=zeros(1,length(x_2n));
sample3(NumCoff+1:NumCoff+f_sample/r_s*NumBits)=sample2;
%plot(sample3)
%2n ����
y_2n=x_2n.*sample3;
%y3=y2;
y_2n(:,all((y_2n==0),1))=[];%B = all(A, 1)����һ����������������Ϊall(A, 1)�ȼ���all(A)
b_r2n=rand(1,1000);
for i=1:1000
    sym m;
    sym n;
    m=y_2n(i);
    if(m>11.75)
         b_r2n(i)=3;
       else if(m>7.5)
            b_r2n(i)=2;
          else if(m>2.6)
            b_r2n(i)=1;  
              else 
              b_r2n(i)=0;     
              end
           end
    end
    
end    
%2n-1
y_2n_1=x_2n_1.*sample3;
%y3=y2;
y_2n_1(:,all((y_2n_1==0),1))=[];%B = all(A, 1)����һ����������������Ϊall(A, 1)�ȼ���all(A)

b_r2n_1=rand(1,1000);
for i=1:1000
    sym m;
    sym n;
    m=y_2n_1(i);
    if(m>12.5)
         b_r2n_1(i)=3;
       else if(m>7.5)
            b_r2n_1(i)=2;
          else if(m>2.5)
            b_r2n_1(i)=1;  
              else 
              b_r2n_1(i)=0;     
              end
           end
    end
    
end    
%b_t=(sign(b1)+1)*0.5;
%b_r=(sign(y2)+1)*0.5;
%BER=length(find(b_t~= b_r))/NumBits;

%����ת��
b_r(2,:)=b_r2n;%b1��ֵ�ĸ���b2�ĵ�һ�дӿ�ʼ��������
b_r(1,:)=b_r2n_1;
b_r=reshape(b_r,1,length(b)/2);
%---------
b_t=sign(b);
BER1=length(find(b_t1~=b_r))/2000;
fprintf('������=%f',BER1);
