/*��д�����������������ַ��������string1���Ƿ����
  string2�У�����У���������ִ�����ÿ�γ��ֵ���ʼλ�ã�
  ���û�У����'no'*/ 
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main(){
	printf("������string1��string2");
	const int q = 100;
	int num[q],h=0;
	char word[q];
	char words[q];
	scanf_s("%s", word, q);
	scanf_s("%s", words, q);
	int a, b, i, j, k, l,p;
	a = strlen(word);
	b = strlen(words);
	l = a - b + 1;
	for (i = 0; i <= l; i++) {
			for (j = i; j <= b+i-1; j++) {
				if (word[j] == words[j-i]) continue;
				else {
					k = l - 1;
					goto end;
				}
		}
			num[h] = i;
			h++;
		end:;
	}
	if (k == 0) {
		printf("NO");
	}
	else {
		printf("%d\n", k);
		for (p = 0; p < h; p++) {
			printf("%d", num[p]);
		}
	}

}
