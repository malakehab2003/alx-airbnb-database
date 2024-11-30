-- determine the used database
USE Airbnb;

-- a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT name
FROM Property
WHERE id IN (
  SELECT property_id
  FROM Review
  WHERE AVG(rating) > 4.0
);

-- a correlated subquery to find users who have made more than 3 bookings.
SELECT
  CONCAT(first_name, ' ', last_name) AS Person
FROM User
WHERE (
  SELECT COUNT(*)
  FROM Booking
  WHERE Booking.user_id = User.id
  ) > 3;
