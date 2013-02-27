HAZIRLAYANLAR

Semih Özköroğlu// 
Murat Yiğit//
Ahmet Karafilik//
Serkan Kurt//
Can Korkmaz

AÇIKLAMA(explanation)

VİDEO ÜZERİNDE SARILMA TESPİTİ
DETERMINATION OF HUGGING ON VİDEO

Bilgisayar Mühendisliği Bölümü
Ondokuz Mayıs Üniversitesi

ÖZETÇE                                                

Günümüz teknolojisinde şehirler
kameralarla izlenmektedir.Bu kameraların
amacı halkın güvenliğini sağlamaktır.Bu
kameralarla elde edilen görüntülerin insan
gözüyle izlenmesi çok maliyetlidir .Örnek
verecek olursak kural hatası yapan araçları
tespit edip bunların plakalarını kayıt eden
sistemlerin insan gücüyle bu işi yapmaya
çalışması masraflı ve güç olur.Şehirlerdeki
mobese kameralarının anında görüntü
işleme metoduyla çalışan bir sisteme bağlı
olması hem ileri kolaylaştırır hemde
zamandan tasarruf sağlar.Bu çalışmada
kişilerin sarılıp sarılmadıkları eccentrity ,
baunding box ,morfolojik yöntemler ve bazı
kısıtlar kullanılarak tespit edilmiştir.

1. GİRİŞ

Görüntü işleme artık hayatımızın her
bir alanında aktif olarak kullanım
durumundadır. İşlenen görüntülerden
oluşturulan veriler bir çok alan için gerekli
olan verilerdir. Bu bağlamda sarılma analizi
çeşitli alanlarda kullanılır. Örnek olarak
havaalanında bekleyen yolcu sayısını
bulurken sarılmakta olan kişilerin
ayırtedilebilmesi için bu çalışma bir modül
olarak kullanılabilir. Bu sayede
havaalanında bekleyen yolcu sayısı tespit
edilip günün ve ayın yoğunluk derecesine
göre sefer düzenlemeleri planlanabilir. Bir
başka örnek olarak ise toplumun ruhsal
durum analizi için yapılacak olan
çalışmalarda en büyük eksikliğin veri olduğu
bilinmektedir. Bu çalışma sayesinde insanlar
arasında etkileşimi ölçmek için veri kümesi
oluşturulur.

2 . KULLANILAN KAYNAKLAR

Analiz aşamasında kullanılacak olan
video çekimlerinde 5 kişi ile farklı şekillerde
11 adet sarılma eyleminin olduğu ve 3 adet
sarılma eyleminin olmadığı , 14 adet video
üzerinde çalışma yapıldı. Video üzerinde en
doğru analizi almak için arkaplanı sabit olan
bir çalışma ortamı tercih edildi.

3. ALGORİTMA 'NIN
GERÇEKLENMESİ

Uygulama kullanıcı etkileşimli bir
arayüz sunmaktadır.Bu arayüz ile
kullanıcıdan işlenmesi istenilen bir video
seçmesini ve her bir videonun arkaplan
modellemesi ile standart sapmasını
oluşturmak amacı ile başlangıç ve bitiş
frame aralığı seçmesini istenmektedir. Genel
olarak bu aralık [1 - 25] olarak
belirlenmektedir. Eğer video'nun arkaplan
görüntüsünde çok fazla sapmalar var ise bu
değer aralığını daha büyük seçmek daha
uygun olur.

Girilen video'nun işlenme aşamasına
başlamadan önce girilen frame aralığında
bg_model methodu ile videonun
background'ı üzerinden ortalama(mn) bir
frame ile standart sapma(st) frameleri elde
edilmektedir.

Bu aşamada mn ile st değerleri ile renkli
resmin R,G,B bileşenleri için
ortalamadan(mn) çıkarılmış f1, f2, ve f3
değerleri temp(abs(sqrt(f1.^2 + f2.^2 +
f3.^2) - sqrt(st{1}.^2+st{2}.^2+st{3}.^2)) <
60) = 0 ifadesinde kullanarak işlenmekte
olan frame üzerinde blackwhite dönüşümü
gerçeklenmiştir( Kişiler 1 arkaplan 0 ).

İlk olarak blackwhite frame'lerimizi temiz
methoduna göndererek belirlenmiş eşik
değerine göre belirlenmiş alan değerine
sahip olan frame'lerin index numaralarını
Oan cell'in kaydederek sadece birbirine
temas halinde olan frame'lerin belirlenmesi
yapıldı. Morfolojik yöntemleri ve
regionprops methodlarını uygulanarak.
Sadece etkileşimde olan frame'ler üzerinde
çalışılabilir bu düzeye getirildi.

Bu aşamada enkars methodu ile
etkileşimde olan frame'lerin BoundingBox
ve Eccentricity özellikleri regionprops
methodu ile alınarak BoundingBox 'ı en
küçük ve Eccentricity 'i en büyük olan ilk 5
frame belirlenmesi yapıldı. Bu belirleme ile
eylemin yapıldığı (Sarılma, itme, el sıkışma
vs..) en kritik frame'leri belirlenmiş oldu.
Bu eleme'ler sayesinde video işleme hızımız
yaklaşık olarak %75 oranında bir artış
sağlanmış oldu.

En son aşamamız olan eleme methodu ile
bir önceki aşamamızdan gelen framelerden
en küçük alan'a sahip olanı seçilir.Sebebi ise
tam sarılma anında toplam pixel sayısı,
birbirine temas halinde olan diğer frame'lere
göre daha az olmaktadır. Alanı en küçük
olan frame'mizde seçildikten sonra elimizde
tek bir frame bulunmaktadır ancak bu
frame'in tam olarak sarılma anı olduğu
ispatlamak için belirlenen sayıda imerode
methodu uygulayarak eğer elimizdeki frame
üzerinde parçalanmalar meydana gelmiyor
ise bu frame'mimizin tam olarak sarılma
videosu olduğunu ispatlamış oluyoruz.

