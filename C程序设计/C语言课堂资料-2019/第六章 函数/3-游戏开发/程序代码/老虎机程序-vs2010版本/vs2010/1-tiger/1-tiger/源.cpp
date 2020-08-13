#include"acllib.h"
#include<time.h>
#include<iostream>
using namespace std;
struct animal
{	
	int x, y;//���Ͻ�����λ��
	int num;//���ɵ�0-3�������������4��ͼƬ���±�λ��
} animals[3][3];
ACL_Image image[4];//���ص�4��ͼƬ��Ϣ
const int mw = 300, mh = 300;//���ڸ߿�
const int width = 100, height = 100;//���鳤��
void TimerEvent(int id);//��ʱ��������
void KeyEvent(int key, int event);//���̴�����
void paint();//��ͼ����
int Setup()//����������Winmain���ã�
{
	int i, j;
	srand((unsigned)time(NULL));
	initWindow("tiger", DEFAULT, DEFAULT, mw, mh);
	registerTimerEvent(TimerEvent);
	registerKeyboardEvent(KeyEvent);
	loadImage("1-bird.jpg", &image[0]);
	loadImage("1-cat.jpg", &image[1]);
	loadImage("1-dog.jpg", &image[2]);
	loadImage("1-rabbit.jpg", &image[3]);
	//����3*3������λ�ú��������ͼƬ�±�
	for (i = 0;i < 3;++i)
	{
		for (j = 0;j < 3;++j)
		{
			animals[i][j].num = rand()%4;
			animals[i][j].x = j * 100;
			animals[i][j].y = i * 100;

		}
	}
	startTimer(0, 500);
	paint();
	return 0;
}
void TimerEvent(int id)
{
	int i, j;
	switch (id)
	{
	case 0:
		//����һ��
		for (i = 2;i >=0;--i)
		{
			for (j = 0;j < 3;++j)
			{
				animals[i][j].num = animals[i - 1][j].num;
			}
		}
		//��0�������������
		for (i = 0;i < 3;++i)
			animals[0][i].num = rand() % 4;
		break;
	default:
		break;
	}
	paint();
}
void KeyEvent(int key, int event)
{
	char s[20];
	if (event != BUTTON_DOWN)return;
	beginPaint();
	clearDevice();
	setTextSize(30);
	setTextColor(BLACK);

	if (key == VK_RETURN)//�س�������
	{
		if (animals[1][0].num == animals[1][1].num && animals[1][1].num == animals[1][2].num)
		{
			sprintf_s(s, "YOU WIN��");
			paintText(width, height, s);
			cancelTimer(0);

		}
		else
		{
			sprintf_s(s, "You Lost��");
			paintText(width, height, s);
			cancelTimer(0);
		}
	}
	endPaint();
}
void paint()
{
	int i, j;
	beginPaint();
	clearDevice();
	for (i = 0;i < 3;++i)
	{
		for (j = 0;j < 3;++j)
		{
			putImageScale(&image[animals[i][j].num], animals[i][j].x, animals[i][j].y, width, height);
		}
	}
	
	endPaint();
}