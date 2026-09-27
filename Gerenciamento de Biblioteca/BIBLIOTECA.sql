drop database if EXISTS biblioteca;

CREATE DATABASE IF NOT EXISTS  biblioteca;
USE BIBLIOTECA;

CREATE TABLE IF NOT EXISTS AUTOR (
idautor INT PRIMARY	KEY NOT NULL AUTO_INCREMENT,
nomeautor VARCHAR (100),
nacionalidade VARCHAR (50),
biografia TEXT
);

CREATE TABLE IF NOT EXISTS USUARIO(
idusuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomeusuario VARCHAR (150),
CPF VARCHAR (14) UNIQUE ,
telefone VARCHAR (15) UNIQUE ,
email VARCHAR (150),
tipousuario ENUM ('ADMINISTRADOR','COMUM'),
status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS GENERO (
idgenero INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nomegenero VARCHAR (100),
descricao TEXT
);

CREATE TABLE IF NOT EXISTS PRATELEIRA (
idPrateleira INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numero VARCHAR (10),
Capacidade INT,
Localizacao VARCHAR (100),
TipoMaterial VARCHAR (20)
);

CREATE TABLE IF NOT EXISTS ItemACERVO (
IdItem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
TipoItem ENUM ('LIVRO','CD'),
Status ENUM ('DISPONIVEL','EMPRESTADO', 'ATRASADO','DANIFICADO'),
IDPRATELEIRA INT,
FOREIGN KEY (IDPRATELEIRA) REFERENCES Prateleira (idprateleira)
);

CREATE TABLE IF NOT EXISTS LIVRO (
IDLIVRO INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
TITULO VARCHAR (200),
edicao INT, 
ISBN VARCHAR (20) UNIQUE,
idautor INT,
descricao TEXT,
IdItem INT UNIQUE,
FOREIGN KEY (idautor) REFERENCES AUTOR (idautor),
FOREIGN KEY (idITEM) REFERENCES ItemACERVO (iditem)
);


CREATE TABLE IF NOT EXISTS CD (
IDCD INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
IdItem INT, 
ARTISTA VARCHAR (100),
ALBUM VARCHAR (100),
DURACAO VARCHAR (10),
GENEROMUSICAL VARCHAR (100),
FOREIGN KEY (iditem) REFERENCES ITEMACERVO (iditem)
);

CREATE TABLE IF NOT EXISTS EMPRESTIMO  (
IdEmperestimo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
idUsuario INT,
iditem INT,
DataEmprestimo DATE,
Datadevolucao DATE ,
Datadevolvida DATE,
Status VARCHAR (50),
FOREIGN KEY (iditem) REFERENCES ITEMACERVO (iditem),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO (IDUSUARIO)
);

CREATE TABLE IF NOT EXISTS LIVRO_GENERO (
IDLIVRO INT NOT NULL, 
IDGENERO INT NOT NULL,
FOREIGN KEY (IDLIVRO) REFERENCES LIVRO(IDLIVRO), 
FOREIGN KEY (IDGENERO) REFERENCES GENERO(IDGENERO)
);

INSERT INTO AUTOR (nomeautor, nacionalidade, biografia) VALUES
('Machado de Assis', 'Brasileiro', 'Escritor brasileiro considerado um dos principais nomes da literatura nacional.'),
('José de Alencar', 'Brasileiro', 'Escritor brasileiro associado ao Romantismo e à formação da literatura nacional.'),
('Graciliano Ramos', 'Brasileiro', 'Escritor brasileiro conhecido por obras de caráter regionalista e social.'),
('João Guimarães Rosa', 'Brasileiro', 'Escritor brasileiro conhecido por sua linguagem inovadora e obras ambientadas no sertão.'),
('F. Scott Fitzgerald', 'Americano', 'Escritor norte-americano conhecido por retratar a sociedade dos Estados Unidos no século XX.'),
('Gabriel García Márquez', 'Colombiano', 'Escritor colombiano conhecido pelo realismo mágico e por sua influência na literatura latino-americana.'),
('Miguel de Cervantes', 'Espanhol', 'Escritor espanhol considerado um dos grandes nomes da literatura ocidental.'),
('Oscar Wilde', 'Irlandês', 'Escritor irlandês conhecido por seus romances, peças teatrais e ensaios.'),
('Jane Austen', 'Britânica', 'Escritora britânica conhecida por romances que retratam relações sociais e familiares.'),
('Franz Kafka', 'Tcheco', 'Escritor de língua alemã conhecido por obras marcadas pelo absurdo e pela burocracia.'),
('Herman Melville', 'Americano', 'Escritor norte-americano conhecido principalmente por romances de aventura e literatura marítima.'),
('Homero', 'Grego', 'Poeta tradicionalmente associado aos poemas épicos A Ilíada e A Odisseia.'),
('Luís de Camões', 'Português', 'Poeta português considerado uma das principais figuras da literatura portuguesa.'),
('Dante Alighieri', 'Italiano', 'Poeta italiano conhecido principalmente pela obra A Divina Comédia.'),
('Sófocles', 'Grego', 'Dramaturgo grego conhecido por suas tragédias clássicas.'),
('Fernando Pessoa', 'Português', 'Poeta e escritor português conhecido pela criação de diversos heterônimos.'),
('Albert Camus', 'Francês', 'Escritor e filósofo francês associado ao pensamento existencialista e ao absurdo.'),
('Jean-Paul Sartre', 'Francês', 'Filósofo e escritor francês associado ao existencialismo.'),
('Platão', 'Grego', 'Filósofo grego e discípulo de Sócrates, autor de diversos diálogos filosóficos.'),
('Aristóteles', 'Grego', 'Filósofo grego que produziu trabalhos sobre lógica, ética, política e ciência.'),
('Marco Aurélio', 'Romano', 'Imperador romano e filósofo associado ao estoicismo.'),
('Nicolau Maquiavel', 'Italiano', 'Filósofo e escritor italiano conhecido por estudos sobre política e poder.'),
('Thomas Hobbes', 'Inglês', 'Filósofo inglês conhecido por suas teorias sobre o Estado e o contrato social.'),
('Jean-Jacques Rousseau', 'Suíço', 'Filósofo e escritor conhecido por suas ideias sobre sociedade, política e educação.'),
('Immanuel Kant', 'Prussiano', 'Filósofo conhecido por suas contribuições à filosofia moderna e à teoria do conhecimento.'),
('Adam Smith', 'Escocês', 'Economista e filósofo escocês considerado um dos principais pensadores da economia clássica.'),
('Karl Marx', 'Alemão', 'Filósofo e economista alemão conhecido por seus estudos sobre sociedade, economia e política.'),
('Charles Darwin', 'Britânico', 'Naturalista britânico conhecido por sua teoria da evolução por seleção natural.'),
('Richard Dawkins', 'Britânico', 'Biólogo e escritor britânico conhecido por seus trabalhos sobre evolução e genética.'),
('Stephen Hawking', 'Britânico', 'Físico britânico conhecido por seus estudos sobre cosmologia e buracos negros.'),
('Thomas Kuhn', 'Americano', 'Filósofo da ciência conhecido por seus estudos sobre mudanças de paradigmas científicos.'),
('Marcel Proust', 'Francês', 'Escritor francês conhecido pela extensa obra Em Busca do Tempo Perdido.'),
('William Faulkner', 'Americano', 'Escritor norte-americano conhecido por suas narrativas sobre o sul dos Estados Unidos.'),
('John Steinbeck', 'Americano', 'Escritor norte-americano conhecido por obras que retratam questões sociais e econômicas.'),
('George Orwell', 'Britânico', 'Escritor e jornalista britânico conhecido por suas obras de crítica social e política.'),
('J.D. Salinger', 'Americano', 'Escritor norte-americano conhecido por retratar a juventude e conflitos sociais.'),
('Harper Lee', 'Americana', 'Escritora norte-americana conhecida por obras relacionadas a questões sociais e raciais.'),
('J.R.R. Tolkien', 'Britânico', 'Escritor e professor britânico conhecido por suas obras de fantasia e criação de mundos fictícios.'),
('Frank Herbert', 'Americano', 'Escritor norte-americano conhecido principalmente pela série de ficção científica Duna.'),
('Isabel Allende', 'Chilena', 'Escritora chilena conhecida por romances que combinam história, drama e elementos fantásticos.'),
('Paulo Coelho', 'Brasileiro', 'Escritor brasileiro conhecido internacionalmente por seus romances e temas espirituais.'),
('Sue Monk Kidd', 'Americana', 'Escritora norte-americana conhecida por romances centrados em relações familiares e sociais.'),
('Dan Brown', 'Americano', 'Escritor norte-americano conhecido por romances envolvendo mistério, história e religião.'),
('Umberto Eco', 'Italiano', 'Escritor e filósofo italiano conhecido por romances e estudos sobre semiótica.'),
('Thomas Mann', 'Alemão', 'Escritor alemão conhecido por romances que abordam questões sociais, culturais e filosóficas.'),
('Mark Twain', 'Americano', 'Escritor norte-americano conhecido por romances sobre a sociedade e a infância nos Estados Unidos.'),
('Nicholas Sparks', 'Americano', 'Escritor norte-americano conhecido por romances de temática amorosa e dramática.'),
('William P. Young', 'Canadense', 'Escritor conhecido por obras de ficção com temas religiosos e familiares.'),
('Khaled Hosseini', 'Afegão', 'Escritor afegão-americano conhecido por romances ambientados no Afeganistão.'),
('Taylor Caldwell', 'Britânica', 'Escritora conhecida por romances históricos e narrativas de caráter religioso.');


INSERT INTO USUARIO
(nomeusuario, CPF, telefone, email, tipousuario, status)
VALUES
('João Silva', '111.111.111-01', '(31) 98888-1001', 'joao.silva@email.com', 'ADMINISTRADOR', 'ATIVO'),
('Maria Oliveira', '222.222.222-02', '(31) 98888-1002', 'maria.oliveira@email.com', 'COMUM', 'ATIVO'),
('Pedro Santos', '333.333.333-03', '(31) 98888-1003', 'pedro.santos@email.com', 'COMUM', 'ATIVO'),
('Ana Souza', '444.444.444-04', '(31) 98888-1004', 'ana.souza@email.com', 'COMUM', 'ATIVO'),
('Lucas Pereira', '555.555.555-05', '(31) 98888-1005', 'lucas.pereira@email.com', 'COMUM', 'ATIVO'),
('Mariana Costa', '666.666.666-06', '(31) 98888-1006', 'mariana.costa@email.com', 'COMUM', 'ATIVO'),
('Carlos Mendes', '777.777.777-07', '(31) 98888-1007', 'carlos.mendes@email.com', 'COMUM', 'ATIVO'),
('Beatriz Almeida', '888.888.888-08', '(31) 98888-1008', 'beatriz.almeida@email.com', 'COMUM', 'ATIVO'),
('Rafael Martins', '999.999.999-09', '(31) 98888-1009', 'rafael.martins@email.com', 'COMUM', 'ATIVO'),
('Juliana Ferreira', '123.456.789-10', '(31) 98888-1010', 'juliana.ferreira@email.com', 'COMUM', 'ATIVO');


INSERT INTO GENERO (nomegenero, descricao) VALUES
('Romance', 'Obras centradas em relações humanas, sentimentos e acontecimentos pessoais.'),
('Realismo psicológico', 'Obras que exploram pensamentos, sentimentos e conflitos internos dos personagens.'),
('Drama', 'Narrativas marcadas por conflitos humanos e situações emocionais.'),
('Indígena', 'Obras relacionadas à cultura, história e representação dos povos indígenas.'),
('Realismo', 'Movimento literário que busca representar a realidade de maneira objetiva.'),
('Regionalista', 'Obras que destacam características culturais, sociais e geográficas de uma região.'),
('Realismo mágico', 'Narrativas que apresentam acontecimentos fantásticos tratados como parte da realidade.'),
('Conto', 'Narrativas geralmente curtas, com poucos personagens e acontecimentos concentrados.'),
('Fantasia', 'Obras que apresentam elementos sobrenaturais ou mundos imaginários.'),
('Clássico', 'Obras reconhecidas por sua relevância histórica e literária.'),
('Novela', 'Narrativas de extensão intermediária entre o conto e o romance.'),
('Ficção científica', 'Obras que utilizam ciência e tecnologia como elementos importantes da narrativa.'),
('Thriller', 'Narrativas caracterizadas por suspense, tensão e acontecimentos inesperados.'),
('Épico', 'Obras que apresentam grandes feitos, aventuras e acontecimentos heroicos.'),
('Poema épico', 'Narrativa poética que apresenta feitos heroicos ou acontecimentos grandiosos.'),
('Tragédia', 'Obras dramáticas marcadas por conflitos e acontecimentos de caráter trágico.'),
('Poesia épica', 'Produção poética voltada para grandes feitos e acontecimentos históricos ou lendários.'),
('História', 'Obras relacionadas a acontecimentos e processos históricos.'),
('Filosofia', 'Obras voltadas à reflexão sobre existência, conhecimento, ética e sociedade.'),
('Ética', 'Obras que discutem princípios relacionados ao comportamento e à moral.'),
('Política', 'Obras que abordam poder, governo, sociedade e organização política.'),
('Sociologia', 'Obras relacionadas ao estudo das relações e estruturas da sociedade.'),
('Ciência política', 'Obras que estudam instituições, governos, poder e relações políticas.'),
('Teoria política', 'Obras dedicadas à análise de conceitos e sistemas políticos.'),
('Economia', 'Obras relacionadas à produção, distribuição e consumo de riquezas.'),
('Política econômica', 'Obras que abordam organização econômica e decisões relacionadas à economia.'),
('Ciências naturais', 'Obras relacionadas ao estudo da natureza e seus fenômenos.'),
('Biologia', 'Obras relacionadas ao estudo dos seres vivos e seus processos.'),
('Física', 'Obras relacionadas ao estudo da matéria, energia e fenômenos físicos.'),
('Matemática', 'Obras relacionadas ao estudo de números, estruturas e relações matemáticas.'),
('Ensaios históricos', 'Textos que analisam acontecimentos e processos históricos.'),
('Ficção especulativa', 'Obras que exploram possibilidades imaginárias ou alternativas à realidade.'),
('Adaptação', 'Obras que apresentam elementos derivados ou adaptados de outras formas narrativas.');


INSERT INTO PRATELEIRA
(numero, Capacidade, Localizacao, TipoMaterial)
VALUES
('A01', 20, 'Sala de Literatura Brasileira', 'LIVRO'),
('A02', 20, 'Sala de Literatura Estrangeira', 'LIVRO'),
('A03', 20, 'Sala de Literatura Clássica', 'LIVRO'),
('A04', 20, 'Sala de Filosofia', 'LIVRO'),
('A05', 20, 'Sala de Politica e Historia', 'LIVRO'),
('A06', 20, 'Sala de Ciencias', 'LIVRO'),
('A07', 20, 'Sala de Ficcao', 'LIVRO'),
('A08', 20, 'Sala de Fantasia', 'LIVRO'),
('A09', 20, 'Sala de Literatura Contemporanea', 'LIVRO'),
('A10', 20, 'Sala de Acervo Geral', 'LIVRO'),
('B01', 30, 'Sala Multimidia - Musica', 'CD'),
('B02', 30, 'Sala Multimidia - Albuns', 'CD');


INSERT INTO ItemACERVO
(TipoItem, Status, IDPRATELEIRA)
VALUES
('LIVRO', 'DISPONIVEL', 1),
('LIVRO', 'DISPONIVEL', 1),
('LIVRO', 'EMPRESTADO', 1),
('LIVRO', 'DISPONIVEL', 1),
('LIVRO', 'DANIFICADO', 1),

('LIVRO', 'DISPONIVEL', 2),
('LIVRO', 'EMPRESTADO', 2),
('LIVRO', 'DISPONIVEL', 2),
('LIVRO', 'DISPONIVEL', 2),
('LIVRO', 'ATRASADO', 2),

('LIVRO', 'DISPONIVEL', 3),
('LIVRO', 'DISPONIVEL', 3),
('LIVRO', 'EMPRESTADO', 3),
('LIVRO', 'DISPONIVEL', 3),
('LIVRO', 'DANIFICADO', 3),

('LIVRO', 'DISPONIVEL', 4),
('LIVRO', 'DISPONIVEL', 4),
('LIVRO', 'EMPRESTADO', 4),
('LIVRO', 'DISPONIVEL', 4),
('LIVRO', 'DISPONIVEL', 4),

('CD', 'DISPONIVEL', 11),
('CD', 'EMPRESTADO', 11),
('CD', 'DISPONIVEL', 11),
('CD', 'DANIFICADO', 12),
('CD', 'DISPONIVEL', 12);

INSERT INTO LIVRO
(TITULO, edicao, ISBN, idautor, IdItem, descricao) VALUES
('Dom Casmurro', 4, '000000000001', 1, 1, 'Romance brasileiro que apresenta a narrativa de Bentinho e suas lembranças sobre Capitu.'),
('Memórias Póstumas de Brás Cubas', 2, '000000000002', 1, 2, 'Romance narrado por um personagem após sua morte, marcado por ironia e crítica social.'),
('O Guarani', 3, '000000000003', 2, 3, 'Romance indianista brasileiro ambientado no período colonial.'),
('Iracema', 5, '000000000004', 2, 4, 'Romance indianista que apresenta a história de Iracema e Martim.'),
('Senhora', 3, '000000000005', 2, 5, 'Romance que aborda relações sociais, amor e casamento na sociedade brasileira.'),
('Vidas Secas', 4, '000000000006', 3, 6, 'Romance regionalista que acompanha uma família de retirantes do sertão brasileiro.'),
('Grande Sertão: Veredas', 1, '000000000007', 4, 7, 'Romance ambientado no sertão brasileiro e marcado por linguagem inovadora.'),
('O Grande Gatsby', 1, '000000000008', 5, 8, 'Romance que retrata a sociedade norte-americana durante a década de 1920.'),
('Cem Anos de Solidão', 2, '000000000009', 6, 9, 'Romance que acompanha várias gerações da família Buendía.'),
('O Amor nos Tempos do Cólera', 1, '000000000010', 6, 10, 'Romance sobre amor, passagem do tempo e relações humanas.'),
('Crônica de uma Morte Anunciada', 3, '000000000011', 6, 11, 'Narrativa sobre um assassinato anunciado antecipadamente à comunidade.'),
('Dom Quixote', 4, '000000000012', 7, 12, 'Clássico da literatura espanhola que acompanha as aventuras de Dom Quixote e Sancho Pança.'),
('O Retrato de Dorian Gray', 5, '000000000013', 8, 13, 'Romance que aborda juventude, beleza, moralidade e consequências das escolhas pessoais.'),
('Orgulho e Preconceito', 4, '000000000014', 9, 14, 'Romance que acompanha os relacionamentos e conflitos sociais da família Bennet.'),
('Emma', 3, '000000000015', 9, 15, 'Romance centrado em Emma Woodhouse e suas tentativas de influenciar relacionamentos.'),
('Persuasão', 1, '000000000016', 9, 16, 'Romance sobre escolhas, amadurecimento e reencontro amoroso.'),
('A Metamorfose', 4, '000000000017', 10, 17, 'Novela sobre Gregor Samsa e sua transformação inesperada.'),
('O Processo', 2, '000000000018', 10, 18, 'Romance que acompanha um homem envolvido em um processo judicial inexplicável.'),
('O Castelo', 1, '000000000019', 10, 19, 'Romance sobre um personagem que tenta obter acesso a uma autoridade misteriosa.'),
('Moby Dick', 3, '000000000020', 11, 20, 'Romance marítimo centrado na perseguição da baleia branca pelo capitão Ahab.');

INSERT INTO CD 
(IdItem, ARTISTA, ALBUM, DURACAO, GENEROMUSICAL) VALUES
(21, 'Legião Urbana', 'Dois', '45:30', 'Rock'),
(22, 'Titãs', 'Cabeça Dinossauro', '42:15', 'Rock'),
(23, 'Milton Nascimento', 'Clube da Esquina', '51:20', 'MPB'),
(24, 'Charlie Brown Jr.', 'Acústico', '48:10', 'Rock'),
(25, 'Djavan', 'Luz', '44:35', 'MPB');




INSERT INTO EMPRESTIMO
(IdEmperestimo, idUsuario, iditem, DataEmprestimo, Datadevolucao, Datadevolvida, Status)
VALUES
(1, 2, 3, '2026-08-01', '2026-08-15', '2026-08-14', 'DEVOLVIDO'),

(2, 3, 7, '2026-08-05', '2026-08-19', '2026-08-18', 'DEVOLVIDO'),

(3, 4, 10, '2026-08-10', '2026-08-24', '2026-08-24', 'DEVOLVIDO'),

(4, 5, 13, '2026-08-15', '2026-08-29', '2026-08-28', 'DEVOLVIDO'),

(5, 6, 18, '2026-08-20', '2026-09-03', '2026-09-02', 'DEVOLVIDO'),

(6, 7, 22, '2026-08-25', '2026-09-08', '2026-09-07', 'DEVOLVIDO'),

(7, 8, 3, '2026-09-01', '2026-09-15', '2026-09-15', 'DEVOLVIDO'),

(8, 9, 7, '2026-09-02', '2026-09-16', '2026-09-18', 'ATRASADO'),

(9, 10, 13, '2026-09-05', '2026-09-19', '2026-09-19', 'DEVOLVIDO'),

(10, 2, 18, '2026-09-08', '2026-09-22', '2026-09-22', 'DEVOLVIDO'),

(11, 3, 21, '2026-09-10', '2026-09-24', '2026-09-24', 'DEVOLVIDO'),

(12, 4, 22, '2026-09-12', '2026-09-26', '2026-09-26', 'DEVOLVIDO'),

(13, 5, 3, '2026-09-13', '2026-09-27', '2026-09-27', 'DEVOLVIDO'),

(14, 6, 7, '2026-09-14', '2026-09-28', '2026-09-28', 'DEVOLVIDO'),

(15, 7, 13, '2026-09-15', '2026-09-29', '2026-09-29', 'EMPRESTADO');