#include<stdio.h>
#include<math.h>
int main()
{
	int a,b,c,delta;
	double x1,x2,k;
	printf("���ֵؽ�һԪ���η���\n�밴�˸�ʽ����a b c\n");
	scanf("%d %d %d",&a,&b,&c);
	delta=b*b*1.0-4*a*c*1.0;
	if(delta<0)
	{
		printf("�޽�\n����������\n��<0�㻹��\n����ѧ������ƨ��ѧ�İ�\nɵ��\n��ү��\n���Ӳ��ź��˹�\n");
	}
	else
	{
		k=sqrt(delta);
		a=a*1.0;
		b=b*1.0;
		x1=(0-b+k)/(2*a);
		x2=(0-b-k)/(2*a);
		printf("x1=%lf\nx2=%lf\n��������������������\n���������ʦ������ô����\n���������������ʹ�����ӽⷽ�̣�\n������û����\n��ѧ�ˣ�ȫ������ʦ��?\n��θ�����\n�´��������Ӵ���Ĺ�ͷ\n",x1,x2);
	}
	return 0; 
 } 
