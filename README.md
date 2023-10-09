# FTPFileUpload
<p>Step 1. Create Oracle Directory - create directory file_dir as "c:\files"</p>
<p>Step 2. Grant All on the directory to your app schema  - grant all on directory file_dir to "my_schema" </p>
<p>Step 3. grant execute on UTL_TCP to "my_schema" </p>
<p>Step 4. grant execute on UTL_FILE to "my_schema" </p>
<p>Step 5. Run the scrpits below</p>
        @install.sql

<p>sample</p>
<p>begin</p>
	<p>ftp_file_upload_api.ftp_file_upload(p_filename => ,   -- file name</p>
							  <p>p_mimetype  =>  ,           -- file mime type</p>
							  <p>p_blob      =>  ,           -- file blob
							  <p>p_dir_name  =>  ,           -- Oracle Directory name</p>
							  <p>p_ftp_host  =>  ,           -- ftp host IP</p>
							  <p>p_ftp_username  =>  ,       -- ftp username</p>
							  <p>p_ftp_password  =>  ,       -- ftp password</p>
							  <p>p_ftp_dir   =>  ,           -- ftp folder directory</p>
							  <p>p_ftp_port  => );           -- ftp port</p>
							  
<p>end;	</p>
