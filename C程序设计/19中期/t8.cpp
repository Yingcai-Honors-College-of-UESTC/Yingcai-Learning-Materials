#include<stdio.h>
#include<stdlib.h>

//���塰ѧ�����ṹ 
struct student
{
	int no;
	int grade;
};

int main()
{
	struct student stu[10],tmp;
	
	//����ѧ��ѧ�źͳɼ� 
	for(int i=0;i<=9;i++)
	{
		scanf("%d %d",&stu[i].no,&stu[i].grade);
	}
	
	//�Գɼ����� 
	int max;
	for(int i=0;i<10;++i)
	{
		max=i;
		for(int j=i+1;j<10;++j)
		{
			if(stu[j].grade>stu[max].grade)
			{
				max=j;
			}
			tmp=stu[i];
			stu[i]=stu[max];
			stu[max]=tmp;
		}
	}
	
	/*�����߷ֺ���ͷּ���Ӧѧ��*/
	
	//��߷� 
	printf("��߷ֵ���\n");
	for(int i=9;stu[i].grade==stu[9].grade;i--)
	{
		printf("%d\n",stu[i].no);
	} 
	printf("��߷�Ϊ%d\n",stu[9].grade);
	
	//��ͷ�
	printf("��ͷֵ���\n");
	for(int i=0;stu[i].grade==stu[0].grade;i++)
	{
		printf("%d\n",stu[i].no);
	} 
	printf("��ͷ�Ϊ%d\n",stu[0].grade);
	
	return 0;
}
