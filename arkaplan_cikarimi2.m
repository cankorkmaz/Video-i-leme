function [bw , index , hata] = arkaplan_cikarimi2(video_yolu,fr_aralik)
    %% objemizi okuyoruz.
    
    obje = mmreader(video_yolu);
    %% arkaplan ortalaması ve standart sapması
    
    [mn st] = bg_model(video_yolu,[fr_aralik(1) fr_aralik(2)]);
    
    %% Frame sayısını alıyoruz. Ve tüm frameleri okuyoruz.
 
    num = get(obje, 'numberOfFrames'); % En son frame'in index numarasını verir.
    frame = read(obje,[1 num]);
    
    %% Frame'lerin boyutlarını alıyoruz.
    [R C L] = size(read(obje,num));
    bw = {};
    Oan = [];
    hata = 0;
    for fr_no = 1:num

        temp = double(ones(R,C));
    %%  Ortalama ile Standart Sapma Etkileşimi
    % a=double(mn{1})+ st{1}*x; Ortalama Frame'in RED kısmının standart
    % miktarı kadar üst sınırı belirtilmiştir.
    % b=double(mn{1})- st{1}*x; İfadesinde ortalama frame'in RED kısmının
    % alt sınırının belirlenmesi yapılmıştır.
    % c değeri Green kısmının üst değeri, d ise Green bileşeninin alt
    % sınırını belirtmektedir.
    % e ve g değerleride benzer şekilde Blue bileşeni için yapılmıştır.
    %
        f1 = double(mn{1}) - double(frame(:,:,1,fr_no));
        f2 = double(mn{2}) - double(frame(:,:,2,fr_no));
        f3 = double(mn{3}) - double(frame(:,:,3,fr_no));
    %% Geçici değişken kalıcı yapılmıştır.
    % Geçici değerleri taşıyan temp dizisi bw cell'inde kalıcı hale
    % getirilmiştir.
    
        temp(abs(sqrt(f1.^2 + f2.^2 + f3.^2) - sqrt(st{1}.^2+st{2}.^2+st{3}.^2)) < 60) = 0;
        [bw{fr_no}, Oan] = temiz(temp, fr_no, Oan);
    end
    if length(Oan) == 0
        hata = 1;
        index = 0;
    else
        [index, hata] = eleme(bw,Oan);
    end
    index=min(index);
