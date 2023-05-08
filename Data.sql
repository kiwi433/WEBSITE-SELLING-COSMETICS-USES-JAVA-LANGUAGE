create database CSDLNC;
use CSDLNC;

create table `accounts`(
`id` int not null primary key auto_increment,
`username` varchar(50),
`password` varchar(50),
`isAdmin` boolean
);
create table `user_infor`(
`id_userinfor` int not null primary key auto_increment,
`id_account` int,
`fullname` varchar(255),
`gender` boolean,
`phonenumber` varchar(50),
`address` varchar(255),
`position` varchar(50),
`total` int default 0,
CONSTRAINT pk_account_userinfo foreign key (`id_account`) references `accounts`(`id`)
);
create table `product`(
`id` int not null primary key auto_increment,
`image` varchar(255),
`name` varchar(255),
`price` varchar(255),
`category` varchar(255),
`description` varchar(500),
capacity varchar(500),
origin varchar(255),
trademark varchar(255),
`quantity` int
);
create table `order`(
`id`int not null primary key auto_increment,
`id_product` int,
`id_user` int,
`order_quantity` int,
`date_order` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_p_o foreign key(`id_product`) references `product`(`id_p`),
CONSTRAINT pk_a_o foreign key(`id_user`) references `user_infor`(`id_account`)
);

DELIMITER  //
CREATE TRIGGER update_product AFTER INSERT ON `order`
FOR EACH ROW
BEGIN
	UPDATE product
	SET quantity = quantity - new.order_quantity
	WHERE product.id_p = new.id_product;
END //delimiter ;
DELIMITER //
CREATE TRIGGER update_product_update AFTER UPDATE ON `order`
FOR EACH ROW
BEGIN 
	UPDATE product
	SET quantity = quantity + OLD.order_quantity - NEW.order_quantity
	WHERE product.id_p = new.id_product;
END //delimiter ;
DELIMITER //
CREATE TRIGGER update_inventory_delete AFTER DELETE ON `order`
FOR EACH ROW
BEGIN
	UPDATE product
	SET quantity = quantity + OLD.order_quantity
	WHERE product.id_p = OLD.id_product;
END //delimiter ;

DELIMITER //
CREATE PROCEDURE delete_empty_customer_name()
BEGIN
 DELETE FROM product where `name` = '' OR `price` = ''Or `image`=''or `description`=''or `category`=''or capacity=''or origin=''or trademark=''or quantity='';
 DELETE product
    FROM product
    INNER JOIN (
        SELECT MIN(id_p) AS min_id, name
        FROM product
        GROUP BY name
        HAVING COUNT(*) > 1
    ) AS duplicates ON product.name = duplicates.name
    WHERE product.id_p> duplicates.min_id;
    UPDATE product
SET price = REPLACE(price, '.','');
UPDATE products  set price = RTRIM(price);
END //DELIMITER ;

SET GLOBAL event_scheduler = ON;
CREATE EVENT my_event
ON SCHEDULE EVERY 1 second
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO call delete_empty_customer_name();

