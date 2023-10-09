create table  t_upload_file_log 
   (	upload_id number not null enable, 
		upload_name varchar2(500), 
		mime_type varchar2(200), 
		char_set varchar2(200), 
		upload_blob blob, 
		crt_by varchar2(52), 
		crt_dt timestamp (6), 
		 constraint upload_pk primary key (upload_id)
  using index  enable
   )
/

create index  t_upload_file_log_index1 on  t_upload_file_log (upload_name)
/

create or replace trigger  upload_file_log_trig
before insert on t_upload_file_log
for each row

begin
if :new.upload_id is null then
	:new.upload_id := to_number(sys_guid(),'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
	:new.crt_by :=nvl(sys_context('APEX$SESSION','APP_USER'),USER);
	:new.crt_dt := sysdate;
end if;
end upload_file_log_trig;
/
alter trigger  upload_file_log_trig enable
/
create sequence file_upload_seq  increment by 1 start with 1 
/
