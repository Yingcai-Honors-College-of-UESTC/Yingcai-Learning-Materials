#include<stdio.h>
int main()
{
	//�������� 
	int a;
	scanf("%d",&a);
	
	//name�洢������str�洢�������
	char name[a][20],str[20]; 
	int i,k,number,len=0,count=0;
	printf("enter the number of students");
	i=scanf("%d",&number);
	
	//�������
	if(i<1)
	{
		printf("scanf error");
		return -1;
	}
	
	//�ҳ�������ֵĳ��� 
	for(i=0;i<number;i++)
	{
		scanf("%s",name[i]);
		k=strlen(name[i]);
		if(len<=k)
		{
			len=k;
		}
	} 
	
	//��M��ͷ����������� 
	for(i=0;i<number;i++)
	{
		if(name[i][0]=='M')
		{
			count++;
			printf("%s\n",name[i]);
		}
	}
	
	//����������
	int b;
	for(i=0;i<20;i++)
	{
		b=strlen(name[i]);
		if(b==len)
		{
			printf("%s",name[i]);
		}
	} 
	
	return 0;
}
