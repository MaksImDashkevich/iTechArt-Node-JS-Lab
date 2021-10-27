CREATE DATABASE TEST;
USE TEST;

CREATE TABLE users
( 
id INT NOT NULL ,
login NVARCHAR(100) NOT NULL,
passwords NVARCHAR(100) NOT NULL,

CONSTRAINT users PRIMARY KEY(id)
);

CREATE TABLE roles
(
id INT NOT NULL,
name NVARCHAR(100) NOT NULL,

CONSTRAINT rol PRIMARY KEY(id) 
);

CREATE TABLE pizzas
(
id INT NOT NULL,
title NVARCHAR(100) NOT NULL,
price NUMERIC NOT NULL,

CONSTRAINT piz PRIMARY KEY(id) 
);

CREATE TABLE ingredients
(
id INT NOT NULL,
name NVARCHAR(100) NOT NULL,
price NUMERIC NOT NULL,

CONSTRAINT ing PRIMARY KEY(id)  
);

CREATE TABLE promo_codes
(
id INT NOT NULL,
code SMALLINT  NULL,
value NUMERIC NULL,
due_date DATETIME NOT NULL,

CONSTRAINT promo PRIMARY KEY(id) 
);

CREATE TABLE user_info
(
id INT NOT NULL,
user_id INT NOT NULL,
name NVARCHAR(100) NOT NULL,
namber VARCHAR(20) NULL,
email NVARCHAR(100) NOT NULL,

CONSTRAINT usinfo PRIMARY KEY(id),

FOREIGN KEY (user_id)
	REFERENCES users(id)
);

CREATE TABLE users_roles
(
id INT NOT NULL,
user_id INT NOT NULL,
role_id INT NOT NULL,

CONSTRAINT userol PRIMARY KEY(id),

FOREIGN KEY (user_id)
	REFERENCES users(id),

FOREIGN KEY (role_id)
	REFERENCES roles(id)    
);


CREATE TABLE ordor
(
id INT NOT NULL,
user_id INT NOT NULL,
promo_code_id INT  NULL,
waiting_time TIME  NOT NULL,
to_be_paid NUMERIC NOT NULL,
buyers_address NVARCHAR(100) NOT NULL,
paymen NVARCHAR(100) NOT NULL,
delivery NVARCHAR(100) NOT NULL,
comments TEXT(300) NULL,
statys NVARCHAR(100) NOT NULL,

CONSTRAINT ord PRIMARY KEY(id),

FOREIGN KEY (user_id)
	REFERENCES users(id),
    
FOREIGN KEY (promo_code_id)
	REFERENCES promo_codes(id)
);

CREATE TABLE basket
(
id INT NOT NULL,
ordor_id INT NOT NULL,
pizza_id INT NOT NULL,
quantity SMALLINT NULL,
price NUMERIC NULL,

CONSTRAINT bas PRIMARY KEY(id),

FOREIGN KEY (ordor_id)
	REFERENCES ordor(id),

FOREIGN KEY (pizza_id)
	REFERENCES pizzas(id)    
);

CREATE TABLE pizza_ingredient
(
id INT NOT NULL,
ingredient_id INT NOT NULL,
pizza_id INT NOT NULL,
quantity SMALLINT NOT NULL,

CONSTRAINT pizing PRIMARY KEY(id),

FOREIGN KEY (ingredient_id)
	REFERENCES ingredients(id),
    
FOREIGN KEY (pizza_id)
	REFERENCES pizzas(id)
);

CREATE TABLE reviews
(
id INT NOT NULL,
pizza_id INT NOT NULL,
user_id INT NOT NULL,
date DATETIME NOT NULL,
comment TEXT(300) NULL,
rate SMALLINT NULL,

CONSTRAINT rev PRIMARY KEY(id),

FOREIGN KEY (user_id)
	REFERENCES users(id),
    
FOREIGN KEY (pizza_id)
	REFERENCES pizzas(id)
);