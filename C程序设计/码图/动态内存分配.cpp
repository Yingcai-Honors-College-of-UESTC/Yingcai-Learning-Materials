/*��д������������n����̬���䱣��n�������Ĵ洢����Ȼ������n���������浽�洢���С���󣬽���n��������С���������
���磺
�������£�
10�س�
10 9 8 7 6 5 4 3 2 1�س�
�����
1,2,3,4,5,6,7,8,9,10*/
#include<stdio.h>
#include<stdlib.h>
int main()
{
	int* a, n, i, j, k;
	scanf_s("%d", &n);
	a = (int*)malloc(sizeof(int) * n);
	for (i = 0; i < n; i++)
	{
		scanf_s("%d", &a[i]);
	}
	for (i = 0; i < n - 1; i++)
	{
		for (j = i + 1; j < n; j++)
		{
			if (a[i] > a[j])
			{
				k = a[i];
				a[i] = a[j];
				a[j] = k;
			}
		}
	}
	for (i = 0; i < n - 1; i++)
	{
		printf("%d,", a[i]);
	}
	printf("%d", a[i]);
	return 0;
}
