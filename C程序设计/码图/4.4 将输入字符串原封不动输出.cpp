/*���������һ���ַ���(�޿ո��Ʊ����)��
ԭ�ⲻ��������ַ���������������س���
�����20����Ч�ַ����������س�����
�������룺apple �����apple
���룺test2test* �����test2test* */

#include<stdio.h>
int main()
{
	char c[20];
	scanf("%s",c,20);
	for(int i=0;c[i]!='\0';i++)
	{
	    printf("%c",c[i]);
	} 
    printf("%s\n","\0");
	return 0;
} 
