const String DATABASE_NAME = "dbdefesacivil";
const String TBUSUARIO = "tbusuario";
const String TBCHAMADO = "tbchamado";
const String TBBAIRRO = "tbbairro";
const String TBCOMUNIDADE = "tbcomunidade";
const String CREATE_TBUSUARIO = "CREATE TABLE tbusuario (id INTEGER PRIMARY KEY,cpf TEXT,email TEXT,nome TEXT,senha TEXT)";
const String CREATE_TBCHAMADO = "CREATE TABLE tbchamado(processo INTEGER,nomeOrigem TEXT,dataSolicitacao TEXT,origemChamado TEXT,NomeSolicitante TEXT,enderecoOcorrencia TEXT,comunidade INTEGER,roteiro TEXT,olicitacao TEXT,vitimas INTEGER,vitimasFatais INTEGER,statusChamado TEXT)";
const String CREATE_TBBAIRRO = "CREATE TABLE tbbairro(codigoBairro INTEGER,nomeBairro TEXT,rpa INTEGER,mr TEXT,regional TEXT)";
const String CREATE_TBCOMUNIDADE = "CREATE TABLE tbcomunidade(id INTEGER PRIMARY KEY,nomeComunidade TEXT,bairroComunidade INTEGER)";