%��ȡ�����ļ�
[sound0,fs] = audioread('woman.wav');
sound1=sound0(:,1);

%��ͨ�˲�
sound2=filter(Num,1,sound1); %NumΪ��filter designer���ɵ�һ���˲�������
sound(sound2,fs);
filename=('test_bandpassFilter.wav');
audiowrite(filename,sound2,fs);