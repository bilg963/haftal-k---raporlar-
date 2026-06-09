##YAZILIM MİMARİSİ TEMELLERİ 

#Monolitik Mimari (Monolith)
 Monolitik mimaride uygulamanın tüm bileşenleri (arayüz, iş mantığı, veri tabanı erişimi vb.) tek bir kod tabanında (codebase) birleşik ve bağımlı bir şekilde geliştirilir, derlenir ve yayına alınır (deploy edilir).

 Avantajları;
 #Basitlik: Geliştirmesi, test edilmesi ve yayına alınması başlangıçta oldukça kolaydır.
 #Hızlı Başlangıç: Projenin erken aşamalarında hız kazandırır.
 #Performans: Bileşenler arası iletişim doğrudan bellek içi (in-memory) çağrılarla yapıldığı için ağ gecikmesi (network latency) yaşanmaz.

 Dezavantajları:
 #Ölçekleme Zorluğu: Uygulamanın sadece bir modülünde yoğunluk olduğunda tüm uygulamanın ölçeklenmesi gerekir.
 #Tek Teknolojik Bağımlılık: Tüm projede tek bir teknoloji yığını (stack) kullanma zorunluluğu vardır.
 #Hata Yayılımı (Single Point of Failure): Kodun bir yerinde oluşan kritik bir hata tüm uygulamanın çökmesine neden olabilir.


#Mikroservis Mimari (Microservice)
 Mikroservis mimarisinde uygulama, birbirleriyle hafif protokoller (HTTP REST, gRPC, Message Broker vb.) üzerinden haberleşen, bağımsız çalışan ve her biri tek bir işten sorumlu küçük servislerin bir araya gelmesiyle oluşur.

Avantajları;
 #Bağımsız Yayına Alım (Independent Deployment): Bir servisi güncellemek diğer servisleri etkilemez veya kesintiye uğratmaz.
 #Teknoloji Çeşitliliği: Her servis kendi gereksinimine en uygun dil ve veritabanı ile yazılabilir.
 #Hata İzolasyonu: Bir servisin çökmesi genellikle diğer servislerin çalışmasını tamamen durdurmaz.
 #Ölçeklenebilirlik: Sadece yoğun trafik alan servisler bağımsız olarak ölçeklenebilir.

Dezavantajları:
 #Karmaşıklık: Dağıtık sistemlerin yönetimi, izlenmesi (monitoring) ve hata ayıklaması (debugging) zordur.
 #Veri Tutarlılığı (Data Consistency): Dağıtık veritabanlarında "Eventual Consistency" (nihai tutarlılık) yönetimi zordur.
 #Ağ Gecikmesi: Servisler arası ağ üzerinden yapılan haberleşmeler ek gecikme yaratır.

#Mimari Desenler
 Kullanıcı arayüzü (UI) barındıran uygulamalarda kodun okunabilirliğini artırmak, test edilebilirliği kolaylaştırmak ve sorumlulukları ayrıştırmak (Separation of Concerns) için çeşitli mimari desenler kullanılır.

 #MVC (Model-View-Controller)
 Geleneksel web uygulamalarında ve birçok masaüstü/mobil framework'te standart kabul edilen desendir.

 #Model: Uygulamanın veri yapısını ve iş mantığını (business logic) temsil eder. Veritabanı işlemlerini yönetir.
 #View: Kullanıcının gördüğü ekranı ve arayüzü temsil eder. Model'deki verileri görselleştirir.
 #Controller: View ile Model arasında köprü görevi görür. Kullanıcıdan gelen girdileri (input/request) alır, işler, Model'i günceller ve uygun View'ı seçerek kullanıcıya döner.

 #MVVM (Model-View-ViewModel)
 Özellikle modern tek sayfalı web uygulamalarında (SPA - Vue, Angular, React) ve mobil platformlarda (iOS Swift/SwiftUI, Android Kotlin/Jetpack Compose) yaygın olarak kullanılır.

 #Model: Veri kaynaklarını, API çağrılarını ve temel iş mantığını barındırır.
 #View: Kullanıcı arayüzüdür. Kullanıcı etkileşimlerini doğrudan ViewModel'e iletir.
 #ViewModel: View'ın durumunu (state) tutan ve View için veriyi hazırlayan katmandır. En önemli özelliği, View ile ViewModel arasında kurulan "Data Binding" (Veri Bağlama) mekanizmasıdır. Bu sayede ViewModel'deki bir veri değiştiğinde View otomatik olarak güncellenir; View üzerindeki bir girdi değiştiğinde ise ViewModel'deki veri otomatik güncellenir. View, Model'den tamamen habersizdir. 


 #State Management (Durum Yönetimi) Nedir?
 State management, bir uygulamanın “durumunun (state)” nasıl saklandığını, güncellendiğini ve farklı bileşenler arasında nasıl paylaşıldığını yöneten yapıdır.

 #State (Durum) Nedir?
 State, uygulamanın o anki verisini ifade eder. Örneğin:
-Kullanıcı bilgileri
-Sepetteki ürünler
-Form verileri
-API’den gelen veriler

 #State Management Neden Gereklidir?
Küçük uygulamalarda state yönetimi basit olabilir ancak uygulama büyüdükçe:
-Veri karmaşası oluşur
-Aynı veri farklı yerlerde tutarsız hale gelebilir
-Veri akışı zorlaşır

 #Katmanlı Mimari (Layered Architecture)
 Katmanlı mimari, yazılımın farklı sorumluluklara sahip katmanlara ayrılmasıdır.

 -Controller → Service → Repository

 #Controller Katmanı
-Kullanıcıdan gelen isteği karşılar
-İş mantığı içermez
-Service katmanına yönlendirir

 #Service Katmanı
-İş mantığını içerir
-Repository ile veri alışverişi yapar

 #Repository Katmanı
-Veritabanı işlemlerini yönetir
-CRUD işlemleri yapar

 #Avantajlar
 -Daha düzenli kod
 -Kolay bakım
 -Test edilebilirlik
 -Ölçeklenebilirlik

 #Sonuç
 State management veri akışını, katmanlı mimari ise sistem yapısını düzenler.
