create function porownaj(login char, haslo_in varchar2) 
return number is
i number; haslo varchar2(30); pesel_pac char(11);

begin
  select haslo into haslo from pacjenci
  where pesel_pac = login;


  if haslo = haslo_in then
    i:= 1;
    return i;
  else
    i:=0;
    return i;
  end if;
  end;
  


select porownaj('12345106798','123456ewa') from dual;

  