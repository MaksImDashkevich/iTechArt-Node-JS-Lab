
CREATE DATABASE TEST3;

USE TEST3;

CREATE TABLE users
( 
id			 INT 			NOT NULL 	PRIMARY KEY,
login		 VARCHAR(100) 	NOT NULL,
passwords	 VARCHAR(100) 	NOT NULL
);

CREATE TABLE roles
(
id		 INT			 NOT NULL		PRIMARY KEY,
name	 VARCHAR(100)	 NOT NULL
);

CREATE TABLE pizzas
(
id			INT 			NOT NULL	PRIMARY KEY,
title 		VARCHAR(100) 	NOT NULL,
price 		NUMERIC 		NOT NULL
);

CREATE TABLE ingredients
(
id 			INT 			NOT NULL	PRIMARY KEY,
name		VARCHAR(100) 	NOT NULL,
price 		NUMERIC 		NOT NULL
);

CREATE TABLE promo_codes
(
id 			INT			 NOT NULL		PRIMARY KEY,
code 		SMALLINT	 NULL,
value 		NUMERIC		 NULL,
due_date	DATETIME	 NOT NULL
);

CREATE TABLE user_info
(
id			 INT			 NOT NULL	PRIMARY KEY,
user_id		 INT			 NOT NULL,
name		 VARCHAR(100)	 NOT NULL,
namber		 VARCHAR(20)	 NULL,
email		 VARCHAR(100)	 NOT NULL
);

CREATE TABLE users_roles
(
id			 INT	 NOT NULL		PRIMARY KEY,
user_id		 INT	 NOT NULL,
role_id		 INT	 NOT NULL
);


CREATE TABLE ordor
(
id				 INT			 NOT NULL	PRIMARY KEY,
user_id			 INT			 NOT NULL,
promo_code_id	 INT			 NULL,
waiting_time	 TIME			 NOT NULL,
to_be_paid		 NUMERIC		 NOT NULL,
buyers_address	 VARCHAR(100)	 NOT NULL,
paymen			 VARCHAR(100)	 NOT NULL,
delivery		 VARCHAR(100)	 NOT NULL,
comments		 TEXT(300)		 NULL,
statys			 VARCHAR(100)	 NOT NULL
);

CREATE TABLE basket
(
id			 INT		 NOT NULL	PRIMARY KEY,
ordor_id	 INT		 NOT NULL,
pizza_id	 INT		 NOT NULL,
quantity	 SMALLINT	 NULL,
price		 NUMERIC	 NULL
);

CREATE TABLE pizza_ingredient
(
id				 INT		 NOT NULL	PRIMARY KEY,
ingredient_id	 INT		 NOT NULL,
pizza_id		 INT		 NOT NULL,
quantity		 SMALLINT	 NOT NULL
);

CREATE TABLE reviews
(
id			 INT			 NOT NULL	PRIMARY KEY,
pizza_id	 INT			 NOT NULL,
user_id		 INT			 NOT NULL,
date		 DATETIME		 NOT NULL,
comment		 TEXT(300)		 NULL,
rate		 SMALLINT		 NULL
);

ALTER TABLE user_info
ADD CONSTRAINT FK_user_info_user_id_users_id FOREIGN KEY(user_id)
	REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
    
ALTER TABLE users_roles
ADD CONSTRAINT FK_users_roles_user_id_users_id FOREIGN KEY(user_id)
	REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;    

ALTER TABLE users_roles
ADD CONSTRAINT FK_users_roles_role_id_roles_id FOREIGN KEY(role_id)
	REFERENCES roles(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;      

ALTER TABLE ordor
ADD CONSTRAINT FK_ordor_user_id_users_id FOREIGN KEY(user_id)
	REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
    
ALTER TABLE ordor
ADD CONSTRAINT FK_ordor_promo_code_id_promo_codes_id FOREIGN KEY(promo_code_id)
	REFERENCES promo_codes(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;    
    
ALTER TABLE basket
ADD CONSTRAINT FK_basket_ordor_id_ordor_id FOREIGN KEY(ordor_id)
	REFERENCES ordor(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE; 
    
ALTER TABLE basket
ADD CONSTRAINT FK_basket_pizza_id_pizzas_id FOREIGN KEY(pizza_id)
	REFERENCES pizzas(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;     
    
ALTER TABLE pizza_ingredient
ADD CONSTRAINT FK_pizza_ingredient_ingredient_id_ingredients_id FOREIGN KEY(ingredient_id)
	REFERENCES ingredients(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;     
    
ALTER TABLE pizza_ingredient
ADD CONSTRAINT FK_pizza_ingredient_pizza_id_pizzas_id FOREIGN KEY(pizza_id)
	REFERENCES pizzas(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;     

ALTER TABLE reviews
ADD CONSTRAINT FK_reviews_user_id_users_id FOREIGN KEY(user_id)
	REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;    

     