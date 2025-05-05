<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
</head>
<body>
  <div class="container">
    <h1>📤 FTP File Upload via Oracle PL/SQL</h1>

    <h2>🔧 Setup Steps</h2>
    <ol>
      <li>Create Oracle directory: <code>CREATE DIRECTORY file_dir AS 'C:\files';</code></li>
      <li>Grant access to your schema: <code>GRANT ALL ON DIRECTORY file_dir TO my_schema;</code></li>
      <li>Grant network privileges: 
        <ul>
          <li><code>GRANT EXECUTE ON UTL_TCP TO my_schema;</code></li>
          <li><code>GRANT EXECUTE ON UTL_FILE TO my_schema;</code></li>
        </ul>
      </li>
      <li>Run the installation script:
        <br /><code>@install.sql</code>
      </li>
    </ol>

    <h2>🧪 Sample Usage</h2>
    <pre><code>
BEGIN
  ftp_file_upload_api.ftp_file_upload(
    p_filename     => 'example.txt',        -- File name
    p_mimetype     => 'text/plain',         -- MIME type
    p_blob         => :P1_FILE,             -- File BLOB
    p_dir_name     => 'FILE_DIR',           -- Oracle directory
    p_ftp_host     => '192.168.1.100',      -- FTP server IP
    p_ftp_username => 'ftpuser',            -- FTP username
    p_ftp_password => 'ftppass',            -- FTP password
    p_ftp_dir      => '/upload',            -- FTP folder path
    p_ftp_port     => 21                    -- FTP port
  );
END;
    </code></pre>
  </div>
</body>
</html>
