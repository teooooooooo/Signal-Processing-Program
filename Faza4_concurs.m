function [filtru,M_aux,omega_aux,verificare_toleranta] = Faza4_concurs(M,tip,omega_c,omega_p,omega_s,aux,Delta_p,Delta_s)
% PIRVAN TEODORA-MARIA, 333AC

% aux este folosit pentru cazurile in care poate exista un parametru aditional
% daca aux = 0 => nu exista parametru
% aux!= 0 => exista parametru

% Se verifica tipul ferestrei => se formeaza fereastra propriu zisa
if aux == 0
    if tip == "dreptunghiulara"
        window = boxcar(M);
    elseif tip == "triunghiulara"
        window = triang(M);
    elseif tip == "blackman"
        window = blackman(M);
    elseif tip == "hamming"
        window = hamming(M);
    elseif tip == "hanning"
        window = hanning(M);
    else
        fprintf("Greseala!");
    end
end

if aux ~= 0
    if tip == "cebisev"
        window = chebwin(M,aux);
    elseif tip == "kaiser"
        window = kaiser(M,aux);
    elseif tip == "tuckey"
        window = tukeywin(M,aux);
    elseif tip == "lanczos"
        window = functie_fereastra_lanczos(M,aux);
    else 
        fprintf("Greseala!");
    end
end

% Normare frecventa
freq_c=omega_c/pi;

% Se realizeaza filtrul ferestrei cu ajutorul functiei fir1
filtru = fir1(M-1,freq_c,window);

% Se afla tolerantele, respectiv suma dintre acestea
[Delta_pr,Delta_sr] = faza3_puncta(filtru,omega_p,omega_s);

% Afisari

fprintf("Suma dintre /Delta_p_r si /Delta_p_s este %f\n\n", Delta_pr + Delta_sr);

if aux == 0
    if tip == "dreptunghiulara"
        fprintf("Filtru de ordin %d realizat cu fereastra dreptunghiulara\n\n",M);
    elseif tip == "triunghiulara"
        fprintf("Filtru de ordin %d realizat cu fereastra triunghiulara\n\n",M);
    elseif tip == "blackman"
        fprintf("Filtru de ordin %d realizat cu fereastra blackman\n\n",M);
    elseif tip == "hamming"
        fprintf("Filtru de ordin %d realizat cu fereastra hamming\n\n",M);
    elseif tip == "hanning"
        fprintf("Filtru de ordin %d realizat cu fereastra hanning\n\n",M);
    end
end

if aux ~= 0
    if tip == "cebisev"
        fprintf("Filtru de ordin %d realizat cu fereastra Cebisev, parametrul aditional avand valoarea %f\n\n", M,aux);
    elseif tip == "kaiser"
        fprintf("Filtru de ordin %d realizat cu fereastra Kaiser, parametrul aditional avand valoarea %f\n\n", M,aux);
    elseif tip == "tuckey"
        fprintf("Filtru de ordin %d realizat cu fereastra Tuckey, parametrul aditional avand valoarea %f\n\n", M,aux);
    elseif tip == "lanczos"
        fprintf("Filtru de ordin %d realizat cu fereastra Lanczos, parametrul aditional avand valoarea %f\n\n", M,aux);
    end
end
   verificare_toleranta = Faza3_punctb2(Delta_pr,Delta_p,Delta_sr,Delta_s);
   M_aux = M;
   omega_aux = omega_c;
end