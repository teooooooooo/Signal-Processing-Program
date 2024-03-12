function [window] = functie_fereastra_lanczos(M,L)

n = 0 : M-1;
% functia propriu-zisa 4.12
window = ( sin(2 * pi * ((2*n - M + 1)/(2 *(M-1))))./(2*pi*((2*n - M+1)/(2*(M - 1))))).^L;
if mod(M, 2)
    window((M-1)/2 + 1) = 1;
end

end
