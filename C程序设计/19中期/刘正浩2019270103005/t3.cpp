#include<stdio.h>
int main()
{
	double a[10],b;
	int i,j,m,n=0;
	
	//��������ĸ��� 
	scanf("%d",&m);
	
	//�ж��Ƿ�Ϊ���������洢
	for(i=0;i<=m;i++)
	{
		scanf("%lf",&b);
		if((b-(int)b>0.0000009))
		{
			n++;
			a[n]=b;
		} 
	}
	
	//�Ը������������� 
	for(i=1;i<=n-1;i++)
	{
		for(j=i+1;j<=n;j++)
		{
			if(a[i]>a[j])
			{
				b=a[i];
				a[i]=a[j];
				a[j]=b;
			}
		}
	}
	
	//���
	for(i=0;i<=n;i++)
	{
		printf("%lf",a[i]);
	} 
	
	return 0;
}
