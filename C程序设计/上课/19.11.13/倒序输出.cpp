/*��������ַ�����*/ 
#include<stdio.h>
#define LEN 50
int main()
{
	char str[LEN]={0};
	int len,i;
	gets(str);//gets������ո�scanf����
	len=strlen(str);
	for(i=len-1;i>=0;i--)
	{
		putchar(str[i]);
	}
	return 0;
}
