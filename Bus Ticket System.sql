CREATE DATABASE BusTicket;
USE BusTicket;

CREATE TABLE Buses
(
  B_no VARCHAR(10) NOT NULL,
  service_no VARCHAR(5) NOT NULL,
  seats INT NOT NULL,
  date_time datetime NOT NULL,
  PRIMARY KEY (B_no)
);

CREATE TABLE Customer
(
  C_id VARCHAR(10) NOT NULL,
  gender CHAR(1) NOT NULL,
  DOB VARCHAR(10) NOT NULL,
  Fname VARCHAR(30) NOT NULL,
  Lname VARCHAR(30) NOT NULL,
  street VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  state VARCHAR(30) NOT NULL,
  PRIMARY KEY (C_id)
);

CREATE TABLE Payment
(
  T_id VARCHAR(10) NOT NULL,
  amount VARCHAR(5) NOT NULL,
  date_time datetime NOT NULL,
  stat VARCHAR(10) NOT NULL,
  PRIMARY KEY (T_id)
);

CREATE TABLE Cus_Bus
(
  B_no VARCHAR(10) NOT NULL,
  C_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (B_no, C_id),
  FOREIGN KEY (B_no) REFERENCES Buses(B_no),
  FOREIGN KEY (C_id) REFERENCES Customer(C_id)
);

CREATE TABLE Customer_mobile
(
  mobile VARCHAR(10) NOT NULL,
  C_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (mobile, C_id),
  FOREIGN KEY (C_id) REFERENCES Customer(C_id)
);

CREATE TABLE Buses1
(
  service_no VARCHAR(5) NOT NULL,
  sourcee VARCHAR(30) NOT NULL,
  destination VARCHAR(30) NOT NULL,
  PRIMARY KEY (service_no)
);

CREATE TABLE Ticket
(
  PNR VARCHAR(10) NOT NULL,
  seat_no VARCHAR(3) NOT NULL,
  B_point VARCHAR(30) NOT NULL,
  D_point VARCHAR(30) NOT NULL,
  Date_time datetime NOT NULL,
  B_no VARCHAR(10) NOT NULL,
  T_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (PNR),
  FOREIGN KEY (B_no) REFERENCES Buses(B_no),
  FOREIGN KEY (T_id) REFERENCES Payment(T_id)
);

CREATE TABLE Ticket_P_name
(
  P_name VARCHAR(30) NOT NULL,
  PNR VARCHAR(10) NOT NULL,
  PRIMARY KEY (P_name, PNR),
  FOREIGN KEY (PNR) REFERENCES Ticket(PNR)
);

describe Ticket; 
truncate table Customer;
select * from Buses;
delete from Customer where C_id = "2010010373";
drop table Customer_mobile;

select * from Customer;
insert into Customer values("2010010395", "M", "30-01-2003", "Venkat", "Tharun", "bank colony", "hanmakonda", "Telangana");
insert into Customer values("2010010417", "M", "27-07-2003", "Sai", "Prasad", "NBK colony", "Vijayawada", "Andhra Padesh");
insert into Customer values("2010010388", "M", "13-08-2003", "Sai", "Thej", "Arunodhaya colony", "Tirupati", "Andhra Padesh");
insert into Customer values("2010010365", "F", "20-12-2002", "Poonam", "Kaithwas", " Lalganj", "Prathapghad", "Uttar Padesh");
insert into Customer values("2010010373", "F", "31-05-2003", "Rishitha", "Gunnam", "Mundapeta", "Rajhumundry", "Andhra Padesh");

select * from Customer_mobile;
insert into Customer_mobile values("7675027442", "2010010395");
insert into Customer_mobile values("9908102218", "2010010395");
insert into Customer_mobile values("9494653824", "2010010417");
insert into Customer_mobile values("8977703366", "2010010373");
insert into Customer_mobile values("9494562843", "2010010417");
insert into Customer_mobile values("8143951807", "2010010388");
insert into Customer_mobile values("9044198961", "2010010365");

select * from Buses;
insert into Buses values("AP03Z2365", "A5361", 50, "2022-11-03 21:30:00");
insert into Buses values("AP36Z5332", "B3569", 50, "2022-11-04 09:30:00");
insert into Buses values("AP05Z5624", "A5361", 45, "2022-11-05 12:40:00");

select * from Buses1;
insert into Buses1 values("A5361", "Vijayawada", "Warangal");
insert into Buses1 values("B3569", "Warangal", "Vizag");

select * from Cus_Bus;
insert into Cus_Bus values("AP36Z5332", "2010010395");
insert into Cus_Bus values("AP03Z2365", "2010010417");

select * from Payment;
insert into Payment values("PQ56334XC7", "750", "2022-11-05 12:40:00", "Confirm");
insert into Payment values("RS85174ZS3", "949", "2022-11-04 09:30:00", "Confirm");

select * from Ticket;
insert into Ticket values("AN3Q5698XZ", "L12", "Vijayawada", "Warangal", "2022-11-05 12:40:00", "AP05Z5624", "PQ56334XC7");
insert into Ticket values("BR9X2843MD", "U02", "Warangal", "Vizag", "2022-11-04 09:30:00", "AP36Z5332", "RS85174ZS3");

select * from Ticket_P_name;
insert into Ticket_P_name values("Sampoorna", "AN3Q5698XZ");
insert into Ticket_P_name values("Venkateshwarlu", "AN3Q5698XZ");
insert into Ticket_P_name values("Venkat Tharun", "AN3Q5698XZ");
insert into Ticket_P_name values("Tony", "BR9X2843MD");
insert into Ticket_P_name values("Bharadhwaj", "BR9X2843MD");


select P_name from Ticket_P_name natural join Ticket where PNR="AN3Q5698XZ";
select stat from Payment inner join Ticket where Ticket.T_id=Payment.T_id and Ticket.PNR="BR9X2843MD";
update customer_mobile set mobile="7671933523" where C_id="2010010395" and mobile="7675027442";
select mobile from customer_mobile where C_id="2010010395";