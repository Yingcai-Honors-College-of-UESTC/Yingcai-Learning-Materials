/*************************************************************************
 *  ѧ�ţ�
 *  ������
 *************************************************************************
 *                      ����������������ϻ�ʵ�� ������
 *
 *  ��ҵ����: Alpha ��������ӱ�ʵ��
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

/* ���Ա�ı�ʾ */
struct list_t
{
	int length;
	/* ��ͷ��������ṹ */
	struct node_t *head;
};

struct node_t
{
    int data;
    struct node_t *next;
};

/////////////////////////////////////////////////////////////////////////////
/* ��̬����һ���µĽڵ㣬������ʼ�� */
static struct node_t* _create_node()
{
    struct node_t* node;
    /* ��ʼ��ͷ��� */
    node = (struct node_t *)malloc(sizeof(struct node_t));
    node->data = -1;
    node->next = NULL;

    return node;
}

/* ��ȡָ��λ���ϵ�ǰһ���ڵ㣬�������򷵻� NULL */
static struct node_t* _get_prevnode(LIST list, int pos)
{
	struct node_t *node = NULL;

    /* ָ��ͷ��� */
	node = list->head;

	/*ѭ����ָ��λ�õ�ǰһ���ڵ�ʱpos��Ϊ1����������ִ��*/
	while(node != NULL && pos-- > 0)
	{
		node = node->next;
	}

	return node;
}

/////////////////////////////////////////////////////////////////////////////

/* ����һ���յ����Ա� */
LIST create_list()
{
	struct list_t *list ;

    list = (struct list_t *)malloc(sizeof(struct list_t));
	list->length = 0 ;
	/*��ȡ���������ͷ���ָ��*/
	list->head = _create_node();

    return list;
}

/* ��ȡ���Ա�ĳ��� */
int   list_length(LIST list)
{

    return 0;
}


/* ��ȡָ��λ���ϵĽڵ㣬�������򷵻� E_NODE_NOT_FOUND */
int   list_get(LIST list, int pos)
{


    return 0;
}

/* ����ֵx���뵽���Ա��λ�� pos �� */
int   list_insert(LIST list, int pos, int x)
/*
 * ��� pos < length��˵�����Ա��д��ڱ�x��Ľڵ�
 * ����pos == length, ��ʱx������㣬Ӧ��ӵ����ĩβ
 */
{
	struct node_t *prev,*new_node ;

	assert(NULL != list);
	/* �ж�pos�Ƿ���Ч:pos���벻С��0,���Ҳ����������� */
	if(pos < 0 || pos > list->length)
	{
		return E_NODE_NOT_FOUND ;
	}

    /*�½�һ���ڵ���Ҫ�����Ԫ��*/
	new_node = _create_node();
	new_node->data = x;

	prev = _get_prevnode(list, pos);

	/*���²���ڵ��nextָ��ָ��ԭ��������ָ��λ�ýڵ�ĵ�ַ*/
	new_node->next = prev->next ;
	/*��ָ��λ��ǰһ���ڵ��nextָ��ָ���²���ڵ�ĵ�ַ*/
	prev->next = new_node ;

    /*�������������Զ���1*/
	list->length += 1;

	return E_SUCCESS ;
}

/* ɾ�����Ա���ָ��λ���ϵĽڵ㣬λ�ò������򷵻� E_NODE_NOT_FOUND */
int   list_delete(LIST list, int pos)
{


	return E_SUCCESS ;
}
