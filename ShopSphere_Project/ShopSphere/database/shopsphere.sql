CREATE DATABASE IF NOT EXISTS shopsphere CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shopsphere;

CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(160) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('CUSTOMER','ADMIN') NOT NULL DEFAULT 'CUSTOMER',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  category_id INT NULL,
  name VARCHAR(160) NOT NULL,
  brand VARCHAR(100) DEFAULT '',
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  discount DECIMAL(5,2) NOT NULL DEFAULT 0,
  stock INT NOT NULL DEFAULT 0,
  image_url VARCHAR(500),
  status BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_products_category FOREIGN KEY(category_id) REFERENCES categories(category_id)
);
CREATE TABLE IF NOT EXISTS cart (
  cart_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  UNIQUE KEY uq_cart_user_product(user_id, product_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  payment_method VARCHAR(40) NOT NULL DEFAULT 'MOCK',
  payment_status VARCHAR(30) NOT NULL DEFAULT 'PENDING',
  order_status VARCHAR(30) NOT NULL DEFAULT 'PLACED',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);
CREATE TABLE IF NOT EXISTS order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  FOREIGN KEY(product_id) REFERENCES products(product_id)
);
CREATE TABLE IF NOT EXISTS wishlist (
  wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  UNIQUE KEY uq_wishlist_user_product(user_id, product_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

INSERT IGNORE INTO categories(category_id,name) VALUES (1,'Electronics'),(2,'Fashion'),(3,'Home');
INSERT IGNORE INTO products(product_id,category_id,name,brand,description,price,discount,stock,image_url,status) VALUES
(1,1,'Wireless Headphones','SoundWave','Everyday wireless headphones with a comfortable fit.',2499.00,15,20,'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=700',TRUE),
(2,1,'Smart Watch','Pulse','Track your day with a clean, modern smartwatch.',3299.00,10,12,'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=700',TRUE),
(3,2,'Classic Sneakers','Northstar','Versatile sneakers for everyday wear.',1899.00,20,25,'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=700',TRUE),
(4,3,'Desk Lamp','Luma','Minimal lamp for a focused workspace.',999.00,5,18,'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=700',TRUE),
(5,2,'Everyday Backpack','TrailKit','Roomy backpack for college and commuting.',1499.00,12,14,'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=700',TRUE),
(6,1,'Compact Camera','FocusPro','A compact camera for your creative projects.',12499.00,8,5,'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=700',TRUE);
