CREATE TABLE usuario (
id INT AUTO_INCREMENT PRIMARY KEY,
tipo VARCHAR(50),
email VARCHAR(150),
nome VARCHAR(100),
senha VARCHAR(100)
);

CREATE TABLE admin (
id INT AUTO_INCREMENT PRIMARY KEY,
tipo VARCHAR(50),
email VARCHAR(150),
nome VARCHAR(100),
senha VARCHAR(100)
);

CREATE TABLE categorias(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
admin_id INT,

FOREIGN KEY (admin_id) REFERENCES admin(id)
);

CREATE TABLE series (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
descricao TEXT,
admin_id INT,
categoria_id INT,

FOREIGN KEY (admin_id) REFERENCES admin(id),
FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE series_usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
serie_id INT,
usuario_id INT,

FOREIGN KEY (serie_id) REFERENCES series(id),
FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE temporadas (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
descricao TEXT,
admin_id INT,
serie_id INT,

FOREIGN KEY (admin_id) REFERENCES admin(id),
FOREIGN KEY (serie_id) REFERENCES series(id)
);

CREATE TABLE episodios(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
descricao TEXT,
admin_id INT,
serie_id INT,
temporada_id INT,

FOREIGN KEY (admin_id) REFERENCES admin(id),
FOREIGN KEY (serie_id) REFERENCES series(id),
FOREIGN KEY (temporada_id) REFERENCES temporadas(id)
);

CREATE TABLE series_temporadas_series_usuarios(
id INT AUTO_INCREMENT PRIMARY KEY,
serie_usuario_id INT,
temporada_id INT,

FOREIGN KEY (serie_usuario_id) REFERENCES series_usuarios(id),
FOREIGN KEY (temporada_id) REFERENCES temporadas(id)
);

CREATE TABLE episodios_temporadas_serie_usuario(
id INT AUTO_INCREMENT PRIMARY KEY,
episodio_id INT,
temporada_serie_usuario_id INT,

FOREIGN KEY (episodio_id) REFERENCES episodios(id),
FOREIGN KEY (temporada_serie_usuario_id) REFERENCES series_temporadas_series_usuarios(id)
);