CREATE DIRECTORY test_dir AS '/u01/app/oracle/test_dir';
declare
  vInFileTxt utl_file.file_type;
BEGIN
  vInFileTxt := utl_file.fopen('test_dir', 'test.txt', 'w');
 

  utl_file.put_line(vInFileTxt, q'[Hi I'm writing something here]');
  utl_file.fclose(vInFileTxt);
  
EXCEPTION
  WHEN others then
    dbms_output.put_line('Problem is:' || sqlerrm);
end;