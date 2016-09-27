CREATE OR REPLACE procedure modyfikuj(id_wizyty_in number, Godzina_rozpoczecia_in date, Godzina_zakonczenia_in date)
is
id_wizyty number(5); Godzina_rozpoczecia date; Godzina_zakonczenia date; cena number(5);
begin
  UPDATE WIZYTY
    SET Godzina_rozpoczecia = Godzina_rozpoczecia_in, Godzina_zakonczenia =Godzina_zakonczenia_in
    WHERE id_wizyty=id_wizyty_in;
  end;
  

