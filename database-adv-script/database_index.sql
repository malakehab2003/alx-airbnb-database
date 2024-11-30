EXPLAIN ANALYZE SELECT first_name FROM User WHERE email = 'johndoe@example.com';
CREATE INDEX email_index on User(email);
EXPLAIN ANALYZE SELECT first_name FROM User WHERE email = 'johndoe@example.com';

EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id IN (SELECT id FROM Property  WHERE name = 'Beach House');
CREATE INDEX prop_id_index on Booking(property_id);
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id IN (SELECT id FROM Property  WHERE name = 'Beach House');


EXPLAIN ANALYZE SELECT * FROM Property WHERE name = 'Beach House';
CREATE INDEX name_index ON Property (name);
EXPLAIN ANALYZE SELECT * FROM Property WHERE name = 'Beach House';
