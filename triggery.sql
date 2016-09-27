/*CREATE or replace TRIGGER mainupdate BEFORE UPDATE ON PACJENCI
FOR EACH ROW 
begin
if (length(:new.haslo) > 3)
then 
 update PACJENCI SET haslo = :old.haslo;
 else 
  update PACJENCI SET haslo = :new.haslo;
end if;
 end;*/
 
  CREATE or replace TRIGGER modyfikuj_cene after update on wizyty
  FOR EACH ROW 
  begin
    insert into wizyty(cena)
    values (cena +20);
  end;
    
 
  call zmien_haslo('12345671098','1234aa');
