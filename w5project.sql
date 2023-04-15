CREATE TABLE "car" (
  "vin" SERIAL PRIMARY KEY,
  "serial_number" INTEGER,
  "model_year" INTEGER,
  "body_type" INTEGER,
  "brand_name" INTEGER,
  "color" VARCHAR(60),
  "year" INTEGER,
  "car_for_sale" BOOLEAN,
  "car_for_service" BOOLEAN
);


CREATE TABLE "sales agent" (
  "agent_id" SERIAL,
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "number" INTEGER,
  "address" VARCHAR(60),
  "email" VARCHAR(60),
  PRIMARY KEY ("agent_id")
);

CREATE TABLE "sales_invoice " (
  "sales_id" INTEGER,
  "customer_id" INTEGER,
  "vin" INTEGER,
  "date" DATE,
  "price" NUMERIC,
  "agnet_id" INTEGER,
    FOREIGN KEY ("vin")
      REFERENCES "sales_agent"("agent_id"),
    FOREIGN KEY ("vin")
      REFERENCES "car"("vin")
);



CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "work_at" VARCHAR(60),
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "address" VARCHAR(60),
  "city" INTEGER,
  "state" VARCHAR(60),
  "country" VARCHAR(60),
  "zipcode" INTEGER,
  "gender" VARCHAR(60),
  "annual_income" INTEGER,
  "agent_id" INTEGER,
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "service_invoice" (
  "service_ticket_num" SERIAL,
  "car_id" INTEGER,
  "custormer_id" INTEGER,
  "date_received" DATE,
  "date_returned" DATE,
  "comments" VARCHAR(60),
  "hourly_rate" NUMERIC,
  "serviced_date" DATE,
  "serviced_mec_id" INTEGER,
  "vin" INT,
  PRIMARY KEY ("service_ticket_num")
);

CREATE INDEX "fk" ON  "service_invoice" ("serviced_mec_id");

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "hour_work " NUMERIC,
  PRIMARY KEY ("mechanic_id")
);


-------
CREATE TABLE "car" (
  "vin" SERIAL PRIMARY KEY,
  "serial_number" INTEGER,
  "model_year" INTEGER,
  "body_type" VARCHAR(20),
  "brand_name"  VARCHAR(20),
  "color" VARCHAR(60),
  "year" INTEGER,
  "car_for_sale" BOOLEAN,
  "car_for_service" BOOLEAN
);


CREATE TABLE "sales_agent" (
  "agent_id" SERIAL,
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "number" INTEGER,
  "address" VARCHAR(60),
  "email" VARCHAR(60),
  PRIMARY KEY ("agent_id")
);

CREATE TABLE "sales_invoice " (
  "sales_id" INTEGER,
  "customer_id" INTEGER,
  "vin" INTEGER,
  "date" DATE,
  "price" NUMERIC,
  "agnet_id" INTEGER,
    FOREIGN KEY ("vin")
      REFERENCES "sales_agent"("agent_id"),
    FOREIGN KEY ("vin")
      REFERENCES "car"("vin")
);



CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "work_at" VARCHAR(60),
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "address" VARCHAR(60),
  "city"  VARCHAR(20),
  "state" VARCHAR(60),
  "country" VARCHAR(60),
  "zipcode" INTEGER,
  "gender" VARCHAR(60),
  "annual_income" INTEGER,
  "agent_id" INTEGER,
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "service_invoice" (
  "service_ticket_num" SERIAL,
  "car_id" INTEGER,
  "custormer_id" INTEGER,
  "date_received" DATE,
  "date_returned" DATE,
  "comments" VARCHAR(60),
  "hourly_rate" NUMERIC,
  "serviced_date" DATE,
  "serviced_mec_id" INTEGER,
  "vin" INT,
  PRIMARY KEY ("service_ticket_num")
);

CREATE INDEX "fk" ON  "service_invoice" ("serviced_mec_id");

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "hour_work " NUMERIC,
  PRIMARY KEY ("mechanic_id")
);

INSERT INTO car
VALUES (
	DEFAULT, 
	'176349', 
	'2014',	
	'sedan',	
	'Toyota',
	'Silver',
	
	'FALSE',
	'FALSE'
),(
	DEFAULT,
	'166488', 
	'2017',	
	'SUV',	
	'mercedes',
	'red',
	'FALSE',

	'TRUE'
)

INSERT INTO car
VALUES (
	DEFAULT, 
	'266340', 
	'2010',	
	'Sedan',	
	'Mazda',
	'grey',
	'FALSE',
	
	'FALSE'
),(
	DEFAULT,
	'166400', 
	'2012',	
	'suv',	
	'Toyota',
	'green',
	'FALSE',
	
	'FALSE'
)


SELECT *
FROM customer

CREATE or replace PROCEDURE car_for_service(vin_num INT)
------procedure to set car_for_service = TRUE, is_serviced = TRUE
LANGUAGE plpgsql 
AS $$ 
BEGIN
	 UPDATE car SET car_for_service = TRUE, is_serviced = True
	 WHERE vin = vin_num ;	
			
			  COMMIT;
END;
$$;

CALL car_for_service(3)

SELECT *
FROM car

DROP TABLE sales agent  Cascade

ALTER TABLE car
ADD COLUMN is_serviced BOOLEAN;

CREATE or replace PROCEDURE set_boolean(vin_num INT
)--procedure to set car_for_service = TRUE, is_serviced = False
LANGUAGE plpgsql 
AS $$ 
BEGIN
			 UPDATE car SET car_for_service = FALSE, is_serviced = FALSE
             WHERE vin = vin_num  ;	
			
	
		  COMMIT;
END;
$$;
CALL car_for_service(4)

INSERT INTO service_invoice
VALUES (
	DEFAULT, 
	'1', 
	'2',	
	'08-10-2023',	
	'25',
	'Excellent service',
	'50',
	'08-12-2023',
	'1',
	'2'
	
),(
	DEFAULT,
	'2', 
	'1',	
	'08-10-2023',	
	'08-12-2023',
	'Excellent service',
	'50',
	'08-12-2023',
	'1',
	'2'
)

SELECT *
FROM sales_agent

CREATE OR REPLACE FUNCTION insert_sales_agent( _agent_id INTEGER,_first_name VARCHAR(60), _last_name VARCHAR(60),_number INTEGER, _address VARCHAR(60),_email VARCHAR(60))
RETURNS void
LANGUAGE plpgsql
AS $MAIN$
BEGIN
	INSERT INTO sales_agent
	VALUES(_agent_id,_first_name , _last_name ,_number , _address ,_email);
END;
$MAIN$;
SELECT insert_sales_agent(3, 'Abdel', 'ELH', 3, '463455 lyn st alexandria va 54663', 'gugduuh@gmail.com')

--------
CREATE OR REPLACE FUNCTION insert_sales_agent( _first_name VARCHAR(60), _last_name VARCHAR(60),_number INTEGER, _address VARCHAR(60),_email VARCHAR(60))
RETURNS void
LANGUAGE plpgsql
AS $MAIN$
BEGIN
	INSERT INTO sales_agent
	VALUES(_first_name , _last_name ,_number , _address ,_email);
END;
$MAIN$;
SELECT insert_sales_agent( 4, 'Aaabdel', 'ELHaaa', 3, '463455 lyn st alexandria va 54663', 'gugduuh@gmail.com')
-----------
CREATE OR REPLACE FUNCTION insert_sales_agent( )
RETURNS void
LANGUAGE plpgsql
AS $MAIN$
BEGIN
	INSERT INTO sales_agent
	VALUES(_first_name , _last_name ,_number , _address ,_email);
END;
$MAIN$;
SELECT insert_sales_agent( 5, 'Art', 'Poo', 2, '463455 D st alexandria va 54663', 'guuugduuh@gmail.com')

----
CREATE OR REPLACE FUNCTION insert_sales_agent( )
RETURNS void
LANGUAGE plpgsql
AS $MAIN$
BEGIN
	INSERT INTO sales_agent
	VALUES(_first_name , _last_name ,_number , _address ,_email);
END;
$MAIN$;
SELECT insert_sales_agent(  6,'George', 'Baff', 3, '463455 lyn st alexandria va 54663', 'gugduuh@gmail.com')

SELECT *
FROM sales_agent