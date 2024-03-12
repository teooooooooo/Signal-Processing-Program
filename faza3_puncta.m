function [Delta_pr,Delta_sr] = faza3_puncta(h,omega_p,omega_s)
% PIRVAN TEODORA-MARIA, 333AC
banda_trecere = 0:omega_p/1000:omega_p; % realizare banda trecere [0,omega_p];
banda_stopare = omega_s: omega_s/1000:pi; % realizare banda stopare
H1 = freqz(h,1,banda_trecere);
H2 = freqz(h,1,banda_stopare);
Delta_pr = max(abs(1-abs(H1))); % maximul distantei dintre |H|_p si 1 (pentru a determina Delta_pr)
Delta_sr =  max(abs(H2)); % maximul lui |H|_s (pentru a determina Delta_sr).

end