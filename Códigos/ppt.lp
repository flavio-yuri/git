horaDeComecoDaTarefa(Tarefa, Comeco):- tarefa(Tarefa, _, _, _, _), Comeco = #min {Horas: tarefa(Tarefa, Viagem, _, _, _), tabela(_, Viagem, Horas)}.

horaDeFimDaTarefa(Tarefa, Fim) :- tarefa(Tarefa, _, _, _, _), Fim = #max {N,Viagem : tarefa(Tarefa, Viagem, _, _, _), tabela(_, Viagem, Horas), viagem(Viagem, _, Tempo), N = Horas + Tempo}.


%Restrição: Duas viagens só estão na mesma tarefa se os horários não chocarem.

horaQueAViagemTermina(Viagem, N, Tabela) :- viagem(Viagem, _, Tempo), tabela(Tabela, Viagem, Hora), N = Tempo + Hora.

:- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), tabela(Tabela, Viagem2, Hora2), horaQueAViagemTermina(Viagem1, N, Tabela), Viagem1 < Viagem2, N > Hora2.


%Restrição nova: A próxima viagem da tarefa.
proximaViagem(Tarefa, Viagem1, N) :- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), N = #min {Viagem2: tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), Viagem2 > Viagem1}.


%Restrição: O intervalo entre as viagens de uma tarefa não pode ser maior que 15 minutos.
:- tarefa(Tarefa, Viagem1, Dia, Semana, Tabela), tarefa(Tarefa, Viagem2, Dia, Semana, Tabela), horaQueAViagemTermina(Viagem1, N, Tabela), tabela(Tabela, Viagem2, Inicio2), N + 15 < Inicio2, proximaViagem(Tarefa, Viagem1, Viagem2).
	

%Restrição: Todo motorista tem que estar alocado em pelo menos uma tarefa.
1 <= {alocacao(Motorista, Tarefa, Dia, Semana, Tabela) : tarefa(Tarefa, Viagem, Dia, Semana, Tabela)} :- motorista(Motorista).


%alocacao(antonio,3,1,1,1).
%alocacao(antonio,1,1,1,1).

%Restrição: Toda tarefa tem que estar alocada para um motorista.
1 <= #count{Motorista: alocacao(Motorista, Tarefa, Dia, Semana, Tabela) : motorista(Motorista)} :- tarefa(Tarefa, Viagem, Dia, Semana, Tabela), dia(Dia), semana(Semana).

%Restrição: Dois motoristas só podem pegar a mesma tarefa se forem em dias diferentes..
:- alocacao(Motorista1, Tarefa, Dia, Semana, Tabela), alocacao(Motorista2, Tarefa, Dia, Semana, Tabela), Motorista1 != Motorista2.




%alocacao(claudia,1,1,1,1).



%Percebi aqui que são a mesma coisa essas duas restrições

%Restrição 3.2: Só pode ter um motorista alocado para cada tarefa
:- alocacao(Motorista1, Tarefa, Dia, Semana, Tabela), alocacao(Motorista2, Tarefa, Dia, Semana, Tabela), Motorista1 != Motorista2.




%Restrição 3.2.1: O mesmo motorista só pode pegar mais de uma tarefa no mesmo dia se os horários não chocarem
:- alocacao(Motorista, Tarefa1, Dia, Semana, Tabela), alocacao(Motorista, Tarefa2, Dia, Semana, Tabela), horaDeFimDaTarefa(Tarefa1, Fim), horaDeComecoDaTarefa(Tarefa2, Comeco), Tarefa1 != Tarefa2, Comeco <= Fim.





%Restrição 3.2.2: O motorista só pode ser alocado em uma tabela.
%:- alocacao(Motorista, _, Dia, Semana, Tabela1), alocacao(Motorista, _, Dia, Semana, Tabela2), Tabela2 != Tabela1.


%alocacao(antonio,3,1,1,1).
%alocacao(antonio,2,1,1,2).




%O motorista pode pegar duas tarefas no mesmo dia, nas respostas que tem dado aparecem apenas um motorista pega uma tarefa por dia, talvez seja por que tem menos tarefas do que motoristas, se não for, eu tô lascadom pq eu sei dizer o que não pode fazer, mas o que pode eu não sei.



%Restrição 3.3: Diz se o motorista trabalhou em tal dia de tal semana.
trabalhou(Motorista, Dia, Semana) :- alocacao(Motorista, _, Dia, Semana, _).


%Restrição 3.4: Diz que se o motorista for alocado em pelo menos um dia da escala, ele está sendo usado na escala.
escalado(Motorista, Dia, Semana):- trabalhou(Motorista, Dia, Semana).


%Restrição 3.5, 3.6: Determina a última tarefa do turno.
%ultimaTarefaDoDia(Tarefa1, Motorista, Dia, Semana):- alocacao(Motorista, Tarefa1, Dia, Semana, Tabela), not alocacao(Motorista, Tarefa2, Dia, Semana, Tabela), tarefa(Tarefa1, _, Dia, Semana, Tabela), tarefa(Tarefa2, _, Dia, Semana, Tabela), Tarefa2-Tarefa1 == 1.

%alocacao(antonio,1,1,1,1).
%alocacao(antonio,3,1,1,1).


ultimaTarefaDoDia(Motorista, Tarefa1, Dia, Semana) :- motorista(Motorista), dia(Dia), semana(Semana), N = #max{Comeco, Tarefa: alocacao(Motorista, Tarefa, Dia, Semana, Tabela), horaDeComecoDaTarefa(Tarefa, Comeco), tabela(Tabela, _, _)}, alocacao(Motorista, Tarefa1, Dia, Semana, _), horaDeComecoDaTarefa(Tarefa1, N). 




%Fazer restrição: O motorista só pode ser alocado em duas tarefas diferentes se os horários não chocarem
%Acho que a 3.8 já garante isso



%Restrição nova: Determina qual a primeira tarefa do dia.
%primeiraTarefaDoDia(Motorista, Tarefa, Dia, Semana) :- alocacao(Motorista, Tarefa1, Dia, Semana, _), horaDeComecoDaTarefa(Tarefa1, Comeco), Comeco2 = #min{Horas: tarefa(Tarefa, Viagem, _, _, _), tabela(_, Viagem, Horas), Tarefa != Tarefa1}, Comeco2 > Comeco.



primeiraTarefaDoDia(Motorista, Tarefa1, Dia, Semana) :- motorista(Motorista), dia(Dia), semana(Semana), N = #min{Comeco, Tarefa: alocacao(Motorista, Tarefa, Dia, Semana, Tabela), horaDeComecoDaTarefa(Tarefa, Comeco), tabela(Tabela, _, _)}, alocacao(Motorista, Tarefa1, Dia, Semana, _), horaDeComecoDaTarefa(Tarefa1, N). 



%Restrição 3.7: O motorista só pode ter um turno por dia.
:- ultimaTarefaDoDia(Motorista, Tarefa1, Dia, Semana), alocacao(Motorista, Tarefa2, Dia, Semana, Tabela), horaDeComecoDaTarefa(Tarefa2, N), horaDeComecoDaTarefa(Tarefa1, M), N > M.


%ultimaTarefaDoDia(1, antonio, 1, 1).
%alocacao(antonio, 4, 1, 1, 1).

%Número arbitrário
%QuantidadeDescancsoMinimoEntreJornadas == 30.


%Restrição 3.8: Garante que o motorista tenha um descanso mínimo entre jornadas seguidas. Coloquei o tempo como meia hora
:- alocacao(Motorista, Tarefa1, Dia, Semana, Tabela), alocacao(Motorista, Tarefa2, Dia, Semana, Tabela), tarefa(Tarefa1, _, Dia, Semana, Tabela), tarefa(Tarefa2, _, Dia, Semana, _), horaDeFimDaTarefa(Tarefa1, Fim), horaDeComecoDaTarefa(Tarefa2, Comeco), Tarefa1 != Tarefa2, Fim > (Comeco-30).


%Fazer o dia depois?




%Restrição 3.9: O motorista tem que ter um descanso mínimo entre duas tarefas em dias diferentes.
%Coloquei como 8 horas, mas não sei se a tarefa tem que começar depois de 8 horas ou se com 8 horas depois já pode começar.
:- ultimaTarefaDoDia(Motorista, Tarefa1, Dia1, Semana), primeiraTarefaDoDia(Motorista, Tarefa2, Dia2, Semana), tarefa(Tarefa1, _, Dia1, Semana, _), tarefa(Tarefa2, _, Dia2, Semana, _), horaDeFimDaTarefa(Tarefa1, Fim), horaDeComecoDaTarefa(Tarefa2, Comeco), Dia2 - Dia1 == 1, N = Fim + 480, M = Comeco + 1440, N > M.


:- ultimaTarefaDoDia(Motorista, Tarefa1, Dia1, Semana1), primeiraTarefaDoDia(Motorista, Tarefa2, Dia2, Semana2), tarefa(Tarefa1, _, Dia1, Semana1, _), tarefa(Tarefa2, _, Dia2, Semana2, _), horaDeFimDaTarefa(Tarefa1, Fim), horaDeComecoDaTarefa(Tarefa2, Comeco), Dia2 == 1, Dia1 == 7, Semana2 - Semana1 = 1, N = Fim + 480, M = Comeco + 1440, N > M.


%alocacao(claudia, 5, 1, 1, 2).
%alocacao(claudia, 2, 2, 1, 2).


%Restrição 3.10 e 3.11: O motorista tem que trabalhar um minimo e máximo de horas (depende de cada empresa, por isso vou usar um número arbitrário).
%:- alocacao(Motorista, Tarefa1, Dia, Semana, _), alocacao(Motorista, Tarefa2, Dia, Semana, _), primeiraTarefaDoDia(Motorista, Tarefa1, Dia, Semana), ultimaTarefaDoDia(Motorista, Tarefa2, Dia, Semana), horaDeComecoDaTarefa(Tarefa1, Comeco), horaDeFimDaTarefa(Tarefa2, Fim), N = Fim-Comeco, 600 < N; N < 240.

tantoQueMotoristaTrabalhouNoDia(Motorista, Dia, Semana, N) :- alocacao(Motorista, Tarefa1, Dia, Semana, _), alocacao(Motorista, Tarefa2, Dia, Semana, _), primeiraTarefaDoDia(Motorista, Tarefa1, Dia, Semana), ultimaTarefaDoDia(Motorista, Tarefa2, Dia, Semana), horaDeComecoDaTarefa(Tarefa1, Comeco), horaDeFimDaTarefa(Tarefa2, Fim), N = Fim-Comeco.

:- tantoQueMotoristaTrabalhouNoDia(Motorista, Dia, Semana, N), N > 600.
%:- tantoQueMotoristaTrabalhouNoDia(Motorista, Dia, Semana, N), N < 240.
%Essa dá errado, mas eu acho que é pq tem poucas tarefas.

%alocacao(antonio, 1, 1, 1, 1).
%alocacao(antonio, 3, 1, 1, 1).
%alocacao(antonio, 4, 1, 1, 1).
%alocacao(antonio, 6, 1, 1, 1).




%Restrição 3.12: Saber se o motorista trabalhou mais ou menos do que necessário(semanal). É realmente necessária?
%A ideia é mais ou menos parecida com a restrição acima, que não está funcionando.
%Restrição 3.13: Saber quantas horas a mais o motorista fez na semana.
% Mesma ideia, juntei as duas.

%trabalhouAMais(Motorista,Semana, Mais) :- HorasSemanais = #sum{Horas: alocacao(Motorista, Tarefa1, Dia, Semana, _), alocacao(Motorista, Tarefa2, Dia, Semana, _), primeiraTarefaDoDia(Motorista, Tarefa1, Dia, Semana), ultimaTarefaDoDia(Motorista, Tarefa2, Dia, Semana), horaDeComecoDaTarefa(Tarefa1, Comeco), horaDeFimDaTarefa(Tarefa2, Fim), Horas = Fim - Comeco}, HorasSemanais > 40, Mais = HorasSemanais - 40, motorista(Motorista), semana(Semana).


trabalhouAMais(Motorista, Semana, Mais) :- motorista(Motorista), semana(Semana), HorasSemanais = #sum{Horas: tantoQueMotoristaTrabalhouNoDia(Motorista, Dia, Semana, Horas), dia(Dia)}, HorasSemanais > 2400, Mais = HorasSemanais - 2400.


%trabalhouAMenos(Motorista,Semana, Menos) :- HorasSemanais = #sum{Horas: alocacao(Motorista, Tarefa1, Dia, Semana, _), alocacao(Motorista, Tarefa2, Dia, Semana, _), primeiraTarefaDoDia(Motorista, Tarefa1, Dia, Semana), ultimaTarefaDoDia(Motorista, Tarefa2, Dia, Semana), horaDeComecoDaTarefa(Tarefa1, Comeco), horaDeFimDaTarefa(Tarefa2, Fim), Horas = Fim - Comeco}, HorasSemanais < 40, Menos = 40 - HorasSemanais, motorista(Motorista), semana(Semana).


trabalhouAMenos(Motorista, Semana, Menos) :- motorista(Motorista), semana(Semana), HorasSemanais = #sum{Horas: tantoQueMotoristaTrabalhouNoDia(Motorista, Dia, Semana, Horas), dia(Dia)}, HorasSemanais < 2400, Menos = 2400 - HorasSemanais.


%Restrição 3.14: Impõe um limite máximo de horas extras que o motorista pode fazer, mas isso eu acho que dá pra fazer nas restrições acima.
:- motorista(Motorista), semana(Semana), trabalhouAMais(Motorista, Semana, Mais), Mais > 600.

:- motorista(Motorista), semana(Semana), trabalhouAMenos(Motorista, Semana, Menos), Menos > 1200.


%Restrição 3.15: Referente às leis trabalhistas, garante que o motorista deve ter um dia de descanso, pois há uma quantidade máxima de dias sem folga (que, mais uma vez, será escolhido um valor arbitrário, coloquei o valor como um dia só).
% Vou fazer na força bruta, depois eu tento fazer mais bonitinho.
%{alocacao(Motorista, Tarefa, Dia, Semana, Tabela) : tarefa(Tarefa, Viagem, Dia, Semana, Tabela)} <= 5 :- motorista(Motorista), semana(Semana).
%:- alocacao(Motorista, _, X..Y, Semana, _), alocacao(Motorista, _, Y+1, Semana, _), X = 1..2, Y = 2..6 , Y - X == 4.

%alocacao(antonio, 1, 1..6, 1, 1).



%:- alocacao(Motorista, _, 3..7, Semana1, _), alocacao(Motorista, _, 1, Semana2, _), Semana2 - Semana1 == 1.
%:- alocacao(Motorista, _, 4..7, Semana1, _), alocacao(Motorista, _, 1, Semana2, _), alocacao(Motorista, _, 2, Semana2, _), Semana2 - Semana1 == 1.
%:- alocacao(Motorista, _, 5..7, Semana1, _), alocacao(Motorista, _, 1..2, Semana2, _), alocacao(Motorista, _, 3, Semana2, _), Semana2 - Semana1 == 1.
%:- alocacao(Motorista, _, 6..7, Semana1, _), alocacao(Motorista, _, 1..3, Semana2, _), alocacao(Motorista, _, 4, Semana2, _), Semana2 - Semana1 == 1.
%:- alocacao(Motorista, _, 7, Semana1, _), alocacao(Motorista, _, 1..4, Semana2, _), alocacao(Motorista, _, 5, Semana2, _), Semana2 - Semana1 == 1.


%Eu acho que essas últimas restrições já correspondem a restrição 3.16, que pelo o que eu entendi faz a "virada da semana".


%Restrição 3.17 e 3.18: Garante uma folga no domingo a cada período de tempo (preciso realmente dizer que é arbitrário?)
%Quando eu criar mais semanas, eu volto pra essa.
%:- alocacao(Motorista, _, _, Semana1, _), alocacao(Motorista, _, _, Semana2, _), alocacao(Motorista, _, _, Semana3, _), alocacao(Motorista, _, 1, Semana4, _), Semana2 - Semana1 == 1, Semana3 - Semana2 == 1, Semana4 - Semana3 == 1.


%Restrição 3.19: Perguntar ao Paulo, pq o jeito que eu pensei usa as mesmas coisas das que eu não fiz acima.
% Soma o tamanho das tarefas.
tamanhoDeTodasAsTarefas(N):- Semana=1, N = #sum{Tamanho: tarefa(Tarefa, _, _, Semana, _), semana(Semana), horaDeFimDaTarefa(Tarefa, Fim), horaDeComecoDaTarefa(Tarefa, Comeco), Tamanho = Fim - Comeco}.

%A quantidade de Motoristas é o tamanho de todas as tarefas dividido pela quantidade de horas semanais(sem horas extras). No modelo se acrescenta uma variável g, que serve pra cobrir os dias de folga, aí eu não entendi o que é realmente essa variável, já que ela só aparece aí.
qtdMotoristas(Qtd) :- tamanhoDeTodasAsTarefas(N), Qtd = 2*((N)/(44 * 60)).
:- qtdMotoristas(Qtd), Qtd > N, N = #count {Motorista: escalado(Motorista, _, Semana), motorista(Motorista), semana(Semana)}.

%Restrição 3.21: Indica a quantidade de horas não aproveitadas pelo motorista, perguntar ao Paulo, pois a ideia é a mesma da 3.13.
%Acho que já fiz.

%#const m = motorista.

%Restrição 3.22: Indica que o número de motoristas usados seja o mesmo encontrado pelo outro modelo (?).
%m {escalado(Motorista, Dia, Semana) : motorista(Motorista)} m :- tarefa(Tarefa, _, Dia, _, Semana, _).


#show alocacao/5.
%#show tantoQueMotoristaTrabalhouNoDia/4.
%#show ultimaTarefaDoDia/4.
%#show primeiraTarefaDoDia/4.
%#show horaDeFimDaTarefa/2.
%#show horaDeComecoDaTarefa/2.
%#show tamanhoDeTodasAsTarefas/1.
%#show qtdMotoristas/1.
%#show horaQueAViagemTermina/3.
%#show proximaViagem/3.
%#show trabalhouAMais/3.