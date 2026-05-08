#DOSYA SİSTEMLERİ VE DEPOLAMA MANTIĞI 

1-NTFS,ext4,APPS FARKI NEDİR?

#NTFS (NEW TECHNOLOGY FİLE SYSTEM): Windows işletim sistemlerinin varsayılan dosya sistemidir.
Dosya şifreleme, erişim izinleri (güvenlik) ve sistem çökmelerine karşı veri kurtarmayı kolaylaştıran "günlükleme" (journaling) gibi gelişmiş özelliklere sahiptir.
 Büyük boyutlu dosyalar ve geniş kapasiteli diskler için tasarlanmıştır.

ext4 (FOURTH EXTENDED FİLE SYSTEM) : Linux işletim sistemlerinin en yaygın kullanılan dosya sistemidir. 
Yüksek performanslı, güvenilir ve esnektir.
 O da günlükleme özelliği sunar ve dosya parçalanmasını (fragmentation) minimum düzeyde tutarak sistemin zamanla yavaşlamasını engeller.

 APFS (APPLE FİLE SYSTEM): Apple'ın macOS, iOS ve iPadOS cihazları için özel olarak geliştirdiği modern dosya sistemidir. 
 Diğerlerinden en büyük farkı, özellikle SSD'ler (flaş bellekler) için optimize edilmiş olmasıdır.
 Dosyaları anında kopyalama (cloning), hızlı alan hesaplama ve çok güçlü şifreleme özellikleri sunar.

 2-BLOK YAPISI NEDİR?

 Bilgisayarlar verileri depolarken diske "A harfini şuraya koy, B harfini buraya koy" şeklinde tek tek yazmazlar.
  Bunun yerine depolama alanını "Blok" (Block) veya "Küme" (Cluster) adı verilen, eşit ve sabit boyutlu (genellikle 4 KB boyutunda) küçük odacıklara bölerler.
 # Bir dosya kaydedileceğinde, boyutu ne olursa olsun bu bloklara yerleştirilir.
#Eğer dosyanız çok küçükse (örneğin 1 KB), o 4 KB'lık bloğun geri kalanı boş kalsa bile başka bir dosya o bloğa yazılamaz.
#Dosyanız büyükse (örneğin 10 KB), sistem bu dosyayı ardışık 3 bloğa (4 + 4 + 2) paylaştırır.
#Neden Blok Kullanılır? Depolama biriminin işlemcisi, verileri bit veya bayt düzeyinde aramak yerine bloklar halinde okuyup yazar. Bu, veriye erişimi inanılmaz derecede hızlandırır ve organize etmeyi kolaylaştırır.

3. HDD vs SSD ÇALIŞMA PRENSİPLERİ?

Bu iki donanım, aynı işi (veri depolama) tamamen farklı iki fiziksel prensiple yapar:
HDD (Hard Disk Drive - Mekanik Sabit Disk): Plak çalarlar gibi çalışır.
 İçerisinde üst üste dizilmiş, yüksek hızda (örn. 5400 veya 7200 RPM) dönen manyetik disk plakaları ve bu plakalar üzerinde gezinerek veriyi okuyup yazan mekanik bir "okuma/yazma kafası" bulunur.
  Bir veriye ulaşmak için o kafanın fiziksel olarak doğru noktaya gitmesi ve diskin dönerek veriyi kafanın altına getirmesi gerekir. Bu mekanik hareket, gecikmeye ve yavaşlığa sebep olur.

SSD (Solid State Drive - Katı Hal Sürücüsü): İçerisinde dönen veya hareket eden hiçbir parça yoktur (tıpkı büyük bir USB flash bellek gibi).
 Veriler, NAND flash bellek yongalarında (çiplerinde) elektronların hapsedilmesiyle saklanır. 
 Veriye erişmek istendiğinde okuma/yazma işlemi sadece elektrik sinyalleriyle gerçekleşir. 
 Hareketli bir parça olmadığı için verilere erişim süresi neredeyse anında (milisaniyeler seviyesinde) gerçekleşir.
