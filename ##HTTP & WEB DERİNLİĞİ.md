##HTTP & WEB DERİNLİĞİ

#HTTP REQUEST/RESPONSE YAPISI NEDİR?
istemci (tarayıcı) ile sunucu arasındaki istek (request), yanıt (response) ve başlıklar (headers) temel bileşenlerinden oluşan temel web iletişim kuralıdır.

HTTP Request (İstek) Yapısı;
İstemcinin (örneğin internet tarayıcısının) sunucuya gönderdiği talep mesajıdır.
-Start Line (Başlangıç Satırı): İşlemin türünü (GET, POST gibi metotları), istenen adresi (URL/Path) ve HTTP sürümünü gösterir.
-Headers (Başlıklar): Tarayıcı türü, dil ve kabul edilen veri biçimleri gibi ek bilgileri taşır.
-Body (Gövde): Sunucuya gönderilecek verileri (örneğin form doldururken yazılan yazıları) barındırır.

HTTP Response (Yanıt) Yapısı;
Sunucunun, gelen isteğe karşılık istemciye döndüğü cevap mesajıdır.
-Status Line (Durum Satırı): HTTP sürümünü ve işlemin sonucunu bildiren sayısal durum kodunu (örn. 200 OK, 404 Not Found) içerir.
-Headers (Başlıklar): Sunucu bilgisi, gönderilen verinin türü (Content-Type) gibi detayları verir.
-Body (Gövde): İstenen web sayfasının kodları (HTML, JSON vb.) veya dosyaları yer alır.

#STATUS CODE'LAR (200, 400, 401, 500…)
HTTP durum kodları (status codes), sunucunun gelen isteğe verdiği 3 haneli dijital yanıtlardır. Bu kodlar, tarayıcıya işlemin başarılı olup olmadığını veya nerede hata oluştuğunu söyler.

Kodlar ilk rakamlarına göre 5 ana gruba ayrılır:

-1xx: Bilgilendirme (Informational)İsteğin sunucuya ulaştığını ve işlemin devam ettiğini belirtir.
100 Continue: İşlemin ilk kısmının alındığını, devam edilebileceğini söyler.

-2xx: Başarı (Success)İsteğin sunucu tarafından başarıyla alındığını ve onaylandığını belirtir.
200 OK: İstek başarıyla tamamlandı. (En sık karşılaşılan kod)
201 Created: İstek başarılı oldu ve sunucuda yeni bir kaynak oluşturuldu (Örn: Yeni kayıt).
204 No Content: İşlem başarılı ama geri döndürülecek bir içerik yok.

-3xx: Yönlendirme (Redirection)İstenen kaynağın başka bir adrese taşındığını belirtir.
301 Moved Permanently: Sayfa kalıcı olarak yeni bir adrese taşındı.
302 Found: Sayfa geçici olarak başka bir adrese yönlendirildi.

-4xx: İstemci Hatası (Client Error)Hatanın tarayıcıdan veya kullanıcıdan kaynaklandığını belirtir.
400 Bad Request: İstek hatalı veya eksik (Örn: Yanlış yazılmış kod/form verisi).
401 Unauthorized: Bu sayfayı görmek için giriş yapmanız veya yetkiniz olması gerekiyor.
403 Forbidden: Giriş yapsanız bile bu kaynağa erişiminiz kesinlikle yasak.
404 Not Found: İstenen sayfa veya dosya sunucuda bulunamadı.

-5xx: Sunucu Hatası (Server Error)İstek doğru olsa bile sunucunun kendi içindeki bir sorundan dolayı yanıt veremediğini belirtir.
500 Internal Server Error: Sunucuda ne olduğu belirlenemeyen genel bir hata oluştu.
502 Bad Gateway: Sunucu, arkasındaki diğer sunucudan hatalı bir yanıt aldı.
503 Service Unavailable: Sunucu aşırı yoğun veya bakımda olduğu için şu an hizmet veremiyor.

#CORS NEDİR?

CORS (Cross-Origin Resource Sharing - Kökenler Arası Kaynak Paylaşımı), bir web uygulamasının, kendisininkinden farklı bir kökene (alan adı, protokol veya port) ait kaynaklara erişmesini denetleyen bir tarayıcı güvenlik mekanizmasıdır.

1. "Kök" (Origin) Nedir?
Bir web sitesinin kökeni üç bileşenden oluşur: Protokol, Domain (Alan Adı) ve Port. Bunlardan biri bile farklıysa, tarayıcı bunu "farklı bir köken" (cross-origin) olarak kabul eder.https://ornek.com ve https://ornek.com -> Aynı köken (Sadece yol değişti)http://ornek.com ve https://ornek.com -> Farklı köken (Protokol farklı)https://ornek.com ve https://ornek.com -> Farklı köken (Alt alan adı farklı)https://ornek.com:3000 ve https://ornek.com:8080 -> Farklı köken (Port farklı).

2.CORS Neden Var? (SOP Kuralı)
Tarayıcılar varsayılan olarak SOP (Same-Origin Policy - Aynı Köken Politikası) adı verilen katı bir güvenlik kuralına sahiptir. Bu kural, kötü niyetli bir sitenin, sizin adınıza başka bir sitenin verilerini (örneğin banka hesabınızdaki bilgileri) gizlice çekmesini engeller.

CORS, bu katı güvenliği bozmadan, güvenli web sitelerine istisnalar tanımak için geliştirilmiş bir esnetme sistemidir.

3. CORS Nasıl Çalışır?Siz tarayıcı üzerinden farklı bir kökendeki API'ye istek attığınızda süreç şöyle işler:Tarayıcı İstek Başlığını Ekler: Tarayıcı, isteğin içine Origin: https://siteniz.com başlığını koyar.
Sunucu Yanıt Verir: Sunucu bu isteği aldığında, kendi ayarlarında bu siteye izin verilip verilmediğine bakar. Eğer izin varsa, yanıta Access-Control-Allow-Origin: https://siteniz.com başlığını ekler.
Tarayıcı Kontrol Eder: Tarayıcı gelen yanıttaki bu başlığı görür. Eğer sizin sitenizin adı listede yoksa, istek sunucuya gitmiş ve yanıt dönmüş olsa bile tarayıcı bu veriyi JavaScript kodunuza teslim etmez ve konsolda meşhur "CORS Error" hatasını basar.

4. Ön Kontrol (Preflight) İstekleriEğer yaptığınız istek sunucudaki veriyi değiştirecek tehlikeli bir işlemse (örneğin POST, PUT, DELETE metotları veya özel başlıklar içeriyorsa), tarayıcı asıl istekten önce sunucuya OPTIONS metoduyla minik bir deneme isteği gönderir.
Soru: "Sana birazdan POST isteği atacağım, bu kökene ve metoda iznin var mı?
"Cevap: "Evet, var." (Sunucu onay verirse asıl istek gönderilir).