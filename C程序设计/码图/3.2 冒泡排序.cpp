/*����
�������10������������С�����˳�������ʹ��,��Ϊ�������
ע�⣺1������ΪӢ�����뷨�ж��ţ�2��������������Ϊ��������
����
10 9 8 7 6 5 4 3 2 1
���
1,2,3,4,5,6,7,8,9,10
*/
#include<stdio.h>
#include<stdlib.h>
int main()
{
	int a[10],i,j,z;
	for(i=0;i<=9;i++)
	{
		if(i<9)
		{
			scanf("%d ",&a[i]);
		}
		else scanf("%d",&a[9]);
	}
	for(i=0;i<=8;i++)
	{
		for(j=0;j<=8-i;j++)
		{
			if(a[j]>a[j+1])
			{
				z=a[j];
				a[j]=a[j+1];
				a[j+1]=z;
			}
		}
	}
	for(i=0;i<10;i++)
	{
		if(i<9)
		{
			printf("%d,",a[i]);
		}
		else printf("%d",a[i]);
    }
    return 0;
 } 
