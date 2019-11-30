horaDeComecoDaTarefa(Tarefa, Comeco):- tarefa(Tarefa, _, _, _, _), Comeco = #min {Horas: tarefa(Tarefa, Viagem, _, _, _), tabela(_, Viagem, Horas)}.

horaDeFimDaTarefa(Tarefa, Fim) :- tarefa(Tarefa, _, _, _, _), Fim = #max {N,Viagem : tarefa(Tarefa, Viagem, _, _, _), tabela(_, Viagem, Horas), viagem(Viagem, _, Tempo), N = Horas + Tempo}.


%Restrição: Duas viagens só estão na mesma tarefa se os horários não chocarem.

horaQueAViagemTermina(Tabela, Viagem, N) :- viagem(Viagem, _, Tempo), tabela(Tabela, Viagem, Hora), N = Tempo + Hora.

:- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), tabela(Tabela, Viagem2, Hora2), horaQueAViagemTermina(Viagem1, N, Tabela), Viagem1 < Viagem2, N > Hora2.


%Restrição nova: A próxima viagem da tarefa.
proximaViagem(Tarefa, Viagem1, N) :- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), N = #min {Viagem2: tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), Viagem2 > Viagem1}.


%Restrição: O intervalo entre as viagens de uma tarefa não pode ser maior que 20 minutos.
:- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), horaQueAViagemTermina(Viagem1, N, Tabela), tabela(Tabela, Viagem2, Inicio2), N + 20 < Inicio2, proximaViagem(Tarefa, Viagem1, Viagem2).
	

%Restrição: Todo motorista tem que estar alocado em pelo menos uma tarefa.
1 <= {alocacao(Motorista, Tarefa, Dia, Semana, Tabela) : tarefa(Tarefa, Viagem, Dia, Semana, Tabela)} :- motorista(Motorista).


%alocacao(antonio,3,1,1,1).
%alocacao(antonio,1,1,1,1).

%Restrição: Toda tarefa tem que estar alocada para um motorista.
1 <= #count{Motorista: alocacao(Motorista, Tarefa, Dia, Semana, Tabela) : motorista(Motorista)} :- tarefa(Tarefa, Viagem, Dia, Semana, Tabela), dia(Dia), semana(Semana).

#show alocacao/5.