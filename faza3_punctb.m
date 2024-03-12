function [filtru] = faza3_punctb(M,omega_c,tip)
% PIRVAN TEODORA-MARIA, 333AC
if tip == "kaiser"
    freq_c = omega_c / pi;
    beta = 7.6486;
    omega_p = 1.7236; % asemanatoare cu omega_c
    omega_s = 2.1829;

    % Fereastra

    w_kaiser = kaiser(M,beta);
    w_kaiser = w_kaiser / sum(w_kaiser); % normare

    % Filtru

    filtru = fir1(M-1,freq_c,w_kaiser);
end

end
