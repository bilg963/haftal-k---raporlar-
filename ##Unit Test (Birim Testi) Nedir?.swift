##Unit Test (Birim Testi) Nedir?

Unit Test, bir uygulamanın test edilebilen en küçük bağımsız parçasını (genellikle tek bir fonksiyonu, metodu veya sınıfı) diğer tüm bileşenlerden izole ederek test etme işlemidir.

Amaç: Yazılan küçük kod parçacığının, beklenen girdiler karşısında doğru çıktıları verip vermediğini doğrulamaktır.
Özellikleri: Çok hızlı çalışırlar (milisaniyeler içinde), harici veri tabanlarına veya internete bağlanmazlar.
Gerçek Hayat Analojisi: Bir araba fabrikasında, araba tamamen birleştirilmeden önce tek bir bujinin veya fren balatasının laboratuvarda tek başına düzgün çalışıp çalışmadığının test edilmesi gibidir.

 Kod Örneği (Swift):
swift

// Test edilecek fonksiyon
func topla(a: Int, b: Int) -> Int {
    return a + b
}
// Unit Test Yazımı
func testToplamaFonksiyonu() {
    let sonuc = topla(a: 3, b: 5)
    assert(sonuc == 8, "Hata: 3 + 5 işleminin sonucu 8 olmalıydı!")
}
##Integration Test ve E2E (End-to-End) Test Karşılaştırması
Yazılım test piramidinde yukarı çıktıkça testlerin kapsamı büyür. Bu iki test türünün tanımları ve farkları düz yazı olarak şu şekildedir:

#Entegrasyon (Integration) Testi
Tanım: Birden fazla kod biriminin veya modülün bir araya geldiğinde birbirleriyle uyum içinde çalışıp çalışmadığını test eder.
Kapsam: İki veya daha fazla modül arasındaki ilişkiyi inceler. Örneğin, yazdığın veri tabanı servisinin, kullanıcı arayüzü tetiklendiğinde veri tabanına doğru şekilde veri kaydedip kaydetmediğini test etmek entegrasyona girer.
Hız: Orta hızda çalışır. Harici bazı sistemlerle entegre olduğu için Unit test kadar hızlı değildir.
Gerçek Hayat Analojisi: Üretilen motor ile şanzımanın birbirine cıvatalarla bağlanıp, vites geçişlerinde çarkların uyum içinde dönüp dönmediğinin laboratuvar ortamında test edilmesi gibidir.

#Uçtan Uca (E2E - End-to-End) Test
Tanım: Uygulamanın en başından en sonuna kadar, gerçek bir kullanıcının yapacağı tüm adımları simüle ederek test etme işlemidir.
Kapsam: Tüm sistemi ve tüm entegrasyonları tek seferde doğrular. Örneğin; uygulamanın açılması, kullanıcının e-posta yazması, "Giriş Yap" butonuna basması, Firebase sunucusuna gidip oturum açılması ve ana ekrana yönlendirilmesi gibi tüm akış baştan sona test edilir.
Hız: Oldukça yavaş çalışır. Çünkü simülatörü veya fiziksel tarayıcıyı açarak ekrandaki butonlara gerçek bir insan gibi sırayla tıklar.
Gerçek Hayat Analojisi: Arabanın tüm parçaları birleştirildikten sonra sürücü koltuğuna gerçek bir test pilotunun oturup, anahtarı çevirerek otobana çıkması ve tüm aracı gerçek yol şartlarında baştan sona denemesi gibidir.

##Mocking (Taklit Etme) Neden Kullanılır?
Mocking, test edilmek istenen kodun dış dünyaya olan bağımlılıklarını (API çağrıları, veri tabanı sorguları, cihaz donanımları vb.) sahte (taklit) nesnelerle ikame etme yöntemidir.

❓ Neden Mocking Kullanırız?
Hız (Speed): Testlerin her çalışmasında internet üzerinden gerçek bir sunucuya (örneğin Firebase veya hava durumu API'sine) istek atmak çok zaman alır. Mock kullanarak yerel hafızadan anında cevap alınır.
Kararlılık ve Bağımsızlık (Isolation): İnternet bağlantın kesildiğinde veya Firebase sunucusu çöktüğünde senin yazdığın kodun testleri başarısız olmamalıdır. Mock nesnesi testin dış dünyadan etkilenmesini önler.
Hata Senaryolarını Test Etme (Edge Cases): Gerçek bir API'den kasıtlı olarak "500 Sunucu Hatası" veya "İnternet Bağlantısı Zaman Aşımı" hatası almak zordur. Mock nesnesine "Bana şimdi 500 hatası döndür" diyerek uygulamanın hata anındaki davranışını kolayca test edebilirsin.
Maliyet (Cost): Ücretli API servislerine (Örn: Google Maps API) test sırasında binlerce kez istek atıp fatura ödemek yerine, bu servisleri ücretsiz taklit eden mock nesneleri kullanılır.
Gerçek Hayat Analojisi: Otomobil çarpışma testlerinde (Crash Test) arabaya gerçek bir insan oturtmak yerine cansız manken (crash test dummy) yerleştirilmesi gibidir. Manken burada insanı taklit eden (mocking) nesnedir.