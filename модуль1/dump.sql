CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO roles (name) VALUES ('Администратор'), ('Менеджер'), ('Авторизированный клиент');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    role_id INTEGER NOT NULL REFERENCES roles(id),
    full_name VARCHAR(150) NOT NULL,
    login VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

INSERT INTO users (role_id, full_name, login, password) VALUES
(1, 'Кондратьева Алиса Михайловна', 'kondratieva@cake-shop.ru', 'AdCk76#'),
(1, 'Волошин Игорь Сергеевич', 'voloshin@cake-shop.ru', 'XyZ$89p'),
(1, 'Сладкоежкина Виктория Павловна', 'sladkoezhkina@cake-shop.ru', 'T0rt!k45'),
(2, 'Кремов Артем Дмитриевич', 'kremov@cake-shop.ru', 'Mn7@gP23'),
(2, 'Бисквитов Петр Владимирович', 'biskvitov@cake-shop.ru', 'Rt5#fH67'),
(2, 'Ягодная Елена Игоревна', 'yagodnaya@cake-shop.ru', 'Ber3ry$1'),
(3, 'Сахарова Анна Викторовна', 'saharova.client@mail.ru', 'Cli3nt#9'),
(3, 'Вафельный Максим Олегович', 'waffle.client@gmail.com', 'WafFl3$5'),
(3, 'Шоколадов Кирилл Александрович', 'chocolate.client@mail.ru', 'Ch0c0L8*'),
(3, 'Фруктовская Ольга Сергеевна', 'fruit.client@outlook.com', 'FrU1t%22');

CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO brands (name) VALUES ('Сладкая радость'), ('Вкусный дом'), ('Тортэйшн'), ('Фруттиссимо'), ('Кексик и Ко');

CREATE TABLE cake_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO cake_types (name) VALUES 
('Классический бисквит'), ('Американский'), ('Классический медовик'), ('Суфлейный'),
('Шоколадный мусс'), ('Фруктово-ягодный'), ('Шоколадный бисквит'), ('Капкейки'),
('Десертный'), ('Овощной бисквит'), ('Чизкейк'), ('Ягодный муссовый'),
('Тематический бисквит'), ('Кофейно-сливочный'), ('Многоярусный бисквит'),
('Итальянский десерт'), ('Кондитерское изделие'), ('Цитрусовый мусс'),
('Шоколадно-вишневый'), ('Безглютеновый');

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


INSERT INTO categories (name) VALUES 
('Праздничный'), ('День рождения'), ('Любой повод'), ('Юбилей'), ('Для него'),
('Летний'), ('Свадьба'), ('Детский праздник'), ('Для нее'), ('Здоровое питание'),
('Кофе-брейк'), ('Для взрослых'), ('Свадебный'), ('Романтический ужин'),
('Чайный стол'), ('Весенний праздник'), ('Для аллергиков');

CREATE TABLE pickup_points (
    id SERIAL PRIMARY KEY,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    house VARCHAR(50) NOT NULL
);

INSERT INTO pickup_points (postal_code, city, street, house) VALUES
('420151', 'г. Сладкий', 'ул. Тортовая', '15'),
('125061', 'г. Сладкий', 'ул. Кремовая', '8'),
('630370', 'г. Сладкий', 'ул. Кондитерская', '24'),
('400562', 'г. Сладкий', 'ул. Шоколадная', '32'),
('614510', 'г. Сладкий', 'ул. Пирожная', '47'),
('410542', 'г. Сладкий', 'ул. Вафельная', '46'),
('620839', 'г. Сладкий', 'ул. Ягодная', '8'),
('443890', 'г. Сладкий', 'ул. Сахарная', '1'),
('603379', 'г. Сладкий', 'ул. Бисквитная', '46'),
('603721', 'г. Сладкий', 'ул. Десертная', '41'),
('410172', 'г. Сладкий', 'ул. Фруктовая', '13'),
('614611', 'г. Сладкий', 'ул. Медовая', '50'),
('454311', 'г. Сладкий', 'ул. Пряничная', '19'),
('660007', 'г. Сладкий', 'ул. Карамельная', '19'),
('603036', 'г. Сладкий', 'ул. Вишневая', '4'),
('394060', 'г. Сладкий', 'ул. Ореховая', '43'),
('410661', 'г. Сладкий', 'ул. Кексовая', '50'),
('625590', 'г. Сладкий', 'ул. Сливовая', '20'),
('625683', 'г. Сладкий', 'ул. 8 Марта', '12'),
('450983', 'г. Сладкий', 'ул. Муссовая', '26'),
('394782', 'г. Сладкий', 'ул. Пироговая', '3'),
('603002', 'г. Сладкий', 'ул. Эклерная', '28'),
('450558', 'г. Сладкий', 'ул. Наполеоновская', '30'),
('344288', 'г. Сладкий', 'ул. Чизкейковая', '1'),
('614164', 'г. Сладкий', 'ул. Кексовая', '30'),
('394242', 'г. Сладкий', 'ул. Пралине', '43'),
('660540', 'г. Сладкий', 'ул. Солнечная', '25'),
('125837', 'г. Сладкий', 'ул. Шоколадная', '40'),
('125703', 'г. Сладкий', 'ул. Марципановая', '49');

CREATE TABLE order_statuses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO order_statuses (name) VALUES ('Новый'), ('В обработке'), ('Готов'), ('Завершен'),('Отменен');

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    article VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    unit VARCHAR(50) NOT NULL DEFAULT 'шт.',
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    brand_id INTEGER REFERENCES brands(id),
    type_id INTEGER REFERENCES cake_types(id),
    category_id INTEGER REFERENCES categories(id),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    description TEXT,
    image_filename VARCHAR(100)
);

INSERT INTO products(article, name, unit, price, brand_id, type_id, category_id, is_active, stock_quantity, description, image_filename) VALUES
('T001C1', 'Наполеон', 'шт.', 2190, 1, 1, 1, TRUE, 8, 'Классический торт Наполеон с заварным кремом и слоеными коржами, 2 кг', 'napoleon.jpg'),
('T002F4', 'Красный бархат', 'шт.', 3244, 2, 2, 2, TRUE, 13, 'Яркий бисквит с какао и сливочно-сырным кремом Чизкейк, 1.8 кг', 'red_velvet.jpg'),
('T003B5', 'Медовик', 'шт.', 4499, 1, 3, 3, TRUE, 5, 'Нежный торт с медовыми коржами и сметанным кремом, 2 кг', 'medovik.jpg'),
('T004R7', 'Птичье молоко', 'шт.', 3900, 3, 4, 4, TRUE, 8, 'Воздушное суфле на агар-агаре и шоколадная глазурь по ГОСТу, 1.5 кг', 'ptichye_moloko.jpg'),
('T005M3', 'Трюфельный', 'шт.', 3800, 2, 5, 5, TRUE, 16, 'Шоколадный торт с нежным муссом и карамельной прослойкой, 1.7 кг', 'truffel.jpg'),
('T006K8', 'Фруктовый рай', 'шт.', 4100, 4, 6, 6, TRUE, 6, 'Легкий бисквит с йогуртовым кремом и свежими сезонными ягодами, 2 кг', 'fruit_paradise.jpg'),
('T007H7', 'Прага', 'шт.', 2700, 1, 7, 1, TRUE, 14, 'Шоколадный торт по рецепту пражского ресторана, с абрикосовым конфитюром, 1.5 кг', 'prague.jpg'),
('T008H3', 'Капкейки "Ассорти" (12 шт.)', 'шт. (набор)', 1890, 5, 8, 8, TRUE, 4, 'Набор из 12 капкейков с разными начинками и украшениями', 'cupcakes.jpg'),
('T009R5', 'Сникерс', 'шт.', 4300, 2, 9, 9, TRUE, 6, 'Торт-десерт на основе знаменитого батончика: арахис, нуга, карамель, шоколад, 1.8 кг', 'snickers.jpg'),
('T010E4', 'Морковный торт', 'шт.', 2800, 1, 10, 10, TRUE, 15, 'Влажный бисквит с морковью, орехами и сливочным сыром, 1.5 кг', 'carrot_cake.jpg'),
('T011E3', 'Чизкейк Нью-Йорк', 'шт.', 3556, 3, 11, 11, TRUE, 6, 'Классический выпеченный чизкейк на песочной основе, 1.2 кг', 'ny_cheesecake.jpg'),
('T012B5', 'Малиновый меридиан', 'шт.', 3800, 4, 12, 7, TRUE, 14, 'Нежное малиновое муссовое кольцо на миндальном бисквите, 1.6 кг', 'raspberry_mousse.jpg'),
('T013R4', 'Детский "Смешарики"', 'шт.', 5500, 2, 13, 8, TRUE, 6, 'Торт в виде любимых персонажей, цветной бисквит, сливочный крем, 2.5 кг', 'smeshariki.jpg'),
('T014F4', 'Кофейный Гляссе', 'шт.', 2100, 3, 14, 12, TRUE, 3, 'Торт со вкусом кофе гляссе, кофейные коржи и нежный крем, 1.4 кг', 'coffee_glace.jpg'),
('T015F5', 'Свадебная феерия (3 яруса)', 'шт.', 15400, 2, 15, 13, TRUE, 1, 'Трехъярусный свадебный торт с ванильным муссом и цветочным декором, 5 кг', 'wedding_cake.jpg'),
('T016F4', 'Тирамису', 'шт.', 4600, 1, 16, 14, TRUE, 9, 'Классическое тирамису на основе маскарпоне, савоярди и кофе, 1.5 кг', 'tiramisu.jpg'),
('T017R5', 'Пирожное Картошка (10 шт.)', 'шт. (набор)', 900, 5, 17, 15, TRUE, 12, 'Набор из 10 пирожных Картошка, посыпанных какао', 'kartoshka.jpg'),
('T018G4', 'Лимонный курд', 'шт.', 6800, 4, 18, 16, TRUE, 15, 'Освежающий торт с лимонным курдом, безе и хрустящим слоем, 1.8 кг', 'lemon_curd.jpg'),
('T019G5', 'Черный лес', 'шт.', 4200, 3, 19, 1, TRUE, 9, 'Немецкий торт с шоколадными бисквитами, вишней и взбитыми сливками, 1.7 кг', 'black_forest.jpg'),
('T020R5', 'Безглютеновый шоколадный', 'шт.', 4800, 2, 20, 17, TRUE, 11, 'Богатый шоколадный торт на миндальной муке, без глютена и лактозы, 1.5 кг', 'gluten_free.jpg');

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    pickup_point_id INTEGER NOT NULL REFERENCES pickup_points(id),
    status_id INTEGER NOT NULL REFERENCES order_statuses(id),
    order_date DATE NOT NULL,
    delivery_date DATE,
    pickup_code VARCHAR(10) NOT NULL UNIQUE,
    total_amount DECIMAL(10, 2) DEFAULT 0
);

INSERT INTO orders (user_id, pickup_point_id, status_id, order_date, delivery_date, pickup_code, total_amount) VALUES
(7, 1, 4, '2025-03-15', '2025-03-16', '7348', 0),
(8, 11, 4, '2025-03-20', '2025-03-21', '8921', 0),
(9, 2, 4, '2025-03-25', '2025-03-26', '1567', 0),
(10, 11, 4, '2025-03-28', '2025-03-29', '3402', 0),
(7, 2, 4, '2025-04-01', '2025-04-02', '5198', 0),
(8, 15, 4, '2025-04-03', '2025-04-04', '6734', 0),
(9, 3, 4, '2025-04-05', '2025-04-06', '2815', 0),
(10, 19, 1, '2025-04-07', '2025-04-08', '4963', 0),
(7, 5, 1, '2025-04-08', '2025-04-09', '8270', 0),
(8, 19, 1, '2025-04-09', '2025-04-10', '1389', 0);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price_at_order DECIMAL(10, 2) NOT NULL,
    UNIQUE(order_id, product_id)
);


INSERT INTO order_items (order_id, product_id, quantity, price_at_order) VALUES
(1, 1, 2, 2190), (1, 2, 1, 3244),
(2, 3, 1, 4499), (2, 4, 1, 3900),
(3, 5, 1, 3800), (3, 6, 1, 4100),
(4, 7, 1, 2700), (4, 8, 2, 1890),
(5, 9, 1, 4300), (5, 10, 1, 2800),
(6, 11, 1, 3556), (6, 12, 1, 3800),
(7, 13, 1, 5500), (7, 14, 1, 2100),
(8, 15, 1, 15400), (8, 16, 1, 4600),
(9, 17, 3, 900), (9, 18, 1, 6800),
(10, 19, 2, 4200), (10, 20, 1, 4800);

UPDATE orders SET total_amount = (
    SELECT SUM(quantity * price_at_order) 
    FROM order_items 
    WHERE order_items.order_id = orders.id
);



















