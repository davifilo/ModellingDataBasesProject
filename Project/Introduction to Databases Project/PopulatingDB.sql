-- Insert into MemberGen table
INSERT INTO MemberGen (idnumber, name, surname, iban, email)
VALUES 
(10001, 'Luca', 'Rossi', 'IT60X0542811101000000123456', 'luca.rossi@email.com'),
(10002, 'Marco', 'Bianchi', 'IT60X0542811101000000123457', 'marco.bianchi@email.com'),
(10003, 'Giulia', 'Verdi', 'IT60X0542811101000000123458', 'giulia.verdi@email.com'),
(10004, 'Sara', 'Neri', 'IT60X0542811101000000123459', 'sara.neri@email.com'),
(10005, 'Antonio', 'Esposito', 'IT60X0542811101000000123460', 'antonio.esposito@email.com');

-- Insert into MemberLoc table
INSERT INTO MemberLoc (idnumber, city, postalcode, street, housenumber)
VALUES 
(10001, 'Trento', '38100', 'Via Roma', '10'),
(10002, 'Bolzano', '39100', 'Piazza Duomo', '15'),
(10003, 'Rovereto', '38068', 'Via Dante', '5'),
(10004, 'Merano', '39012', 'Corso Libertà', '8'),
(10005, 'Pergine', '38057', 'Via Garibaldi', '12');

-- Insert into TelephoneNumber table
INSERT INTO TelephoneNumber (number)
VALUES 
('333-1234567'),
('333-9876543'),
('333-5556666'),
('333-4447777'),
('333-8889999');

-- Insert into TelPer table
INSERT INTO TelPer (member, telephoneNumber)
VALUES 
(10001, '333-1234567'),
(10002, '333-9876543'),
(10003, '333-5556666'),
(10004, '333-4447777'),
(10005, '333-8889999');

-- Insert into ActiveMember table
INSERT INTO ActiveMember (member)
VALUES 
(10001), (10002), (10003), (10004), (10005);

-- Insert into ManagerialMember table (only 1 managerial member)
INSERT INTO ManagerialMember (member)
VALUES 
(10001);

-- Insert into Observer table
INSERT INTO Observer (activeMember)
VALUES 
(10003), (10004), (10005);

-- Insert into Referee table
INSERT INTO Referee (activeMember)
VALUES 
(10001), (10002);

-- Insert into Unavailability table
INSERT INTO Unavailability (code, startdate, enddate, activeMember)
VALUES 
(1, '2024-01-01', '2024-01-15', 10001),
(2, '2024-02-01', '2024-02-20', 10002),
(3, '2024-03-01', '2024-03-10', 10003);

-- Insert into Leave table
INSERT INTO Leave (unavailability, description)
VALUES 
(1, 'Sick leave'),
(2, 'Family leave');

-- Insert into Leaves table
INSERT INTO Leaves (leave, activeMember)
VALUES 
(1, 10001),
(2, 10002);

-- Insert into MedicalCertificate table (certificates valid for the respective matches)
INSERT INTO MedicalCertificate (code, startdate, enddate, referee)
VALUES 
(1, '2024-02-15', '2024-03-02', 10001), -- Valid for match 1
(2, '2024-03-15', '2024-04-02', 10002), -- Valid for match 2
(3, '2024-04-15', '2024-05-02', 10001), -- Valid for match 3
(4, '2024-05-15', '2024-06-02', 10002), -- Valid for match 4
(5, '2024-06-15', '2024-07-02', 10001), -- Valid for match 5
(6, '2024-07-15', '2024-08-02', 10002), -- Valid for match 6
(7, '2024-08-15', '2024-09-02', 10001), -- Valid for match 7
(8, '2024-09-15', '2024-10-02', 10002); -- Valid for match 8

-- Insert into Team table (more teams added)
INSERT INTO Team (name, category)
VALUES 
('FC Trento', 'U15'),
('AS Bolzano', 'U15'),
('SC Rovereto', 'U17'),
('US Merano', 'U17'),
('AC Pergine', 'U19'),
('Virtus Levico', 'U19'),
('AS Lavis', 'Seconda categoria'),
('FC Mori', 'Seconda categoria');

-- Insert into Match table (home team’s city is the match location)
INSERT INTO Match (code, location, date, competitionName)
VALUES 
(1, 'Stadio Trento', '2024-03-01', 'campionato U15'),
(2, 'Stadio Bolzano', '2024-04-01', 'campionato U15'),
(3, 'Stadio Rovereto', '2024-05-01', 'campionato U17'),
(4, 'Stadio Merano', '2024-06-01', 'campionato U17'),
(5, 'Stadio Pergine', '2024-07-01', 'campionato U19'),
(6, 'Stadio Levico', '2024-08-01', 'campionato U19'),
(7, 'Campo Lavis', '2024-09-01', 'campionato Seconda categoria'),
(8, 'Campo Mori', '2024-10-01', 'campionato Seconda categoria');

-- Insert into Plays table (matches involve teams of the same category)
INSERT INTO Plays (match, homeTeamName, homeTeamCategory, guestTeamName, guestTeamCategory)
VALUES 
(1, 'FC Trento', 'U15', 'AS Bolzano', 'U15'),
(2, 'AS Bolzano', 'U15', 'FC Trento', 'U15'),
(3, 'SC Rovereto', 'U17', 'US Merano', 'U17'),
(4, 'US Merano', 'U17', 'SC Rovereto', 'U17'),
(5, 'AC Pergine', 'U19', 'Virtus Levico', 'U19'),
(6, 'Virtus Levico', 'U19', 'AC Pergine', 'U19'),
(7, 'AS Lavis', 'Seconda categoria', 'FC Mori', 'Seconda categoria'),
(8, 'FC Mori', 'Seconda categoria', 'AS Lavis', 'Seconda categoria');

-- Insert into ObserverAssignation table (reduced pay values)
INSERT INTO ObserverAssignation (match, pay, state, observer)
VALUES 
(1, 30.00, 'Confirmed', 10003),
(2, 30.00, 'Pending', 10004),
(3, 30.00, 'Confirmed', 10005),
(4, 30.00, 'Pending', 10003),
(5, 30.00, 'Confirmed', 10004),
(6, 30.00, 'Pending', 10005),
(7, 30.00, 'Confirmed', 10003),
(8, 30.00, 'Pending', 10004);

-- Insert into RefereeAssignation table (reduced pay values, and referee must have valid medical certificate)
INSERT INTO RefereeAssignation (match, pay, state, referee)
VALUES 
(1, 50.00, 'Confirmed', 10001), -- Medical Certificate 1
(2, 50.00, 'Pending', 10002),   -- Medical Certificate 2
(3, 50.00, 'Confirmed', 10001), -- Medical Certificate 3
(4, 50.00, 'Pending', 10002),   -- Medical Certificate 4
(5, 50.00, 'Confirmed', 10001), -- Medical Certificate 5
(6, 50.00, 'Pending', 10002),   -- Medical Certificate 6
(7, 50.00, 'Confirmed', 10001), -- Medical Certificate 7
(8, 50.00, 'Pending', 10002);   -- Medical Certificate 8

-- Insert into Manages table (the managerial member manages every match)
INSERT INTO Manages (match, managerialMember)
VALUES 
(1, 10001),
(2, 10001),
(3, 10001),
(4, 10001),
(5, 10001),
(6, 10001),
(7, 10001),
(8, 10001);

-- Insert into IsExempted table
INSERT INTO IsExempted (referee, team, category)
VALUES 
(10001, 'FC Trento', 'U15'),
(10002, 'AS Bolzano', 'U15');
