#ifndef __LIST_APP_H_INCLUDED__
#define __LIST_APP_H_INCLUDED__


/*************************************************************************
 * ����ǰ������
 *************************************************************************/

/* �������Ա����δ�ӡ����ֵ */
void display_list(LIST list);

/* �����Ա����� */
void sort_list(LIST list);

/* �������Ա�������Ӧ��λ�� */
int search_list(LIST list, int x);

/* ɾ�����Ա����ظ����ֵĽ�� */
void purge_list  (LIST list);



#endif // __LIST_APP_H_INCLUDED__
