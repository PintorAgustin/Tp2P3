DROP TABLE IF EXISTS conversiones CASCADE;
DROP TABLE IF EXISTS campanias CASCADE;
DROP TABLE IF EXISTS plataformas CASCADE;

CREATE TABLE campanias (
    id_campania SERIAL PRIMARY KEY,
    nombre_campania VARCHAR(100) UNIQUE NOT NULL,
    presupuesto NUMERIC(10,2) NOT NULL,
    fecha_inicio DATE NOT NULL
);

CREATE TABLE plataformas (
    id_plataforma SERIAL PRIMARY KEY,
    nombre_plataforma VARCHAR(50) NOT NULL,
    url_plataforma VARCHAR(255)
);

CREATE TABLE conversiones (
    id_conversion SERIAL PRIMARY KEY,
    tipo_conversion VARCHAR(50) NOT NULL,
    valor NUMERIC(10,2),
    fecha_conversion TIMESTAMP NOT NULL,
    id_campania INT REFERENCES campanias(id_campania) ON DELETE CASCADE,
    id_plataforma INT REFERENCES plataformas(id_plataforma) ON DELETE CASCADE
);

INSERT INTO campanias (nombre_campania, presupuesto, fecha_inicio) VALUES
('Lanzamiento iPhone', 50000.00, '2025-08-01'),
('Campaña Black Friday', 75000.00, '2025-11-20');


INSERT INTO plataformas (nombre_plataforma, url_plataforma) VALUES
('Google Ads', 'https://ads.google.com'),
('Meta Ads', 'https://www.facebook.com/business/ads');


INSERT INTO conversiones (tipo_conversion, valor, fecha_conversion, id_campania, id_plataforma) VALUES
('venta', 1200.50, '2025-08-05 14:30:00', 1, 1),
('registro', NULL, '2025-08-06 18:45:00', 1, 2),
('venta', 350.00, '2025-11-22 10:00:00', 2, 1);