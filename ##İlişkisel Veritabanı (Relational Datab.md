##İlişkisel Veritabanı (Relational Database) Nedir?

İlişkisel Veritabanı, verilerin satırlar ve sütunlardan oluşan tablolar (tables) halinde düzenlendiği ve bu tabloların birbirleriyle belirli mantıksal ilişkiler (relations) üzerinden bağlandığı bir veritabanı modelidir.
 1970 yılında Edgar F. Codd tarafından tanımlanmıştır.

Temel Özellikleri:
Tablosal Yapı: Veriler, Excel sayfalarına benzer şekilde iki boyutlu tablolarda saklanır.
Veri Tutarlılığı (ACID): İşlemlerin (transactions) güvenli bir şekilde yapılmasını garanti eder (Atomicity, Consistency, Isolation, Durability).
Esneklik ve Güvenilirlik: SQL standardı sayesinde veriye erişim ve sorgulama standartlaştırılmıştır.
Popüler Sistemler: PostgreSQL, MySQL, Microsoft SQL Server, Oracle ve SQLite en yaygın İlişkisel Veritabanı Yönetim Sistemleridir (RDBMS).

##Birincil Anahtar (Primary Key) ve Yabancı Anahtar (Foreign Key)
Tablolar arasındaki ilişkileri kurmak ve veri bütünlüğünü korumak için anahtarlar (keys) kullanılır.

A. Birincil Anahtar (Primary Key - PK)
Bir tablodaki her bir satırı (kaydı) benzersiz bir şekilde tanımlayan sütun veya sütunlar grubudur.

Benzersizdir (Unique): Aynı değer tabloda birden fazla satırda bulunamaz.
Boş Bırakılamaz (NOT NULL): Her satır mutlaka geçerli bir birincil anahtara sahip olmalıdır.
Örnek: Bir Kullanıcılar tablosunda her kullanıcıya atanan benzersiz kullanici_id sütunu.

B. Yabancı Anahtar (Foreign Key - FK)
Bir tablodaki verilerin, başka bir tablonun birincil anahtarı ile ilişkilendirilmesini sağlayan sütundur. İlişkisel veritabanlarının "ilişki" kısmını bu anahtar oluşturur.

Veri Bütünlüğü (Referential Integrity): Yabancı anahtarın gösterdiği değer, hedef tablonun birincil anahtar sütununda mutlaka mevcut olmalıdır.
Örnek: Bir Siparisler tablosundaki kullanici_id sütunu. Bu sütun, siparişi hangi kullanıcının verdiğini bulmak için Kullanıcılar tablosundaki kullanici_id (PK) sütununu referans alır.

##Temel SQL Sorguları: SELECT, JOIN, GROUP BY
Veritabanından bilgi çekmek ve bu bilgileri analiz etmek için SQL komutları kullanılır.

A. SELECT (Veri Seçme)
Veritabanındaki tablolardan belirli verileri okumak/getirmek için kullanılır.

B. JOIN (Tabloları Birleştirme)
Aralarında ilişki bulunan iki veya daha fazla tabloyu, ortak sütunları üzerinden birleştirerek tek bir sonuç kümesi elde etmeyi sağlar.

INNER JOIN: Her iki tabloda da eşleşen satırları getirir.
LEFT JOIN (veya LEFT OUTER JOIN): Sol tablodaki tüm satırları ve sağ tabloda eşleşen satırları getirir. Sağ tabloda eşleşme yoksa NULL döner.

C. GROUP BY (Gruplama)
Verileri belirli bir sütuna göre gruplamak ve bu gruplar üzerinde matematiksel hesaplamalar (COUNT, SUM, AVG, MAX, MIN gibi toplama işlevleri) yapmak için kullanılır.

##İndeks (Index) Nedir ve Ne İşe Yarar?
İndeks (Index), veritabanı sorgularının hızını artırmak amacıyla, tablonun belirli sütunları üzerinde oluşturulan özel veri yapılarıdır (genellikle B-Tree veya Hash yapısı).
