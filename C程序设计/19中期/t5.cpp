/*�ж�һ���������ʽ�е�С�����Ƿ����
  �������ʽ�ɼ������룬������ȫΪ��������
  �����Ϊ��Ԫ�������+��-��*��/��% */ 
#include<stdio.h>
int main()
{
	char a[30];
	scanf("%s",a);
	int b=0;
	for(int i=0;i<30;i++)
	{
		if(a[i]=='(')
		{
			b++;
		}
		else if(a[i]==')')
		{
			b--;
		}
		if(b<0)
		{
			printf("error");
			return 0;
		}
	}
	
	if(b==0)
	{
		printf("no problem, my old brother");
	}

	else if(b>0)
	{
		printf("error");
	}
	
	return 0;
}
