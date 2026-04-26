    KERNEL (ÇEKİRDEK) NEDİR?
İşletim sisteminin en iç katmanında yer alan ve donanım ile kullanıcı uygulamaları arasındaki iletişimi sağlayan temel yazılımdır.
Temel Görevleri:
    Donanım Soyutlama: Uygulamaların donanımı karmaşık komutlar yerine standart API'ler üzerinden kullanmasını sağlar.
    Kaynak Yönetimi:  İşlemci, bellek ve giriş/çıkış (I/O) cihazlarının paylaşımını denetler.
    Güvenlik:  Uygulamaların birbirine veya sisteme zarar vermesini engellemek için "Kernel Mode" ve "User Mode" ayrımı yapar.
    
    SÜREÇ(PROCESS)-İŞ PARÇACIĞI (THREAD) FARKI NEDİR?
SÜREÇ: işletim sistemi tarafından yürütülen bir programın örneğidir (instance). Bir programı (örneğin Xcode veya Spotify) başlattığınızda, işletim sistemi ona özel bir bellek alanı ve kaynaklar ayırır.

    Bağımsızdır: Her sürecin kendi bellek alanı (adres alanı) vardır. Bir süreç, diğerinin belleğine doğrudan erişemez.
    Ağırdır: Bir süreci başlatmak veya sonlandırmak, işletim sistemi için daha fazla kaynak ve zaman maliyeti yaratır.
     İzole edilmiştir: Bir süreç çökerse, genellikle diğer süreçleri etkilemez.

İŞ PARÇACIĞI: bir sürecin içindeki en küçük yürütme birimidir. Bir süreç (program), aynı anda birden fazla iş yapabilmek için kendi içinde "thread"ler oluşturur.

    Bağımlıdır: Bir sürecin içindeki tüm thread'ler, o sürece ait belleği ve kaynakları ortak kullanır.
     Hafiftir: Thread oluşturmak ve yönetmek, sürece göre çok daha hızlıdır.
    Paylaşımcıdır: Aynı süreçteki thread'ler birbirleriyle çok hızlı iletişim kurabilirler çünkü aynı veriye erişebilirler.

BELLEK YÖNETİMİ: bir bilgisayar programının çalışırken ihtiyacı olan veri depolama alanını (RAM) verimli bir şekilde kullanma sürecidir. Programın ihtiyaç duyduğu belleği tahsis etmesi (allocation), kullanması ve işi bittiğinde bu alanı geri vermesi (deallocation) aşamalarından oluşur.

   Bilgisayar belleği iki ana bölüme ayrılır:

Stack (Yığın):
Hızlıdır.
Yerel değişkenler (fonksiyon içindeki değişkenler) ve fonksiyon çağrıları burada tutulur.
Otomatiktir: Fonksiyon bittiğinde içindeki veriler anında silinir. "LIFO" (Last In First Out) prensibiyle çalışır.


Heap (Öbek):
Daha büyüktür ama daha yavaştır.
Programın çalışma anında (runtime) boyutunu bilmediğimiz veya uzun süre saklamak istediğimiz veriler (nesneler, sınıflar) burada tutulur.
Yönetim Gerektirir: verilerin ne zaman silineceğine karar verilmesi gerekir,burda bellek yönetimi devreye girer.
    
    BELLEK YÖNETİMİ YÖNTEMLERİ 
    
1. Manuel Bellek Yönetimi (Manual Memory Management)
Bu yöntemde, belleğin tahsis edilmesi (allocation) ve serbest bırakılması (deallocation) sorumluluğu tamamen yazılım geliştiricidedir. Genellikle düşük seviyeli dillerde (C, C++) tercih edilir.

İşleyiş: Geliştirici, ihtiyaç duyulan alanı malloc veya new gibi komutlarla ayırır; işi bittiğinde free veya delete ile iade eder.
Avantaj: Sistemin en düşük seviyesinde tam kontrol ve maksimum hız sağlar.
Zayıf Yön: Bellek sızıntıları (memory leaks) veya geçersiz bellek erişimi gibi insan kaynaklı hatalara son derece açıktır.
2. Otomatik Çöp Toplama (Garbage Collection - GC)
Yazılımın çalışma anında (runtime), arka planda bağımsız bir mekanizma olarak çalışan bir sistemdir. Java, C#, Python gibi modern diller tarafından kullanılır.

İşleyiş: Sistem, belirli aralıklarla belleği tarar. Artık hiçbir nesne veya değişken tarafından referans verilmeyen (ulaşılamayan) blokları tespit eder ve otomatik olarak temizler.
Avantaj: Yazılımcıyı bellek yönetimi yükünden kurtarır, güvenliği artırır.
Zayıf Yön: Temizlik işleminin ne zaman gerçekleşeceği kesin değildir; bu durum "pause" (duraksama) denilen kısa süreli performans kayıplarına yol açabilir.
3. Otomatik Referans Sayma (Automatic Reference Counting - ARC)
Bellek yönetimini derleme aşamasında (compile-time) planlayan bir yöntemdir. Özellikle Swift ve Objective-C dillerinde, Apple platformları için standart haline gelmiştir.

İşleyiş: Her nesne için bellekte bir "referans sayacı" tutulur. Nesneye her yeni bağlantı yapıldığında sayaç artar, bağlantı kesildiğinde azalır. Sayaç değeri sıfıra ulaştığı anda nesne bellekten derhal tahliye edilir.
Avantaj: Manuel yönetimin hızı ile otomatik sistemlerin güvenliğini birleştirir; GC gibi anlık duraksamalara neden olmaz.
Zayıf Yön: İki nesnenin birbirini sonsuz döngüde tutması (strong reference cycle) durumunda bellekten silinememesi gibi özel dikkat gerektiren senaryolar barındırır.

CPU ZAMANLAYICI: modern çoklu görev (multi-tasking) işletim sistemlerinde, sınırlı olan işlemci kaynağının, yürütülmeyi bekleyen süreçler (processes) ve iş parçacıkları (threads) arasında nasıl paylaştırılacağını belirleyen kritik bir yazılım bileşenidir.

Temel Fonksiyonlar ve Amaçlar
İşletim sisteminin performansını doğrudan etkileyen zamanlayıcıların temel hedefleri şunlardır:

İşlemci Verimliliği (Utilization): CPU'nun boş kalma süresini minimize ederek sistem kaynaklarını maksimum düzeyde kullanmak.
Adalet (Fairness): Her bir sürecin işlemciyi belirlenen politikalar çerçevesinde adil bir şekilde kullanmasını sağlamak.
Yanıt Süresi (Response Time): Özellikle etkileşimli uygulamalarda kullanıcının komutlarına verilen yanıt süresini en aza indirmek.
İş Bitirme Oranı (Throughput): Birim zaman içerisinde tamamlanan görev sayısını maksimize etmek.
Zamanlama Türleri ve Stratejiler
Zamanlayıcılar, yönetim biçimlerine göre iki temel sınıfa ayrılır:

Kesintisiz (Non-Preemptive): Bir süreç CPU'yu aldığında, işi bitene veya isteğe bağlı olarak CPU'yu serbest bırakana kadar çalışmaya devam eder.
Kesintili (Preemptive): İşletim sistemi, daha yüksek öncelikli bir süreç geldiğinde veya zaman aşımı durumunda mevcut süreci durdurup işlemciyi başka bir sürece devredebilir. Modern sistemlerin çoğunda bu yöntem uygulanır.
Yaygın Zamanlama Algoritmaları
Raporlarda sıkça atıfta bulunulan temel algoritmalar şunlardır:

First-Come, First-Served (FCFS): Süreçlerin geliş sırasına göre işlendiği en basit kuyruk yapısıdır.
Round Robin (RR): Her sürece eşit bir zaman dilimi (time slice) tanınarak döngüsel bir sırayla işlemci kullanımı sağlanır.
Shortest Job First (SJF): İşlem süresi en kısa olan göreve öncelik verilerek ortalama bekleme süresi düşürülür.
Öncelik Zamanlaması (Priority Scheduling): Görevlere atanan kritiklik derecelerine göre CPU tahsisi yapılır.
