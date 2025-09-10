DROP TABLE IF EXISTS reacciones CASCADE;
DROP TABLE IF EXISTS publicaciones CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;

CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE publicaciones (
    id_publicacion SERIAL PRIMARY KEY,
    contenido TEXT NOT NULL,
    fecha_publicacion TIMESTAMP NOT NULL,
    autor_de_post INT REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE reacciones (
    id_reaccion SERIAL PRIMARY KEY,
    tipo_reaccion VARCHAR(20) NOT NULL,
    fecha_reaccion TIMESTAMP NOT NULL,
    id_usuario INT REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_publicacion INT REFERENCES publicaciones(id_publicacion) ON DELETE CASCADE
);

INSERT INTO usuarios (nombre_usuario, fecha_registro) VALUES
('PintorPro', '2025-07-01'),
('PeleManco', '2025-07-10'),
('IvanManco', '2025-08-15');


INSERT INTO publicaciones (contenido, fecha_publicacion, autor_de_post) VALUES
('Nuevo torneo', '2025-08-20 15:00:00', 1),
('Lanzamiento GTA 6', '2025-08-21 18:00:00', 2),
('Tips para mejorar en COD', '2025-09-01 12:30:00', 3);


INSERT INTO reacciones (tipo_reaccion, fecha_reaccion, id_usuario, id_publicacion) VALUES
('like', '2025-08-20 16:00:00', 2, 1),
('compartir', '2025-08-21 19:00:00', 1, 2),
('risa', '2025-09-01 13:00:00', 2, 3),
('like', '2025-09-01 13:15:00', 1, 3);