/*��Ŀ�����������ַ���a��b��a����n���ַ���дһ������
���ַ���a�еĵ�p��q���ַ����뵽�ַ���b��k���ַ��������
��ָ�뷽������
���磺����a��abcdefg��b��tttt��
p=3��q=5��k=2����Ӧ�����ttcdett�� 
*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
void ins(char a[],char b[],int m,int n,int p)
{
	char* x, * y;
	x = (char*)malloc(sizeof(char));
	y = (char*)malloc(sizeof(char));
	x = &a[0];
	for (int i = 0; i < p; i++)
	{
		printf("%c", *x);
		x++;
	}
	y = &b[m - 1];
	for (int i = 0; i < n - m; i++)
	{
		printf("%c", *y);
		y++;
	}
	int k;
	k = strlen(a);
	for (int i = 0; i < k - p; i++)
	{
		printf("%c", *x);
		x++;
	}
}
int main()
{
	char a[105], b[105];
	printf("input char'a'\n");
	scanf_s("%s", a, 105);
	printf("input char'b'\n");
	scanf_s("%s", b, 105);
	int m, n, p;
	printf("input controlling nums");
	scanf_s("%d %d %d", &m, &n, &p);
	ins(a, b, m, n, p);
	return 0;
}
