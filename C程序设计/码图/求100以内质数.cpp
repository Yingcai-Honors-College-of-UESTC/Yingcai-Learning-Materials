/*��дһ�������ҳ�1~100�е�����������

���������ʽҪ��
	Ҫ��ÿ�������涼Ҫ������ţ�
	�벻Ҫ��������ַ�
���磺
�����2,3,5,  */
#include<stdio.h>
#include<math.h>
int main()
{
	int a = 0, i, j;
	double sqrtn;
	for (i = 2; i <= 100; i++)
	{
		sqrtn = sqrt((double)i);
		for (j = 2; j <= sqrtn; j++)
		{
			if (i % j == 0)
			{
				a++;
			}
		}
		if (a == 0)
		{
			printf("%d,", i);
		}
		a = 0;
	}
	return 0;
}
