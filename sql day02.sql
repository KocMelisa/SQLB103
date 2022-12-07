create table ogrenciler3
(
	ogrenci_no char(7),
	isim varchar(50),
	soyisim varchar(25),
	not_ort real,
	kayit_tarihi date
);

--varolan tablodan tablo olusturmak
create table notlar 
as
select isim, not_ort from ogrenciler3;

select * from notlar;

--tablo icine veri ekleme

insert into notlar values ('melisa', 95.5);
insert into notlar values ('ali', 85.5);
insert into notlar values ('musa', 65.5);
insert into notlar values ('hakan', 55.5);
insert into notlar values ('adem', 75.5);
insert into notlar values ('sumeyye', 95.5);

select * from notlar;

create table talebeler
(
	isim varchar(10),
	notlar real
);

insert into talebeler values ('melisa', 95.5);
insert into talebeler values ('ali', 85.5);
insert into talebeler values ('musa', 65.5);
insert into talebeler values ('hakan', 55.5);
insert into talebeler values ('adem', 75.5);
insert into talebeler values ('sumeyye', 95.5);

select * from talebeler;

create table ogrenciler4
(
	ogrenci_no char(7) unique,
	isim varchar(50) not null,
	soyisim varchar(25),
	not_ort real,
	kayit_tarihi date
);

select * from ogrenciler4;

insert into ogrenciler4 values ('1234567','melisa','koc', 95.5,now());
insert into ogrenciler4 values ('1234568','ali','veli', 95.5,now());
insert into ogrenciler4 (ogrenci_no,soyisim,not_ort) values ('1234569','evren',85.5);

--prımary key

create table ogrenciler5
(
	ogrenci_no char(7) primary key,
	isim varchar(50) not null,
	soyisim varchar(25),
	not_ort real,
	kayit_tarihi date
);

create table ogrenciler6
(
	ogrenci_no char(7),
	isim varchar(50) not null,
	soyisim varchar(25),
	not_ort real,
	kayit_tarihi date,
	Constraint ogr primary key(ogrenci_no)
);

-- foreign key

/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,  
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)    
);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);

select * from tedarikciler3;
select * from urunler;

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”  
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın. 
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve 
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar
(
	id varchar(15) primary key,
	isim varchar(30) unique,
	maas int not null,
	ise_baslama date
);

create table adresler
(
	adres_id varchar(30),
	sokak varchar(30),
	cadde varchar(30),
	sehir varchar(30),
	foreign key (adres_id) references calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');

--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez

INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');

--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez

INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');

--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- INT / STRING

INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');

--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY ikinci hicligi kabul etmiyor
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY 
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY not null

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz

--INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
   
-- FK'ye null değeri atanabilir.

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

SELECT * FROM calisanlar;
SELECT * FROM adresler;

-- CHECK CONSTRAINT
CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000) NOT NULL,
ise_baslama date    
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14'); 

-- DQL -- WHERE KULLANIMI

SELECT * FROM calisanlar1;
SELECT isim FROM calisanlar;

-- Calisanlar tablosundan maası 5000 den buyuk olan isimleri listeleyiniz

SELECT isim,maas FROM calisanlar WHERE maas>5000;

-- Calisanlar tablosundan ismi Veli Han olan tüm verileri listeleyiniz

SELECT * FROM calisanlar WHERE isim='Veli Han';

-- Calisanlar tablosundan maası 5000 olan tüm verileri listeleyiniz

SELECT * FROM calisanlar WHERE maas=5000;

-- DML -- DELETE KOMUTU

DELETE FROM calisanlar; -- Eğer parent tablo başka bir child tablo ile iliskili ise önce child tablo silinmelidir
DELETE FROM adresler;
SELECT * FROM adresler;

--Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir = 'Antep';

CREATE TABLE ogrenciler7
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);

INSERT INTO ogrenciler7 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler7 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler7 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler7 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler7 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler7 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenciler7;

