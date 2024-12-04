-- Membuat tabel bernama eventease
CREATE DATABASE eventease;

\c eventease;

-- Tabel users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    profile_picture VARCHAR(255),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    is_verified BOOLEAN DEFAULT FALSE,
    otp_code VARCHAR(6),
    otp_expiration TIMESTAMP WITHOUT TIME ZONE,
    google_id VARCHAR(255),
    has_password BOOLEAN DEFAULT FALSE
);

-- Tabel tabel_event
CREATE TABLE tabel_event (
    event_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    nama_event VARCHAR(255),
    event_category VARCHAR(100),
    host_profile VARCHAR(255),
    host_name VARCHAR(255),
    host_telp VARCHAR(255),
    event_type VARCHAR(20),
    start_date DATE,
    start_time_first TIME,
    end_time_first TIME,
    end_date DATE,
    location_type VARCHAR(10),
    address VARCHAR(255),
    online_link VARCHAR(255),
    gmaps_link TEXT,
    description TEXT,
    foto_banner VARCHAR(255),
    start_time_sec TIME,
    end_time_sec TIME,
    status VARCHAR(10),
    jenis_ticket VARCHAR(10),
    nama_ticket VARCHAR(40),
    harga DECIMAL(10, 2),
    stok INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel transaction
CREATE TABLE transaction (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    event_id INT REFERENCES tabel_event(event_id) ON DELETE CASCADE,
    order_id VARCHAR(255),
    fullname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    quantity INT,
    gross_amount DECIMAL(10, 2),
    payment_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data ke dalam database
INSERT INTO tabel_event (
    id, nama_event, event_category, host_profile, hostname, event_type, 
    start_date, start_time_first, end_time_first, end_date, location_type, 
    address, online_link, gmaps_link, description, foto_banner, start_time_sec, 
    end_time_sec, status, jenis_tiket, nama_tiket, harga, stok
) VALUES (4, 'Tech Conference 2024', 'Technology', '674f85ccbd894.jpg', 'TechGroup Inc.', 
         'single',  '2024-12-20', '09:00', '15:00', '2024-12-20', 'offline', 
         'Tech Convention Center, Silicon Valley', NULL, 'https://maps.app.goo.gl/quF3vdFaAcMxb9126’, 
         'An inspiring conference bringing together technology enthusiasts, startups, and investors.',  
         '674f866930d1b', 'NULL’, 'NULL', 'draft', 'ticketed', 'Techno Ticket', 100000.00, 20);

-- Menampilkan data
SELECT nama_event, event_category, host_profile, hostname, 
    start_date, start_time_first, end_time_first, end_date, location_type, 
    address, gmaps_link, description, foto_banner, harga FROM tabel_event WHERE id = 4;

-- Update data
UPDATE tabel_event 
              SET address = 'New Convention Center, Jakarta', 
                  start_time_first = '10:00', 
                  end_time_first = '16:00' 
              WHERE id = 4;

-- Delete data
DELETE FROM tabel_event WHERE id = 4;