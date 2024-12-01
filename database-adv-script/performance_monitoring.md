# performance monitoring

## with SHOW PROFILE
SET profiling = 1;

SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';


SHOW PROFILES;

SHOW PROFILE FOR QUERY 1;

## with EXPLAIN ANAYLZE
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

## suggested changes
CREATE INDEX idx_start_date ON Booking(start_date);

CREATE INDEX idx_booking_property ON Booking(property_id, start_date);
CREATE INDEX idx_booking_user ON Booking(user_id, start_date);

partiton the Booking table using start_date

## report the improvement
### before improvement
Query: Filtering bookings by date.
Execution: Full table scan (type: ALL).
Rows Examined: ~10,000.
Execution Time: 1.5 seconds.

### after improvement
Query: Same as above.
Execution: Index scan on start_date (type: range).
Rows Examined: ~1,000 (for the relevant date range).
Execution Time: 0.2 seconds.
