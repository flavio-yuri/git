motorista(antonio).
motorista(claudia).
motorista(besouro).


%coloco um identificador na viagem?
%O tempo de viagem vai ficar assim, como 1 hora é 60 minutos, meia-noite será 0, 1 da mdarugada será 60, 2 da madruga será 120 e por aí vai
%viagem(identificador, linha, tempo).
viagem(viagem1, linha1, 60).
viagem(viagem2, linha2, 60).
viagem(viagem3, linha1, 60).
viagem(viagem4, linha2, 60).
viagem(viagem5, linha3, 60).
viagem(viagem6, linha4, 60).
viagem(viagem5, linha3, 60).

%Uma linha possui varias tabelas
% linha(identificador, tabela).
% linha(identificador, pontoPartida, pontoChegada).
linha(linha1, custodio, sede, tabela1).
linha(linha2, carrascal, california, tabela1).
linha(linha3, dMauricio, riachoVerde, tabela2).
linha(linha4, gogo, multirao, tabela2).





%Restrição: Duas viagens só estão na mesma tarefa se os horários não chocarem.
:- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), tabela(Tabela, Viagem1, Hora1), tabela(Tabela, Viagem2, Hora2), viagem(Viagem1, _, TempoDaViagem), Hora1 + TempoDaViagem >= Hora2, Viagem1 != Viagem2.


%Restrição: O intervalo entre as viagens de uma tarefa não pode ser maior que 15 minutos.
:- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), viagem(Viagem1, _, Tempo1), viagem(Viagem2, _, Tempo2), tabela(Tabela, Viagem1, Inicio1), tabela(Tabela, Viagem2, Inicio2), Inicio1 + Tempo1 + 15 < Inicio2.




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
tabela(tabela1, viagem1, 360).
tabela(tabela1, viagem2, 450).
tabela(tabela2, viagem3, 375).
tabela(tabela2, viagem4, 485).

