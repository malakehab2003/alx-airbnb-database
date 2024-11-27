CREATE DATABASE IF NOT EXISTS Airbnb;

USE Airbnb;

DROP TABLE IF EXISTS User;

CREATE TABLE IF NOT EXISTS User (
  id CHAR(36) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('guest', 'host', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX index_email (email)
);


DROP TABLE IF EXISTS Property;

CREATE TABLE IF NOT EXISTS Property (
  id CHAR(36) PRIMARY KEY,
  host_id CHAR(36),
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(255) NOT NULL,
  pricepernight DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES User (id) ON DELETE CASCADE,
  INDEX index_id (id)
);

DROP TABLE IF EXISTS Booking;

CREATE TABLE IF NOT EXISTS Booking (
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
);

DROP TABLE IF EXISTS Payment;

CREATE TABLE IF NOT EXISTS Payment (
  id CHAR(36) PRIMARY KEY,
  booking_id CHAR(36) NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  CONSTRAINT fk_booking FOREIGN KEY (booking_id) REFERENCES Booking(id) ON DELETE CASCADE,
  INDEX index_booking_id (booking_id)
);

DROP TABLE IF EXISTS Review;

CREATE TABLE IF NOT EXISTS Review (
  id CHAR(36) PRIMARY KEY,
  property_id CHAR(36) NOT NULL,
  user_id CHAR(36) NOT NULL,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Property(id) ON DELETE CASCADE,
  CONSTRAINT fk_user_review FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Message;

CREATE TABLE IF NOT EXISTS Message (
  id CHAR(36) PRIMARY KEY,
  sender_id CHAR(36) NOT NULL,
  recipient_id CHAR(36) NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES User(id) ON DELETE CASCADE,
  CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES User(id) ON DELETE CASCADE
);
