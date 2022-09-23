DROP DATABASE IF EXISTS Inventory;
CREATE DATABASE Inventory;
USE Inventory;

CREATE TABLE warehouse(
    warehouse_id INT NOT NULL DEFAULT 0 ,
    warehouse_location VARCHAR(50) NOT NULL DEFAULT 'UNKNOWN',
    PRIMARY KEY(warehouse_id)
);

CREATE TABLE product (
    product_id INT NOT NULL DEFAULT 0 ,
    warehouse_id INT NOT NULL DEFAULT 0,
    product_name VARCHAR(50) DEFAULT 'UNKNOWN',
    p_Quantity INT NOT NULL DEFAULT 0,
    p_price INT NOT NULL DEFAULT 99999, 
    PRIMARY KEY (product_id,warehouse_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
);

CREATE TABLE brand (
    brand_id INT NOT NULL DEFAULT 0,
    product_id INT NOT NULL DEFAULT 0,
    brand_name VARCHAR(128) DEFAULT 'UNKNOWN',
    PRIMARY KEY (product_id,brand_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE P_order(
    order_id INT NOT NULL DEFAULT 0,
    product_id INT NOT NULL DEFAULT 0,
    order_address VARCHAR(40) NOT NULL DEFAULT 'UNKOWN',
    order_date date,
    Total_bill INT NOT NULL DEFAULT 0,
    PRIMARY KEY(order_id,product_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);

CREATE TABLE customer(
    cust_id INT NOT NULL DEFAULT 0,
    order_id INT NOT NULL DEFAULT 0,
    cust_name VARCHAR(50) NOT NULL DEFAULT 'UNKNOWN',
    bill_amount INT NOT NULL DEFAULT 0,

    PRIMARY KEY(cust_id,order_id),
    FOREIGN KEY(order_id) REFERENCES P_order(order_id)
);


INSERT INTO warehouse VALUES (1,"Sangli");
INSERT INTO warehouse VALUES (2,"Kolhapur");
INSERT INTO warehouse VALUES (3,"Satara");
INSERT INTO warehouse VALUES (4,"Pune");
INSERT INTO warehouse(warehouse_id) VALUES (5);


INSERT INTO product VALUES (1,1, 'Monitor',100,10000);
INSERT INTO product VALUES (2,1, "Keyboard",43,3000);
INSERT INTO product VALUES (3,1, "Mouse",90,1000);
INSERT INTO product VALUES (4,1, "PS5",79,50000);
INSERT INTO product VALUES (5,1, "VR",87,30000);
INSERT INTO product VALUES (6,1, "Iphone",99,78000);

INSERT INTO brand VALUES (1, 1, "Samsung");
INSERT INTO brand VALUES (2, 1,"Apple");
INSERT INTO brand VALUES (3, 1,"Oppo");
INSERT INTO brand VALUES (4, 1,"Asus");

INSERT INTO P_order VALUES (1,1,'sangli','2022-10-22',25000);
INSERT INTO P_order VALUES (2,2,'miraj','2022-10-30',30000);
INSERT INTO P_order VALUES (3,3,'kupwad','2022-11-05',30000);


INSERT INTO customer VALUES (1,1, "Jack",100000);
INSERT INTO customer VALUES (2,2, "Kunal",10000);
INSERT INTO customer VALUES (3,3, "Shasikant",50000);



