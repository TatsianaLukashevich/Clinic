create OR REPLACE procedure pokaz_wizyte(login char) 
is 

pesel_pac char(11);

begin

  select * into newtab from wizyty
  where pesel_pac = 12345106798;
end;


call pokaz_wizyte('12345106798') ;