/*������n^k<=m��k�����ֵ������n��m������õ�*/ 
#include<stdio.h>
int main()
{
	int n,m,p=1,k=0;
	
	//����n,m
	printf("�밴˳������n��m"); 
	scanf("%d %d",&n,&m);
	
	//�ж�k�����ֵ
	while(p<m)
	{
		p*=n;
		k++;
	} 
	
	//���k
	printf("%d",k-1);
	
	return 0; 
}
