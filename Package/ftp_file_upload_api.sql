create or replace package ftp_file_upload_api as 
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
							 );

end ftp_file_upload_api;
