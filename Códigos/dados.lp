motorista(antonio).
motorista(claudia).
motorista(besouro).
motorista(geraldo).
motorista(raimundo).
motorista(poupanca).
motorista(larissa).
motorista(adriana).
motorista(fransisco).
motorista(carlos).
motorista(cleiton).
motorista(leonardo).
motorista(juliana).
motorista(ronildo).
motorista(alex).
%motorista(vinicius).
%motorista(segundo).
%motorista(savio).
%motorista(pedro).
%motorista(joao).
%motorista(paulo).
%motorista(viviane).
%motorista(wladimir).
%motorista(filho).
%motorista(leonara).




%Uma linha possui varias tabelas
% linha(identificador, tabela).
% linha(identificador, pontoPartida, pontoChegada). Tirei a tabela da linha, pq eu acho que a linha existe independente de tabela.
linha(linha1, custodio, sede).
linha(linha2, carrascal, california).
linha(linha3, dMauricio, riachoVerde).
linha(linha4, gogo, multirao).
linha(linha5, cipoAnjos, lagoa).




%horaDeFimDaTarefa

% 0:00 = 0.
% 1:00 = 60.
% 2:00 = 120.
% 3:00 = 180.
% 4:00 = 240.
% 5:00 = 300.
% 6:00 = 360.
% 7:00 = 420.
% 8:00 = 480.
% 9:00 = 540.
% 10:00 = 600.
% 11:00 = 660.
% 12:00 = 720.
% 13:00 = 780.
% 14:00 = 840.
% 15:00 = 900.
% 16:00 = 960.
% 17:00 = 1020.
% 18:00 = 1080.
% 19:00 = 1140.
% 20:00 = 1200.
% 21:00 = 1260.
% 22:00 = 1320.
% 23:00 = 1380.
% 24:00 = 1440.


%tabelas de horários contêm viagens.
% tabela(identificador, viagem, inicioDaViagem).
tabela(1, 1, 360).
tabela(1, 2, 430).
tabela(1, 3, 400).
tabela(1, 4, 475).
tabela(1, 5, 510).
tabela(1, 6, 540).
tabela(1, 7, 600).
tabela(2, 1, 390).
tabela(2, 2, 480).
tabela(2, 3, 405).
tabela(2, 4, 515).
tabela(2, 5, 550).
tabela(2, 6, 590).
tabela(2, 7, 620).
tabela(2, 8, 685).


%O tempo de viagem vai ficar assim, como 1 hora é 60 minutos, meia-noite será 0, 1 da mdarugada será 60, 2 da madruga será 120 e por aí vai
%viagem(identificador, linha, tempo).
viagem(1, linha1, 60).
viagem(2, linha2, 60).
viagem(3, linha1, 65).
viagem(4, linha2, 60).
viagem(5, linha3, 60).
viagem(6, linha4, 60).
viagem(7, linha5, 60).
viagem(8, linha1, 60).