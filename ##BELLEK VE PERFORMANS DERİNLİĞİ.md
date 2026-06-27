##BELLEK VE PERFORMANS DERİNLİĞİ 

#STACK VE HEAP FARKI?
Stack (Yığın) ve Heap (Öbek), bilgisayar belleğinde (RAM) verilerin saklandığı, işleyiş ve performans açısından tamamen farklı amaçlara hizmet eden iki temel bölgedir.Kısaca özetlemek gerekirse; Stack hızlı, otomatik yönetilen ama sınırlı bir bellek bölgesiyken; Heap büyük, dinamik olarak tahsis edilen ama yönetimi daha yavaş ve karmaşık olan bellek bölgesidir.

#GARBAGE COLLECTİON (GC) NASIL ÇALIŞIR?
Garbage Collection (Çöp Toplayıcı), programın çalışması sırasında Heap bellekte oluşturulan ancak artık kullanılmayan (bağlantısı kopmuş) nesneleri otomatik olarak tespit edip temizleyen arka plan mekanizmasıdır. Java, .NET (C#), Go ve Python gibi modern dillerde bellek yönetimini otomatize eder.

1-Temel İşleyiş Algoritması: Mark and Sweep (İşaretle ve Süpür)

Çoğu modern GC motoru bu algoritmanın türevlerini kullanır:

Mark (İşaretleme): GC, "GC Roots" adı verilen kök noktalardan (aktif Stack değişkenleri, global/statik değişkenler, CPU register'ları) başlayarak bellekteki tüm nesneleri tarar. Erişilebilen her nesneyi "aktif" olarak işaretler.
Sweep (Süpürme): Bellek tamamen taranır. Üzerinde hiçbir işaret bulunmayan (yani kök değişkenlerden ulaşılamayan) tüm nesneler bellekten silinir ve alanları boşaltılır.
Compact (Sıkıştırma - Opsiyonel): Silinen nesnelerin ardından Heap üzerinde boşluklar (fragmantasyon) kalır. GC, belleği optimize etmek için kalan aktif nesneleri ardışık olarak yan yana kaydırır.

2-Performans Optimizasyonu: Generational GC (Kuşaksal Hipotez)

GC'nin tüm Heap alanını sürekli taraması çok büyük bir performans maliyetidir. Bu yüzden nesneler ömürlerine göre kuşaklara ayrılır (Weak Generational Hypothesis):
Generation 0 (Genç Kuşak): Yeni oluşturulan nesneler buraya gelir. Nesnelerin büyük kısmı çok kısa ömürlüdür (örn: bir fonksiyon içindeki geçici nesne). Bu yüzden Genç Kuşak çok sık ve çok hızlı taranır (Minor GC).
Generation 1 (Geçiş Kuşağı): Genç Kuşak temizliğinden sağ kurtulan nesneler buraya taşınır. Orta vadeli nesneleri barındırır.
Generation 2 (Yaşlı/Kalıcı Kuşak): Sürekli hayatta kalan statik veriler, büyük nesneler (Large Objects) veya uzun ömürlü servisler buraya aktarılır. Çok nadir taranır çünkü taranması tüm sistemi kısa süreliğine durdurabilir (Major GC / Full GC).

3-Performansa Etkisi (Stop-The-World)
GC çalışırken, nesnelerin bellekteki yerlerinin değişmesi riskine karşı uygulamanın ana iş parçacıkları anlık olarak durdurulur. Buna Stop-The-World (STW) denir. GC algoritmalarının kalitesi (örn: Go'nun low-latency GC'si veya Java'nın ZGC'si), bu duraklama sürelerini milisaniyelerin altına indirme başarısıyla ölçülür.

#MEMORY LEAK (BELLEK SIZINTISI) NEDİR,NASIL OLUŞUR?
Memory Leak, program tarafından Heap bellekte tahsis edilen alanların, artık ihtiyaç duyulmadığı halde sisteme geri iade edilememesi durumudur. Zamanla kullanılmayan bu gizli veriler RAM'i doldurur ve sistemin OutOfMemoryException hatasıyla çökmesine neden olur.

1-Memory Leak Nasıl Oluşur? (Temel Nedenler)
GC mimarisine sahip dillerde bile bellek sızıntısı yaşanabilir. Bunun temel sebebi, yazılımcının fark etmeden bir nesneye ait referansı (bağlantıyı) canlı tutmasıdır. GC, üzerinde aktif referans olan nesneye dokunamaz.

En yaygın sızıntı senaryoları şunlardır:
Kapatılmayan Kaynaklar (Unmanaged Resources): Veritabanı bağlantıları (Connections), dosya akışları (Streams) veya network socket'leri açıldıktan sonra close() veya dispose() edilmezse bellek sızıntısına yol açar.
Unutulan Event Abonelikleri (Event Handlers): Uzun ömürlü bir nesne (örn: bir ana pencere), kısa ömürlü bir nesnenin event'ine (olayına) abone olduğunda, kısa ömürlü nesne işi bitse bile bellekten silinemez. Çünkü ana nesne ona referansla bağlı kalır.
Statik (Static) Koleksiyonlar: static olarak tanımlanan bir List veya Map içerisine sürekli veri eklemek ve bu verileri hiç temizlememek. Statik yapılar uygulama kapanana kadar Heap'te yaşar.
Önbellekleme (Caching) Hataları: Bellekte saklanan veriler için bir geçerlilik süresi (TTL - Time to Live) belirlenmezse, cache sürekli büyüyerek RAM'i tüketir.

2-Performansa Etkileri ve Tespiti
Performans Kaybı: Bellek doldukça, işletim sistemi RAM yerine disk alanını (Swap/Sanal Bellek) kullanmaya başlar. Bu da uygulamanın inanılmaz derecede yavaşlamasına sebep olur. Ayrıca GC, belleği açmak için daha sık devreye girerek CPU'yu tüketir.
Tespit Araçları (Profilers): Memory leak tespiti için kod canlı ortamda izlenir. .NET Memory Profiler, JProfiler, VisualVM, Xcode Instruments veya Chrome DevTools (Memory Tab) gibi araçlarla bellek grafiğindeki sürekli artış (testere dişi grafiği yerine sürekli yukarı tırmanan grafik) incelenerek sızıntı yapan nesneler bulunur.