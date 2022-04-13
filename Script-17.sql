create or replace function add_salesperson(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _salesperson_address VARCHAR, _salesperson_contact VARCHAR, _salesperson_email VARCHAR)
returns void
as $MAIN$
begin 
	insert into salesperson(salesperson_id,first_name,last_name,salesperson_address,salesperson_contact,salesperson_email)
	VALUES(_salesperson_id, _first_name, _last_name, _salesperson_address, _salesperson_contact, _salesperson_email);
end;
$MAIN$
language plpgsql;

select add_salesperson(1, 'Jerry', 'Singer', '100 Williams Rd, Philadelphia, PA 99011', '702-589-8988', 'jsinger9@gmail.com');
select * from salesperson;

create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _customer_address VARCHAR, _customer_contact VARCHAR, _customer_email VARCHAR)
returns void
as $MAIN$
begin 
	insert into customer(customer_id,first_name,last_name,customer_address,customer_contact,customer_email)
	VALUES(_customer_id, _first_name, _last_name, _customer_address, _customer_contact, _customer_email);
end;
$MAIN$
language plpgsql;

select add_customer(1, 'Jonny', 'Joestar', '101 Dalmatian Rd, Philadelphia, PA 99110', '720-599-6987', 'jjoestar1@gmail.com');
select * from customer;

create or replace function add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _mechanic_address VARCHAR, _mechanic_contact VARCHAR, _mechanic_email VARCHAR)
returns void
as $MAIN$
begin 
	insert into mechanic(mechanic_id,first_name,last_name,mechanic_address,mechanic_contact,mechanic_email)
	values(_mechanic_id, _first_name, _last_name, _mechanic_address, _mechanic_contact, _mechanic_email);
end;
$MAIN$
language plpgsql;

select add_mechanic(1, 'Joseph', 'Adams', '199 Red St, Philadelphia, PA 19911', '722-897-5687', 'jadams199@gmail.com');
select * from mechanic;

create or replace function add_inventory(_upc INTEGER, _inventory_amount INTEGER)
returns void
as $MAIN$
begin 
	insert into inventory(upc,inventory_amount)
	values(_upc, _inventory_amount);
end;
$MAIN$
language plpgsql;

select add_inventory(1, 1);
select * from inventory;

insert into part(part_id, part_name, part_amount, upc)
values(1, 'wheels', 1, 1);
select * from part;

insert into invoice(invoice_id, invoice_date, amount, salesperson_id, customer_id)
values(1, NOW()::timestamp, 1937.62, 1, 1);
select * from invoice;

insert into service_ticket(service_ticket_id, service_date, service_detail, amount, customer_id, mechanic_id, part_id)
values(1, NOW()::timestamp, 'Changing wheels', 190.00, 1, 1, 1);
select * from service_ticket;

