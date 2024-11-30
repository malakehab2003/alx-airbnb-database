## the most used column in User table is email
## the most used column in Booking table is property_id
## the most used column in Property table is name

### first query
SELECT first_name
FROM User
WHERE email = 'johndoe@example.com';

#### performance before is actual time=0..1
#### performance after is actual time=100e-6..100e-6

### second query
SELECT *
FROM Booking
WHERE property_id IN (
  SELECT id 
  FROM Property
  WHERE name = 'Beach House'
);

#### performance before is actual time=1.0622..0.0638
#### performance after is actual time=0.0622..0.0638

### third query

SELECT *
FROM Property
WHERE name = 'Beach House';

#### performance before is actual time=0.0627..0.0738
#### performance after is actual time=0.0206..0.0231
