#API NEDİR ?
API (Application Programming Interface - Uygulama Geliştirme Arayüzü), iki farklı yazılım veya sistemin birbiriyle iletişim kurmasını,
 veri alışverişi yapmasını sağlayan kurallar ve protokoller bütünüdür. Bir yazılımın yeteneklerini, diğer bir yazılıma güvenli ve standart bir şekilde açmasını sağlar.

##NEDEN VAR ?
Modülerlik ve Hız: Geliştiricilerin tekerleği yeniden icat etmesine gerek kalmaz. Örneğin; bir e-ticaret sitesi kurarken kendi harita veya ödeme sisteminizi sıfırdan yazmak yerine Google Maps API veya Stripe/Iyzico API kullanarak bu özellikleri projenize dakikalar içinde ekleyebilirsiniz.
Bağımsızlık: Farklı dillerde yazılmış sistemlerin (örneğin backend'i Java ile, mobil uygulaması Swift ile yazılmış bir sistemin) ortak bir dilde anlaşmasını sağlar.
Güvenlik: Kullanıcılar veya diğer uygulamalar, veritabanına doğrudan erişemezler; sadece API'nin izin verdiği uç noktalardan (endpoint) kısıtlı ve güvenli bir şekilde veri alabilir veya gönderebilirler.

#HTTP METODLARI: GET – POST – PUT – DELETE
Bu dört temel metod, RESTful API mimarisinde veritabanı üzerindeki temel CRUD (Create, Read, Update, Delete) işlemlerinin web ortamındaki karşılıklarıdır:

GET (Okuma/Read): Sunucudan veri çekmek veya okumak için kullanılır. Sunucudaki veriyi değiştirmez (Güvenli metoddur).
Örnek: Bir alışveriş sitesindeki ürünleri listelemek veya spesifik bir kullanıcının profil bilgilerini görüntülemek.

POST (Oluşturma/Create): Sunucuya yeni bir veri göndermek ve yeni bir kaynak oluşturmak için kullanılır.
Örnek: Sisteme yeni bir kullanıcı kayıt olduğunda veya sepete yeni bir ürün eklendiğinde.

PUT (Güncelleme/Update): Sunucuda var olan bir veriyi tamamen güncellemek veya değiştirmek için kullanılır.
Örnek: Kullanıcının profil bilgilerini (ad, soyad, şifre) güncellemesi.

DELETE (Silme/Delete): Sunucuda var olan bir veriyi silmek için kullanılır.
Örnek: Bir fotoğrafı veya hesabı kalıcı olarak sistemden kaldırmak.

#JSON YAPISI (JavaScript Object Notation)
JSON, sistemler arası veri taşımak için kullanılan en popüler, hafif ve bağımsız veri formatıdır. İnsanlar tarafından kolayca okunup yazılabilirken, makineler (yazılımlar) tarafından da çok hızlı bir şekilde çözümlenip (parse) işlenebilir.

Veriler Anahtar-Değer (Key-Value) çiftleri halinde tutulur.

#BASİT BİR ENDPOİNT NASIL TASARLANIR ?
Endpoint (Uç Nokta), bir API'nin erişilebildiği, belirli bir işlevi yerine getiren URL adresidir (Örn: https://api.uygulama.com/kullanicilar).

Basit ve standartlara uygun bir endpoint tasarlarken şu kurallara dikkat edilmelidir:

İsimlendirme Kuralları (İsim Kullanımı, Fiil Değil): Endpoint isimleri yapılan eylemi değil, kaynağı (resource) belirtmelidir. Eylemi belirleyen şey HTTP metodları olmalıdır.

Yanlış: /kullaniciGetir veya /kullaniciSil
Doğru: /kullanicilar (Veriyi çekmek için GET, silmek için DELETE metodu ile çağrılır).
Spesifik Bir Kaynağa Ulaşmak (Path Variables): Tekil verilere ulaşmak için benzersiz kimlikler (ID) url içine gömülmelidir.

Belirli bir kullanıcıyı getirmek: GET /kullanicilar/123
Belirli bir kullanıcının siparişleri: GET /kullanicilar/123/siparisler
Filtreleme ve Arama (Query Parameters): Geniş veri setlerinde arama veya sayfalama yapmak için URL sonuna ? ile parametreler eklenir.

Örnek: GET /kullanicilar?sehir=istanbul&yas=25
Anlamlı Durum Kodları (HTTP Status Codes) Döndürmek: Sunucu, gelen isteğe sadece veri ile değil, standart bir durum kodu ile de cevap vermelidir:

200 OK: İşlem başarılı.
201 Created: Veri başarıyla oluşturuldu (Genelde POST işleminden sonra).
400 Bad Request: Gönderilen veri hatalı veya eksik.
404 Not Found: İstenilen kaynak/veri bulunamadı.
500 Internal Server Error: Sunucu tarafında sistemsel bir hata oluştu.