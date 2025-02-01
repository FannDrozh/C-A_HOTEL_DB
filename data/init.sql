-- Создание таблицы
Create table Roles(
	IdRole INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	RoleEmployee VARCHAR(45)
);

Create table TicketStatuses(
	IdTicketStatuse INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	StatusTicket VARCHAR (45)
);

Create table OccupancyStatuses(
	IdOccupancyStatuse INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	OccupancyStatuses VARCHAR (45)
);

Create table CleaningStatuses(
	IdCleaningStatuse INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	CleaningStatuse VARCHAR (45)
);

Create table Clients(
	IdClient INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	FirstName VARCHAR(50),
	SecondName VARCHAR(75),
	MidName VARCHAR (45),
	BirthDay DATE
);

Create table Employees(
	IdEmployee INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	FirstName VARCHAR(50),
	SecondName VARCHAR(75),
	MidName VARCHAR (45),
	BirthDay DATE,
	IdRoles INT,
	DateOfEmployment DATE,
	DateOfDismissal DATE,
	CONSTRAINT fk_Roles_Employees FOREIGN KEY (IdRoles) REFERENCES Roles (IdRole)
);

Create table Rooms(
	IdRoom INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdCleaningStatuses INT,
	IdOccupancyStatuses INT,
	Description TEXT,
	CONSTRAINT fk_CleaningStatuses_Rooms FOREIGN KEY (IdCleaningStatuses) REFERENCES CleaningStatuses (IdCleaningStatuse),
	CONSTRAINT fk_OccupancyStatuses_Rooms FOREIGN KEY (IdOccupancyStatuses) REFERENCES OccupancyStatuses (IdOccupancyStatuse)
);

Create table CleaningTickets(
	IdCleaningTicket INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdRooms INT,
	IdEmployees INT,
	IdTicketStatuses INT,
	CONSTRAINT fk_Rooms_CleaningTickets FOREIGN KEY (IdRooms) REFERENCES Rooms (IdRoom),
	CONSTRAINT fk_Employees_CleaningTickets FOREIGN KEY (IdEmployees) REFERENCES Employees (IdEmployee),
	CONSTRAINT fk_TicketStatuses_CleaningTickets FOREIGN KEY (IdTicketStatuses) REFERENCES TicketStatuses (IdTicketStatuse)
);

Create table ReservRooms(
	IdReservRoom INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	IdRooms INT,
	CountPeople VARCHAR(45),
	IdClients INT,
	DateInner DATE,
	DateOuter DATE,
	CONSTRAINT fk_Rooms_ReservRooms FOREIGN KEY (IdRooms) REFERENCES Rooms (IdRoom),
	CONSTRAINT fk_Clients_ReservRooms FOREIGN KEY (IdClients) REFERENCES Clients (IdClient)
);
