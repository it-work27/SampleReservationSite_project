-- 車種ランクマスタ
CREATE TABLE car_rank_mst (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) NOT NULL,
    create_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    create_user VARCHAR(255),
    update_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_user VARCHAR(255)
);


-- 車種マスタ
CREATE TABLE car_model_mst (
    id SERIAL PRIMARY KEY,
    carmodel_name VARCHAR(255) NOT NULL,
    carmodel_rank_id INTEGER NOT NULL REFERENCES car_rank_mst(id),
    create_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    create_user VARCHAR(255),
    update_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_user VARCHAR(255)
);


-- 店舗マスタ
CREATE TABLE shop_mst (
    id SERIAL PRIMARY KEY,
    shop_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    business_hours VARCHAR(100) NOT NULL,
    create_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    create_user VARCHAR(255),
    update_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_user VARCHAR(255)
);


-- 車両テーブル
CREATE TABLE car_tbl (
    id SERIAL PRIMARY KEY,
    car_number VARCHAR(50) NOT NULL,
    car_model_id INTEGER NOT NULL REFERENCES car_model_mst(id),
    shop_id INTEGER NOT NULL REFERENCES shop_mst(id),
    create_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    create_user VARCHAR(255),
    update_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_user VARCHAR(255)
);


-- ユーザーテーブル
CREATE TABLE users_tbl (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL, -- ハッシュ化されたパスワードを保存
    address VARCHAR(255),
    create_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    create_user VARCHAR(255),
    update_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_user VARCHAR(255)
);


-- 予約テーブル
CREATE TABLE reservation_tbl (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users_tbl(id),
    car_id INTEGER NOT NULL REFERENCES car_tbl(id),
    shop_id INTEGER NOT NULL REFERENCES shop_mst(id),
    reservation_start_datetime TIMESTAMP NOT NULL,
    reservation_end_datetime TIMESTAMP NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    create_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    create_user VARCHAR(255),
    update_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_user VARCHAR(255)
);


-- 予約状況検索ビュー
CREATE VIEW reservation_status_view AS
SELECT 
    r.car_id,
    r.reservation_start_datetime,
    r.reservation_end_datetime
FROM 
    reservation_tbl r;


-- 車種ランクマスタデータ
INSERT INTO car_rank_mst (price, create_user, update_user) VALUES
(10000.00, 'admin', 'admin'),
(15000.00, 'admin', 'admin'),
(20000.00, 'admin', 'admin');

-- 車種マスタデータ
INSERT INTO car_model_mst (carmodel_name, carmodel_rank_id, create_user, update_user) VALUES
('Toyota Prius', 1, 'admin', 'admin'),
('Honda Civic', 2, 'admin', 'admin'),
('Tesla Model 3', 3, 'admin', 'admin');

-- 店舗マスタデータ
INSERT INTO shop_mst (shop_name, address, business_hours, create_user, update_user) VALUES
('Tokyo Downtown', '123 Tokyo St, Tokyo', '9:00-18:00', 'admin', 'admin'),
('Osaka Central', '456 Osaka Rd, Osaka', '9:00-18:00', 'admin', 'admin'),
('Nagoya East', '789 Nagoya Ave, Nagoya', '9:00-18:00', 'admin', 'admin');

-- 車両データ
INSERT INTO car_tbl (car_number, car_model_id, shop_id, create_user, update_user) VALUES
('ABC123', 1, 1, 'admin', 'admin'),
('DEF456', 2, 2, 'admin', 'admin'),
('GHI789', 3, 3, 'admin', 'admin');

-- ユーザーデータ
INSERT INTO users_tbl (username, email, password, address, create_user, update_user) VALUES
('user1', 'user1@example.com', 'password1', 'Tokyo', 'admin', 'admin'),
('user2', 'user2@example.com', 'password2', 'Osaka', 'admin', 'admin'),
('user3', 'user3@example.com', 'password3', 'Nagoya', 'admin', 'admin');

-- 予約データ
INSERT INTO reservation_tbl (user_id, car_id, shop_id, reservation_start_datetime, reservation_end_datetime, price, create_user, update_user) VALUES
(1, 1, 1, '2024-08-01 10:00:00', '2024-08-03 10:00:00', 30000.00, 'admin', 'admin'),
(2, 2, 2, '2024-08-05 12:00:00', '2024-08-07 12:00:00', 45000.00, 'admin', 'admin'),
(3, 3, 3, '2024-08-10 14:00:00', '2024-08-12 14:00:00', 60000.00, 'admin', 'admin');
