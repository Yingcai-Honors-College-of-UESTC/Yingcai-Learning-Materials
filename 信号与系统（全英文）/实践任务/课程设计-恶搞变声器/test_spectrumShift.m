%��ȡ�����ļ�
[sound0,fs] = audioread('woman.wav');
sound1=sound0(:,1);
ln=length(sound1);
sound2=zeros(ln,1);

%�������ź����
for i=1:ln
    sound2(i)=1.5*sound1(i)*sin(2*pi*i*100/44100);
end
sound(sound2,fs);
filename=('test_spectrumShift.wav');
audiowrite(filename,sound2,fs);