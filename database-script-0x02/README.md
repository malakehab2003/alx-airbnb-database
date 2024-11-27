## inseting data
### adding fake data for the airbnb database
### here is the fake data

###  data for user
INSERT INTO User (id, first_name, last_name, email, password_hash, role, created_at)
VALUES
  ('913445fe-14e3-401c-9f42-b5d9855cc76c', 'John', 'Doe', 'johndoe@example.com', 'hashedpassword1', 'guest', CURRENT_TIMESTAMP),
  ('1f0de700-8225-4119-9183-4ac02d61bc61', 'Jane', 'Smith', 'janesmith@example.com', 'hashedpassword2', 'host', CURRENT_TIMESTAMP),
  ('52ce935d-5496-4fd7-8f56-5ff45714dd84', 'Alice', 'Johnson', 'alicejohnson@example.com', 'hashedpassword3', 'admin', CURRENT_TIMESTAMP);

###  data for property
INSERT INTO Property (id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('65cfb8ff-8d81-4dd2-86a8-fabb7749a71b', '1f0de700-8225-4119-9183-4ac02d61bc61', 'Cozy Apartment', 'A cozy one-bedroom apartment in the city center.', 'New York', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('9e275291-9de5-4026-b09e-ef9ce2d49346', '1f0de700-8225-4119-9183-4ac02d61bc61', 'Beach House', 'A beautiful beachfront house with great ocean views.', 'Miami', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

###  data for Booking
INSERT INTO Booking (id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('32140675-73c0-4bee-9705-62356d536e5c', '65cfb8ff-8d81-4dd2-86a8-fabb7749a71b', '913445fe-14e3-401c-9f42-b5d9855cc76c', '2024-12-01', '2024-12-07', 720.00, 'confirmed', CURRENT_TIMESTAMP),
  ('e7e6a60f-04a0-41ac-9ab9-806ec13301dc', '9e275291-9de5-4026-b09e-ef9ce2d49346', '913445fe-14e3-401c-9f42-b5d9855cc76c', '2024-12-10', '2024-12-15', 1250.00, 'pending', CURRENT_TIMESTAMP);

###  data for payment
INSERT INTO Payment (id, booking_id, amount, payment_date, payment_method)
VALUES
  ('26b3539b-cccc-4390-a83b-7c56ee43ad7f', '32140675-73c0-4bee-9705-62356d536e5c', 720.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('ccab0732-7c2b-4844-b825-ee40a33c992b', 'e7e6a60f-04a0-41ac-9ab9-806ec13301dc', 1250.00, CURRENT_TIMESTAMP, 'paypal');

###  data for review
INSERT INTO Review (id, property_id, user_id, rating, comment, created_at)
VALUES
  ('10659fcb-231a-4401-99f5-d0ca1a4f6a1f', '65cfb8ff-8d81-4dd2-86a8-fabb7749a71b', '913445fe-14e3-401c-9f42-b5d9855cc76c', 5, 'Great place to stay, very comfortable!', CURRENT_TIMESTAMP),
  ('d0fc958b-85db-492b-8a0b-70b44730ab86', '9e275291-9de5-4026-b09e-ef9ce2d49346', '913445fe-14e3-401c-9f42-b5d9855cc76c', 4, 'Nice place but the beach access could be better.', CURRENT_TIMESTAMP);

###  data for message
INSERT INTO Message (id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('845f26e4-3f5a-47a2-bc79-1dd70d6093a5', '913445fe-14e3-401c-9f42-b5d9855cc76c', '1f0de700-8225-4119-9183-4ac02d61bc61', 'I am interested in booking your apartment. Is it available?', CURRENT_TIMESTAMP),
  ('6246fb6e-1731-47b1-9e09-dfe8dcf03635', '1f0de700-8225-4119-9183-4ac02d61bc61', '913445fe-14e3-401c-9f42-b5d9855cc76c', 'Yes, the apartment is available for your dates. Let me know if you would like to proceed.', CURRENT_TIMESTAMP);
