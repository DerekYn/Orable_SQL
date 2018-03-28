 --- * 생성되어진 트리거의 종류와 소스를 보는 것 *** ---
 
 select *
 from user_triggers;
 
 
 --- *** 트리거 삭제하기 *** ---
 
 drop trigger 트리거명;
 
 --- *** 트리거의 비활성화 / 활성화 하기 *** ---
 
 alter trigger ROWBTRI_TBL_MEMBER_DETAIL disable;
 alter trigger ROWBTRI_TBL_MEMBER_DETAIL enable;

-- 5912