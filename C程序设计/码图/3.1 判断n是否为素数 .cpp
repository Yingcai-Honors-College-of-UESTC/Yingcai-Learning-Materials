/*����һ������3������n���ж����Ƿ�Ϊ�����������yes/no��
���磬����4�����no��
����7�����yes��
�������룬�����error���������û�лس����š�
*/
#include<stdio.h>
#include<math.h>
int main()
{
	int i,n,d=0;
	double sqrtn;
	scanf("%d",&n);
	
	if(n<3)
	{
	  printf("error");
	} 
	
	else
	{ 
	  sqrtn=sqrt(n*1.0);
	  for(i=2;i<=sqrtn;i++)
	  {
	  	if(n%i==0)
		  {
	  	    d++;
	      }
	  }
	  
	  if(d==0)
	  {
	  	printf("yes");
	  }
	  
	  else
	  {
	  	printf("no");
	  }
	} 
	return 0;
}
	
