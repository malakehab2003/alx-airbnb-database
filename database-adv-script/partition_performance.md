# table partitoning

## before partitioning
The query scanned the entire Booking table, resulting in a higher number of rows being examined.
Performance was slower due to the larger dataset being scanned.

## after partitioning
The query scanned only the relevant partition (p_2023), significantly reducing the number of rows examined.
Query execution time was reduced due to the smaller subset of data being scanned.