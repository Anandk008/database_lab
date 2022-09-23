DROP DATABASE IF EXISTS Machines;
CREATE DATABASE Machines;
USE Machines;

CREATE TABLE warehouse(
    machine_id INT NOT NULL DEFAULT 0 ,
    machine_type VARCHAR(50) NOT NULL DEFAULT 'UNKNOWN',
    PRIMARY KEY(machine_id)
);

CREATE TABLE motor (
    motor_id INT NOT NULL DEFAULT 0 ,
    machine_id INT NOT NULL DEFAULT 0,
    manufacturer_name VARCHAR(50) DEFAULT 'UNKNOWN',
    power_of_machine INT NOT NULL DEFAULT 0,
    machine_price INT NOT NULL DEFAULT 99999, 
    PRIMARY KEY (motor_id),
    FOREIGN KEY (machine_id) REFERENCES warehouse(machine_id)
);

CREATE TABLE dc_motor (
    dc_motor_id INT NOT NULL DEFAULT 0,
    machine_id INT NOT NULL DEFAULT 0,
    manufacturer_name VARCHAR(50) DEFAULT 'UNKNOWN',
    power_of_machine INT NOT NULL DEFAULT 0,
    machine_price INT NOT NULL DEFAULT 99999, 
    PRIMARY KEY (dc_motor_id),
    FOREIGN KEY (machine_id) REFERENCES warehouse(machine_id)
);

CREATE TABLE transformer (
    transformer_id INT NOT NULL DEFAULT 0 ,
    machine_id INT NOT NULL DEFAULT 0,
    manufacturer_name VARCHAR(50) DEFAULT 'UNKNOWN',
    rating_of_machine INT NOT NULL DEFAULT 0,
    machine_price INT NOT NULL DEFAULT 99999, 
    PRIMARY KEY (transformer_id),
    FOREIGN KEY (machine_id) REFERENCES warehouse(machine_id)
);

CREATE TABLE motor_brand (
    brand_id INT NOT NULL DEFAULT 0,
    motor_id INT NOT NULL DEFAULT 0,
    brand_name VARCHAR(128) DEFAULT 'UNKNOWN',
    PRIMARY KEY (motor_id,brand_id),
    FOREIGN KEY (motor_id) REFERENCES motor(motor_id)
);

CREATE TABLE dc_motor_brand (
    brand_id INT NOT NULL DEFAULT 0,
    dc_motor_id INT NOT NULL DEFAULT 0,
    brand_name VARCHAR(128) DEFAULT 'UNKNOWN',
    PRIMARY KEY (dc_motor_id,brand_id),
    FOREIGN KEY (dc_motor_id) REFERENCES dc_motor(dc_motor_id)
);

CREATE TABLE transformer_brand (
    brand_id INT NOT NULL DEFAULT 0,
    transformer_id INT NOT NULL DEFAULT 0,
    brand_name VARCHAR(128) DEFAULT 'UNKNOWN',
    PRIMARY KEY (transformer_id,brand_id),
    FOREIGN KEY (transformer_id) REFERENCES transformer(transformer_id)
);

CREATE TABLE M_order(
    order_id INT NOT NULL DEFAULT 0,
    machine_id INT NOT NULL DEFAULT 0,
    order_address VARCHAR(40) NOT NULL DEFAULT 'UNKOWN',
    order_date date,
    Total_bill INT NOT NULL DEFAULT 0,
    PRIMARY KEY(order_id,machine_id),
    FOREIGN KEY(machine_id) REFERENCES warehouse(machine_id)
);

CREATE TABLE customer(
    cust_id INT NOT NULL DEFAULT 0,
    order_id INT NOT NULL DEFAULT 0,
    cust_name VARCHAR(50) NOT NULL DEFAULT 'UNKNOWN',
    bill_amount INT NOT NULL DEFAULT 0,

    PRIMARY KEY(cust_id,order_id),
    FOREIGN KEY(order_id) REFERENCES M_order(order_id)
);


INSERT INTO warehouse VALUES (1,"ac-motor");
INSERT INTO warehouse VALUES (2,"single-phase-transformer");
INSERT INTO warehouse VALUES (3,"3-phase-transformer");
INSERT INTO warehouse VALUES (4,"dc-motor");
INSERT INTO warehouse(machine_id) VALUES (5);


INSERT INTO motor VALUES (1,1, "Cummins",100,10000);
INSERT INTO motor VALUES (2,1, "Siemens",43,3000);
INSERT INTO motor VALUES (3,1, "Cummins",90,1000);
INSERT INTO motor VALUES (4,1, "Lunar",79,50000);
INSERT INTO motor VALUES (5,1, "ABB motors",87,30000);
INSERT INTO motor VALUES (6,1, "simens",99,78000);

INSERT INTO dc_motor VALUES (1,4, "Cummins",100,8000);
INSERT INTO dc_motor VALUES (2,4, "Siemens",43,2400);
INSERT INTO dc_motor VALUES (3,4, "Cummins",90,500);

INSERT INTO transformer VALUES (1,2, "Cummins transformers",100,10000);
INSERT INTO transformer VALUES (2,2, "Siemens transformers",43,3000);
INSERT INTO transformer VALUES (3,2, "Cummins transformers",90,1000);
INSERT INTO transformer VALUES (4,3, "Lunar transformers",79,50000);
INSERT INTO transformer VALUES (5,3, "ABB transformers",87,30000);
INSERT INTO transformer VALUES (6,3, "simens transformers",99,78000);

INSERT INTO motor_brand VALUES (1, 1, "Cummins");
INSERT INTO motor_brand VALUES (2, 2,"Siemens");
INSERT INTO motor_brand VALUES (3, 3,"Lunar");
INSERT INTO motor_brand VALUES (4, 4,"ABB motors");

INSERT INTO dc_motor_brand VALUES (1, 1, "Gujrat");
INSERT INTO dc_motor_brand VALUES (2, 2,"AVR");
INSERT INTO dc_motor_brand VALUES (3, 3,"ABC");

INSERT INTO transformer_brand VALUES (1, 1, "Trans Tronics");
INSERT INTO transformer_brand VALUES (2, 2,"Sonal Enterprizes");
INSERT INTO transformer_brand VALUES (3, 3,"SS Transformers");


INSERT INTO M_order VALUES (1,1,'sangli','2022-10-22',25000);
INSERT INTO M_order VALUES (2,2,'miraj','2022-10-30',30000);
INSERT INTO M_order VALUES (3,3,'kupwad','2022-11-05',30000);


INSERT INTO customer VALUES (1,1, "Tesla",100000);
INSERT INTO customer VALUES (2,2, "AEG Enetrprizes",10000);
INSERT INTO customer VALUES (3,3, "Anand Enterprizes",50000);



