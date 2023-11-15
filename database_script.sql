CREATE DATABASE latihan_w3;

USE latihan_w3;

CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ean BIGINT,
  title VARCHAR(200),
  category VARCHAR(100),
  vendor VARCHAR(100),
  price DECIMAL(10, 2),
  rating INT,
  created_at DATETIME
);

INSERT INTO products (ean, title, category, vendor, price, rating, created_at)
VALUES
  (9876543210987, 'Komputer Gaming', 'Elektronik', 'Toko Jaya', 7500000, 4, '2023-01-15 08:00:00'),
  (8765432109876, 'TV Ultra HD', 'Elektronik', 'Toko Makmur', 15000000, 5, '2023-02-20 11:15:00'),
  (7654321098765, 'Kursi Santai', 'Furnitur', 'Mebel indah', 2000000, 4, '2023-03-25 13:45:00');

CREATE TABLE reviews (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  reviewer VARCHAR(100),
  rating INT,
  body TEXT,
  created_at DATETIME,
  FOREIGN KEY (product_id) REFERENCES products (id)
);

INSERT INTO reviews (product_id, reviewer, rating, body, created_at)
VALUES
  (1, 'Budi Hartono', 4, 'Komputer cukup cepat dan bagus', '2023-02-15 17:00:00'),
  (2, 'Rani Febriana', 5, 'Gambar TV sangat jernih dan tajam', '2023-03-22 08:15:00'),
  (3, 'Siti Aminah', 3, 'Kursi nyaman tapi warna cepat pudar', '2023-04-28 11:45:00');

CREATE TABLE people (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  password VARCHAR(100),
  address VARCHAR(200),
  city VARCHAR(100),
  state VARCHAR(100),
  zip INT,
  latitude DOUBLE,
  longitude DOUBLE,
  birth_date DATE,
  created_at DATETIME
);

INSERT INTO people (address, email, password, name, city, longitude, state, birth_date, zip, latitude, created_at)
VALUES
  ('Jln. Merdeka 1', 'budi@email.com', 'pwd123', 'Budi Hartono', 'Jakarta', 106.827153, 'DKI Jakarta', '1990-02-15', 10110, -6.175392, '2023-01-01 10:00:00'),
  ('Jln. Mangga 5', 'rani@email.com', 'pwd789', 'Rani Febriana', 'Surabaya', 112.750377, 'Jawa Timur', '1995-04-12', 60292, -7.247665, '2023-03-15 14:00:00'),
  ('Jln. Melati 2', 'siti@email.com', 'pwd456', 'Siti Aminah', 'Bandung', 107.607605, 'Jawa Barat', '1992-08-30', 40255, -6.906099, '2023-02-01 11:00:00');

CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  product_id INT,
  quantity INT,
  subtotal DECIMAL(10, 2),
  tax DECIMAL(10, 2),
  total DECIMAL(10, 2),
  discount DECIMAL(10, 2),
  created_at DATETIME,
  FOREIGN KEY (user_id) REFERENCES people (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
);

INSERT INTO orders (user_id, product_id, quantity, subtotal, tax, total, discount, created_at)
VALUES
  (1, 1, 1, 7500000, 750000, 8250000, 100000, '2023-02-10 11:25:00'),
  (2, 2, 1, 15000000, 1500000, 16500000, 500000, '2023-03-18 09:45:00'),
  (3, 3, 2, 4000000, 400000, 4400000, 100000, '2023-04-22 15:20:00');
