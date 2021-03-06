CREATE TABLE Badania
  (
    Id_badania NUMBER (5) NOT NULL ,
    Nazwa      VARCHAR2 (20 CHAR) NOT NULL ,
    PESEL_pac  CHAR (11 CHAR) NOT NULL ,
    Data       DATE NOT NULL
  ) ;
COMMENT ON TABLE Badania
IS
  'Okresla badania prowadzone w przychodni' ;
  COMMENT ON COLUMN Badania.Id_badania
IS
  'Sluzy do rozrozniania badan miedzy soba' ;
  COMMENT ON COLUMN Badania.Nazwa
IS
  'Sluzy do nazwy badania' ;
  COMMENT ON COLUMN Badania.PESEL_pac
IS
  'Pesel sluzy do rozrozniania pacjentow' ;
  COMMENT ON COLUMN Badania.Data
IS
  'Data prowadzonego badania badania' ;
  CREATE INDEX Id_badania__IDX ON Badania
    ( Id_badania ASC
    ) ;
ALTER TABLE Badania ADD CONSTRAINT B_PK PRIMARY KEY ( Id_badania ) ;


CREATE TABLE Gabinety
  (
    Nr_gabinetu   NUMBER (4) NOT NULL ,
    Przeznaczenie VARCHAR2 (100 CHAR)
  ) ;
COMMENT ON TABLE Gabinety
IS
  'Sluzy do okreslenia gabinetu,ktory znajduje sie w przychodni' ;
  COMMENT ON COLUMN Gabinety.Nr_gabinetu
IS
  'Sluzy do rozrozniania gabinetow w przychodni' ;
  COMMENT ON COLUMN Gabinety.Przeznaczenie
IS
  'Opis przeznaczenia danego gbinetu w przychodni' ;
  CREATE INDEX Gabinet__IDX ON Gabinety
    ( Nr_gabinetu ASC
    ) ;
ALTER TABLE Gabinety ADD CONSTRAINT G_PK PRIMARY KEY ( Nr_gabinetu ) ;


CREATE TABLE Pacjenci
  (
    PESEL_pac CHAR (11 CHAR) NOT NULL ,
    Imie      VARCHAR2 (15 CHAR) NOT NULL ,
    Nazwisko  VARCHAR2 (20 CHAR) NOT NULL ,
    Haslo     VARCHAR2 (30 CHAR) NOT NULL
  ) ;
COMMENT ON TABLE Pacjenci
IS
  'Opisuje pacjentow przychodni' ;
  COMMENT ON COLUMN Pacjenci.PESEL_pac
IS
  'Pesel sluzy do rozrozniania pacjentow' ;
  COMMENT ON COLUMN Pacjenci.Imie
IS
  'Sluzy do okreslenia osoby' ;
  COMMENT ON COLUMN Pacjenci.Nazwisko
IS
  'Sluzy do okreslenia osoby' ;
  CREATE INDEX PESEL_pac__IDX ON Pacjenci
    ( PESEL_pac ASC
    ) ;
  CREATE INDEX Haslo__IDX ON Pacjenci
    ( Haslo ASC
    ) ;
ALTER TABLE Pacjenci ADD CONSTRAINT Pac_PK PRIMARY KEY ( PESEL_pac ) ;


CREATE TABLE Pracownicy
  (
    PESEL_prac        CHAR (11 CHAR) NOT NULL ,
    Imie              VARCHAR2 (15 CHAR) NOT NULL ,
    Nazwisko          VARCHAR2 (20 CHAR) NOT NULL ,
    Wynagrodzenie     NUMBER (6) ,
    Specjalizacja     VARCHAR2 (50 CHAR) ,
    Data_zatrudnienia DATE
  ) ;
COMMENT ON TABLE Pracownicy
IS
  'Opisuje pracownika(lekarza), pracujacego w przychodni' ;
  COMMENT ON COLUMN Pracownicy.PESEL_prac
IS
  'Pesel sluzy do rozrozniania pracownikow' ;
  COMMENT ON COLUMN Pracownicy.Imie
IS
  'Sluzy do okreslenia osoby' ;
  COMMENT ON COLUMN Pracownicy.Nazwisko
IS
  'Sluzy do okreslenia osoby' ;
  COMMENT ON COLUMN Pracownicy.Wynagrodzenie
IS
  'Okresla wynagrodzenie otrzymane w poprzednim miesiacu pracy' ;
  COMMENT ON COLUMN Pracownicy.Specjalizacja
IS
  'Sluzy do okreslenia specjalizacji danego lekarza' ;
  COMMENT ON COLUMN Pracownicy.Data_zatrudnienia
IS
  'Sluzy do okreslenia daty zatrudnienia pracownika' ;
  CREATE INDEX PESEL_prac__IDX ON Pracownicy
    ( PESEL_prac ASC
    ) ;
ALTER TABLE Pracownicy ADD CONSTRAINT Prac_PK PRIMARY KEY ( PESEL_prac ) ;


CREATE TABLE Sprzety
  (
    Numer_seryjny VARCHAR2 (15 CHAR) NOT NULL ,
    Nazwa         VARCHAR2 (20 CHAR) NOT NULL ,
    Stan          CHAR (1) NOT NULL ,
    Opis          VARCHAR2 (150 CHAR) ,
    Nr_gabinetu   NUMBER (4)
  ) ;
COMMENT ON TABLE Sprzety
IS
  'Opisuje sprzet istniejacy w przychodni' ;
  COMMENT ON COLUMN Sprzety.Numer_seryjny
IS
  'Sluzy do rozrozniania sprzetu. Kazdy sprzed posiada swoj numer seryjny' ;
  COMMENT ON COLUMN Sprzety.Nazwa
IS
  'Kazdy sprzet posiada swoja nazwe' ;
  COMMENT ON COLUMN Sprzety.Stan
IS
  'Stan sprzetu, zepsuty - 0 , sprawny - 1' ;
  COMMENT ON COLUMN Sprzety.Opis
IS
  'Opis sprzetu, do czego ma sluzyc' ;
  COMMENT ON COLUMN Sprzety.Nr_gabinetu
IS
  'Sluzy do rozrozniania gabinetow w przychodni' ;
  CREATE INDEX Numer_seryjny__IDX ON Sprzety
    ( Numer_seryjny ASC
    ) ;
ALTER TABLE Sprzety ADD CONSTRAINT S_PK PRIMARY KEY ( Numer_seryjny ) ;


CREATE TABLE Terminarze
  (
    Data                DATE NOT NULL ,
    Godzina_rozpoczecia DATE  NOT NULL ,
    Godzina_zakonczenia DATE  NOT NULL ,
    PESEL_prac          CHAR (11 CHAR) NOT NULL ,
    Nr_gabinetu         NUMBER (4) NOT NULL
  ) ;
COMMENT ON TABLE Terminarze
IS
  'Sluzy do okreslenia czasu i daty  pracy pracownika w okreslonym gabinecie' ;
  COMMENT ON COLUMN Terminarze.Data
IS
  'Okresla dzien pracy pracownika w danym gabinecie' ;
  COMMENT ON COLUMN Terminarze.Godzina_rozpoczecia
IS
  'Okresla godzine rozpoczecia przcy' ;
  COMMENT ON COLUMN Terminarze.Godzina_zakonczenia
IS
  'Okresla godzine zakonczenia pracy' ;
  COMMENT ON COLUMN Terminarze.PESEL_prac
IS
  'Sluzy do okreslenia pracy pracownika w okreslonym gabinecie' ;
  COMMENT ON COLUMN Terminarze.Nr_gabinetu
IS
  'Sluzy do okreslenia gabinetu, w ktorym pracuje pracownik' ;
ALTER TABLE Terminarze ADD CONSTRAINT T_PK PRIMARY KEY ( Data, PESEL_prac, Nr_gabinetu ) ;


CREATE TABLE Testy
  (
    Nr_testu   NUMBER (5) NOT NULL ,
    Wynik      VARCHAR2 (300) ,
    Opis       VARCHAR2 (300) ,
    Id_badania NUMBER (5) NOT NULL
  ) ;
COMMENT ON TABLE Testy
IS
  'Opisuje testy prowadzone w przychodni' ;
  COMMENT ON COLUMN Testy.Nr_testu
IS
  'Numer prowadzonego testu' ;
  COMMENT ON COLUMN Testy.Wynik
IS
  'Wyniki otrzymane po prowadzonym tescie' ;
  COMMENT ON COLUMN Testy.Opis
IS
  'Opis prowadzonego testu' ;
  COMMENT ON COLUMN Testy.Id_badania
IS
  'Sluzy do rozrozniania badan miedzy soba' ;
  CREATE INDEX Nr_testu__IDX ON Testy
    ( Nr_testu ASC
    ) ;
ALTER TABLE Testy ADD CONSTRAINT Testy_PK PRIMARY KEY ( Nr_testu ) ;


CREATE TABLE Wizyty
  (
    Id_wizyty           NUMBER (5) NOT NULL ,
    Godzina_rozpoczecia DATE NOT NULL ,
    Godzina_zakonczenia DATE NOT NULL ,
    Przyczyna           VARCHAR2 (150 CHAR) NOT NULL ,
    Cena                NUMBER (5,2) NOT NULL ,
    Data                DATE NOT NULL ,
    PESEL_prac          CHAR (11 CHAR) NOT NULL ,
    Nr_gabinetu         NUMBER (4) NOT NULL ,
    PESEL_pac           CHAR (11 CHAR) NOT NULL
  ) ;
COMMENT ON TABLE Wizyty
IS
  'Opisuje wizyty w przychodni' ;
  COMMENT ON COLUMN Wizyty.Id_wizyty
IS
  'Sluzy do rozrozniania miedzy soba wizyty' ;
  COMMENT ON COLUMN Wizyty.Godzina_rozpoczecia
IS
  'Okresla godzine rozpoczecia wizyty' ;
  COMMENT ON COLUMN Wizyty.Godzina_zakonczenia
IS
  'Okresla godzine zakonczenia wizyty ' ;
  COMMENT ON COLUMN Wizyty.Przyczyna
IS
  'Okresla przyczyne pacjenta, zwracajacego sie do lekarza' ;
  COMMENT ON COLUMN Wizyty.Cena
IS
  'Cena wizyty' ;
  COMMENT ON COLUMN Wizyty.PESEL_prac
IS
  'Pesel sluzy do rozrozniania pracownikow' ;
  COMMENT ON COLUMN Wizyty.Nr_gabinetu
IS
  'Sluzy do rozrozniania gabinetow w przychodni' ;
  COMMENT ON COLUMN Wizyty.PESEL_pac
IS
  'Pesel sluzy do rozrozniania pacjentow' ;
  CREATE INDEX Id_wizyty__IDX ON Wizyty
    ( Id_wizyty ASC
    ) ;
ALTER TABLE Wizyty ADD CONSTRAINT W_PK PRIMARY KEY ( Id_wizyty ) ;


ALTER TABLE Badania ADD CONSTRAINT B_Paci_FK FOREIGN KEY ( PESEL_pac ) REFERENCES Pacjenci ( PESEL_pac ) ;

ALTER TABLE Sprzety ADD CONSTRAINT Sprzety_Gabinety_FK FOREIGN KEY ( Nr_gabinetu ) REFERENCES Gabinety ( Nr_gabinetu ) ;

ALTER TABLE Terminarze ADD CONSTRAINT T_G_FK FOREIGN KEY ( Nr_gabinetu ) REFERENCES Gabinety ( Nr_gabinetu ) ;

ALTER TABLE Terminarze ADD CONSTRAINT T_Prac_FK FOREIGN KEY ( PESEL_prac ) REFERENCES Pracownicy ( PESEL_prac ) ;

ALTER TABLE Testy ADD CONSTRAINT Testy_B_FK FOREIGN KEY ( Id_badania ) REFERENCES Badania ( Id_badania ) ;

ALTER TABLE Wizyty ADD CONSTRAINT W_Pac_FK FOREIGN KEY ( PESEL_pac ) REFERENCES Pacjenci ( PESEL_pac ) ;

ALTER TABLE Wizyty ADD CONSTRAINT W_T_FK FOREIGN KEY ( Data, PESEL_prac, Nr_gabinetu ) REFERENCES Terminarze ( Data, PESEL_prac, Nr_gabinetu ) ;
