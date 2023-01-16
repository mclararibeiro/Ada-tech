-- MODELAGEM DATABASE 

create database futebol;
create schema jogos;

create table jogos.estado(
idestado integer,
nome_estado varchar(50),
uf char(2),
primary key (idestado)
);

create table jogos.cidade(
idcidade integer,
nome_cidade varchar(50),
idestado integer,
primary key (idcidade),
foreign key (idestado) references jogos.estado (idestado)
);


create table jogos.time(
id serial,
time varchar(50),
idcidade integer,
primary key (id),
foreign key (idcidade) references jogos.cidade (idcidade)
);

create table jogos.jogadores(
idjogador integer,
nome_jogador varchar(50),
idtime integer,
idade integer,
primary key (idjogador),
foreign key (idtime) references jogos.time(id)
);

create table jogos.partidas(
idjogo integer,
idtime1 integer,
idtime2 integer,
data date,
golstime1 integer,
golstime2 integer,
descricao varchar(50),
primary key (idjogo),
foreign key (idtime1) references jogos.time(id),
foreign key (idtime2) references jogos.time(id)
);

-- POPULAÇÃO DO BANCO

insert into jogos.estado(idestado,nome_estado,uf)
values
('81','Pernambuco','PE'),
('82','Alagoas','AL'),
('83','Paraíba','PB'),
('84','Rio Grande do Norte','RN');

insert into jogos.cidade(idcidade,nome_cidade,idestado)
values 
('1001','Recife','81'),
('1002','Maceió','82'),
('1003','João Pessoa','83'),
('1004','Natal','84');

insert into jogos.time(time,idcidade)
values 
('Santa Cruz','1001'),
('CRB','1002'),
('Campinense','1003'),
('América-RN','1004');

insert into jogos.jogadores(idjogador,nome_jogador,idtime,idade)
values 
('1','Tiago','1','30'),
('2','Victor','1','20'),
('3','Alemão','1','18'),
('4','Danny','1','30'),
('5','Renatinho','1','25'),
('6','Natan','1','31'),
('7','Sandro Manoel','1','20'),
('8','Caça Rato','1','30'),
('9','Grafite','1','23'),
('10','Guilherme Vicente','1','23'),
('11','Joaão Paulo','1','24'),
('12','Vitor','2','31'),
('13', 'Reginaldo','2','29'),
('14','W.Carvalho','2','34'),
('15','Guilherme Romao','2','34'),
('16','Yago','2','25'),
('17','Juninho','2','32'),
('18','D.Medeiros','2','28'),
('19','Fabinho','2','33'),
('20','Anselmo Ramon','2','32'),
('21','E.R Bezerra','2','22'),
('22','M.M Guimarães','2','23'),
('23','Mateus Santanta','3','25'),
('24','Cesar Augusto','3','28'),
('25','Guilherme Campana','3','23'),
('26','Alan Franciso','3','21'),
('27','Diego','3','29'),
('28','Dione','3','34'),
('29','Bremer Literre','3','26'),
('30','Lucas Alisson','3','34'),
('31','Carlos Eduardo','3','21'),
('32','Pedro Henrique','3','19'),
('33','Fumaça','3','24'),
('34','Romulo','4','29'),
('35','Elvis','4','18'),
('36','Wermersson','4','24'),
('37','Lucielmo','4','28'),
('38','Wallace PE','4','29'),
('39','Erivan Pedro','4','28'),
('40','Fauver','4','18'),
('41','Cleto Freire','4','20'),
('42','Tessio','4','22'),
('43','Maycon','4','33'),
('44','Maria Clara','4','24');

insert into jogos.partidas(idjogo,idtime1,idtime2,data,golstime1,golstime2,descricao)
values 
('1','1','2','01/01/2023','3','1','fase de grupos'),
('2','3','4','01/01/2023','2','0','fase de grupos'),
('3','1','3','04/01/2023','2','2','fase de grupos'),
('4','2','4','04/01/2023','1','1','fase de grupos'),
('5','1','4','07/01/2023','3','2','fase de grupos'),
('6','2','3','07/01/2023','0','2','fase de grupos'),
('7','2','1','10/01/2023','1','2','fase de grupos'),
('8','4','3','10/01/2023','1','4','fase de grupos'),
('9','3','1','13/01/2023','1','2','fase de grupos'),
('10','4','2','13/01/2023','0','0','fase de grupos'),
('11','4','1','16/01/2023','0','1','fase de grupos'),
('12','3','2','16/01/2023','2','0','fase de grupos'),
('13','1','3','19/01/2023','5','2','final');






