CREATE OR REPLACE procedure zmien_haslo(login char, haslo_in varchar2)
is
pesel_pac char(11); haslo varchar2(30);
begin
  UPDATE PACJENCI
    SET haslo = haslo_in
    WHERE pesel_pac=login;
  end;
  
   call zmien_haslo('12345671098','12345a');