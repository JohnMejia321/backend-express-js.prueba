CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL UNIQUE,
    image VARCHAR(255) NULL ,
	is_available BOOLEAN NULL,
    session_token VARCHAR(255) NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL
);


-- sentencia sql para agregar usuarios

INSERT INTO users(
	email,
	name,
	lastname,
	phone,
	password,
	created_at,
	updated_at
)
	VALUES(
		'john@correo.com',
		'john',
		'mejia',
		'3234242',
		'12345',
		'2024-04-25',
		'2024-04-25'
	);





CREATE TABLE roles (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255),
	description VARCHAR(255), 
	route 	VARCHAR (255), 
	created_at TIMESTAMP, 
	updated_at TIMESTAMP
);

CREATE TABLE user_has_roles (
	id_user BIGINT, 
	id_role BIGINT, 
	created_at TIMESTAMP, 
	updated_at TIMESTAMP
);

CREATE TABLE addresses (
	id BIGINT PRIMARY KEY, 
	id_user BIGINT, 
	address 	VARCHAR (255),  
	neighborhood 	VARCHAR (50),  
	city DECIMAL (10,0),  
	state DECIMAL (10,0),  
	cp DECIMAL (10,0),  
	lon DECIMAL (20) ,  
	lat DECIMAL (20) ,   
	created_at TIMESTAMP ,   
	updated_at TIMESTAMP
);

CREATE TABLE orders (
	id_order BIGINT PRIMARY KEY ,
	order_key 	BIGINT ,
	id_user 	BIGINT ,
	address 	BIGINT ,
	total DECIMAL (10.2) ,   
	status 	VARCHAR (50) ,   
	timestamp 	BIGINT ,   
	createad_at TIMESTAMP ,   
	updatead_at TIMESTAMP
);

CREATE TABLE order_has_products (
	id_product BIGINT ,
	order_key  	BIGINT ,
	cantity  	BIGINT ,
	createad_by  	TIMESTAMP ,
	updatead_by  	TIMESTAMP
);

CREATE TABLE categories (
id_category  	BIGSERIAL PRIMARY KEY,
name 		VARCHAR (100) NOT NULL,
description TEXT NOT NULL,
parent_id INT REFERENCES categories(id_category)
createad_by TIMESTAMPTZ DEFAULT now(),
updateed_by TIMESTAMPTZ DEFAULT now()
);


CREATE TABLE products(
id_product SERIAL PRIMARY KEY,
barcode INT NOT NULL UNIQUE,
name varchar NOT NULL UNIQUE,
description TEXT NOT NULL UNIQUE,
image1 varchar NOT NULL UNIQUE,

category_id INT REFERENCES categories(id_category)
createed_by TIMESTAMPTZ DEFAULT now(),
updateed_by TIMESTAMPTZ
);
