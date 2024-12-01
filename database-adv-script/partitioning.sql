-- determine the database
USE airbnb;

-- run a query
SELECT * 
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- explain analyze this query
EXPLAIN ANALYZE SELECT * 
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- parititon the table with the starting year
CREATE TABLE Booking_Partitioned (
  id CHAR(36) PRIMARY KEY,
  property_id CHAR(36) NOT NULL,
  user_id CHAR(36) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property(id) ON DELETE CASCADE,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
  INDEX index_property_id (property_id),
  INDEX index_book_id (id)
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p_2020 VALUES LESS THAN (2021),
  PARTITION p_2021 VALUES LESS THAN (2022),
  PARTITION p_2022 VALUES LESS THAN (2023),
  PARTITION p_2023 VALUES LESS THAN (2024),
  PARTITION p_future VALUES LESS THAN MAXVALUE
);


-- copy data of the original table in the new table
INSERT INTO Booking_Partitioned
SELECT *
FROM Booking;


-- rename the table to have the same table name again
RENAME TABLE Booking TO Booking_Backup;
RENAME TABLE Booking_Partitioned TO Booking;

-- run same query
SELECT * 
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';


-- explain analyze this query
EXPLAIN ANALYZE SELECT * 
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
