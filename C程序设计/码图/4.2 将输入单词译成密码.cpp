/*���뵥��������룬��������ǣ���ԭ������ĸ����ĵ�4����ĸ����ԭ������ĸ��
���磬��ĸ'A'�����4����ĸ��"E",��"E"����"A"��"Z"��"D"���档���磬����"China"Ӧ��Ϊ"Glmre"��
���һ���򣬽����뵥����Ϊ����������
���س������������룻�����20��֮��ض�;���뵥�ʳ���Ϊ0�������벻Ϊ��ĸ�����error)*/
#include<stdio.h>
#include<string.h>
int main()
{
    int i,a;
	char s[21],c[21];
	scanf("%s",s,21);
	for(i=0;(s[i]!='\0')&&(i<21);i++)
	{
		if(s[i]<65||(s[i]>90&&s[i]<97)||s[i]>122)
		{
			printf("error");
			goto end;
		}
	}
	
	a=strlen(s);
	if(a==0)
	{
		printf("error");
	}
	
	else
	{
		for(i=0;s[i]!='\0';i++)
     	{
		    if(s[i]<87||(s[i]>96&&s[i]<119))
	        {
	   	    	c[i]=s[i]+4;
	    	}
		    else
		    {
		    	c[i]=s[i]-22;
		    }
	    }
	    
	    	printf("%s",c);
	}
    end:
    return 0;
}
