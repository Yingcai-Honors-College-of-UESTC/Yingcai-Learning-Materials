/*�������Ĺ����Ƕ���20��������
  ͳ�ƷǸ���������������Ǹ���֮�� */ 
#include<stdio.h>
int main()
{
	int i, a[5], s = 0, count = 0;
	for (i = 0; i < 5; i++)
		scanf("%d", &a[i]);
	for (i = 0; i < 5; i++)
	{
		if (a[i] < 0)
		{
			continue;
		}
		s += a[i];
		count++;
	}
	printf("%d,%d", s, count);
	return 0;
}
