/*����Բ����뾶r�͸�h����Բ���������������
Ҫ��
pi=3.14
����İ뾶�͸���float����
�������С�����2λ���ȣ������������������Ӣ�Ķ��ţ�����������������
����������
���룺
9 12
�����
area=254.34,volume=3052.08

*/
#include<stdio.h>
int main()
{
	const float pi=3.14;
	float r,h,area,volume;
	scanf("%f %f",&r,&h);
	area=pi*r*r;
	volume=area*h;
	printf("area=%.2f,volume=%.2f",area,volume);
	return 0;
}
	
