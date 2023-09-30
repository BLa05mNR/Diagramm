CREATE TABLE categories(
	id INTEGER PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description VARCHAR(500) NULL
)


CREATE TABLE manufactures(
	id INTEGER PRIMARY KEY,
	name VARCHAR(75) NOT NULL,
	contact_information VARCHAR(50) NOT NULL
)


CREATE TABLE clients(
	id INTEGER PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	full_name VARCHAR(100) NOT NULL,
	adress VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	mobile_phone INTEGER NOT NULL,
	login VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	order_history INTEGER NOT NULL
)


CREATE TABLE departments(
	id INTEGER PRIMARY KEY,
	department_name VARCHAR(80) NOT NULL,
	description VARCHAR(500) NULL
)


CREATE TABLE products (
	id INTEGER PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	description VARCHAR(500) NULL,
	price INTEGER NOT NULL,
	quality_in_stock INTEGER NOT NULL,
	FOREIGN KEY (manufacter_id) REFERENCES manufactures(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE NO ACTION ON UPDATE CASCADE,
	model VARCHAR(80) NULL,
	specifications VARCHAR(100) NULL
)


CREATE TABLE staff (
	employee_id INTEGER PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	full name VARCHAR(100) NOT NULL,
	position VARCHAR(50) NOT NULL,
	date_of_employment DATE NOT NULL,
	contact_information VARCHAR(75) NOT NULL,
	FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE NO ACTION ON UPDATE CASCADE
)


CREATE TABLE warehouse (
	inventory_id INTEGER PRIMARY KEY,
	FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	quantity INTEGER NOT NULL
)


CREATE TABLE orders (
	id INTEGER PRIMARY KEY,
	FOREIGN KEY (customer_id) REFERENCES clients(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	date DATETIME NOT NULL,
	status VARCHAR(20) NOT NULL,
	adress_delivery VARCHAR(300) NOT NULL, 
	method_payment VARCHAR(100) NOT NULL 
)


CREATE TABLE order_details (
	FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (product_id) REFERENCES manufactures(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	quantity INTEGER NOT NULL,
	price INTEGER NOT NULL
)


CREATE TABLE customer_purchases (
	id INTEGER PRIMARY KEY,
	FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE NO ACTION ON UPDATE NO ACTION 
	FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	quantity INTEGER NOT NULL,
	date_of_purchase DATETIME NOT NULL
)


CREATE TABLE payment (
	payment_id INTEGER PRIMARY KEY,
	FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	payment_method VARCHAR(50) NOT NULL,
	date_payment DATETIME NOT NULL,
	status VARCHAR(20)NOT NULL
)


CREATE TABLE delivery (
	delivery_id INTEGER PRIMARY KEY,
	FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	adress_delivery VARCHAR(300) NOT NULL,
	date_delivery DATE NOT NULL,
	status VARCHAR(20) NOT NULL
)


CREATE TABLE reviews (
	review_id INTEGER PRIMARY KEY,
	FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE NO ACTION ON UPDATE NO ACTION 
	FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE NO ACTION ON UPDATE NO ACTION 
	comments VARCHAR(250) NULL,
	rating INTEGER NOT NULL,
	date DATE NOT NULL
)