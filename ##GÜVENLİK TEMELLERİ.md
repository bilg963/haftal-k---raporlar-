##GÜVENLİK TEMELLERİ 

#Authentication (Kimlik Doğrulama) 

Temel Soru: "Sen kimsin?" (Who are you?) sorusuna yanıt arar.
Süreç: Kullanıcının iddia ettiği kişi olup olmadığının (e-posta/şifre, biyometri, SMS kodu vb. aracılığıyla) sistem tarafından doğrulanması adımıdır.
Zamanlama: Güvenlik zincirinin ilk halkasıdır, yani sisteme ilk giriş yaparken (login) bir kez gerçekleşir.
Örnekler:
-Kullanıcı adı ve şifre girerek giriş yapmak.
-Telefonda FaceID veya parmak izi okutmak.
-İki aşamalı doğrulama (2FA) kodu girmek.

#Authorization (Yetkilendirme)

Temel Soru: "Ne yapmaya yetkin var?" (What can you do?) sorusuna yanıt arar.
Süreç: Kimliği zaten doğrulanmış olan bir kullanıcının, sistemdeki hangi kaynaklara, dosyalara veya sayfalara erişebileceğinin sınırlarının çizilmesidir.
Zamanlama: Kimlik doğrulandıktan sonra, kullanıcının uygulama içinde yaptığı her işlemde (sayfa değiştirme, silme, düzenleme vb.) arka planda sürekli kontrol edilir.
Örnekler:
-Standart bir kullanıcının yönetim (admin) paneline girmesinin engellenmesi.
-Bir kullanıcının sadece kendi oluşturduğu dosyaları veya profil bilgilerini düzenleyebilmesi.

#JWT (JSON Web Token) Nedir ve Nasıl Çalışır?

JWT, iki taraf arasında güvenli bir şekilde JSON formatında veri taşımayı sağlayan, şifrelenmiş bir veri standardıdır. En büyük özelliği "State-less" (Durumsuz) çalışmasıdır. Yani sunucu her gelen istekte veritabanına bakmak yerine, gelen token'ın imzasını kontrol ederek geçerliliğini anında anlar.

JWT Yapısı 3 bölümden oluşur;

1-Header (Başlık): Token'ın hangi şifreleme algoritması (örn: HMAC SHA256) ve hangi türde (JWT) yazıldığını belirtir.
2-Payload (Veri/Yük): Token içinde taşınan kullanıcı bilgileridir (kullanıcı ID'si, rolü, adı vb.). Bu kısım şifreli değildir, sadece kodlanmıştır (Base64). Bu yüzden buraya şifre gibi hassas bilgiler yazılmamalıdır.
3-Signature (İmza): Header ve Payload kısımlarının birleştirilip, sadece sunucunun bildiği gizli bir anahtar (Secret Key) ile şifrelenmesiyle oluşur. Token'ın yolda değiştirilip değiştirilmediğini (güvenliğini) doğrular.

JWT Çalışma Akışı;
Adım 1: Kullanıcı kullanıcı adı ve şifresiyle sisteme giriş isteği atar.
Adım 2: Sunucu bilgileri doğrular, gizli anahtarı ile imzalayarak bir JWT oluşturur ve istemciye (tarayıcıya/mobile) gönderir.
Adım 3: İstemci, sonraki her istekte bu token'ı isteğin başlığına (Authorization Header - Bearer) koyarak sunucuya gönderir.
Adım 4: Sunucu veritabanına sormadan, kendi gizli anahtarıyla imzanın doğruluğunu kontrol eder. İmza geçerliyse isteği onaylar ve veriyi döner. 

#OAuth (Open Authorization) Nedir ve Nasıl Çalışır?
OAuth, kullanıcının şifresini üçüncü taraf uygulamalarla paylaşmadan, o uygulamalara kendi verilerine erişim izni vermesini sağlayan bir yetkilendirme protokolüdür.

OAuth bir kimlik doğrulama yöntemi değildir. Sadece yetki devretme (delegation) aracıdır. Örneğin bir uygulamaya üye olurken "Google ile Giriş Yap" dediğinizde, o uygulamaya Google şifrenizi vermezsiniz. Google'a "Bu uygulamanın benim e-postama erişmesine izin veriyorum" yetkisi verirsiniz.

OAuth Çalışma Akışı (Örnek: Google ile Giriş);
Adım 1: Kullanıcı, üçüncü parti uygulamadaki "Google ile Giriş Yap" butonuna basar.
Adım 2: Uygulama, kullanıcıyı Google'ın resmi giriş sayfasına yönlendirir.
Adım 3: Kullanıcı Google hesabıyla giriş yapar ve uygulamanın istediği izinleri onaylar.
Adım 4: Google, onay sonrası uygulamaya geçici bir "Yetkilendirme Kodu" (Auth Code) gönderir.
Adım 5: Uygulama, bu geçici kodu ve kendi gizli kimliğini Google'a göndererek kalıcı bir "Access Token" (Erişim Anahtarı) talep eder.
Adım 6: Google doğrulamayı yapar ve uygulamaya Access Token'ı teslim eder.
Adım 7: Giriş başarılı olur. Uygulama artık bu token'ı kullanarak kullanıcının Google'daki izin verilen bilgilerine erişebilir.

#SQL Injection (SQL Enjeksiyonu) Nedir? 
SQL Injection, veritabanı kullanan web uygulamalarında kullanıcı girdilerinin (arama kutuları, giriş panelleri vb.) yeterince filtrelenmemesi sonucu ortaya çıkar. Saldırganlar, bu giriş alanlarına standart veriler girmek yerine özel SQL komutları yazarlar.

Nasıl Çalışır?
Örneğin; bir kullanıcının ID'sine göre veri çeken bir sorgu yerine, giriş alanına 1 OR 1=1 gibi bir ifade yazılarak tüm veritabanı tablosu manipüle edilebilir.Sonuçları: Kullanıcı şifreleri, kredi kartı bilgileri gibi hassas veriler çalınabilir, veritabanındaki kayıtlar silinebilir veya yetkisiz yönetici girişleri yapılabilir.


#XSS (Cross-Site Scripting - Siteler Arası Betik Çalıştırma)
XSS, saldırganın güvenilir bir web sitesine zararlı istemci taraflı kodlar (genellikle JavaScript) yerleştirmesi ve bu kodların siteyi ziyaret eden diğer kullanıcıların tarayıcılarında çalıştırılması zafiyetidir. XSS ile saldırganlar kullanıcıların oturum bilgilerini (çerezlerini/cookies) çalabilir.

XSS Türleri:
Stored (Kalıcı) XSS: Zararlı kod veritabanına kaydedilir. Sayfayı veya o veriyi görüntüleyen her kullanıcının tarayıcısında bu kod otomatik çalışır (Örn: Bir blog sitesinin yorum kısmına yazılan script kodları).
Reflected (Geçici) XSS: Kod veritabanına kaydedilmez. Genellikle e-posta veya mesaj yoluyla gönderilen özel bir linke (URL) gömülür. Linke tıklayan kullanıcının tarayıcısında anlık çalışır.
DOM-based XSS: Tamamen kullanıcının tarayıcısındaki (istemci tarafındaki) JavaScript kodlarındaki hatalardan kaynaklanır.
Örnek XSS Saldırı Kodu:
Saldırgan bir yorum kutusuna filtreleme yapılmadığını fark edip şunu yazar:

Bu yorum siteye kaydedildiğinde, sayfayı açan tüm normal üyelerin tarayıcıları bu kodu çalıştırır ve oturum çerezlerini (cookie) saldırgana gönderir.

XSS'ten Korunma Yolları:
Output Encoding (Kaçış Karakterleri): Kullanıcıdan gelen veriler ekrana yazdırılmadan önce tehlikeli karakterler dönüştürülür. Örneğin, < karakteri < koduna çevrilerek tarayıcının bunu kod olarak çalıştırması engellenir, düz yazı olarak gösterilmesi sağlanır.
Input Sanitization (Girdi Temizleme): Kullanıcıdan gelen girdiler taranır ve içindeki script, iframe gibi tehlikeli HTML etiketleri temizlenir.
Content Security Policy (CSP): Sunucunun tarayıcıya "Sadece benim belirlediğim güvenli kaynaklardan gelen JavaScript kodlarını çalıştır" talimatı vermesini sağlayan bir güvenlik filtresidir.