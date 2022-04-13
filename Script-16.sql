create table salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	salesperson_address VARCHAR(150),
	salesperson_contact VARCHAR(15),
	salesperson_email VARCHAR(100)
);

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	customer_address VARCHAR(150),
	customer_contact VARCHAR(15),
	customer_email VARCHAR(100)
);

create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	mechanic_address VARCHAR(150),
	mechanic_contact VARCHAR(15),
	mechanic_email VARCHAR(100)
);

create table inventory(
	upc SERIAL primary key,
	inventory_amount INTEGER
);

create table invoice(
	invoice_id SERIAL primary key,
	invoice_date TIMESTAMP,
	amount NUMERIC(9,2),
	salesperson_id INTEGER not null,
	customer_id INTEGER not null,
	foreign key(salesperson_id) references salesperson(salesperson_id),
	foreign key(customer_id) references customer(customer_id)
);

create table part(
	part_id SERIAL primary key,
	part_name VARCHAR(100),
	part_amount INTEGER,
	upc INTEGER not null,
	foreign key(upc) references inventory(upc)
);

create table service_ticket(
	service_ticket_id SERIAL primary key,
	service_date TIMESTAMP,
	service_detail VARCHAR(200),
	amount NUMERIC(6,2),
	customer_id INTEGER not null,
	mechanic_id INTEGER not null,
	part_id INTEGER not null,
	foreign key(customer_id) references customer(customer_id),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(part_id) references part(part_id)
);