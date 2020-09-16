#ifndef __LINEAR_LIST_H_INCLUDED__
#define __LINEAR_LIST_H_INCLUDED__

/*************************************************************************
 *  ���Ա�ĳ�����������
 *************************************************************************
 *
 *     ��ͷ�ļ������������Ա�ĳ����������ͣ������������ƺͻ�����������
 * �Ա�Ӧ�õĿͻ������Ӧ�ڴ˻���֮�Ͻ�����ƺ�ʵ�֡�
 *
 *     ���ڴ��ļ����������κ�ʵ�ֵľ���ϸ�ڣ�ʹ�ÿͻ����벻���������Ա�
 * �ľ����ʾ��ʵ�ַ�ʽ��
 *
 *************************************************************************
 *
 *  Copyright 2010-2013 by HAO Jiasheng <haojiasheng@gmail.com>
 *
 ************************************************************************/

/* ���� list_t Ϊ�ṹ�����ͣ�����ȥ��������ʾ��ʵ����Ϣ���� */
typedef struct list_t* LIST;

/* ���������Ϣ�� */
#define E_NODE_NOT_FOUND -1
#define E_SUCCESS        0

/* ����һ���յ����Ա� */
LIST create_list();

/* ��ȡ���Ա�ĳ��� */
int   list_length(LIST list);

/* ��ȡָ��λ���ϵĽڵ㣬�������򷵻� E_NODE_NOT_FOUND */
int   list_get   (LIST list, int pos);

/* ����ֵx���뵽���Ա��λ�� pos �� */
int   list_insert(LIST list, int pos, int x);

/* ɾ�����Ա���ָ��λ���ϵĽڵ㣬λ�ò������򷵻� E_NODE_NOT_FOUND */
int   list_delete(LIST list, int pos);

#endif // __LINEAR_LIST_H_INCLUDED__
