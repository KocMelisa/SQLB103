--create database melisa


--create database koc


create table ogrenciler2
(

	ogrenci_no char(7),
	isim varchar(50),
	soyisim varchar(25),
	not_ort real,
	kayit_tarihi date
);

--varolan tablodan tablo olusturmak

create table ogrenci_notlari 
as 
select isim, soyisim, not_ort from ogrenciler2;

insert into ogrenciler2 values ('1234567', 'Said', 'ILHAN', 85.5 , '2022-12-11');
insert into ogrenciler2 values ('1234567', 'Said', 'ILHAN', 85.5 , now());

--parcali veri eklemek icin

insert into ogrenciler2 (isim,soyisim) values ('erol','evren');

--dql data query language
-- select

select * from ogrenciler2; -- yildiz hersey anlamindadir




