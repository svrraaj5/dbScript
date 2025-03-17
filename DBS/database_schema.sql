-- Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Devices Table
CREATE TABLE Devices (
    device_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    brand VARCHAR(50),
    model VARCHAR(50),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Features Table
CREATE TABLE Features (
    feature_id SERIAL PRIMARY KEY,
    feature_name VARCHAR(100) UNIQUE
);

-- User Activities Table
CREATE TABLE UserActivities (
    activity_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    device_id INT REFERENCES Devices(device_id),
    action TEXT,
    timestamp TIMESTAMP DEFAULT NOW()
);

-- Settings Table
CREATE TABLE Settings (
    setting_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    preference_name VARCHAR(100),
    preference_value VARCHAR(100)
);

-- Alerts Table
CREATE TABLE Alerts (
    alert_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    device_id INT REFERENCES Devices(device_id),
    alert_type VARCHAR(50),
    message TEXT,
    timestamp TIMESTAMP DEFAULT NOW()
);


------------------------------

-- Insert Users
INSERT INTO Users (name, email) VALUES 
('Kishore MK', 'kmk@example.com');

-- Insert Devices (Only Samsung)
INSERT INTO Devices (user_id, brand, model, status) VALUES 
(1, 'Samsung', 'SmartGlasses X', 'Active');

-- Insert Features
INSERT INTO Features (feature_name) VALUES 
('Voice Control'),
('Object Detection'),
('Navigation Assistance'),
('Text-to-Speech'),
('IoT Connectivity');

-- Insert User Activities
INSERT INTO UserActivities (user_id, device_id, action) VALUES 
(1, 1, 'Turned on device'),
(1, 1, 'Activated object detection');

-- Insert Settings
INSERT INTO Settings (user_id, preference_name, preference_value) VALUES 
(1, 'Theme', 'Dark'),
(1, 'Language', 'English');

-- Insert Alerts
INSERT INTO Alerts (user_id, device_id, alert_type, message) VALUES 
(1, 1, 'Hazard', 'Pothole detected ahead!'),
(1, 1, 'Navigation', 'Turn left in 10 meters');
