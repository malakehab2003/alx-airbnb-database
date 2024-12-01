-- determine the database
use airbnb;

--  initial query
SELECT 
  Booking.id AS booking_id,
  Booking.start_date,
  Booking.end_date,
  Booking.total_price,
  Booking.status AS booking_status,
  User.id AS user_id,
  User.first_name,
  User.last_name,
  Property.id AS property_id,
  Property.name AS property_name,
  Property.location AS property_location,
  Payment.id AS payment_id,
  Payment.amount AS payment_amount,
  Payment.payment_date,
  Payment.payment_method
FROM Booking
LEFT JOIN User ON Booking.user_id = User.id
LEFT JOIN Property ON Booking.property_id = Property.id
LEFT JOIN Payment ON Booking.id = Payment.booking_id;


-- explain the initial query
EXPLAIN ANALYZE SELECT 
  Booking.id AS booking_id,
  Booking.start_date,
  Booking.end_date,
  Booking.total_price,
  Booking.status AS booking_status,
  User.id AS user_id,
  User.first_name,
  User.last_name,
  Property.id AS property_id,
  Property.name AS property_name,
  Property.location AS property_location,
  Payment.id AS payment_id,
  Payment.amount AS payment_amount,
  Payment.payment_date,
  Payment.payment_method
FROM Booking
LEFT JOIN User ON Booking.user_id = User.id
LEFT JOIN Property ON Booking.property_id = Property.id
LEFT JOIN Payment ON Booking.id = Payment.booking_id;


-- adding index
CREATE INDEX user_id_idx ON Booking(user_id);
CREATE INDEX property_id_idx ON Booking(property_id);


-- regenerate the inital query
SELECT 
  Booking.id AS booking_id,
  Booking.start_date,
  Booking.end_date,
  Booking.total_price,
  Booking.status AS booking_status,
  User.first_name,
  User.last_name,
  Property.name AS property_name,
  Property.location AS property_location,
  Payment.amount AS payment_amount,
  Payment.payment_date
FROM Booking
LEFT JOIN User ON Booking.user_id = User.id
LEFT JOIN Property ON Booking.property_id = Property.id
LEFT JOIN Payment ON Booking.id = Payment.booking_id;


-- explain the query after indexing
EXPLAIN ANALYZE SELECT 
  Booking.id AS booking_id,
  Booking.start_date,
  Booking.end_date,
  Booking.total_price,
  Booking.status AS booking_status,
  User.first_name,
  User.last_name,
  Property.name AS property_name,
  Property.location AS property_location,
  Payment.amount AS payment_amount,
  Payment.payment_date
FROM Booking
LEFT JOIN User ON Booking.user_id = User.id
LEFT JOIN Property ON Booking.property_id = Property.id
LEFT JOIN Payment ON Booking.id = Payment.booking_id;

