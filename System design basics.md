

SİSTEM TASARIMI TEMELLERİ (System Design Basics)

##Scalability (Ölçeklenebilirlik)

Ölçeklenebilirlik, bir sistemin artan iş yüküne (gelen istek sayısı, eşzamanlı kullanıcı, veri miktarı vb.) performans kaybı yaşamadan veya kabul edilebilir sınırlar içinde kalarak uyum sağlayabilme yeteneğidir.

Ölçeklenebilirlik iki temel yöntemle gerçekleştirilir;

1-) Dikey Ölçekleme (Vertical Scaling / Scale Up)
Mevcut sunucunun donanım kapasitesini artırma yöntemidir. CPU çekirdek sayısını artırmak, RAM miktarını yükseltmek veya daha hızlı SSD/NVMe diskler takmak dikey ölçeklemeye örnektir.

Avantajları:
Mimari karmaşıklık yaratmaz; kod üzerinde veya ağ topolojisinde değişiklik gerektirmez.
Tek bir makine üzerinde çalıştığı için veri tutarlılığı ve oturum yönetimi (session management) kolaydır.

Dezavantajları ve Kısıtları:
Donanımsal bir üst sınır vardır; sınırsız büyüme mümkün değildir.
Maliyet eğrisi üst segment donanımlarda katlanarak artar.
Donanım arızalandığında sistemin tamamen çökmesine yol açan tek bir hata noktası (Single Point of Failure - SPOF) barındırır. Donanım yükseltmesi sırasında genellikle kesinti (downtime) gerektirir.

2-) Yatay Ölçekleme (Horizontal Scaling / Scale Out)
Mevcut sisteme aynı işi yapabilen yeni sunucular (node/instance) ekleyerek iş yükünü dağıtma yöntemidir.

Avantajları:
Teorik olarak sınır yoktur; ihtiyaç duyuldukça sisteme yüzlerce yeni makine eklenebilir.
Yüksek erişilebilirlik sağlar; makinelerden biri çökerse diğerleri trafiği karşılamaya devam eder.
Bulut sağlayıcıları (AWS, Azure vb.) ile otomatik ölçekleme (Auto-scaling) kullanılarak sadece talep anında yeni kaynak açılıp maliyet optimize edilebilir.

Dezavantajları ve Zorlukları:
Sunucular arası koordinasyon, ağ gecikmesi, dağıtık sistem tasarımı ve durumsuz (stateless) mimari gerektirir.
Önüne yük dağıtımı için bir Yük Dengeleyici (Load Balancer) koyulmasını zorunlu kılar.

##Load Balancer (Yük Dengeleyici) 

Yük dengeleyici, istemcilerden gelen ağ trafiğini arkasında çalışan birden fazla uygulama sunucusu arasında eşit veya belirlenen kurallara göre dağıtan ağ cihazı veya yazılımıdır.

Temel Fonksiyonları;

Trafik Dağıtımı: Gelen istekleri sunucu havuzundaki uygun makinelere ileterek hiçbir sunucunun aşırı yük altında ezilmemesini sağlar.

Sağlık Kontrolü (Health Checks): Arkasındaki sunucuları belirli aralıklarla ping atarak veya /health uç noktalarına istek atarak denetler. Yanıt vermeyen veya hata kodu döndüren sunucuları trafik akışından otomatik olarak çıkarır; sunucu iyileştiğinde tekrar havuza dahil eder.
Yüksek Erişilebilirlik ve Yedeklilik: Bakım yapılacak veya güncellenecek sunucuları trafik kesintisi olmadan kademeli olarak devre dışı bırakıp geri almayı mümkün kılar.
SSL Sonlandırma (SSL Offloading): HTTPS sertifika doğrulama ve şifre çözme işlemlerini uygulama sunucuları yerine kendi üzerinde yaparak arka plandaki sunucuların CPU yükünü hafifletir.
Yaygın Yük Dengeleme Algoritmaları
Round Robin: İstekleri sırayla her sunucuya birer birer gönderir (1. istek Sunucu A'ya, 2. istek Sunucu B'ye).
Least Connections: O anda en az aktif bağlantıya sahip olan sunucuya yeni isteği yönlendirir. İsteklerin tamamlanma süresi değişkenlik gösterdiğinde idealdir.
IP Hash: İstemcinin IP adresinden bir karma değer üreterek belirli bir istemcinin sürekli aynı sunucuya gitmesini sağlar (Sticky Session ihtiyacında kullanılır).
Weighted (Ağırlıklı) Dağıtım: Sunucuların donanım güçlerine göre ağırlık puanı verilerek daha güçlü sunuculara oransal olarak daha fazla istek gönderilmesini sağlar.
Katmanlarına Göre Yük Dengeleme
L4 (Transport Layer): IP ve Port seviyesinde (TCP/UDP) paket yönlendirmesi yapar. Paket içeriğine bakmadığı için son derece hızlıdır.
L7 (Application Layer): HTTP/HTTPS başlıkları, URL yolu, çerezler (cookies) gibi uygulama katmanı verilerini okuyarak akıllı yönlendirme yapar (Örn: /images isteklerini medya sunucularına, /api isteklerini servis sunucularına yönlendirmek).

##Cache (Önbellek) Mantığı
Neden İhtiyaç Duyulur?

Veri tabanlarına yapılan disk okuma işlemleri ve karmaşık SQL sorguları görece yavaştır. Cache mantığı, sık erişilen ve sık değişmeyen verilerin disk yerine geçici olarak çok daha hızlı olan RAM (bellek) üzerinde saklanmasıdır.

Temel Prensipler ve Avantajlar
Tepki Süresi: Bellekten okuma süresi mikrosaniyeler mertebesindeyken, disk veya ağ üzerinden okuma milisaniyeler sürer.
Veri Tabanı Yükünü Azaltma: Binlerce kullanıcının aynı ana sayfa verisini veya popüler ürün bilgilerini sorgulaması durumunda sorgular veri tabanına ulaşmadan önbellekten dönülür.

Önbellek Stratejileri;

Cache-Aside (Lazy Loading): Uygulama veriyi önce önbellekte arar (Cache Hit). Veri yoksa (Cache Miss), veri tabanından okur, önbelleğe yazar ve istemciye döner. En yaygın kullanılan stratejidir.
Write-Through: Veri yazılırken veya güncellenirken aynı anda hem önbelleğe hem de veri tabanına yazılır.
Write-Back (Write-Behind): Veri doğrudan önbelleğe hızlıca yazılır, veri tabanına ise belirli aralıklarla arka planda asenkron olarak kaydedilir. Çok hızlıdır fakat önbellek sunucusu çökerse veri kaybı riski taşır.

Karşılaşılan Zorluklar;
Cache Invalidation (Önbellek Temizleme): Veri tabanındaki veri güncellendiğinde önbellekteki eski verinin ne zaman ve nasıl geçersiz kılınacağı sistemin en kritik konusudur.
TTL (Time to Live): Verinin önbellekte ne kadar süreyle saklanacağını belirleyen yaşam süresi parametresidir.
Örnek Teknolojiler: Redis, Memcached.

##Queue (Kuyruk) Mantığı
Mantık ve Amaç

Kuyruklar, iş parçacıklarının veya görevlerin First-In, First-Out (FIFO - İlk Giren İlk Çıkar) prensibiyle sıraya dizildiği yapılardır. Temel amaç, sistem bileşenlerini birbirinden bağımsız hale getirmek (decoupling) ve uzun süren işlemleri asenkron (arka planda) yürütmektir.

Kullanım Senaryoları
Asenkron İşleme: Kullanıcı web sitesinden sipariş verdiğinde, sipariş kaydı hızlıca oluşturulur; ancak "PDF fatura üretme", "e-posta gönderme" veya "SMS bildirimi atma" gibi zaman alan işler bir kuyruğa fırlatılır. Kullanıcı bu işlemlerin bitmesini beklemez, anında onay ekranını görür.
Trafik Dalgalanmalarını Dengeleme (Buffering / Rate Limiting): Bir anda binlerce istek geldiğinde sunucunun anlık olarak çökmesini önlemek için istekler kuyrukta toplanır. Arka planda çalışan işçiler (worker/consumer), kendi kapasiteleri doğrultusunda kuyruktan işleri teker teker çekip işler.

##Message Broker Mantığı
Mantık ve Görev

Message Broker (Mesaj Dağıtıcısı), farklı yazılım servislerinin veya mikroservislerin birbirleriyle doğrudan konuşmak yerine, mesajlaşma aracılığıyla gevşek bağlı (loosely coupled) iletişim kurmasını sağlayan bir ara katmandır.

İletişim Modelleri;
Noktadan Noktaya (Point-to-Point / Queue): Mesaj kuyruğa atılır ve bu mesajı yalnızca tek bir tüketici (consumer) alır ve işler. Mesaj işlendikten sonra kuyruktan silinir.
Yayıncı-Abone (Publish/Subscribe - Pub/Sub): Bir yayıncı (publisher) belirli bir konuya (topic) bir mesaj bırakır. O konuyu dinleyen tüm aboneler (subscribers) aynı mesajın bir kopyasını alıp kendi mantıklarına göre işler.

#Queue ve Message Broker Farkı
Kuyruk (Queue) genellikle belirli görevlerin sırayla tek bir tüketici tarafından işlenmesine odaklanırken; Message Broker, mesaj yönlendirme (routing), filtreleme, birden fazla servise aynı olayı haber verme (fan-out/pub-sub) ve mesaj kalıcılığı gibi çok daha gelişmiş kuralları ve topolojileri yönetir.

Örnek Teknolojiler:
RabbitMQ: Gelişmiş yönlendirme kuralları (topic, direct, headers exchange) ve kesin teslimat garantileri sunan güçlü bir mesaj dağıtıcısıdır.
Apache Kafka: Çok yüksek hacimli verileri dağıtık bir günlük (distributed commit log) yapısında tutan, yüksek verimli bir akış (event streaming) platformudur.

#Birlikte Çalışma Mimarisi: Uçtan Uca Bir Örnek

Bu bileşenlerin büyük bir sistemde nasıl bir araya geldiğini e-ticaret örneği üzerinden adım adım inceleyelim:

Adım 1: Milyonlarca kullanıcı aynı anda sisteme giriş yapar. İlk olarak DNS istekleri ve gelen HTTP trafiği Load Balancer tarafından karşılanır.
Adım 2: Load Balancer, trafiği arkadaki 10 adet web uygulama sunucusuna eşit olarak paylaştırır. Sunuculardan biri çökerse sağlık kontrolü sayesinde istekler diğer 9 sunucuya kaydırılır.
Adım 3: Kullanıcılar ürün listesini incelerken sunucular veri tabanına gitmek yerine Cache (Redis) üzerindeki hazır veriyi sorgular. Bu sayede milisaniyeler içinde hızlı yanıt döner.
Adım 4: Kullanıcı "Satın Al" butonuna tıklar. Ödeme doğrulandıktan sonra sistem "Sipariş Tamamlandı" olayını bir Message Broker (RabbitMQ/Kafka) aracına iletir.
Adım 5: Message Broker bu olayı ilgili kuyruklara (Queue) yönlendirir:
Fatura servisi kuyruktan mesajı alıp PDF faturayı üretir.
Bildirim servisi kuyruktan mesajı alıp kullanıcıya SMS ve e-posta gönderir.
Stok takip servisi stok miktarını günceller.
Sonuç: Kullanıcı arayüzde beklemeden hızlıca sipariş özetini görürken, arka plan süreçleri sistem bileşenlerini tıkamadan güvenli ve ölçeklenebilir şekilde tamamlanır.