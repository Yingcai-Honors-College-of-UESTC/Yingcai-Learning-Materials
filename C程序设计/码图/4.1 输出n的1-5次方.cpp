/*��������n��Ȼ�����n��1-5�η�(�ո�����)������������س�
��������-1�����-1 1 -1 1 -1�س�*/

#include<stdio.h>
int main()
{
	int a,b=1,i;
	scanf("%d",&a);
	for(i=1;i<=5;i++)
	{
		b*=a;
		if(i<5)
		{
			printf("%d ",b);
		}
		else
		printf("%d\n",b);
	}
	return 0;
}
