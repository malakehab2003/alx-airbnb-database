-- determine the used database
USE Airbnb;

-- using an INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT 
  CONCAT(User.first_name, ' ', User.last_name) AS person,
  Booking.id,
  Booking.property_id,
  Booking.total_price,
  Booking.status,
  Booking.created_at,
  Booking.start_date,
  Booking.end_date
FROM Booking
JOIN User
ON User.id = Booking.user_id;

-- using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT
  Property.name AS Property_name,
  Review.comment AS Comment
FROM Property
LEFT JOIN Review
ON Property.id = Review.property_id;

-- using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
  CONCAT(User.first_name, ' ', User.last_name) AS Person,
  Booking.id,
  Booking.property_id,
  Booking.total_price,
  Booking.status,
  Booking.created_at,
  Booking.start_date,
  Booking.end_date
FROM User
LEFT JOIN Booking
ON User.id = Booking.user_id

UNION

SELECT 
  CONCAT(User.first_name, ' ', User.last_name) AS Person,
  Booking.id,
  Booking.property_id,
  Booking.total_price,
  Booking.status,
  Booking.created_at,
  Booking.start_date,
  Booking.end_date
FROM User
RIGHT JOIN Booking
ON User.id = Booking.user_id;
