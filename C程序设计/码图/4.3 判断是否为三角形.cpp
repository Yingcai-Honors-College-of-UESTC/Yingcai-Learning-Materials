/*�������������߳���(����)���ж��Ƿ�Ϊ�����Ρ��ǣ����yes�������no���߳���Ϊ����ʱ�����error��
���������ߵĳ����Զ��ŷָ������磺
���룺1,2,3�س�
�����no*/

#include<stdio.h>
int main()
{
	int a,b,c;
	scanf("%d,%d,%d",&a,&b,&c);
	if(a<=0||b<=0||c<=0)
	{
		printf("error");
	}
	else
	{
		if((a+b>c)&&(b+c>a)&&(a+c>b))
	    {
	    	printf("yes");
	    }
	    else
	    {
	    	printf("no");
		}
	}
	return 0;
}
