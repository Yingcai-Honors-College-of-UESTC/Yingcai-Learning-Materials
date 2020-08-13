/*�Խṹ�������������

��Ŀ������
struct Person{
����int no;
����int age;
����int height;
}
ʵ��sort�����Խṹ�������������
void sort(Person * array,int n);

����no��С�����������no��ͬ�����age�������age��ͬ�������height����

ע�⣺
�����쳣��������"error"������Ҫ�������������Ϊ����
*/
#include<stdio.h>
struct Person
{
	int no;
	int age;
	int height;
};
void sort(struct Person* array, int n)
{
	Person k;
	int i, j;
	if (array == NULL || n <= 0)
	{
		printf("error");
		return;
	}
	for (i = 0; i < n - 1; i++)
		for (j = i + 1; j < n; j++)
		{
			if (array[i].no > array[j].no)
			{
				k = array[i];
				array[i] = array[j];
				array[j] = k;
			}
			if (array[i].no == array[j].no && array[i].age > array[j].age)
			{
				k = array[i];
				array[i] = array[j];
				array[j] = k;
			}
			if (array[i].no == array[j].no && array[i].age == array[j].age && array[i].height > array[j].height)
			{
				k = array[i];
				array[i] = array[j];
				array[j] = k;
			}
		}
}
int main()
{
	struct Person a[105];
	int n, i;
	scanf_s("%d", &n);
	for (i = 0; i < n; i++)
	{
		scanf_s("%d%d%d", &a[i].no, &a[i].age, &a[i].height);
	}
	sort(a, n);
	for (i = 0; i < n; i++)
	{
		printf("%d %d %d\n", a[i].no, a[i].age, a[i].height);
	}
	return 0;
}
