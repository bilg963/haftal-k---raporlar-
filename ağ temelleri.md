P (Internet Protocol) Nedir?
İnternete bağlı her cihazın (bilgisayar, telefon, sunucu) sahip olduğu benzersiz bir "adrestir". Verilerin ağ üzerinde doğru hedefe ulaşmasını sağlar.

IPv4: (Örn: 192.168.1.1) Yaygın kullanılan ancak adresleri tükenmek üzere olan versiyon.
IPv6: Çok daha geniş bir adres aralığı sunan yeni nesil protokol.
Port Nedir?
Bir IP adresi bir binanın adresi ise, Port o binadaki kapı numarasıdır. Bir bilgisayarda aynı anda çalışan farklı servislerin (web sitesi, e-posta, oyun sunucusu) birbirine karışmadan veri alıp vermesini sağlar.

Örnek: HTTP için 80, HTTPS için 443 portu kullanılır.
DNS (Domain Name System) Nedir?
İnternetin "telefon rehberidir". Biz tarayıcıya google.com yazdığımızda, DNS bu ismi bilgisayarların anladığı IP adresine (örn: 142.250.184.206) çevirir.

TCP (Transmission Control Protocol) Nedir?
Güvenilir ve bağlantı odaklı bir protokoldür. Veri gönderilmeden önce alıcıyla "el sıkışma" (Three-way Handshake) yapar. Verilerin eksiksiz ve doğru sırayla ulaştığından emin olur. Hata varsa veriyi tekrar gönderir.

Kullanım Alanı: Web sayfaları (HTTP), E-posta, Dosya transferi.
UDP (User Datagram Protocol) Nedir?
Hızlı ama "güvensiz" bir protokoldür. Veriyi gönderir ve ulaşıp ulaşmadığını kontrol etmez. Hızın, doğruluğun önüne geçtiği durumlarda kullanılır.

Kullanım Alanı: Online oyunlar, Canlı yayınlar, Sesli görüşmeler (VoIP).
2. Paket Yapısı Nasıl Çalışır?
İnternet üzerinden gönderilen büyük veriler (bir resim veya dosya), Paket adı verilen küçük parçalara bölünür. Bir paket temel olarak üç bölümden oluşur:

Header (Üstbilgi): Paketin "etiketidir". Gönderen IP, alıcı IP, protokol türü (TCP/UDP) ve paket numarası gibi bilgiler burada yer alır.
Payload (Yük): Asıl taşınan veridir (mesajın bir parçası, bir görselin bir kesiti vb.).
Footer (Altbilgi/Trailer): Paketin bittiğini ve verinin yolda bozulup bozulmadığını kontrol eden (Checksum) bilgileri içerir.
Veriler hedefe vardığında, bu paket numaraları kullanılarak orijinal veri tekrar birleştirilir.

3. Ağ Analiz Araçları
Ping Nedir?
Bir bilgisayara çok küçük bir veri paketi gönderip, geri gelme süresini ölçer. Cihazın "hayatta" olup olmadığını ve bağlantı hızını (gecikme/latency) test etmek için kullanılır.

Traceroute Nedir?
Bir veri paketinin hedefe giderken hangi sunuculardan (hop) geçtiğini listeler. Bağlantıdaki kopukluğun veya yavaşlamanın tam olarak hangi noktada olduğunu anlamamızı sağlar.

Nslookup Nedir?
Bir alan adının (domain) hangi IP adresine karşılık geldiğini sorgular. DNS kayıtlarını kontrol etmek ve DNS sorunlarını gidermek için kullanılır.

Kazanım: Bu kavramları öğrenerek, geliştirdiğimiz yazılımların ağ üzerinden nasıl veri alışverişi yaptığını, bağlantı hatalarının neden kaynaklanabileceğini ve verinin yolculuğunu anlamış oluruz.

