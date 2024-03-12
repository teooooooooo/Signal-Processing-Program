function [verificare_toleranta] = Faza3_punctb2(Delta_pr,Delta_p,Delta_sr,Delta_s)
% filtrele la care cel putin una dintre tolerantele realizate este superioara celei impuse vor fi degradate
% PIRVAN TEODORA-MARIA, 333AC
if Delta_pr < Delta_p && Delta_sr < Delta_s
    verificare_toleranta = 1;
else
    verificare_toleranta = 0;
end

end