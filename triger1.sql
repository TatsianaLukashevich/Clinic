 CREATE or replace TRIGGER modyfikuj_cene
  after update on wizyty
  FOR EACH ROW 
BEGIN
    insert into wizyty(cena)
    values (:old.cena +20);
end;
  
 call modyfikuj('4','17/05/01','18/05/01');