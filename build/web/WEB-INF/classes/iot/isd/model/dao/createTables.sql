/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  thebigmoney
 * Created: 19/05/2024
 */

CREATE TABLE PRODUCTS (
    PRODUCT_ID INTEGER NOT NULL, 
    PRODUCT_NAME VARCHAR(255), 
    PRODUCT_PRICE DECIMAL(10, 2), 
    PRODUCT_UNITS INTEGER, 
    PRODUCT_CATEGORY VARCHAR(255), 
    PRODUCT_IMAGE LONG VARCHAR, 
    PRIMARY KEY (PRODUCT_ID)
);

-- Insert products with specified categories
INSERT INTO IOTUSER.PRODUCTS (PRODUCT_ID, PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_UNITS, PRODUCT_CATEGORY, PRODUCT_IMAGE) VALUES
(1004, 'LG Smart Washing Machine', 1200, 8, 'home appliance', 'https://www.jbhifi.com.au/cdn/shop/files/586169-Product-0-I-637873417377800277_37f6618d-8e97-49dc-917a-2d281173d3f3.jpg?v=1713250050'),
(1005, 'Google Nest Hub Max', 229, 15, 'smart home', 'https://www.jbhifi.com.au/cdn/shop/products/409514-Product-0-I.jpg?v=1660522072'),
(1006, 'Amazon Echo Dot 4th Gen', 49, 30, 'smart home', 'https://www.jbhifi.com.au/cdn/shop/products/485159-Product-0-I-637366313871295350_c00d8e49-4c21-49e0-a194-6cd562194e66_grande.jpg'),
(1007, 'Philips Hue Smart Bulb', 19, 50, 'lighting', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMBVHNpZCHErPx-dlO5soZbgwCV1frXml6V_RCcWE21A&s'),
(1008, 'Sony Smart TV 55', 900, 9, 'electronics', 'https://www.sony.com.au/image/ccbe548efa94995a9c034d96a4a6acbb?fmt=pjpeg&wid=330&bgcolor=FFFFFF&bgc=FFFFFF'),
(1009, 'Apple HomePod Mini', 99, 25, 'smart home', 'https://www.jbhifi.com.au/cdn/shop/products/539284-Product-0-I-637750771359446114.jpg?v=1639440860'),
(1010, 'Fitbit Charge 4', 149, 20, 'wearables', 'https://omnichannelimages.global.ssl.fastly.net/prod/dsv/os/OS-2080FTBADUSSFB417BKBK-SO_001_1.JPG'),
(1011, 'Ring Video Doorbell 3', 199, 18, 'home security', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5RDR1XtVrrSpPRK86V9yuXaAs43OLf2KNy2Rp614G9w&s'),
(1012, 'Nest Learning Thermostat', 249, 12, 'smart home', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS31CPFGR7PFSa7eE-qLVUhxrKqiqkjXFLlDGJ2loYKNA&s'),
(1013, 'Dyson Pure Cool Link', 499, 10, 'air quality', 'https://dyson-h.assetsadobe2.com/is/image/content/dam/dyson/leap-petite-global/dynamic-media/ec/tp00/Primary-Pure-Cool-Link-Tower-primary.png?fmt=png-alpha&scl=1&fmt=png-alpha'),
(1014, 'iRobot Roomba 960', 499, 7, 'home appliance', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReVUGqY_2ziB4jXqeJxtOKIEbwU0A3hF3R8dn7tJhn_g&s'),
(1015, 'Samsung Galaxy Watch 4', 349, 14, 'wearables', 'https://www.jbhifi.com.au/cdn/shop/products/531805-Product-0-I-637647131901276778_3601e207-c60d-46b1-9b4a-c307761485bc.jpg?v=1691461977'),
(1016, 'Xiaomi Mi Smart Band 6', 35, 40, 'wearables', 'https://s.catch.com.au/images/product/0059/59274/618b25aab4af0908735865.jpg'),
(1017, 'Arlo Pro 4 Spotlight Camera', 199, 15, 'home security', 'https://cdn.productreview.com.au/resize/listing-picture/d1c3db93-5617-4038-a2d2-1b205e2eb255?height=630&v=2&width=1200'),
(1018, 'Bose QuietComfort Earbuds', 279, 20, 'audio', 'https://www.jbhifi.com.au/cdn/shop/products/608384-Product-0-I-637980455582467790_a24da224-410a-4f6d-a01f-6fbdd98a2875.jpg?v=1698351918'),
(1019, 'LIFX Smart LED Strip', 89, 22, 'lighting', 'https://www.lifx.com.au/cdn/shop/products/00_LIFX_Lightstrip_2m_AU_58ee52ca-1305-4252-87be-3bb2c04ec3dc.jpg?v=1620792678'),
(1020, 'Eufy Smart Scale P1', 45, 30, 'health & wellness', 'https://m.media-amazon.com/images/I/61XwQl36opL._AC_UF894,1000_QL80_.jpg'),
(1021, 'August Smart Lock Pro', 229, 12, 'home security', 'https://m.media-amazon.com/images/I/51Lm7sw46GL._AC_UF894,1000_QL80_.jpg'),
(1022, 'Anker Nebula Capsule II Smart Mini Projector', 580, 5, 'electronics', 'https://example.com/anker-nebula.jpg'),
(1001, 'Electric Doorbell', 105, 50, 'home appliance', 'https://m.media-amazon.com/images/I/51T-S9efoUL._AC_UF894,1000_QL80_.jpg'),
(1002, 'Tp-Link Home Modem', 100, 25, 'electronics', 'https://www.betta.com.au/media/catalog/product/A/R/ARCHER_VR300_1602561944.JPG?optimize=medium&fit=bounds&height=700&width=700&canvas=700:700'),
(1003, 'Samsung Smart Fridge', 2500, 12, 'home appliance', 'https://www.jbhifi.com.au/cdn/shop/files/523201-Product-0-I-637741143759267611_2b31e2d5-6eeb-46ff-9892-3afdd6fa07ff.jpg?v=1712808504');



CREATE TABLE USERS (EMAIL VARCHAR(255) NOT NULL, "NAME" VARCHAR(255), PASSWORD VARCHAR(255), ADDRESS VARCHAR(255), "TYPE" VARCHAR(255), STATUS VARCHAR(255) DEFAULT 'ACTIVE'  NOT NULL, PRIMARY KEY (EMAIL));


INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('John@gmail.com', 'John Bloggs', 'password', '31 Dury Lane', NULL, 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('alice.johnson@example.com', 'Alice Johnson', 'pass1234', '123 Maple Street, Springfield', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('bob.smith@example.com', 'Bob Smith', 'pass1234', '456 Oak Road, Anytown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('carol.white@example.com', 'Carol White', 'pass1234', '789 Pine Lane, Newtown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('david.brown@example.com', 'David Brown', 'pass1234', '321 Birch Blvd, Oldtown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('emma.thomas@example.com', 'Emma Thomas', 'pass1234', '654 Cedar St, Youngtown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('frank.moore@example.com', 'Frank Moore', 'pass1234', '987 Spruce Ave, Smallville', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('grace.lee@example.com', 'Grace Lee', 'pass1234', '246 Elm St, Middletown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('henry.wilson@example.com', 'Henry Wilson', 'pass1234', '135 Ash Lane, Eastville', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('isabella.martinez@example.com', 'Isabella Martinez', 'pass1234', '864 Willow Road, Westtown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('jacob.anderson@example.com', 'Jacob Anderson', 'pass1234', '975 Maple Court, Northtown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('kylie.taylor@example.com', 'Kylie Taylor', 'pass1234', '321 Poplar St, Southville', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('liam.scott@example.com', 'Liam Scott', 'pass1234', '456 Fir Ave, Centerville', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('mia.clark@example.com', 'Mia Clark', 'pass1234', '789 Birch Way, Lakeview', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('noah.davis@example.com', 'Noah Davis', 'pass1234', '654 Redwood Path, Ridgeville', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('olivia.martinez@example.com', 'Olivia Martinez', 'pass1234', '852 Cedar Blvd, Creekville', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('peter.jones@example.com', 'Peter Jones', 'pass1234', '951 Pine Street, Rivercity', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('quinn.wilson@example.com', 'Quinn Wilson', 'pass1234', '159 Elm Road, Peachtown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('ryan.thomas@example.com', 'Ryan Thomas', 'pass1234', '348 Spruce Lane, Fieldtown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('sophia.jackson@example.com', 'Sophia Jackson', 'pass1234', '762 Oak Drive, Mountaintown', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('tyler.lewis@example.com', 'Tyler Lewis', 'pass1234', '147 Maple Avenue, Seaside', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('nancy.gray@example.com', 'Nancy Gray', 'staff1234', '2584 Broadway St, Metroville', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('ethan.hunt@example.com', 'Ethan Hunt', 'staff1234', '3682 Quarry Rd, Stonecity', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('julia.stone@example.com', 'Julia Stone', 'staff1234', '4701 Sunset Blvd, Beachtown', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('marcus.finch@example.com', 'Marcus Finch', 'staff1234', '572 Parkway Dr, Lakeside', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('olivia.dunn@example.com', 'Olivia Dunn', 'staff1234', '6821 Cedarwood Rd, Forestville', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('patrick.kane@example.com', 'Patrick Kane', 'staff1234', '7842 Oak Valley Ln, Riverview', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('laura.norman@example.com', 'Laura Norman', 'staff1234', '8923 River St, Cliffside', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('simon.pearce@example.com', 'Simon Pearce', 'staff1234', '9034 Grand Ave, Capetown', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('zoe.wright@example.com', 'Zoe Wright', 'staff1234', '10125 Lakefront Blvd, Waterside', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('evan.cole@example.com', 'Evan Cole', 'staff1234', '1126 Vine St, Vinetown', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('testemail@test.com.au', 'Full Name', 'password', 'address', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('anothertest@gmail.com', 'Full Name', 'password', 'address', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('another2@gmail.com', 'Full Name', 'password', 'address', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('jim@aol.com', 'Full Name', 'password', '31a Marrickville Rd', 'CUSTOMER', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('admin@gmail.com', 'Admin', 'password', '', 'STAFF', 'ACTIVE');
INSERT INTO IOTUSER.USERS (EMAIL, "NAME", PASSWORD, ADDRESS, "TYPE", STATUS) 
	VALUES ('felix.lush@gmail.com', 'Felix Lush', 'password', '31a Marrickville Rd, Marrickville', 'CUSTOMER', 'ACTIVE');




CREATE TABLE USER_LOGS (
    ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    USER_EMAIL VARCHAR(255) NOT NULL,
    ACCESS_DATE VARCHAR(255),
    LOGIN_TIME VARCHAR(255),
    LOGOUT_TIME VARCHAR(255),
    PRIMARY KEY (ID)
);



INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '18:19:50', '18:20:11');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '19:02:11', '19:04:53');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '08:39:46', '08:39:52');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '11:07:23', '11:07:55');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('nancy.gray@example.com', '2024-05-17', '12:38:35', '12:40:35');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '13:24:05', '13:25:48');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('evan.cole@example.com', '2024-05-17', '13:26:45', '13:27:21');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '13:40:39', '13:40:42');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '14:13:34', '14:16:11');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '15:17:08', '15:17:13');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('admin@gmail.com', '2024-05-17', '15:32:52', '15:41:30');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-18', '17:32:31', '17:33:18');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '18:19:50', '18:20:11');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '19:02:11', '19:04:53');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '08:39:46', '08:39:52');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '11:07:23', '11:07:55');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('nancy.gray@example.com', '2024-05-17', '12:38:35', '12:40:35');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '13:24:05', '13:25:48');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('evan.cole@example.com', '2024-05-17', '13:26:45', '13:27:21');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '13:40:39', '13:40:42');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '14:13:34', '14:16:11');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '15:17:08', '15:17:13');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('admin@gmail.com', '2024-05-17', '15:32:52', '15:41:30');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-18', '17:32:31', '17:33:18');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-15', '16:28:22', 'null');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-15', '16:30:14', '16:30:16');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-15', '16:46:50', '16:47:10');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '09:25:18', '09:25:31');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '10:48:34', '10:51:15');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '12:04:50', '12:11:19');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '13:19:23', '13:22:39');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('admin@gmail.com', '2024-05-19', '14:49:49', '14:49:54');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('alice.johnson@example.com', '2024-05-19', '14:50:26', '14:50:53');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('admin@gmail.com', '2024-05-19', '15:12:26', '15:12:53');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix@hotmail.com', '2024-05-19', '15:28:23', '15:31:54');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-19', '15:37:17', '15:37:35');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-19', '15:39:52', '15:39:54');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-19', '16:06:32', '16:06:33');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('John@gmail.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('alice.johnson@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('bob.smith@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('carol.white@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-15', '16:28:22', 'null');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-15', '16:30:14', '16:30:16');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-15', '16:46:50', '16:47:10');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '09:25:18', '09:25:31');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '10:48:34', '10:51:15');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '12:04:50', '12:11:19');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '13:19:23', '13:22:39');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('david.brown@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('emma.thomas@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('frank.moore@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('grace.lee@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('henry.wilson@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('isabella.martinez@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('jacob.anderson@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('kylie.taylor@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('liam.scott@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('mia.clark@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('noah.davis@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('olivia.martinez@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('peter.jones@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('quinn.wilson@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('ryan.thomas@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('sophia.jackson@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('tyler.lewis@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('nancy.gray@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('ethan.hunt@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('julia.stone@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('marcus.finch@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('olivia.dunn@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('patrick.kane@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('laura.norman@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('simon.pearce@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('zoe.wright@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('evan.cole@example.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('testemail@test.com.au', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('anothertest@gmail.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('another2@gmail.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('jim@aol.com', '2024-05-16', '09:00:00', '17:00:00');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('felix.lush@gmail.com', '2024-05-16', '18:19:50', '18:20:11');
INSERT INTO IOTUSER.USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) 
	VALUES ('admin@gmail.com', '2024-05-16', '09:00:00', '17:00:00');




CREATE TABLE ORDERS (
    ORDER_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    ORDER_EMAIL VARCHAR(255) NOT NULL,
    ORDER_DATE DATE NOT NULL,
    ADDRESS VARCHAR(255) NOT NULL,
    PRODUCT_ID INTEGER NOT NULL,
    PRICE DECIMAL(10, 2) NOT NULL,
    ORDER_QUANTITY INTEGER NOT NULL,
    PAID BOOLEAN NOT NULL,
    PRIMARY KEY (ORDER_ID)
);

INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '31a Marrickville Rd ', 1005, 229.00, 1, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '31a Marrickville Rd ', 1004, 30000.00, 5, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', '31a Marrickville Rd ', 1006, 1225.00, 5, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', 'Sydney St', 1004, 30000.00, 5, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', 'Sydney St', 1006, 1225.00, 5, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('felix.lush@gmail.com', '2024-05-17', 'Happy St', 1007, 475.00, 5, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('BigJim@gmail.com', '2024-05-17', 'My Address', 1005, 229.00, 1, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('', '2024-05-17', 'No Address Provided', 1004, 30000.00, 5, true);
INSERT INTO IOTUSER.ORDERS (ORDER_EMAIL, ORDER_DATE, ADDRESS, PRODUCT_ID, PRICE, ORDER_QUANTITY, PAID) 
	VALUES ('', '2024-05-17', 'No Address Provided', 1005, 2061.00, 3, true);

CREATE TABLE PAYMENTS (
    PAYMENT_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
    CARD_NAME VARCHAR(30), 
    CARD_NUMBER VARCHAR(30), 
    PAYMENT_METHOD VARCHAR(30), 
    EMAIL VARCHAR(30), 
    PAYMENT_DATE VARCHAR(30), 
    PAYMENT_AMOUNT DOUBLE, 
    PRIMARY KEY (PAYMENT_ID)
);

INSERT INTO IOTUSER.PAYMENTS (CARD_NAME, CARD_NUMBER, PAYMENT_METHOD, EMAIL, PAYMENT_DATE, PAYMENT_AMOUNT) 
	VALUES ('Mister Smith', '2222222222222222', 'Mastercard', 'alec@gmail', '2024-05-19', 50.0);
INSERT INTO IOTUSER.PAYMENTS (CARD_NAME, CARD_NUMBER, PAYMENT_METHOD, EMAIL, PAYMENT_DATE, PAYMENT_AMOUNT) 
	VALUES ('Alec Mcmicking', '0000000000000000', 'Mastercard', 'alec@gmail', '2024-05-19', 50.0);
INSERT INTO IOTUSER.PAYMENTS (CARD_NAME, CARD_NUMBER, PAYMENT_METHOD, EMAIL, PAYMENT_DATE, PAYMENT_AMOUNT) 
	VALUES ('John Smith', '5555555555555555', 'Mastercard', 'alec@gmail', '2024-05-19', 50.0);
INSERT INTO IOTUSER.PAYMENTS (CARD_NAME, CARD_NUMBER, PAYMENT_METHOD, EMAIL, PAYMENT_DATE, PAYMENT_AMOUNT) 
	VALUES ('Alec Mcmicking', '0000000000000000', 'Mastercard', 'alec@gmail', '2024-05-19', 50.0);
INSERT INTO IOTUSER.PAYMENTS (CARD_NAME, CARD_NUMBER, PAYMENT_METHOD, EMAIL, PAYMENT_DATE, PAYMENT_AMOUNT) 
	VALUES ('Mister Smith', '7895213674589215', 'Mastercard', 'alec@gmail', '2024-05-19', 50.0);
INSERT INTO IOTUSER.PAYMENTS (CARD_NAME, CARD_NUMBER, PAYMENT_METHOD, EMAIL, PAYMENT_DATE, PAYMENT_AMOUNT) 
	VALUES ('Hello There', '0000000000000000', 'Mastercard', '', '2024-05-19', 50.0);
INSERT INTO IOTUSER.PAYMENTS (CARD_NAME, CARD_NUMBER, PAYMENT_METHOD, EMAIL, PAYMENT_DATE, PAYMENT_AMOUNT) 
	VALUES ('Mister Smith', '9999999999999999', 'Mastercard', '', '2024-05-19', 50.0);