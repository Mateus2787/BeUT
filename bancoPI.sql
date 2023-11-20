CREATE TABLE TiposCabelo (
    TipoCabeloID INT PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);

CREATE TABLE TiposPele (
    TipoPeleID INT PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);

CREATE TABLE OpcoesVeganas (
    OpcaoVeganaID INT PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);

CREATE TABLE Alergias (
    AlergiaID INT PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL
);

CREATE TABLE Empresa (
    EmpresaID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Produto (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    EmpresaID INT,
    TipoCabeloID INT,
    TipoPeleID INT,
    OpcaoVeganaID INT,
    AlergiaID INT,
    FOREIGN KEY (EmpresaID) REFERENCES Empresa(EmpresaID),
    FOREIGN KEY (TipoCabeloID) REFERENCES TiposCabelo(TipoCabeloID),
    FOREIGN KEY (TipoPeleID) REFERENCES TiposPele(TipoPeleID),
    FOREIGN KEY (OpcaoVeganaID) REFERENCES OpcoesVeganas(OpcaoVeganaID),
    FOREIGN KEY (AlergiaID) REFERENCES Alergias(AlergiaID)
);

CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    CPF VARCHAR(14) UNIQUE,
    CNPJ VARCHAR(18) UNIQUE,
    Senha VARCHAR(255) NOT NULL,
    DataNascimento DATE,
    ProdutoID INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);
