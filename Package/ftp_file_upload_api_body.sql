create or replace package body ftp_file_upload_api as

	--upload file to ftp storage
	procedure ftp_file_upload(p_filename varchar2,
							  p_mimetype varchar2,
							  p_blob     blob,
							  p_dir_name varchar2,
							  p_ftp_host varchar2,
							  p_ftp_username varchar2,
							  p_ftp_password varchar2,
							  p_ftp_dir varchar2,
							  p_ftp_port number
							 ) as
	l_conn      utl_tcp.connection;
	l_file      utl_file.file_type;
	l_file_name varchar2(500);
	l_buffer    raw(32767);
	l_amount    binary_integer := 32767;
	l_pos       integer := 1;
	l_blob      blob;
	l_blob_len  integer;
	l_key number;

	begin
		insert into t_upload_file_log(upload_name,mime_type)
		values(p_filename,p_mimetype);

		l_blob      :=   p_blob;
		l_blob_len  := dbms_lob.getlength(l_blob);

		if l_blob_len > 0 then 
		   /* means the attachmennt is not null */
			l_file := utl_file.fopen(p_dir_name,p_filename,'wb', 32767); 
		   /* read directory */
			while l_pos <= l_blob_len loop
				dbms_lob.read(l_blob, l_amount, l_pos, l_buffer);
				utl_file.put_raw(l_file, l_buffer, true);
				l_pos := l_pos + l_amount;
			end loop;

			utl_file.fclose(l_file);
		end if;
		 -- Transfer file to ftp storage
		begin
			l_conn :=   ftp.login(p_ftp_host, p_ftp_port, p_ftp_username, p_ftp_password);
						 ftp.binary(p_conn => l_conn);
						 ftp.put(p_conn     => l_conn,
						 p_from_dir  => p_dir_name,
						 p_from_file =>  p_filename,
						 p_to_file   => p_ftp_dir||p_filename);
			ftp.logout(l_conn);
			utl_file.fremove ( p_dir_name, p_filename);
		end;

	exception
	when others then
	if utl_file.is_open(l_file) then
	utl_file.fclose(l_file);
	end if;
	rollback;
	raise;
	end ftp_file_upload;

end ftp_file_upload_api;
