#include<stdio.h>
int main()
{
	//�������ĸ���
	int x;
	scanf("%d",&x);
	
	//�������� a
	int a[x];
	for(int i=0;i<x;i++)
	{
		scanf("%d",&a[i]);
	} 
	
	//����ǰ n��Ԫ�����ҳ��� kС��ֵ 
	int n,k;
	scanf("%d %d",&n,&k);
	
	//�ҵ�ǰ n��Ԫ���е� kС��ֵ
	for(int i=n+1;i<x;i++)
	{
		a[i]=0;
	} 
	
	//����
	int i,j,b;
	for(i=0;i<x;i++)
	{
		for(j=i+1;j<x;j++)
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
	printf("%d",a[10-n+k]);
	
	return 0; 
}
