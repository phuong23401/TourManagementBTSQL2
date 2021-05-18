CREATE TABLE `city`(
`id` INT PRIMARY KEY,
`name` VARCHAR(50)
);

CREATE TABLE `tour_types`(
`id` INT PRIMARY KEY,
`type_code` VARCHAR(50),
`type_name` VARCHAR(50)
);

CREATE TABLE `place`(
`id` INT,
`name` VARCHAR(50),
`description` VARCHAR(50),
`AVGprice` INT,
`city_id` INT, 
PRIMARY KEY (`id`, `AVGprice`),
FOREIGN KEY (`city_id`) REFERENCES `city`(`id`)
);

CREATE TABLE `customer`(
`id` INT PRIMARY KEY,
`fullname` VARCHAR(50),
`IDnumber` VARCHAR(50),
`bitrh` DATE,
`city_id` INT,
FOREIGN KEY (`city_id`) REFERENCES `city`(`id`)
);

CREATE TABLE `tour_table`(
`id` INT PRIMARY KEY,
`tour_code` INT,
`tour_id` INT,
`price_place` INT,
`day_start` DATE,
`day_end` DATE,
FOREIGN KEY (`tour_id`) REFERENCES `tour_types`(`id`),
FOREIGN KEY (`price_place`) REFERENCES `place`(`AVGprice`)
);

CREATE TABLE `bill`(
`id` INT PRIMARY KEY,
`tour_id` INT,
`customer_id` INT,
`status` VARCHAR(50),
FOREIGN KEY (`tour_id`) REFERENCES `tour_table`(`id`),
FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`)
);

-- thêm giá trị các bảng
INSERT INTO `city`(`id`, `name`) VALUES
(1, "Ha Noi"),
(2, "Hai Phong"),
(3, "Hue"),
(4, "Da Nang"),
(5, "Sai Gon");

INSERT INTO `tour_types`(`id`, `type_code`, `type_name`) VALUES
(1, "001", "VIP"),
(2, "002", "Thường");

INSERT INTO `customer`(`id`, `fullname`, `IDnumber`, `birth`, `city_id`) VALUES
(1, "Nguyen Van A", "001001", "1990-10-24", 1),
(2, "Nguyen The B", "001002", "1990-10-24", 1),
(3, "Trinh Van C", "001003", "1990-10-24", 1),
(4, "Nguyen Thi D", "001004", "1990-10-24", 2),
(5, "Nguyen Duc E", "001005", "1990-10-24", 5),
(6, "Nguyen Minh A", "001006", "1990-10-24", 3),
(7, "Vu Van A", "001007", "1990-10-24", 4),
(8, "Nguyen Hoang B", "001008", "1990-10-24", 3),
(9, "Nguyen Van F", "001009", "1990-10-24", 2),
(10, "Nguyen Van G", "001010", "1990-10-24", 1);

INSERT INTO `place`(`id`, `name`, `description`, `AVGprice`, `city_id`) VALUES
(1, "Ho Guom", "HN01", 30, 1),
(2, "Cat Ba", "HP02", 40, 2),
(3, "Dai Noi Hue", "H03", 30, 3),
(4, "Ba Na Hills", "DN04", 50, 4),
(5, "Bitexco Skydeck", "SG05", 70, 5);

INSERT INTO `tour_table`(`id`, `tour_code`, `tour_id`, `price_place`, `day_start`, `day_end`) VALUES
(1, 0321, 1, 30, "2021-03-15", "2021-03-22"), 
(2, 0321, 1, 70, "2021-03-15", "2021-03-22"), 
(3, 0421, 1, 50, "2021-04-15", "2021-04-22"),
(4, 0621, 2, 30, "2021-06-15", "2021-06-22"), 
(5, 0521, 1, 40, "2021-05-15", "2021-05-22"), 
(6, 0321, 2, 40, "2021-03-15", "2021-03-22"), 
(7, 0321, 2, 70, "2021-03-15", "2021-03-22"), 
(8, 0721, 1, 50, "2021-07-15", "2021-07-22"), 
(9, 0421, 2, 50, "2021-04-15", "2021-04-22"), 
(10, 0421, 1, 30, "2021-04-15", "2021-04-22"), 
(11, 0321, 1, 40, "2021-03-15", "2021-03-22"), 
(12, 0521, 2, 40, "2021-05-15", "2021-05-22"), 
(13, 0621, 1, 50, "2021-06-15", "2021-06-22"), 
(14, 0321, 2, 70, "2021-03-15", "2021-03-22"), 
(15, 0621, 1, 30, "2021-06-15", "2021-06-22"); 

INSERT INTO `bill`(`id`, `tour_id`, `customer_id`, `status`) VALUES
(1, 1, 1, "Ready"),
(2, 2, 2, "Ready"),
(3, 3, 3, "Ready"),
(4, 4, 4, "Ready"),
(5, 5, 5, "Ready"),
(6, 6, 6, "Ready"),
(7, 7, 7, "Ready"),
(8, 8, 8, "Ready"),
(9, 9, 9, "Ready"),
(10, 10, 10, "Ready");

-- thống kê số lượng tour của các thành phố
SELECT `tour_code`, `city`.`name` FROM `tour_table`
JOIN `place` ON `tour_table`.`price_place` = `place`.`AVGprice`
JOIN `city` ON `place`.`city_id` = `city`.`id`;

-- số tour có ngày bắt đầu trong tháng 3
SELECT COUNT(`day_start`) FROM `tour_table`
WHERE `day_start` >= "2021-03-01" AND `day_start` <= "2021-03-31";

-- số tour có ngày kết thúc trong tháng 4
SELECT COUNT(`day_end`) FROM `tour_table`
WHERE `day_end` >= "2021-04-01" AND `day_end` <= "2021-04-30";