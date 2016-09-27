CREATE OR REPLACE procedure usun(id_wizyty_in number)
is
id_wizyty number(5);
begin
  DELETE FROM WIZYTY
  WHERE id_wizyty=id_wizyty_in;
end;

INSERT INTO WIZYTY
VALUES ('4','16/05/01','17/05/01','Wizyta', '120', '14/02/10', '12345678910', '1', '12345610798');

call usun('4');