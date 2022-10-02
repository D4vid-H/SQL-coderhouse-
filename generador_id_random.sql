set @id = (select md5(UUID()));

select @id from dual;
