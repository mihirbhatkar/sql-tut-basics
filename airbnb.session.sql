-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);

-- @block
INSERT INTO Users(email, bio, country) 
VALUES (
    'noob@gmail.com',
    'i don''t care',
    'US'
)

-- @block
SELECT * FROM Users;

-- @block
SELECT email, id FROM Users
LIMIT 1;

-- @block
SELECT email, id FROM Users
WHERE country = 'US'
AND id > 1
ORDER BY id ASC
LIMIT 4;

-- @block
SELECT email, id FROM Users
WHERE email LIKE 'n%'
ORDER BY id DESC;

-- @block
CREATE INDEX email_index ON Users(email);


-- @block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);


-- @block
INSERT INTO Rooms (owner_id, street)
VALUES  (1,'san diego sailboat'), 
        (1,'nantucket rooms'), 
        (1,'vail cabin'),
        (1,'sf villa');

-- ! JOINS
-- * imagine LEFT as Users table and RIGHT as Rooms table

-- inner join
-- @block
SELECT * FROM users
INNER JOIN rooms
ON Rooms.owner_id = Users.id;

-- left join
-- @block
SELECT * FROM users
LEFT JOIN rooms
ON Rooms.owner_id = Users.id;

-- right join
-- @block
SELECT * FROM users
RIGHT JOIN rooms
ON Rooms.owner_id = Users.id;

-- @block You can use AS keyword to rename fields
SELECT 
    users.id AS user_id,
    rooms.id AS room_id,
    email,
    street
FROM users
INNER JOIN rooms
ON Rooms.owner_id = Users.id;

-- @block Create bookings table
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);

-- @block Alter check_in datatype
ALTER TABLE Bookings
MODIFY COLUMN check_in DATE;


-- * SELECT statements
-- @block
SELECT * FROM users;

-- @block
SELECT * FROM rooms;


-- @block insert bookings
INSERT INTO bookings (guest_id, room_id, check_in)
VALUES  (1,1, '2023-08-30'),
        (1,2, '2023-08-12'),
        (2,1, '2023-08-04');

-- @block
SELECT * from bookings
ORDER BY check_in DESC;

