##LİNUX TEMELLERİ

#TERMİNAL KOMUTLARI 

ls: Mevcut dizindeki dosyaları ve klasörleri listeler.

cd:Dizinler arası geçiş yapmayı sağlar.
cd klasor_adi: Belirtilen klasöre gider.
cd ..: Bir üst dizine çıkar.
cd veya cd ~: Doğrudan ana dizine (home) döner.
cd -: Bir önceki bulunulan dizine geri döner.

grep:Dosyalar içinde belirli bir metni veya deseni arar.

mkdir:Yeni bir dizin (klasör) oluşturmak için kullanılır.

chmod:Dosya veya dizin izinlerini (okuma, yazma, çalıştırma) değiştirmek için kullanılır.

topSistemdeki aktif işlemleri (prosesleri), CPU ve bellek kullanımını gerçek zamanlı olarak görüntüler.

#PAKET YÖNETİMİ 

APT, DNF ve Pacman, Linux işletim sistemlerinde yazılımları (paketleri) yüklemek, güncellemek ve kaldırmak için kullanılan paket yöneticileridir. 
Windows'taki "Program Ekle/Kaldır" veya "App Store" mantığının terminal tabanlı, çok daha hızlı ve güvenli halidir. Her biri farklı Linux dağıtım ailelerine özgüdür.


APT (Advanced Package Tool): Debian, Ubuntu, Linux Mint gibi sistemlerde kullanılır.
DNF (Dandified YUM): Fedora, Red Hat (RHEL), CentOS gibi RPM tabanlı sistemlerde kullanılır.
Pacman: Arch Linux ve türevlerinde (Manjaro vb.) kullanılır, hızıyla bilinir.

#LİNUX DOSYA İZİNLERİ 

Linux'ta dosya izinleri; okuma (r), yazma (w) ve çalıştırma (x) haklarını kullanıcı (user), grup (group) ve diğerleri (others) için düzenler. 
ls -l ile görüntülenir, chmod ile değiştirilir. Temel izinler sayısal (örn: 755) veya sembolik (örn: u+rwx) olarak atanabilir.

#SERVİSLER (systemctl)

Linux'ta servisler (veya daemon'lar), arka planda çalışan, sistem başlatıldığında otomatik olarak başlayan veya sonradan başlatılabilen,
belirli görevleri (web sunucusu, SSH, cron vb.) yerine getiren programlardır. Modern Linux dağıtımlarında bu servisler genellikle systemd (systemctl) ile yönetilir.

Temel Servis Yönetim Komutları (systemctl)
Servis Başlatma: sudo systemctl start <servis_adı>Servis 
Durdurma: sudo systemctl stop <servis_adı>Servis
 Durumu Kontrolü: systemctl status <servis_adı>
 Servisi Etkinleştirme (Açılışta otomatik başlasın): sudo systemctl enable <servis_adı> 
 Servisi Devre Dışı Bırakma: sudo systemctl disable <servis_adı> 
 Tüm Servisleri Listeleme: systemctl list-units --type=service