% part1: ����g(t)����ƥ���˲����������ź�
t_part_1 = 0:0.001:10;  %����t��ȡֵ��Χ��0��10������Ϊ0.001

t01_part_1 = 0;    %�趨t0Ϊ��Ծ��
t02_part_1 = t01_part_1 + 1;
g_part_1 = stepfun(t_part_1, t01_part_1) - stepfun(t_part_1, t02_part_1);     %����g(t)����

z_part_1 = conv(g_part_1, g_part_1);    %�ڸ�������g(t)��h(t)Ϊͬһ�����������Ծ������д�������ʽ
%plot(z_part_1);    %����g(t)��h(t)�����ͼ



% part2: ����ƥ���˲�����źţ����и�˹��������
signal_In = randsrc(128, 2);    %����һ��128*2�ľ��󣬴�����Ϊ128������ź�In������ʵ�����鲿��

t = 0:0.1:129;    %���ò���Ϊ0.1
t0 = 0:0.1:129 * 2;

g = 0;    %��g(t)��ʼ��Ϊ0
t01 = 0;    %�趨t0Ϊ��Ծ��
t02 = t01 + 1;
h = stepfun(t, t01) - stepfun(t, t02);    %����h(t)
for i = 1:128
    g = g + signal_In(i, 1) * (stepfun(t, t01+i) - stepfun(t, t02+i));    %����g(t)����
end

y = awgn(g, 10, 'measured');    %��Ӹ�˹������

z = conv(g+y, h);    %ƥ���˲�
plot (t0, z, 'blue');    %�����˲����ͼ
hold on