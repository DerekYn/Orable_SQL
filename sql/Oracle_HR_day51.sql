   -- ===== *** ���������� �߰� *** ===== 
 alter table tbl_userlogin
 add constraint CK_tbl_userlogin_passwd check( 8 <= length(passwd) and length(passwd) <= 20);
 
 select *
 from tbl_userlogin;
 
 update tbl_userlogin set passwd = 'abcd123$'  -- 8���� �̻��̸� ���� �ȴ�.
 where userid = 'superman';
 
 commit;
 
 desc tbl_userdetail;
 
 alter table tbl_userdetail
 add constraint NN_tbl_userdetail_tel tel not null;          -- ����..
 
 ���������� �߰��� primary key, unique, check, foreign key ������ �߰��� �Ʒ��� ���� �Ѵ�.
 alter table ���̺� ��
 add constraint ����Ʈ����Ʈ ��    primary key(�÷���);
 add constraint ����Ʈ����Ʈ ��    unique(�÷���);
 add constraint ����Ʈ����Ʈ ��    foreign key(�÷���);
                references �θ����̺��(�����޴� �÷���);
                
 �������� �߰��� not null�� �Ʒ��� ���� �Ѵ�.
 alter table tbl_userdetail
 modify tel not null;

-- 3940