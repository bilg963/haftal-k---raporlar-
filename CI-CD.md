
##CI/CD MANTIĞI

1.Modern yazılım geliştirme süreçlerinde hız, kalite ve süreklilik kritik öneme sahiptir. Geleneksel yöntemlerde yazılım parçalarının birleştirilmesi, test edilmesi ve canlıya alınması manuel yürütüldüğünde zaman kaybına ve yüksek hata oranlarına yol açmaktadır. Bu sorunların önüne geçmek amacıyla DevOps kültürünün temel taşlarından biri olan CI/CD (Continuous Integration / Continuous Deployment) yaklaşımı benimsenmiştir. CI/CD, kaynak kodun yazılmasından son kullanıcıya ulaştırılmasına kadar olan tüm adımların otomatikleştirilmiş bir iş hattı (pipeline) üzerinden güvenle yönetilmesini sağlar.

2. Continuous Integration (Sürekli Entegrasyon)

Continuous Integration (CI), bir projede çalışan geliştiricilerin yaptıkları kod değişikliklerini sık aralıklarla (çoğunlukla günde birden fazla kez) ana kod deposuna (main/master branch) entegre etmesi prensibine dayanır.

Geleneksel yaklaşımlarda geliştiriciler kendi dallarında (branch) uzun süre çalışır ve kodları birleştirme aşamasında büyük çakışmalar (merge conflict) ve uyumsuzluklar yaşanırdı. CI yaklaşımında ise geliştirici kodunu depoya gönderdiği (push/pull request) anda otomatik bir süreç tetiklenir:

Kodun en güncel versiyonu merkezi sunucuya çekilir.
Bağımlılıklar yüklenir ve proje derlenir (Build).
Yazılmış olan birim (unit) testler ve statik kod analizleri otomatik olarak çalıştırılır.

Bu sayede kod tabanındaki herhangi bir kırılma veya mantık hatası dakikalar içinde tespit edilir. Geliştiriciye anında geri bildirim verilerek hatanın kaynağı henüz kod hafızalarda tazeyken çözülür.

3. Build – Test – Deploy Pipeline (İş Hattı) Aşamaları

CI/CD süreçleri, birbirini takip eden ve önceden tanımlanmış adımlardan oluşan "Pipeline" (boru hattı / iş hattı) mantığıyla çalışır. Bu hattın temel aşamaları şu şekildedir:

Build (Derleme) Aşaması

Pipeline'ın ilk adımıdır. Geliştiriciden gelen kaynak kod, hedef platforma uygun şekilde derlenir. Gerekli kütüphaneler indirilir, varlıklar (assets) optimize edilir ve çalıştırılabilir paketler ya da konteyner imajları (Docker vb.) üretilir. Eğer derleme aşamasında sözdizimi veya bağımlılık hatası varsa pipeline derhal durdurulur ve sonraki adımlara geçilmez.

Test (Test Etme) Aşaması

Build aşamasını başarıyla geçen kod, kapsamlı bir test süzgecinden geçirilir. Bu aşamada birim testleri (unit tests), servislerin birbiriyle uyumunu denetleyen entegrasyon testleri (integration tests) ve güvenlik zafiyeti taramaları çalıştırılır. Testlerden herhangi biri başarısız olduğunda süreç kesilir ve hata raporu ekibe iletilir. Bu aşama, hatalı veya eksik kodun bir sonraki ortama sızmasını engeller.

Deploy (Dağıtım) Aşaması

Tüm derleme ve test aşamalarını başarıyla tamamlayan yazılım paketi, hedef ortamlara (test, kabul veya üretim ortamı) otomatik olarak yüklenir. Dağıtım aşaması; sunucuların güncellenmesini, veritabanı şema geçişlerini (migration) ve servislerin yeniden başlatılmasını içerir.

4. Continuous Deployment (Sürekli Dağıtım)

Continuous Deployment (CD), test aşamasını başarıyla geçen her değişikliğin hiçbir insan müdahalesi olmadan doğrudan canlı (production) ortama aktarılması sürecidir.

Bu kavram sıklıkla Continuous Delivery ile karıştırılır:

Continuous Delivery (Sürekli Teslimat): Kod her an canlıya çıkabilecek kalitede ve hazır durumdadır; ancak canlıya geçiş adımı bir yöneticinin veya yetkilinin onay butonuna basmasıyla manuel olarak tamamlanır.
Continuous Deployment (Sürekli Dağıtım): Manuel onay adımı tamamen ortadan kaldırılmıştır. Testleri geçen her commit, doğrudan son kullanıcıya ulaşır.

Continuous Deployment seviyesine ulaşabilmek için test otomasyonunun son derece olgun, kapsamlı ve güvenilir olması gerekir. Ayrıca olası bir aksilik durumunda sistemin otomatik olarak bir önceki kararlı sürüme dönmesini sağlayan geri alma (rollback) mekanizmaları kurulu olmalıdır.

5. CI/CD Mantığının Sağladığı Kazanımlar
Hızlı Geri Bildirim Döngüsü: Hatalar tespit edilene kadar haftalar geçmez; geliştirici yaptığı hatayı dakikalar içinde görür ve düzeltir.
İnsan Hatasının Azalması: Manuel dosya kopyalama, sunucuya bağlanma ve yapılandırma adımları otomatikleştirildiği için operasyonel riskler ortadan kalkar.
Pazara Çıkış Süresinin (Time-to-Market) Kısalması: Yeni özellikler ve hata düzeltmeleri kullanıcılara çok daha kısa aralıklarla ve güvenle sunulur.
Yüksek Kod Kalitesi: Pipeline üzerindeki zorunlu test ve analiz kontrolleri sayesinde teknik borç birikmez, yazılım kalitesi standart bir seviyede tutulur.