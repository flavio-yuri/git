dia(1). %Domingo
dia(2). %Segunda
dia(3). %Terça
dia(4). %Quarta
dia(5). %Quinta
dia(6). %Sexta
dia(7). %Sábado

semana(1).
semana(2).
semana(3).
semana(4).


%O jeito que eu pensei seri
% tarefa(identificador, viagem, dia, hora, semana, tabela).
%Mas como saber o número de viagens de cada tarefa?
% Os números grandes são pra representar hora e minuto, por exemplo, 6:15 é 615.
tarefa(1, viagem1, 1..7, 1..4, tabela1).
tarefa(1, viagem4, 1..7, 1..4, tabela1).
%tarefa(1, viagem5, 1..7, 1..4, tabela1).
tarefa(2, viagem2, 1..7, 1..4, tabela2).
tarefa(2, viagem7, 1..7, 1..4, tabela2).
tarefa(2, viagem5, 1..7, 1..4, tabela2).
tarefa(3, viagem1, 1..7, 1..4, tabela1).
tarefa(3, viagem4, 1..7, 1..4, tabela1).