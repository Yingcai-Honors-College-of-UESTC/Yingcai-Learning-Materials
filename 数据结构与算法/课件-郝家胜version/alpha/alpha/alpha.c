/*************************************************************************
 *                      ����������������ϻ�ʵ�� ������
 *************************************************************************
 *  ��ҵ����: Alpha ����ĳ�����������ʵ��
 *
 *  ��ҵ����:
 *      �Ӽ��̽����û��������ɸ���Ȼ��������һ���������Ա������Զ���
 *  �Ա���в���������������Ϊ�Ǽ���Ҳ����Ϊ������
 *      ���Ա�ĳ����������͵Ľӿڶ����� linear_list.h ���Ѹ�����ͬʱ��
 *  ����Щ�ӿڵ����Ա�������㣨��������򡢶��ֲ��ҡ���������ȣ�Ҳ
 *  �����ļ� list_app.c ��ʵ�֡�
 *      ���Ա����������������͵ľ���ʵ�ַ�ʽ���Բ���˳���������ӱ�
 *  �ֱ���Դ�ļ� linear_list_seq.c �� linear_list_lnk.c �У��������ṩ��
 *  �ֲ���ʵ����Ϊ�ο���
 *
 *  ��ҵҪ��
 *      �����ļ� linear_list.h �����������Ա�ĳ����������ͣ�������Ա�
 *  �����������͵����ֲ�ͬ����ʵ�֡�
 *     ��1��˳���ʵ�֣��� linear_list_seq.c ʵ��˳���Ļ�������������
 *  ָ��λ��Ԫ�صĻ�ȡ����λ�������ɾ����������ļ� linear_list_seq.c��
 *     ��2�����ӱ�ʵ�֣��� linear_list_lnk.c ʵ�����ӱ�Ļ�������������
 *  ָ��λ��Ԫ�صĻ�ȡ����λ�������ɾ����������ļ� linear_list_lnk.c��
 *
 *  �ύ˵����
 *      �ύ���ϣ�
 *     ��1�������������г����������͵ķ���;
 *     ��2�������� linear_list_seq.c Դ���루����ע�ͣ���
 *     ��3�������� linear_list_lnk.c Դ���루����ע�ͣ���
 *
 *************************************************************************
 *
 *  Copyright 2010-2016 by HAO Jiasheng <haojiasheng@gmail.com>
 *
 ************************************************************************/
#include <stdio.h>
#include <assert.h>
#include "linear_list.h"
#include "list_app.h"

#define EOL -1           /* End Of List�����������־ */


void do_purge(LIST list)
{
     /* ɾ���ظ����ֵ�Ԫ�� */
     printf("\n>> ɾ���ظ����ֵ�Ԫ��...\n");
     purge_list(list);
     /* ������Ա� */
     display_list(list);
}

void do_find(LIST list)
{
     int x, i;

     /*���ö��ֲ���Ԫ��*/

     printf ("\n>> ������ö��ֲ��ҵ�Ԫ�أ�");
     scanf("%d",&x);

     i = search_list(list,x);
     /* ������ */
     if ( i != E_NODE_NOT_FOUND )
          printf("Found at the position: %d\n", i);
     else
          printf("Not found.\n");

}

void do_delete(LIST list)
{
     int x, i;

     /* ��ȡ�û����룬�������Ա��ж�Ӧ�Ľ��ɾ�� */
     printf("\n>> ����Ҫɾ����Ԫ�أ�");
     scanf("%d", &x);

     /* �ȶ�ΪֵΪ x �Ľ�㣬�õ���λ�ã�Ȼ����ݸ�λ��ִ��ɾ������ */
     i = search_list(list, x);
     if (E_SUCCESS != list_delete(list, i))
          printf("Delete failed: node not found.\n");
     /* ������Ա� */
     display_list(list);
}


/*************************************************************************
 * ������
 *************************************************************************/

/*
 * ��������������������ȡ�û����룬������Ӧ������ӡ���
 * ��    �룺ϵͳĬ��
 * ��    ����0
 */

int main(int argc, char *argv[])
{
     LIST list;
     int x;
     int i;


     /* ����һ���յ����Ա� */
     list = create_list();
     assert(NULL != list);

     /* ��ȡ�û����룬�����뵽���Ա����ʵ���λ�� */
     printf("\n>> �������ɸ���Ȼ������ %d �������룺\n", EOL);

     i = 0;
     while (1) {
          printf(" x[%d] = ", i);
          scanf("%d", &x);
          if (EOL == x)
               break;

          list_insert(list, list_length(list), x);
          /* �����Ա�������� */
          sort_list(list);
          /* ������Ա� */
          display_list(list);

          i++;
     }

     while (1) {
          printf("\n>> [0-> �˳���1-> ������Ա�2-> ɾ���ظ����; 3-> ���ҽ�㣻4-> ɾ�����]��");
          scanf("%d", &x);

          if (x == 0) break;

          switch (x)
          {
          case 1:
               display_list(list);
               break;
          case 2:
               do_purge(list);
               break;
          case 3:
               do_find(list);
               break;
          case 4:
               do_delete(list);
               break;
          }
     }

     return 0;
}

/* Ends */

