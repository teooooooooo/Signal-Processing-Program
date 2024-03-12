
% Pirvan Teodora-Maria, 333AC
% ng = 5, ns = 12

ng = 5;
ns = 12;

%% FAZA 1 - Raspunsurile la impuls si in frecventa ale ferestrelor uzuale

% apelarea functiei pentru aflarea parametrilor de lucru

[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1(ng,ns) ; 

% M = 33 (intreg intre 16 si 45)
% r = 91.6216 (intre 80 dB si 100 dB)
% beta = 6.6486 (intre 2 dB si 10 dB)
% L = 5 (intre 2 si 7)
% alfa = 54.8649 (intre 20% si 80%)

% a) Trasarea raspunsurilor la impuls ale celor 9 ferestre, ca in figura 4.3, cu ajutorul functiei stem

%% Fereastra triunghiulara,  Fereastra Blackman, Fereastra Hamming, Fereastra Hanning

figure(1)
subplot(2,2,1)
% Triunghiulara
w_triung = triang(M); 
stem(w_triung)
title("Fereastra triunghiulara")
ylabel("Amplitudine")
xlabel("M de la 0 la 33")

% Blackman
subplot(2,2,2)
w_blackman = blackman(M); 
stem(w_blackman)
title("Fereastra Blackman")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

% Hamming
subplot(2,2,3)
w_hamming = hamming(M);
stem(w_hamming)
title("Fereastra Hamming")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

% Hanning
subplot(2,2,4)
w_hanning = hanning(M);
stem(w_hanning)
title("Fereastra Hanning")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

%% Fereastra Cebisev, Fereastra Kaiser
figure(2)
subplot(2,3,1)
% Cebisev
w_cebisev1 = chebwin(M,r);
stem(w_cebisev1)
title("Fereastra Cebisev [r = 91.6216]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,2)
w_cebisev2 = chebwin(M,r-5);
stem(w_cebisev2)
title("Fereastra Cebisev [r = 86.6216]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,3)
w_cebisev3 = chebwin(M,r+5);
stem(w_cebisev3)
title("Fereastra Cebisev [r = 96.6216]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

% Cu cat r scade => creste amplitudinea
% Cu cat r creste => scade amplitudinea

% Kaiser
subplot(2,3,4)
w_kaiser1 = kaiser(M,beta);
stem(w_kaiser1)
title("Fereastra Kaiser [beta = 6.6486]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,5)
w_kaiser2 = kaiser(M,beta-1);
stem(w_kaiser2)
title("Fereastra Kaiser [beta = 5.6486]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,6)
w_kaiser3 = kaiser(M,beta+1);
stem(w_kaiser3)
title("Fereastra Kaiser [beta = 7.6486]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

% Cu cat beta scade => amplitudinea creste
% Cu cat beta creste => amplitudinea scade

%% Fereastra Tuckey, Fereastra Lanczos

figure(3)
subplot(2,3,1)
% Lanczos
n = 0 : M-1;
w_lanczos1 = functie_fereastra_lanczos(M,L);
stem(w_lanczos1)
title("Fereastra Lanczos [L = 11]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,2)
L = L - 1;
w_lanczos2 = functie_fereastra_lanczos(M,L);
stem(w_lanczos2)
title("Fereastra Lanczos [L = 10]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,3)
L = L + 2;
w_lanczos3 = functie_fereastra_lanczos(M,L);
stem(w_lanczos3)
title("Fereastra Lanczos [L = 12]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

% Cu cat L mai mare => amplitudine mai mica
% Cu cat L mai mic => amplitudine mai mare

% Tuckey
subplot(2,3,4)
w_tuckey1 = tukeywin(M,alfa);
stem(w_tuckey1)
title("Fereastra Tuckey [alfa = 54.8649]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,5)
alfa2 = alfa - 15;
w_tuckey2 = tukeywin(M,alfa2);
stem(w_tuckey2)
title("Fereastra Tuckey [alfa = 39.8649]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

subplot(2,3,6)
alfa3 = alfa + 15;
w_tuckey3 = tukeywin(M,alfa3);
stem(w_tuckey3)
title("Fereastra Tuckey [alfa = 69.8649]")
xlabel("M de la 0 la 33")
ylabel("Amplitudine")

%% b) Trasati amplitudinile raspunsurilor in frecventa ale ferestrelor de mai sus

% Rezolutia de reprezentare in frecventa => 5000 puncte

%% Dreptunghiular
figure(4)
w_dreptungh = boxcar(M);
w_dreptungh = w_dreptungh / sum(w_dreptungh); % normare
[W_dreptungh, om_dreptungh] = freqz(w_dreptungh,5000);
plot(om_dreptungh,mag2db(abs(W_dreptungh)));
title('Rectangular');
ylabel('[dB]');

%% Triunghiular
figure(5)
subplot(2,2,1)
w_triung = w_triung / sum(w_triung); % normare
[W_triung, om_triung] = freqz(w_triung,5000);
plot(om_triung,mag2db(abs(W_triung)));
title('Triunghiular');
ylabel('[dB]');

% Blackman
subplot(2,2,2)
w_blackman = w_blackman / sum(w_blackman); % normare
[W_blackman, om_blackman] = freqz(w_blackman,5000);
plot(om_blackman,mag2db(abs(W_blackman)));
title('Blackman');
ylabel('[dB]');

% Hamming
subplot(2,2,3)
w_hamming = w_hamming / sum(w_hamming); % normare
[W_hamming, om_hamming] = freqz(w_hamming,5000);
plot(om_hamming,mag2db(abs(W_hamming)));
title('Hamming');
ylabel('[dB]');

% Hanning
subplot(2,2,4)
w_hanning = w_hanning / sum(w_hanning); % normare
[W_hanning, om_hanning] = freqz(w_hanning,5000);
plot(om_hanning,mag2db(abs(W_hanning)));
title('Hanning');
ylabel('[dB]');

%% Cebisev

figure(6)
subplot(2,3,1)
w_cebisev1 = w_cebisev1 / sum(w_cebisev1); % normare
[W_cebisev1, om_cebisev1] = freqz(w_cebisev1,5000);
plot(om_cebisev1, mag2db(abs(W_cebisev1)));
title("Cebisev [r = 91.6216]");
ylabel('[dB]');

subplot(2,3,2)
w_cebisev2 = w_cebisev2 / sum(w_cebisev2); % normare
[W_cebisev2, om_cebisev2] = freqz(w_cebisev2,5000);
plot(om_cebisev2, mag2db(abs(W_cebisev2)));
title("Cebisev [r = 86.6216]");
ylabel('[dB]');

subplot(2,3,3)
w_cebisev3 = w_cebisev3 / sum(w_cebisev3); % normare
[W_cebisev3, om_cebisev3] = freqz(w_cebisev3,5000);
plot(om_cebisev3, mag2db(abs(W_cebisev3)));
title("Cebisev [r = 96.6216]");
ylabel('[dB]');

% Kaiser

subplot(2,3,4)
w_kaiser1 = w_kaiser1 / sum(w_kaiser1); % normare
[W_kaiser1, om_kaiser1] = freqz(w_kaiser1,5000);
plot(om_kaiser1, mag2db(abs(W_kaiser1)));
title("Kaiser [beta = 6.6486]");
ylabel('[dB]');

subplot(2,3,5)
w_kaiser2 = w_kaiser2 / sum(w_kaiser2); % normare
[W_kaiser2, om_kaiser2] = freqz(w_kaiser2,5000);
plot(om_kaiser2, mag2db(abs(W_kaiser2)));
title("Kaiser [beta = 5.6486]");
ylabel('[dB]');

subplot(2,3,6)
w_kaiser3 = w_kaiser3 / sum(w_kaiser3); % normare
[W_kaiser3, om_kaiser3] = freqz(w_kaiser3,5000);
plot(om_kaiser3, mag2db(abs(W_kaiser3)));
title("Kaiser [beta = 7.6486]");
ylabel('[dB]');

%% Lanczos 

figure(7)
subplot(2,3,1)
w_lanczos1 = w_lanczos1 / sum(w_lanczos1); % normare
[W_lanczos1,om_lanczos1] = freqz(w_lanczos1,5000);
plot(om_lanczos1,mag2db(abs(W_lanczos1)));
title("Lanczos [L = 11]");
ylabel('[dB]');

subplot(2,3,2)
w_lanczos2 = w_lanczos2 / sum(w_lanczos2); % normare
[W_lanczos2, om_lanczos2] = freqz(w_lanczos2,5000);
plot(om_lanczos2, mag2db(abs(W_lanczos2)));
title("Lanczos [L = 10]");
ylabel('[dB]');

subplot(2,3,3)
w_lanczos3 = w_lanczos3 / sum(w_lanczos3); % normare
[W_lanczos3, om_lanczos3] = freqz(w_lanczos3,5000);
plot(om_lanczos3, mag2db(abs(W_lanczos3)));
title("Lanczos [L = 12]");
ylabel('[dB]');

% Tuckey

subplot(2,3,4)
w_tuckey1 = w_tuckey1 / sum(w_tuckey1); % normare
[W_tuckey1, om_tuckey1] = freqz(w_tuckey1,5000);
plot(om_tuckey1, mag2db(abs(W_tuckey1)));
title("Tuckey [alfa = 54.8649]");
ylabel('[dB]');

subplot(2,3,5)
w_tuckey2 = w_tuckey2 / sum(w_tuckey2); % normare
[W_tuckey2, om_tuckey2] = freqz(w_tuckey2,5000);
plot(om_tuckey2, mag2db(abs(W_tuckey2)));
title("Tuckey [alfa = 39.8649]");
ylabel('[dB]');

subplot(2,3,6)
w_tuckey3 = w_tuckey3 / sum(w_tuckey3); % normare
[W_tuckey3, om_tuckey3] = freqz(w_tuckey3,5000);
plot(om_tuckey3, mag2db(abs(W_tuckey3)));
title("Tuckey [alfa = 69.8649]");
ylabel('[dB]');

%% c) - Concluzii 


%% Faza 2 - Filtre proiectate cu diverse ferestre

% apelarea functiei pentu generarea pulsatiei de taiere 1.7236 (intre 0 si pi)
omega_c = PS_PRJ_1_Faza_2a(ng,ns) ;

% ordinul ramane acelasi M = 33

% frecventa normalizata de taiere
freq_c=omega_c/pi;

% Secvente pondere ale filtrelor

% Dreptunghiular
figure(8)
subplot(1,5,1)
f_dreptungh = fir1(M-1,freq_c,w_dreptungh);
stem(f_dreptungh)
title("Dreptunghiular")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

% Triunghiular
subplot(1,5,2)
f_triung = fir1(M-1,freq_c,w_triung);
stem(f_triung)
title("Triunghiular")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei")

% Blackman 
subplot(1,5,3)
f_blackman = fir1(M-1,freq_c,w_blackman);
stem(f_blackman)
title("Blackman")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei")

% Hamming 
subplot(1,5,4)
f_hamming = fir1(M-1,freq_c,w_hamming);
stem(f_hamming)
title("Hamming");
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei")

% Hanning 
subplot(1,5,5)
f_hanning = fir1(M-1,freq_c,w_hanning);
stem(f_hanning)
title("Hanning");
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei")

%% Cebisev 

figure(9)
subplot(2,3,1)
f_cebisev1 = fir1(M-1,freq_c,w_cebisev1);
stem(f_cebisev1)
title("Cebisev [r = 91.6216]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,2)
f_cebisev2 = fir1(M-1,freq_c,w_cebisev2);
stem(f_cebisev2)
title("Cebisev [r = 86.6216]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,3)
f_cebisev3 = fir1(M-1,freq_c,w_cebisev3);
stem(f_cebisev3)
title("Cebisev [r = 96.6216]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

% Kaiser

subplot(2,3,4)
f_kaiser1 = fir1(M-1,freq_c,w_kaiser1);
stem(f_kaiser1)
title("Kaiser [beta = 6.6486]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,5)
f_kaiser2 = fir1(M-1,freq_c,w_kaiser2);
stem(f_kaiser2)
title("Kaiser [beta = 5.6486]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,6)
f_kaiser3 = fir1(M-1,freq_c,w_kaiser3);
stem(f_kaiser3)
title("Kaiser [beta = 7.6486]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

%% Lanczos

figure(10)
subplot(2,3,1)
f_lanczos1 = fir1(M-1,freq_c,w_lanczos1);
stem(f_lanczos1)
title("Lanczos [L = 11]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,2)
f_lanczos2 = fir1(M-1,freq_c,w_lanczos2);
stem(f_lanczos2)
title("Lanczos [L = 10]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,3)
f_lanczos3 = fir1(M-1,freq_c,w_lanczos3);
stem(f_lanczos3)
title("Lanczos [L = 12]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,4)
f_tuckey1 = fir1(M-1,freq_c,w_tuckey1);
stem(f_tuckey1)
title("Tuckey [alfa = 54.8649]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

subplot(2,3,5)
f_tuckey2 = fir1(M-1,freq_c,w_tuckey2);
stem(f_tuckey2)
title("Tuckey [alfa = 39.8649]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");


subplot(2,3,6)
f_tuckey3 = fir1(M-1,freq_c,w_tuckey3);
stem(f_tuckey3)
title("Tuckey [alfa = 69.8649]")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");


%% Spectrele filtrelor 

% Dreptunghiular
figure(11)
subplot(2,5,1)
[F_dreptungh,om_dreptungh] = freqz(f_dreptungh,5000);
plot(om_dreptungh,mag2db(abs(F_dreptungh)));
title("Dreptunghiular");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,5,6)
plot(om_dreptungh/pi,unwrap(angle(F_dreptungh))); % frecventa normalizata
title("Dreptunghiular");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

% Triunghiular
subplot(2,5,2)
[F_triung,om_triung] = freqz(f_triung,5000);
plot(om_triung,mag2db(abs(F_triung)));
title("Triunghiular");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,5,7)
plot(om_triung/pi,unwrap(angle(F_triung))); % frecventa normalizata
title("Triunghiular");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

% Blackman
subplot(2,5,3)
[F_blackman,om_blackman] = freqz(f_blackman,5000);
plot(om_blackman,mag2db(abs(F_blackman)));
title("Blackman");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,5,8)
plot(om_blackman/pi,unwrap(angle(F_blackman))); % frecventa normalizata
title("Blackman");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

% Hamming
subplot(2,5,4)
[F_hamming,om_hamming] = freqz(f_hamming,5000);
plot(om_hamming,mag2db(abs(F_hamming)));
title("Hamming");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,5,9)
plot(om_hamming/pi,unwrap(angle(F_hamming))); % frecventa normalizata
title("Hamming");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

% Hanning
subplot(2,5,5)
[F_hanning,om_hanning] = freqz(f_hanning,5000);
plot(om_hanning,mag2db(abs(F_hanning)));
title("Hanning");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,5,10)
plot(om_hanning/pi,unwrap(angle(F_hanning))); % frecventa normalizata
title("Hanning");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

%% Cebisev

figure(12)
subplot(3,4,1)
[F_cebisev1,om_cebisev1] = freqz(f_cebisev1,5000);
plot(om_cebisev1,mag2db(abs(F_cebisev1)));
title('Spectru Cebisev [r = 91.6216]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,2)
plot(om_cebisev1/pi,unwrap(angle(F_cebisev1))); % frecventa normalizata
title("Faza Cebisev [r = 91.6216]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,5)
[F_cebisev2,om_cebisev2] = freqz(f_cebisev2,5000);
plot(om_cebisev2,mag2db(abs(F_cebisev2)));
title('Spectru Cebisev [r = 86.6216]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,6)
plot(om_cebisev2/pi,unwrap(angle(F_cebisev2))); % frecventa normalizata
title("Faza Cebisev [r = 86.6216]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,9)
[F_cebisev3,om_cebisev3] = freqz(f_cebisev3,5000);
plot(om_cebisev3,mag2db(abs(F_cebisev3)));
title('Spectru Cebisev [r = 96.6216]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,10)
plot(om_cebisev3/pi,unwrap(angle(F_cebisev3))); % frecventa normalizata
title("Faza Cebisev [r = 96.6216]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

% Kaiser

subplot(3,4,3)
[F_kaiser1,om_kaiser1] = freqz(f_kaiser1,5000);
plot(om_kaiser1,mag2db(abs(F_kaiser1)));
title('Spectru Kaiser [beta = 6.6486]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,4)
plot(om_kaiser1/pi,unwrap(angle(F_kaiser1))); % frecventa normalizata
title("Faza Kaiser [beta = 6.6486]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,7)
[F_kaiser2,om_kaiser2] = freqz(f_kaiser2,5000);
plot(om_kaiser2,mag2db(abs(F_kaiser2)));
title('Spectru Kaiser [beta = 5.6486]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,8)
plot(om_kaiser2/pi,unwrap(angle(F_kaiser2))); % frecventa normalizata
title("Faza Kaiser [beta = 5.6486]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,11)
[F_kaiser3,om_kaiser3] = freqz(f_kaiser3,5000);
plot(om_kaiser3,mag2db(abs(F_kaiser3)));
title('Spectru Kaiser [beta = 7.6486]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,12)
plot(om_kaiser3/pi,unwrap(angle(F_kaiser3))); % frecventa normalizata
title("Faza Kaiser [beta = 7.6486]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

%% Lanczos

figure(13)
subplot(3,4,1)
[F_lanczos1,om_lanczos1] = freqz(f_lanczos1,5000);
plot(om_lanczos1,mag2db(abs(F_lanczos1)));
title('Spectru Lanczos [L = 11]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,2)
plot(om_lanczos1/pi,unwrap(angle(F_lanczos1))); % frecventa normalizata
title("Faza Lanczos [L = 11]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,5)
[F_lanczos2,om_lanczos2] = freqz(f_lanczos2,5000);
plot(om_lanczos2,mag2db(abs(F_lanczos2)));
title('Spectru Lanczos [L = 10]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,6)
plot(om_lanczos2/pi,unwrap(angle(F_lanczos2))); % frecventa normalizata
title("Faza Lanczos [L = 10]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,9)
[F_lanczos3,om_lanczos3] = freqz(f_lanczos3,5000);
plot(om_lanczos3,mag2db(abs(F_lanczos3)));
title('Spectru Lanczos [L = 12]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,10)
plot(om_lanczos3/pi,unwrap(angle(F_lanczos3))); % frecventa normalizata
title("Faza Lanczos [L = 12]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,3)
[F_tuckey1,om_tuckey1] = freqz(f_tuckey1,5000);
plot(om_tuckey1,mag2db(abs(F_tuckey1)));
title('Spectru Tuckey [alfa = 54.8649]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,4)
plot(om_tuckey1/pi,unwrap(angle(F_tuckey1))); % frecventa normalizata
title("Faza Tuckey [alfa = 54.8649]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,7)
[F_tuckey2,om_tuckey2] = freqz(f_tuckey2,5000);
plot(om_tuckey2,mag2db(abs(F_tuckey2)));
title('Spectru Tuckey [alfa = 39.8649]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,8)
plot(om_tuckey2/pi,unwrap(angle(F_tuckey2))); % frecventa normalizata
title("Faza Tuckey [alfa = 39.8649]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(3,4,11)
[F_tuckey3,om_tuckey3] = freqz(f_tuckey3,5000);
plot(om_tuckey3,mag2db(abs(F_tuckey3)));
title('Spectru Tuckey [alfa = 69.8649]');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(3,4,12)
plot(om_tuckey3/pi,unwrap(angle(F_tuckey3))); % frecventa normalizata
title("Faza Tuckey [alfa = 69.8649]");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

%% punctul b)

% Kaiser [beta = 7.6486] 

% Se mofidica M si se realizeaza aceleasi operatii precum cele de la
% punctul precedent

figure(14)
M2 = (M+(M/2)); % 49.50 => M trebuie sa fie numar real, pozitiv, intreg => M2 = 50 (se aproximeaza)
M2 = 50;
M3 = 2*M;

f_kaiserb1 = fir1(M-1,freq_c,w_kaiser3);
w_kaiserb2 = kaiser(M2,beta);
f_kaiserb2 = fir1(M2-1,freq_c,w_kaiserb2);
w_kaiserb3 = kaiser(M3,beta);
f_kaiserb3 = fir1(M3-1,freq_c,w_kaiserb3);

subplot(2,3,1)
[F_kaiserb1,om_kaiserb1] = freqz(f_kaiserb1,5000);
plot(om_kaiserb1,mag2db(abs(F_kaiserb1)));
title('Spectru Kaiser [beta = 7.6486], M');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,3,4)
plot(om_kaiserb1/pi,unwrap(angle(F_kaiserb1))); % frecventa normalizata
title("Faza Kaiser [beta = 7.6486], M");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(2,3,2)
[F_kaiserb2,om_kaiserb2] = freqz(f_kaiserb2,5000);
plot(om_kaiserb2,mag2db(abs(F_kaiserb2)));
title('Spectru Kaiser [beta = 7.6486], M+M/2');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,3,5)
plot(om_kaiserb2/pi,unwrap(angle(F_kaiserb2))); % frecventa normalizata
title("Faza Kaiser [beta = 7.6486], M+M/2");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(2,3,3)
[F_kaiserb3,om_kaiserb3] = freqz(f_kaiserb3,5000);
plot(om_kaiserb3,mag2db(abs(F_kaiserb3)));
title('Spectru Kaiser [beta = 7.6486], 2*M');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,3,6)
plot(om_kaiserb3/pi,unwrap(angle(F_kaiserb3))); % frecventa normalizata
title("Faza Kaiser [beta = 7.6486], 2*M");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

% Lanczos [L = 12]

L = 12;

w_lanczosb1 = functie_fereastra_lanczos(M,L);
f_lanczosb1 = fir1(M-1,freq_c,w_lanczosb1);
w_lanczosb2 = functie_fereastra_lanczos(M2,L);
f_lanczosb2 = fir1(M2-1,freq_c,w_lanczosb2);
w_lanczosb3 = functie_fereastra_lanczos(M3,L);
f_lanczosb3 = fir1(M3-1,freq_c,w_lanczosb3);

figure(15)
subplot(2,3,1)
[F_lanczosb1,om_lanczosb1] = freqz(f_lanczosb1,5000);
plot(om_lanczosb1,mag2db(abs(F_lanczosb1)));
title('Spectru Lanczos [L = 12], M');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,3,4)
plot(om_lanczosb1/pi,unwrap(angle(F_lanczosb1))); % frecventa normalizata
title("Faza Lanczos [L = 12], M");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(2,3,2)
[F_lanczosb2,om_lanczosb2] = freqz(f_lanczosb2,5000);
plot(om_lanczosb2,mag2db(abs(F_lanczosb2)));
title('Spectru Lanczos [L = 12], M+M/2');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,3,5)
plot(om_lanczosb2/pi,unwrap(angle(F_lanczosb2))); % frecventa normalizata
title("Faza Lanczos [L = 12], M+M/2");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

subplot(2,3,3)
[F_lanczosb3,om_lanczosb3] = freqz(f_lanczosb3,5000);
plot(om_lanczosb3,mag2db(abs(F_lanczosb3)));
title('Spectru Lanczos [L = 12], 2*M');
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
subplot(2,3,6)
plot(om_lanczosb3/pi,unwrap(angle(F_lanczosb3))); % frecventa normalizata
title("Faza Lanczos [L = 12], 2*M");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

%% Faza 3 - Utilizarea Metodei ferestrei pentru rezolvarea PPFTI

% pentru punctul a => a fost realizata functie matlab

% pentru punctul b 

%[omega_p,omega_s,Delta_p] = PS_PRJ_1_Faza_3b(ng,ns) ; 

omega_p = 1.7236; % asemanatoare cu omega_c
omega_s = 2.1829;
Delta_p = 5.4865;
Delta_s = Delta_p;
beta = 7.6486;

% [Delta_pr,Delta_sr] = faza3_puncta(h,omega_p,omega_s);

% Fereastra de lucru => Kaiser [beta = 7.6486] 
% FRECVENTE PONDERE

% PERFORMANTA DEPINDE DE M SI SUMA DINTRE TOLERANTE => AMBELE TREBUIE SA
% FIE CAT MAI MICI  

tip = 'kaiser';

% Cazul M1 , w = 0.25
M1 = 33;
w = 0.25;
omega_c1 = (1-w) * omega_p + w * omega_s;
[filtru1] = faza3_punctb(M,omega_c1, tip);
[Delta_pr1,Delta_sr1] = faza3_puncta(filtru1,omega_s,omega_p);
verificare_toleranta1 = Faza3_punctb2(Delta_pr1,Delta_p,Delta_sr1,Delta_s);
suma1 = Delta_pr1 + Delta_sr1;

% Cazul M1 , w = 0.5
w = 0.5;
omega_c2 = (1-w) * omega_p + w * omega_s;
[filtru2] = faza3_punctb(M,omega_c2,tip);
[Delta_pr2,Delta_sr2] = faza3_puncta(filtru2,omega_s,omega_p);
verificare_toleranta2 = Faza3_punctb2(Delta_pr2,Delta_p,Delta_sr2,Delta_s);
suma2 = Delta_pr2 + Delta_sr2;

% Cazul M1 , w = 0.75
w = 0.75;
omega_c3 = (1-w) * omega_p + w * omega_s;
[filtru3] = faza3_punctb(M,omega_c3,tip);
[Delta_pr3,Delta_sr3] = faza3_puncta(filtru3,omega_s,omega_p);
verificare_toleranta3 = Faza3_punctb2(Delta_pr3,Delta_p,Delta_sr3,Delta_s);
suma3 = Delta_pr3 + Delta_sr3;

% TOLERANTE ACCEPTATE!

%% Cazul M2 = M + M/2 , w = 0.25
M2 = M1 + M1/2; % este 49.5 => se aproximeaza la 50
M2 = 50;
w = 0.25;
omega_c4 = (1-w) * omega_p + w * omega_s;
[filtru4] = faza3_punctb(M2,omega_c4,tip);
[Delta_pr4,Delta_sr4] = faza3_puncta(filtru4,omega_s,omega_p);
verificare_toleranta4 = Faza3_punctb2(Delta_pr4,Delta_p,Delta_sr4,Delta_s);
suma4 = Delta_pr4 + Delta_sr4;

% Cazul M + M/2 , w = 0.5
w = 0.5;
omega_c5 = (1-w) * omega_p + w * omega_s;
[filtru5] = faza3_punctb(M2,omega_c5,tip);
[Delta_pr5,Delta_sr5] = faza3_puncta(filtru5,omega_s,omega_p);
verificare_toleranta5 = Faza3_punctb2(Delta_pr5,Delta_p,Delta_sr5,Delta_s);
suma5 = Delta_pr5 + Delta_sr5;

% Cazul M + M/2, w = 0.75
w = 0.75;
omega_c6 = (1-w) * omega_p + w * omega_s;
[filtru6] = faza3_punctb(M2,omega_c6,tip);
[Delta_pr6,Delta_sr6] = faza3_puncta(filtru6,omega_s,omega_p);
verificare_toleranta6 = Faza3_punctb2(Delta_pr6,Delta_p,Delta_sr6,Delta_s);
suma6 = Delta_pr6 + Delta_sr6;

% TOLERANTE ACCEPTATE!

%% Cazul M3 = M1*2 , w = 0.25
M3 = M1*2;
w = 0.25;
omega_c7 = (1-w) * omega_p + w * omega_s;
[filtru7] = faza3_punctb(M3,omega_c7,tip);
[Delta_pr7,Delta_sr7] = faza3_puncta(filtru7,omega_s,omega_p);
verificare_toleranta7 = Faza3_punctb2(Delta_pr7,Delta_p,Delta_sr7,Delta_s);
suma7 = Delta_pr7 + Delta_sr7;

% Cazul M*2, w = 0.5
w = 0.5;
omega_c8 = (1-w) * omega_p + w * omega_s;
[filtru8] = faza3_punctb(M3,omega_c8,tip);
[Delta_pr8,Delta_sr8] = faza3_puncta(filtru8,omega_s,omega_p);
verificare_toleranta8 = Faza3_punctb2(Delta_pr8,Delta_p,Delta_sr8,Delta_s);
suma8 = Delta_pr8 + Delta_sr8;

% Cazul M*2, w = 0.75
w = 0.75;
omega_c9 = (1-w) * omega_p + w * omega_s;
[filtru9] = faza3_punctb(M3,omega_c9,tip);
[Delta_pr9,Delta_sr9] = faza3_puncta(filtru9,omega_s,omega_p);
verificare_toleranta9 = Faza3_punctb2(Delta_pr9,Delta_p,Delta_sr9,Delta_s);
suma9 = Delta_pr9 + Delta_sr9;

% TOLERANTE ACCEPTATE!

%% Secvente pondere - ordinea descrescatoare a performantei 
% Performanta = M cat mai mic si suma tolerantelor cat mai mica

% Se realizeaza un vector care ordoneaza crescator suma tolerantelor
% se ordoneaza intai suma, apoi sumele se ordoneaza in functie de ordinul M

vector = [suma1,suma2,suma3,suma4,suma5,suma6,suma7,suma8,suma9];
vector_ordonat = sort(vector); % ordonare in functie de suma:
%      suma1,suma3,suma2,suma4,suma6,suma7,suma9,suma5,suma8
% Daca ordonam in functie de filtrul de mai sus, ordinea descrescatoare a
% performantei filtrelor va fi:
%    filtru1,filtru3,filtru2,filtru4,filtru6,filtru7,filtru9,filtru5,filtru8

figure(16)
subplot(3,3,1)
stem(filtru1)
title("Filtru1 M = 33")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,2)
stem(filtru3)
title("Filtru3 M = 33")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,3)
stem(filtru2)
title("Filtru2 M = 33")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,4)
stem(filtru4)
title("Filtru4 M = 50")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,5)
stem(filtru6)
title("Filtru6 M = 50")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,6)
stem(filtru7)
title("Filtru7 M = 66")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,7)
stem(filtru9)
title("Filtru9 M = 66")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,9)
stem(filtru8)
title("Filtru8 M = 66")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,8)
stem(filtru5)
title("Filtru5 M = 50")
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

%% Spectre
figure(17)
subplot(3,3,1)
[Filtru1,om_filtru1] = freqz(filtru1,5000);
plot(om_filtru1,mag2db(abs(Filtru1)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c1, omega_c1], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru1 M = 33, Delta_p_r = 0.9832, Delta_s_r= 0.7446");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
legend({'filtru', '\omega_p', '\omega_c', '\omega_s', '1+-\Delta_p', '\Delta_s'}, 'Location', 'Best');
hold off

subplot(3,3,2)
[Filtru3,om_filtru3] = freqz(filtru3,5000);
plot(om_filtru3,mag2db(abs(Filtru3)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c3, omega_c3], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru3 M = 33, Delta_p_r = 0.7446, Delta_s_r= 0.9832");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off

subplot(3,3,3)
[Filtru2,om_filtru2] = freqz(filtru2,5000);
plot(om_filtru2,mag2db(abs(Filtru2)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c2, omega_c2], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru2 M = 33, Delta_p_r = 0.9109, Delta_s_r= 0.9110");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off

subplot(3,3,4)
[Filtru4,om_filtru4] = freqz(filtru4,5000);
plot(om_filtru4,mag2db(abs(Filtru4)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c4, omega_c4], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru4 M = 50, Delta_p_r = 1, Delta_s_r= 0.8455");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off

subplot(3,3,6)
[Filtru7,om_filtru7] = freqz(filtru7,5000);
plot(om_filtru7,mag2db(abs(Filtru7)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c7, omega_c7], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru7 M = 66, Delta_p_r = 1, Delta_s_r= 0.9145");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off

subplot(3,3,5)
[Filtru6,om_filtru6] = freqz(filtru6,5000);
plot(om_filtru6,mag2db(abs(Filtru6)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c6, omega_c6], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru6 M = 50, Delta_p_r = 0.8455, Delta_s_r= 1.002");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off

subplot(3,3,7)
[Filtru9,om_filtru9] = freqz(filtru9,5000);
plot(om_filtru9,mag2db(abs(Filtru9)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c9, omega_c9], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru9 M = 66, Delta_p_r = 0.9145, Delta_s_r= 1.002");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off

subplot(3,3,8)
[Filtru5,om_filtru5] = freqz(filtru5,5000);
plot(om_filtru5,mag2db(abs(Filtru5)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c5, omega_c5], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru5 M = 50, Delta_p_r = 0.9853, Delta_s_r= 0.9853");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off

subplot(3,3,9)
[Filtru8,om_filtru8] = freqz(filtru8,5000);
plot(om_filtru8,mag2db(abs(Filtru8)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_c8, omega_c8], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);

title("Filtru8 M = 66, Delta_p_r = 0.9996, Delta_s_r= 0.9996");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]")
hold off
%% Faze
figure(18)
subplot(3,3,1)
plot(om_filtru1/pi,unwrap(angle(Filtru1))); % frecventa normalizata
title("Faza Filtru1");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,2)
plot(om_filtru3/pi,unwrap(angle(Filtru3))); % frecventa normalizata
title("Faza Filtru3");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,3)
plot(om_filtru2/pi,unwrap(angle(Filtru2))); % frecventa normalizata
title("Faza Filtru2");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,4)
plot(om_filtru4/pi,unwrap(angle(Filtru4))); % frecventa normalizata
title("Faza Filtru4");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,5)
plot(om_filtru6/pi,unwrap(angle(Filtru6))); % frecventa normalizata
title("Faza Filtru6");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,6)
plot(om_filtru7/pi,unwrap(angle(Filtru7))); % frecventa normalizata
title("Faza Filtru7");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,7)
plot(om_filtru9/pi,unwrap(angle(Filtru9))); % frecventa normalizata
title("Faza Filtru9");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,8)
plot(om_filtru5/pi,unwrap(angle(Filtru5))); % frecventa normalizata
title("Faza Filtru5");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,9)
plot(om_filtru8/pi,unwrap(angle(Filtru8))); % frecventa normalizata
title("Faza Filtru8");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")

%% Faza 4 - Concurs de proiectare

% cu ajutorul unei functii proiectate, se vor simula totalitatea
% ferestrelor propuse in cadrul lucrarii proiectului, si in functie de
% acestea se va alege cea mai performanta, variind diferiti parametri (M)
% PERFORMANTA => M minim si suma tolerantelor minima!
% Panta de taiere se vrea cat mai abrupta

% se va alege M cu valori in intervalul inchis [2, 101]; % nu este
% specificat nimic in legatura cu intervalul de alegere a lui M
% omega_c in intervalul (0,3.14]

omega_p = 1.7236;
omega_s = 2.1829;
Delta_p = 5.4865;
Delta_s = 5.4865;

% Trebuie variate: ordinul M, pulsatia de taiere omega_c si tipul de fereastra, plus parametrul 
% de configurare a ferestrei, daca are.
% Din aceasta faza se intelege => simularea filtrelor ferestrelor si
% cautarea celei mai optime situatii pentru fiecare, realizarea ulterioara
% a unui "podium", evidentierea primelor 3 optiuni

%%
% DREPTUNGHIULARA
vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
suma_aux = 100;
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam
%omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 

        tip = "dreptunghiulara";
        aux = 0; % nu exista parametri

        [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
        [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
        suma = Delta_sr_aux + Delta_pr_aux;
        vector_aux1 = [vector_aux1,suma];
        vector_aux2 = [vector_aux2,M_aux];
        vector_aux3 = [vector_aux3,omega_c_aux];
        
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_dreptunghiulara= min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie = find(vector_aux1 == suma_minima_dreptunghiulara);
M_minim_dreptunghiulara = vector_aux2(pozitie);
omega_minim_dreptunghiulara = vector_aux3(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_dreptunghiulara,tip,omega_minim_dreptunghiulara,omega_p,omega_s,aux,Delta_p,Delta_s);

% omega_c = 1.95, M = 98,suma = 0.0486

% TOLERANTA ACCEPTATA!
%% TRIUNGHIULARA

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 

        tip = "triunghiulara";
        aux = 0; % nu exista parametri

        [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
        [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
        suma = Delta_sr_aux + Delta_pr_aux;
    
        vector_aux1 = [vector_aux1,suma]; 
        vector_aux3 = [vector_aux3,omega_c_aux];
        vector_aux2 = [vector_aux2,M_aux];

    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_triunghiulara = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie = find(vector_aux1 == suma_minima_triunghiulara);
M_minim_triunghiulara = vector_aux2(pozitie);
omega_minim_triunghiulara = vector_aux3(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_triunghiulara,tip,omega_minim_triunghiulara,omega_p,omega_s,aux,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 1.95, M = 100,suma = 0.0435

%% BLACKMAN

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 

        tip = "blackman";
        aux = 0; % nu exista parametri

        [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
        [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
        suma = Delta_sr_aux + Delta_pr_aux;

        vector_aux1 = [vector_aux1,suma]; 
        vector_aux2 = [vector_aux2,M_aux];
        vector_aux3 = [vector_aux3,omega_c_aux];
       
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_blackman = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie =  find(vector_aux1 == suma_minima_blackman);
pozitie = pozitie(1);
M_minim_blackman = vector_aux2(pozitie);
omega_minim_blackman = vector_aux3(pozitie);


%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_blackman,tip,omega_minim_blackman,omega_p,omega_s,aux,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 1.9, M = 100,suma = 2.81e(-04)

%% HAMMING

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 

        tip = "hamming";
        aux = 0; % nu exista parametri

        [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
        [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
        suma = Delta_sr_aux + Delta_pr_aux;

        vector_aux1 = [vector_aux1,suma]; 
        vector_aux2 = [vector_aux2,M_aux];
        vector_aux3 = [vector_aux3,omega_c_aux];
       
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_hamming = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie =  find(vector_aux1 == suma_minima_hamming);
pozitie = pozitie(1);
M_minim_hamming = vector_aux2(pozitie);
omega_minim_hamming = vector_aux3(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_hamming,tip,omega_minim_hamming,omega_p,omega_s,aux,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 2.06, M = 99,suma = 0.0025

%% HANNING

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 

        tip = "hanning";
        aux = 0; % nu exista parametri

        [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
        [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
        suma = Delta_sr_aux + Delta_pr_aux;

        vector_aux1 = [vector_aux1,suma]; 
        vector_aux2 = [vector_aux2,M_aux];
        vector_aux3 = [vector_aux3,omega_c_aux];
       
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_hanning = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie =  find(vector_aux1 == suma_minima_hanning);
pozitie = pozitie(1);
M_minim_hanning = vector_aux2(pozitie);
omega_minim_hanning = vector_aux3(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_hanning,tip,omega_minim_hanning,omega_p,omega_s,aux,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 0.2, M = 100,suma = 0.0016

%% CEBISEV

% parametru aditional :  r intre 80 dB si 100 dB - se tine cont de indicatiile din faza 1

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
vector_aux4 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 
        for aux = 80:1:100   
            tip = "cebisev";
        
            [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
            [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
            suma = Delta_sr_aux + Delta_pr_aux;

            vector_aux1 = [vector_aux1,suma]; 
            vector_aux2 = [vector_aux2,M_aux];
            vector_aux3 = [vector_aux3,omega_c_aux];
            vector_aux4 = [vector_aux4,aux];
        end
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_cebisev = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie =  find(vector_aux1 == suma_minima_cebisev);
pozitie = pozitie(1);
M_minim_cebisev = vector_aux2(pozitie);
omega_minim_cebisev = vector_aux3(pozitie);
r_minim = vector_aux4(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_cebisev,tip,omega_minim_cebisev,omega_p,omega_s,aux,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 1.95, M = 98,suma = 0.000010 , r = 94


%% KAISER

% parametru aditional :  beta intre 2 dB si 10 dB; - se tine cont de indicatiile din faza 1

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
vector_aux4 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 
        for aux = 2:1:10   
            tip = "kaiser";
        
            [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
            [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
            suma = Delta_sr_aux + Delta_pr_aux;

            vector_aux1 = [vector_aux1,suma]; 
            vector_aux2 = [vector_aux2,M_aux];
            vector_aux3 = [vector_aux3,omega_c_aux];
            vector_aux4 = [vector_aux4,aux];
        end
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_kaiser = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie =  find(vector_aux1 == suma_minima_kaiser);
pozitie = pozitie(1);
M_minim_kaiser = vector_aux2(pozitie);
omega_minim_kaiser = vector_aux3(pozitie);
beta_minim = vector_aux4(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_kaiser,tip,omega_minim_kaiser,omega_p,omega_s,aux,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 1.97, M = 100,suma = 0.000019, beta=10


%% TUCKEY

% parametru aditional : alfa intre 20% si 80% - se tine cont de indicatiile din faza 1
% daca dureaza prea mult: se ia caz ideal alfa = 33%
vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
vector_aux4 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.1:3.14 % ca sa mearga mai repede
        for aux = 20:1:80   
            tip = "tuckey";
        
            [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
            [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
            suma = Delta_sr_aux + Delta_pr_aux;

            vector_aux1 = [vector_aux1,suma]; 
            vector_aux2 = [vector_aux2,M_aux];
            vector_aux3 = [vector_aux3,omega_c_aux];
            vector_aux4 = [vector_aux4,aux];
        end
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_tuckey = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie =  find(vector_aux1 == suma_minima_tuckey);
pozitie = pozitie(1);
M_minim_tuckey = vector_aux2(pozitie);
omega_minim_tuckey = vector_aux3(pozitie);
alfa_minim = vector_aux4(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_tuckey,tip,omega_minim_tuckey,omega_p,omega_s,alfa_minim,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% S-a mers pana la 82 - a durat aprox 5 ore verificarea; omega_c pas 0.01
% => s a inlocuit pasul cu 0.1 ca sa mearga mai repede

% omega_c = 1.9, M = 98,suma = 0.0023, alfa = 20

%% Lanczos

% parametru aditional : L intreg intre 2 si 7 - se tine cont de indicatiile din faza 1

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
vector_aux4 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.01:3.14 
        for aux = 2:1:7   
            tip = "lanczos";
        
            [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
            [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
            suma = Delta_sr_aux + Delta_pr_aux;

            vector_aux1 = [vector_aux1,suma]; 
            vector_aux2 = [vector_aux2,M_aux];
            vector_aux3 = [vector_aux3,omega_c_aux];
            vector_aux4 = [vector_aux4,aux];
        end
    end
end

% se afla suma minima din valorile stocate in vector_aux
suma_minima_lanczos = min(vector_aux1);
% se afla pozitia pe care se afla suma_minima => aflam M minim
pozitie =  find(vector_aux1 == suma_minima_lanczos);
pozitie = pozitie(1);
M_minim_lanczos = vector_aux2(pozitie);
omega_minim_lanczos = vector_aux3(pozitie);
L_minim = vector_aux4(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_lanczos,tip,omega_minim_lanczos,omega_p,omega_s,L_minim,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 1.95, M = 100,suma =  0.00012, L = 4

%% CLASAMENT - a fost realizat in functie de cele mai mici sume,
% deoarece minimul s-a aflat in prim plan in functie de suma
% GOLD: cebisev : % omega_c = 1.95, M = 98,suma = 0.000010 , r = 94
% SILVER: kaiser : % omega_c = 1.97, M = 100,suma = 0.000019, beta=10
% BRONZE: lanczos : % omega_c = 1.95, M = 100,suma =  0.00012, L =

gold_c = 1.95; 
M_gold = 98;
r_gold = 94;
silver_c = 1.97;
M_silver = 100;
beta_silver =10;
bronze_c = 1.95; 
M_bronze = 100;
L_bronze = 4;

% Gold
freqgold_c = gold_c / pi;

% Fereastra
w_gold = chebwin(M_gold,r_gold);
w_gold = w_gold / sum(w_gold); % normare

% Filtru
f_gold = fir1(M_gold-1,freqgold_c,w_gold);
[F_gold, om_gold] = freqz(f_gold,5000);

% Silver
freqsilver_c = silver_c / pi;

% Fereastra
w_silver = kaiser(M_silver,beta_silver);
w_silver = w_silver / sum(w_silver); % normare

% Filtru
f_silver = fir1(M_silver-1,freqsilver_c,w_silver);
[F_silver, om_silver] = freqz(f_silver,5000);

% Bronze
freqbronze_c = bronze_c / pi;

% Fereastra
w_bronze = functie_fereastra_lanczos(M_bronze,L_bronze);
w_bronze = w_bronze / sum(w_bronze); % normare

% Filtru
f_bronze = fir1(M_bronze-1,freqbronze_c,w_bronze);
[F_bronze, om_bronze] = freqz(f_bronze,5000);

% Secvente pondere
figure(19)
subplot(3,3,7)
stem(f_gold)
title("GOLD - Cebisev : omega_c = 1.95, M = 98, r = 94");
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,8)
stem(f_silver)
title("SILVER - Kaiser : omega_c = 1.97, M = 100, beta = 10");
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
subplot(3,3,9)
stem(f_bronze)    
title("BRONZE - Lanczos : omega_c = 1.95, M = 100, L = 4");
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");

% SPECTRE 
subplot(3,3,1)
plot(om_gold, mag2db(abs(F_gold)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([gold_c, gold_c], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);
title("GOLD - Cebisev : omega_c = 1.95, M = 98, r = 94");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]");
legend({'filtru', '\omega_pr', '\gold/silver/bronze_c', '\omega_sr', '1+-\Delta_p', '\Delta_s'}, 'Location', 'Best');
hold off

subplot(3,3,2)
plot(om_silver, mag2db(abs(F_silver)));
hold on 
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([silver_c, silver_c], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);
title("SILVER - Kaiser : omega_c = 1.97, M = 100,beta = 10");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]");
hold off
subplot(3,3,3)
plot(om_bronze, mag2db(abs(F_bronze)));
hold on 
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([bronze_c, bronze_c], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s, 3], [aux, aux], 'g--', 'LineWidth', 0.2);
title("BRONZE - Lanczos : omega_c = 1.95, M = 100, L = 4");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]");
hold off

% Faze 
subplot(3,3,4)
plot(om_gold/pi,unwrap(angle(F_gold))); % frecventa normalizata
title("GOLD - Cebisev : omega_c = 1.95, M = 98 , r = 94");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,5)
plot(om_silver/pi,unwrap(angle(F_silver))); % frecventa normalizata
title("SILVER - Kaiser : omega_c = 1.97, M = 100, beta = 10");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")
subplot(3,3,6)
plot(om_bronze/pi,unwrap(angle(F_bronze))); % frecventa normalizata
title("BRONZE - Lanczos : omega_c = 1.95, M = 100, L = 4");
xlabel("Frecventa normalizata")
ylabel("Faza [rad]")


%% FAZA 5
%Astfel, criteriul ar trebui sa ajunga intr-un punct optimal pentru: 
%     * ordine M cat mai mici; 
%     * benzi de tranzitie realizate cat mai inguste (omega_sr-omega_pr); 
%     * tolerante realizate cat mai mici si inferioare celor impuse (Delta_pr<Delta_p, Delta_sr<Delta_s). 

% Aceasta problema se va concentra in jurul ferestrei ce ocupa locul GOLD
% la faza anterioara : Cebisev, si se va modifica putin faza 4

vector_aux1 = [];
vector_aux2 = [];
vector_aux3 = [];
vector_aux4 = [];
%primul vector => stocam sumele, al 2-lea => stocam M, al 3-lea => stocam omega_c
for M = 2:1:100 % initial
    for omega_c = 0.1:0.1:3.14 
        for aux = 80:1:100   
            tip = "cebisev";
        
            [filtru_faza4,M_aux,omega_c_aux,~] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s);
            [Delta_pr_aux,Delta_sr_aux] = faza3_puncta(filtru_faza4,omega_p,omega_s);
            [F, ~] = freqz(filtru_faza4,5000);
            absolut = abs(F);
            K_p = find(absolut >= (1-Delta_p),1, 'last');
            K_s = find(absolut <= Delta_s,1,'first');
            omega_pr=om_window(K_p);
            omega_sr=om_window(K_s);
            banda = omega_sr - omega_pr;
            vector_aux1 = [vector_aux1,banda]; 
            vector_aux2 = [vector_aux2,M_aux];
            vector_aux3 = [vector_aux3,omega_c_aux];
            vector_aux4 = [vector_aux4,aux];
        end
    end
end

% se afla banda minima din valorile stocate in vector_aux
banda_minima_cebisev = min(vector_aux1);
% se afla pozitia pe care se afla banda_minima => aflam M minim
pozitie =  find(vector_aux1 == banda_minima_cebisev);
pozitie = pozitie(1);
M_minim_cebisev = vector_aux2(pozitie);
omega_minim_cebisev = vector_aux3(pozitie);
r_minim = vector_aux4(pozitie);

%Verificarea tolerantei prin apelarea functiei
[~,~,~,verificare_toleranta] = Faza4_concurs(M_minim_cebisev,tip,omega_minim_cebisev,omega_p,omega_s,aux,Delta_p,Delta_s);

% TOLERANTA ACCEPTATA

% omega_c = 0.1, M = 2 , r = 80 

%%
omega_minim_cebisev = 0.1;
M_minim_cebisev = 2 ;
r_minim = 80;      
frecv5 = omega_minim_cebisev / pi;

% Fereastra
w5= chebwin(M_minim_cebisev,r_minim);
w5 = w5 / sum(w5); % normare

% Filtru
f5 = fir1(M_minim_cebisev-1,frecv5,w5);
[F5, om5] = freqz(f5,5000);

absolut = abs(F5);
K_p = find(absolut >= (1-Delta_p),1, 'last');
K_s = find(absolut <= Delta_s,1,'first');
omega_pr=om5(K_p);
omega_sr=om5(K_s);

figure(20);
subplot(1,3,1);
plot(om5,mag2db(abs(F5)));
hold on
plot([omega_p, omega_p], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_minim_cebisev, omega_minim_cebisev], [-250, 0], 'r', 'LineWidth', 0.2); 
plot([omega_s, omega_s], [-250, 0], 'r', 'LineWidth', 0.2);

Delta_p_decibeli = Delta_p/100;
Delta_p_decibeli1 = mag2db(Delta_p_decibeli);
plot([0, omega_p], [Delta_p_decibeli1+(-74), Delta_p_decibeli1+(-74)], 'g--', 'LineWidth', 0.2);
aux = (-74)-Delta_p_decibeli1;
plot([0, omega_p], [ aux, aux], 'g--', 'LineWidth', 0.2);

Delta_s_decibeli = Delta_s / 100;
aux = -74 +(-74 - (mag2db(Delta_s_decibeli)));
plot([omega_s   , 3], [aux, aux], 'g--', 'LineWidth', 0.2);
title("Cebisev : omega_c = 0.1, M = 2 , r = 80 ");
xlabel("Pulsatie")
ylabel("Magnitudine [dB]");
legend({'filtru', '\omega_pr', '\omega_c', '\omega_sr', '1+-\Delta_p', '\Delta_s'}, 'Location', 'Best');
hold off

subplot(1,3,2)
plot(om5/pi,unwrap(angle(F5))); % frecventa normalizata
title("Cebisev : omega_c = 0.1, M = 2 , r = 80 ");
xlabel("Frecventa normalizata");
ylabel("Faza [rad]");

subplot(1,3,3);
stem(f5)
title("Cebisev : omega_c = 0.1, M = 2 , r = 80 ");
xlabel("Secventa - pozitie");
ylabel("Valoarea asociata pozitiei");
