/*��һ���ַ����뵽һ���ַ����У��ַ��Ѿ���С����������
  ���ַ����ַ���������õ���*/ 
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main()
{
	int i=0,j=0;
	char a[105],b[105],c;
	
	//�����ַ������ַ� 
	gets(a);
	scanf("%c",&c);
	
	//�ַ������ַ��� 
	while(a[i]!='\0')
	{
		if(c<=a[i])
		{
			b[j]=c;
			c=127;
		}
		else
		{
			b[j]=a[i];
			i++;
		}
		j++;
	}
	
	//����c����a������һ��
	int e,f;
	e=strlen(a);
	f=strlen(b);
	if(e==f)
	{
		b[j]=c;
	}
	
	//���
	for(i=0;b[i]!='\0';i++)
	{
		printf("%c",b[i]);
	} 
	
	return 0;
}
