/*************************************************************************
 *  ѧ�ţ�
 *  ������
 *************************************************************************
 *                      ����������������ϻ�ʵ�� ������
 *
 *  ��ҵ����: Alpha �����˳���ʵ��
 *
 *  ����������:
 *
 *
 *************************************************************************
 *
 *  Copyright 2010-2013 by HAO Jiasheng <haojiasheng@gmail.com>
 *
 ************************************************************************/
#include <stdio.h>
#include <malloc.h>
#include <assert.h>
#include "../linear_list.h"

#define MAX_LENGTH 64

/* ���Ա�ı�ʾ */
struct list_t
{
     int *data;  /* �ڵ����ͼ��洢�������׵�ַ */
     int length; /* ��ǰ�ڵ���� */
     int max_length;   /* ���ڵ���� */
};


/* ����һ���յ����Ա� */
LIST create_list()
{
     LIST list = (LIST) malloc(sizeof(LIST));
     list->data = (int*) malloc(sizeof(int) * MAX_LENGTH);
     list->length = 0;
     list->max_length = MAX_LENGTH;

     return list;
}

/* ��ȡ���Ա�ĳ��� */
int   list_length(LIST list)
{
     return 0;
}

/* ��ȡָ��λ���ϵĽڵ㣬�������򷵻� E_NODE_NOT_FOUND */
int   list_get   (LIST list, int pos)
{


     return (list->data[pos]);
}


/* ����ֵx���뵽���Ա��λ�� pos �� */
int   list_insert(LIST list, int pos, int x)
{
     int length, i;

     assert(list != NULL);

     length = list->length;
     if (length == list->max_length)
          return E_NODE_NOT_FOUND;

     if ((pos < 0) || (pos > length))
          return E_NODE_NOT_FOUND;

     for (i = length - 1; i >= pos; i--)
          list->data[ i+1 ] = list->data[i];

     list->data[ pos ] = x;

     list->length += 1;

     return E_SUCCESS;
}

/* ɾ�����Ա���ָ��λ���ϵĽڵ㣬λ�ò������򷵻� E_NODE_NOT_FOUND */
int   list_delete(LIST list, int pos)
{


     return E_SUCCESS;
}
