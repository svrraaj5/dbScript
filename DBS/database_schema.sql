-- Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Devices Table
CREATE TABLE Devices (
    device_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Features Table
CREATE TABLE Features (
    feature_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- User Activities Table
CREATE TABLE UserActivities (
    activity_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    device_id INT REFERENCES Devices(device_id) ON DELETE CASCADE,
    action VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Settings Table
CREATE TABLE Settings (
    setting_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    preference_key VARCHAR(255) NOT NULL,
    preference_value VARCHAR(255) NOT NULL
);

-- Alerts Table
CREATE TABLE Alerts (
    alert_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    device_id INT REFERENCES Devices(device_id) ON DELETE CASCADE,
    alert_type VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Users
INSERT INTO Users (name, email) VALUES 
('John Doe', 'john@example.com'),
('Jane Smith', 'jane@example.com');

-- Insert Devices
INSERT INTO Devices (user_id, brand, model, status) VALUES 
(1, 'Samsung', 'Galaxy S21', 'Active'),
(2, 'Google', 'Pixel 7', 'Inactive');

-- Insert Features
INSERT INTO Features (name) VALUES 
('Voice Control'), 
('Text-to-Speech'), 
('IoT Connectivity');

-- Insert User Activities
INSERT INTO UserActivities (user_id, device_id, action) VALUES 
(1, 1, 'Turned on device'),
(2, 2, 'Activated object detection');

-- Insert Settings
INSERT INTO Settings (user_id, preference_key, preference_value) VALUES 
(1, 'theme', 'dark'),
(2, 'language', 'English');

-- Insert Alerts
INSERT INTO Alerts (user_id, device_id, alert_type, message) VALUES 
(1, 1, 'Hazard', 'Pothole detected ahead!'),
(2, 2, 'Navigation', 'Turn left in 10 meters');
