//��ʦ������main��д�˸��������������һ��ÿ���������ݿ����Բ��ԣ��������������զֻ�������β������/˥
#include<stdio.h>
#include<stdlib.h>

int main(void)
{
	typedef struct node
	{
		int data;
		struct node *next;
	}Node,*List;//����һ���ṹ���ͣ����Ҷ���һ������Node��node�ͽṹ���Լ�ָ��ṹnode�ṹ��ָ��next����ָ��ָ���������һ��Ԫ��
	List S=NULL, L;//����ָ��node�ṹ������ָ�룬L����ָ���һ��Ԫ��,S����ָ������Ԫ��
	int number, n;
	printf("�������Ϊ\n");
	scanf_s("%d",&number);
	if (number == 0)
	{
		L = NULL;
		return -1;
	}
	else
	{
		printf("�������1����:\n");
		scanf_s("%d", &n);
		L = (List)malloc(sizeof(Node));
		if(L==NULL)
		{
			printf("����ʧ��\n");
			return -1;
		}

		L->next = NULL;//��ֻ��һ��Ԫ��ʱ����һ��ָ��ָ���ָ��
		L->data = n;

		for (int i = 1; i < number; i++)
		{
			S = (List)malloc(sizeof(Node));
			if (S == NULL)
			{
				printf("����ʧ��\n");
				return -1;
			}
			printf("�������%d����:\n", i+1);
			scanf_s("%d", &n);
			S->data = n;
            S->next = L;//���һ�����ָ���һ�����
			L->next = S;//��һ�����ָ����ĩ�Ľ��
        }
		
	}
	printf("�������ɳɹ�\n");
	List p=S->next,q=p;
	printf("%d\n", p->data);
	p = p->next;
	while (p!=(q))
	{
		printf("%d\n",p->data);
		p = p->next;
	}
	system("pause");
	return 0;
}

