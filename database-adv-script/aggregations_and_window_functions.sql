-- determine the used database
USE Airbnb;

-- a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause
SELECT
  CONCAT(User.first_name, ' ', User.last_name),
  COUNT(Booking.user_id) AS no_of_bookings
FROM User
JOIN Booking
ON Booking.user_id = User.id
GROUP BY Booking.user_id;

--  rank properties based on the total number of bookings they have received.
SELECT 
  Property.name AS property_name,
  RANK() OVER (ORDER BY COUNT(Booking.id)) AS `rank`,
  ROW_NUMBER() OVER (ORDER BY COUNT(Booking.id)) AS `order`
FROM Property
LEFT JOIN Booking
ON Property.id = Booking.property_id
GROUP BY Property.id, Property.name
ORDER BY `rank`;
