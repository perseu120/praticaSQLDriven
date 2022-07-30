CREATE TABLE customers(
	id SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	cpf varchar(11) NOT NULL UNIQUE,
	email TEXT NOT NULL,
	password TEXT NOT NULL	
)

CREATE TABLE states(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
)

CREATE TABLE cities(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	"stateId" INTEGER REFERENCES states(id)
)

CREATE TABLE customerAddresses(
	id SERIAL PRIMARY KEY,
	"customersId" INTEGER REFERENCES customers(id),
	street TEXT,
	number INTEGER,
	complement TEXT,
	"postalCode" INTEGER,
	"cityId" INTEGER REFERENCES cities(id)
)

CREATE TABLE customerPhones(
	id SERIAL PRIMARY KEY,
	"customersId" INTEGER REFERENCES customers(id),
	number varchar(11),
	type text
)

CREATE TABLE bankAccount(
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES customers(id),
	"accountNumber" INTEGER NOT NULL UNIQUE,
	agency INTEGER NOT NULL,
	"openDate" DATE DEFAULT( NOW()),
	"closeDate" DATE DEFAULT (NULL)
)

CREATE TABLE transactions(
	id SERIAL PRIMARY KEY,
	"banckAccountId" REFERENCES bankAccount(id),
	amount INTEGER DEFAULT (0),
	type TEXT,
	time TIMESTAMP,
	description TEXT,
	cancelled BOOLEAN 
)

CREATE TABLE creditCards(
	id SERIAL PRIMARY KEY,
	"bankAccountId" EFERENCES bankAccount(id),
	name TEXT NOT NULL,
	number INTEGER,
	"securityCode" INTEGER NOT NULL,
	"expirationMonth" INTEGER NOT NULL,
	"expirationYear" INTEGER NOT NULL,
	password TEXT NOT NULL,
	limit INTEGER DEFAULT(0);
)











