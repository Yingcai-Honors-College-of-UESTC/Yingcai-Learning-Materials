/*ʵ���ַ����Ŀ�����

void my_strcpy(char * destination,char * source);
��sourceָ����ַ���������destinationָ���λ�á�

ע�⣺ʹ�ÿո��ַ�����ʾ�ַ����Ľ�����
����sourceָ��λ�ã����α������ַ�'a'���ַ�'b'���ַ��ո�' '���ַ�'c'����sourceָ����ַ���Ϊ"ab"��


�����쳣��������"error"������Ҫ�������������Ϊ����*/
#include<stdio.h>
void my_strcpy(char* destination, char* source)
{
	int i, p = 1;
	if (destination == NULL || source == NULL)
	{
		printf("error");
		return;
	}
	for (i = 0; source[i] != ' '; i++)
		destination[i] = source[i];
	destination[i] = source[i];
}
int main()
{
	char destination[105], source[105];
	gets_s(source, 105);
	my_strcpy(destination, source);
	return 0;
}
