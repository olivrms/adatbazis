Create Table ugyfel_masked5_0(
Login Varchar(100),
Email Varchar(100) Masked With (Function = 'email()'),
Nev Varchar(100) Masked With (FUNCTION = 'partial(1,"XXX_XXX",1)'),
Szulev int Masked With (Function = 'random(1000,9999)'),
Nem Varchar(100),
Cim Varchar(100) Masked With (Function = 'partial(4,"XXX",0)'));
Insert Into ugyfel_masked5_0
SELECT Login, Email, Nev, Szulev, Nem, Cim
From ugyfel;
CREATE USER MaskUser5_0 WITHOUT Login;
GRANT SELECT ON ugyfel_masked5_0 TO MaskUser5_0;
EXECUTE AS User= 'MaskUser5_0';
SELECT * FROM ugyfel_masked5_0 REVERT
--ha tudunk hivatkozni ugyfel tablara
--ha nem akkor:
--insert into ugyfel_masked5_0
--(Login, Email, Nev, Szulev, Nem, Cim)
--Values 
--('adam1','ádám.kiss@mail.hu','Kiss Ádám',1991,'F','5630 Békés, Szolnoki út 8.'),
--('adam3','adam3@gmail.com','Barkóci Ádám',1970,'F','3910 Tokaj, Dózsa György utca 37.'),
--stb..;