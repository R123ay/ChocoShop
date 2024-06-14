CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- 插入一些測試用戶
INSERT INTO users (username, password, role) VALUES
('admin', 'adminpassword', 'ADMIN'),
('customer1', 'customerpassword', 'CUSTOMER');
