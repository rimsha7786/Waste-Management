CREATE DATABASE IF NOT EXISTS waste_management_pk;
 USE waste_management_pk; 
-- 1. Areas Table 
CREATE TABLE Areas ( area_id INT PRIMARY KEY AUTO_INCREMENT, area_name VARCHAR(100), zone VARCHAR(50), city VARCHAR(50), postal_code VARCHAR(10), population INT, total_bins INT ); 
INSERT INTO Areas VALUES (1, 'Gulberg', 'Zone A', 'Lahore', '54000', 45000, 25), (2, 'DHA Phase 5', 'Zone B', 'Lahore', '54792', 38000, 20), (3, 'Model Town', 'Zone C', 'Lahore', '54700', 52000, 30), (4, 'Johar Town', 'Zone A', 'Lahore', '54782', 48000, 28), (5, 'Garden Town', 'Zone B', 'Lahore', '54600', 35000, 18), (6, 'Bahria Town', 'Zone C', 'Lahore', '53720', 62000, 35), (7, 'Allama Iqbal Town', 'Zone A', 'Lahore', '54570', 55000, 32), (8, 'Township', 'Zone B', 'Lahore', '54770', 41000, 22), (9, 'Shadman', 'Zone C', 'Lahore', '54000', 28000, 15), (10, 'Faisal Town', 'Zone A', 'Lahore', '54770', 46000, 26), (11, 'Wapda Town', 'Zone B', 'Lahore', '54770', 39000, 21), (12, 'Valencia Town', 'Zone C', 'Lahore', '54000', 33000, 17), (13, 'Cavalry Ground', 'Zone A', 'Lahore', '54810', 29000, 16), (14, 'Thokar Niaz Baig', 'Zone B', 'Lahore', '53700', 44000, 24), (15, 'Ichhra', 'Zone C', 'Lahore', '54000', 51000, 29), (16, 'Samanabad', 'Zone A', 'Lahore', '54000', 47000, 27), (17, 'Muslim Town', 'Zone B', 'Lahore', '54600', 36000, 19), (18, 'Mustafa Town', 'Zone C', 'Lahore', '54000', 40000, 23), (19, 'Green Town', 'Zone A', 'Lahore', '54000', 34000, 18), (20, 'Canal Road', 'Zone B', 'Lahore', '54000', 31000, 16); 
-- 2. Bins Table
CREATE TABLE Bins ( bin_id INT PRIMARY KEY AUTO_INCREMENT, bin_type VARCHAR(50), capacity INT, latitude DECIMAL(10, 7), longitude DECIMAL(10, 7), area_id INT, install_date DATE, status VARCHAR(20), fill_level INT, FOREIGN KEY (area_id) REFERENCES Areas(area_id) ); 
INSERT INTO Bins VALUES (1, 'Plastic', 120, 31.5204, 74.3587, 1, '2023-01-15', 'Full', 95), (2, 'Organic', 150, 31.4697, 74.4089, 2, '2023-02-20', 'Half', 55), (3, 'Metal', 100, 31.4826, 74.3241, 3, '2023-01-10', 'Empty', 15), (4, 'Paper', 80, 31.4668, 74.2741, 4, '2023-03-05', 'Full', 90), (5, 'Glass', 90, 31.4695, 74.2732, 5, '2023-02-15', 'Half', 45), (6, 'Plastic', 120, 31.3411, 74.2331, 6, '2023-01-25', 'Full', 88), (7, 'Organic', 150, 31.4435, 74.3436, 7, '2023-03-10', 'Empty', 20), (8, 'Mixed', 140, 31.4530, 74.3444, 8, '2023-02-05', 'Half', 60), (9, 'Paper', 80, 31.5467, 74.3206, 9, '2023-01-18', 'Full', 85), (10, 'Plastic', 120, 31.4229, 74.2855, 10, '2023-02-28', 'Half', 50), (11, 'Metal', 100, 31.4403, 74.3131, 11, '2023-03-15', 'Empty', 10), (12, 'Organic', 150, 31.4820, 74.3441, 12, '2023-01-20', 'Full', 92), (13, 'Glass', 90, 31.4881, 74.3433, 13, '2023-02-10', 'Half', 48), (14, 'Mixed', 140, 31.4165, 74.2995, 14, '2023-03-01', 'Full', 87), (15, 'Paper', 80, 31.5446, 74.3272, 15, '2023-01-12', 'Empty', 25), (16, 'Plastic', 120, 31.5056, 74.3294, 16, '2023-02-22', 'Half', 55), (17, 'Organic', 150, 31.4800, 74.2900, 17, '2023-03-08', 'Full', 93), (18, 'Metal', 100, 31.4700, 74.3100, 18, '2023-01-30', 'Half', 42), (19, 'Mixed', 140, 31.4600, 74.3200, 19, '2023-02-18', 'Empty', 18), (20, 'Glass', 90, 31.5100, 74.3400, 20, '2023-03-12', 'Full', 89);
-- 3. Vehicles Table
CREATE TABLE Vehicles ( vehicle_id INT PRIMARY KEY AUTO_INCREMENT, vehicle_number VARCHAR(20), type VARCHAR(50), capacity INT, fuel_type VARCHAR(20), registration_date DATE, last_service DATE, status VARCHAR(20) ); 
INSERT INTO Vehicles VALUES (1, 'LHR-2345', 'Compactor Truck', 8000, 'Diesel', '2022-01-10', '2024-11-15', 'Active'), (2, 'LHR-5678', 'Side Loader', 6000, 'Diesel', '2022-03-20', '2024-10-20', 'Active'), (3, 'LHR-8901', 'Front Loader', 7000, 'Diesel', '2022-05-15', '2024-11-05', 'Active'), (4, 'LHR-1234', 'Roll-off Truck', 10000, 'Diesel', '2021-12-10', '2024-09-25', 'Maintenance'), (5, 'LHR-4567', 'Compactor Truck', 8000, 'CNG', '2022-06-05', '2024-11-10', 'Active'), (6, 'LHR-7890', 'Side Loader', 6000, 'Diesel', '2022-07-12', '2024-10-30', 'Active'), (7, 'LHR-2468', 'Front Loader', 7000, 'Diesel', '2022-08-20', '2024-11-18', 'Active'), (8, 'LHR-1357', 'Compactor Truck', 8000, 'CNG', '2022-09-15', '2024-10-15', 'Active'), (9, 'LHR-9753', 'Side Loader', 6000, 'Diesel', '2022-02-28', '2024-09-10', 'Maintenance'), (10, 'LHR-8642', 'Roll-off Truck', 10000, 'Diesel', '2022-04-10', '2024-11-20', 'Active'), (11, 'LHR-3691', 'Front Loader', 7000, 'CNG', '2022-10-05', '2024-10-25', 'Active'), (12, 'LHR-1593', 'Compactor Truck', 8000, 'Diesel', '2022-11-15', '2024-11-12', 'Active'), (13, 'LHR-7531', 'Side Loader', 6000, 'Diesel', '2021-11-20', '2024-09-18', 'Active'), (14, 'LHR-9517', 'Front Loader', 7000, 'CNG', '2022-12-01', '2024-10-22', 'Maintenance'), (15, 'LHR-3579', 'Roll-off Truck', 10000, 'Diesel', '2023-01-10', '2024-11-08', 'Active'), (16, 'LHR-2580', 'Compactor Truck', 8000, 'Diesel', '2023-02-14', '2024-10-28', 'Active'), (17, 'LHR-1470', 'Side Loader', 6000, 'CNG', '2023-03-20', '2024-11-15', 'Active'), (18, 'LHR-3698', 'Front Loader', 7000, 'Diesel', '2023-04-25', '2024-09-30', 'Active'), (19, 'LHR-7412', 'Compactor Truck', 8000, 'Diesel', '2023-05-30', '2024-10-18', 'Active'), (20, 'LHR-9630', 'Roll-off Truck', 10000, 'CNG', '2023-06-15', '2024-11-22', 'Active'); 
-- 4. Employees Table 
CREATE TABLE Employees ( employee_id INT PRIMARY KEY AUTO_INCREMENT, first_name VARCHAR(50), last_name VARCHAR(50), phone VARCHAR(15), email VARCHAR(100), job_role VARCHAR(50), hire_date DATE, status VARCHAR(20) );
INSERT INTO Employees VALUES (1, 'Ahmed', 'Khan', '0300-1234567', 'ahmed.khan@waste.pk', 'Driver', '2022-01-15', 'Active'), (2, 'Fatima', 'Ali', '0321-2345678', 'fatima.ali@waste.pk', 'Manager', '2021-11-10', 'Active'), (3, 'Hassan', 'Malik', '0333-3456789', 'hassan.malik@waste.pk', 'Helper', '2022-03-20', 'Active'), (4, 'Ayesha', 'Raza', '0345-4567890', 'ayesha.raza@waste.pk', 'Supervisor', '2022-02-05', 'Active'), (5, 'Usman', 'Sheikh', '0300-5678901', 'usman.sheikh@waste.pk', 'Driver', '2022-04-12', 'Active'), (6, 'Zainab', 'Hussain', '0321-6789012', 'zainab.hussain@waste.pk', 'Helper', '2022-05-18', 'Active'), (7, 'Bilal', 'Ahmad', '0333-7890123', 'bilal.ahmad@waste.pk', 'Driver', '2022-06-25', 'Active'), (8, 'Sana', 'Iqbal', '0345-8901234', 'sana.iqbal@waste.pk', 'Admin', '2021-12-01', 'Active'), (9, 'Imran', 'Butt', '0300-9012345', 'imran.butt@waste.pk', 'Helper', '2022-07-30', 'Active'), (10, 'Maria', 'Noor', '0321-0123456', 'maria.noor@waste.pk', 'Supervisor', '2022-08-15', 'Active'), (11, 'Kamran', 'Siddiqui', '0333-1234509', 'kamran.siddiqui@waste.pk', 'Driver', '2022-09-20', 'Active'), (12, 'Hina', 'Yousaf', '0345-2345610', 'hina.yousaf@waste.pk', 'Helper', '2022-10-05', 'Active'), (13, 'Tariq', 'Javed', '0300-3456721', 'tariq.javed@waste.pk', 'Manager', '2021-10-15', 'Active'), (14, 'Nadia', 'Waheed', '0321-4567832', 'nadia.waheed@waste.pk', 'Driver', '2022-11-10', 'Active'), (15, 'Asim', 'Mirza', '0333-5678943', 'asim.mirza@waste.pk', 'Helper', '2022-12-01', 'Active'), (16, 'Saima', 'Baig', '0345-6789054', 'saima.baig@waste.pk', 'Admin', '2023-01-15', 'Active'), (17, 'Faisal', 'Aziz', '0300-7890165', 'faisal.aziz@waste.pk', 'Driver', '2023-02-20', 'Active'), (18, 'Rabia', 'Nasir', '0321-8901276', 'rabia.nasir@waste.pk', 'Supervisor', '2023-03-05', 'Active'), (19, 'Kashif', 'Saleem', '0333-9012387', 'kashif.saleem@waste.pk', 'Helper', '2023-04-12', 'Active'), (20, 'Amna', 'Farooq', '0345-0123498', 'amna.farooq@waste.pk', 'Manager', '2021-09-01', 'Active');
-- 5. Routes Table
CREATE TABLE Routes ( route_id INT PRIMARY KEY AUTO_INCREMENT, route_name VARCHAR(100), area_id INT, vehicle_id INT, duration INT, distance DECIMAL(5,2), priority VARCHAR(20), FOREIGN KEY (area_id) REFERENCES Areas(area_id), FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id) );
INSERT INTO Routes VALUES (1, 'Gulberg Morning Route', 1, 1, 120, 15.5, 'High'), (2, 'DHA Evening Route', 2, 2, 90, 12.3, 'Medium'), (3, 'Model Town Route', 3, 3, 150, 18.7, 'High'), (4, 'Johar Town Circuit', 4, 4, 110, 14.2, 'High'), (5, 'Garden Town Loop', 5, 5, 80, 10.5, 'Medium'), (6, 'Bahria Town Express', 6, 6, 180, 22.8, 'High'), (7, 'Allama Iqbal Route', 7, 7, 140, 16.9, 'High'), (8, 'Township Pickup', 8, 8, 100, 13.1, 'Medium'), (9, 'Shadman Quick Route', 9, 9, 70, 8.6, 'Low'), (10, 'Faisal Town Circuit', 10, 10, 130, 15.8, 'High'), (11, 'Wapda Town Route', 11, 11, 95, 11.7, 'Medium'), (12, 'Valencia Pickup', 12, 12, 85, 10.2, 'Medium'), (13, 'Cavalry Ground Route', 13, 13, 75, 9.3, 'Low'), (14, 'Thokar Route', 14, 14, 125, 14.9, 'High'), (15, 'Ichhra Circuit', 15, 15, 135, 16.2, 'High'), (16, 'Samanabad Route', 16, 16, 115, 13.8, 'Medium'), (17, 'Muslim Town Pickup', 17, 17, 90, 11.1, 'Medium'), (18, 'Mustafa Town Route', 18, 18, 105, 12.6, 'Medium'), (19, 'Green Town Circuit', 19, 19, 80, 9.8, 'Low'), (20, 'Canal Road Route', 20, 20, 70, 8.4, 'Low'); 
-- 6. Schedules Table 
CREATE TABLE Schedules ( schedule_id INT PRIMARY KEY AUTO_INCREMENT, route_id INT, date DATE, time TIME, driver_id INT, helper_ids VARCHAR(50), status VARCHAR(20), FOREIGN KEY (route_id) REFERENCES Routes(route_id), FOREIGN KEY (driver_id) REFERENCES Employees(employee_id) ); 
INSERT INTO Schedules VALUES (1, 1, '2024-12-17', '06:00:00', 1, '3,6', 'Completed'), (2, 2, '2024-12-17', '16:00:00', 5, '9,12', 'Completed'), (3, 3, '2024-12-17', '07:00:00', 7, '15,19', 'Completed'), (4, 4, '2024-12-17', '08:00:00', 11, '3,9', 'In Progress'), (5, 5, '2024-12-17', '09:00:00', 14, '6,15', 'Scheduled'), (6, 6, '2024-12-18', '06:30:00', 17, '12,19', 'Scheduled'), (7, 7, '2024-12-18', '07:30:00', 1, '3,6', 'Scheduled'), (8, 8, '2024-12-18', '08:30:00', 5, '9,12', 'Scheduled'), (9, 9, '2024-12-18', '10:00:00', 7, '15,19', 'Scheduled'), (10, 10, '2024-12-18', '06:00:00', 11, '3,9', 'Scheduled'), (11, 11, '2024-12-19', '07:00:00', 14, '6,15', 'Scheduled'), (12, 12, '2024-12-19', '08:00:00', 17, '12,19', 'Scheduled'), (13, 13, '2024-12-19', '09:00:00', 1, '3,6', 'Scheduled'), (14, 14, '2024-12-19', '10:00:00', 5, '9,12', 'Scheduled'), (15, 15, '2024-12-19', '11:00:00', 7, '15,19', 'Scheduled'), (16, 16, '2024-12-20', '06:00:00', 11, '3,9', 'Scheduled'), (17, 17, '2024-12-20', '07:00:00', 14, '6,15', 'Scheduled'), (18, 18, '2024-12-20', '08:00:00', 17, '12,19', 'Scheduled'), (19, 19, '2024-12-20', '09:00:00', 1, '3,6', 'Scheduled'), (20, 20, '2024-12-20', '10:00:00', 5, '9,12', 'Scheduled'); 
-- 7. Collections Table
CREATE TABLE Collections ( collection_id INT AUTO_INCREMENT PRIMARY KEY, bin_id INT, schedule_id INT, collection_time DATETIME, waste_weight DECIMAL(6,2), duration INT, status VARCHAR(20), FOREIGN KEY (bin_id) REFERENCES Bins(bin_id), FOREIGN KEY (schedule_id) REFERENCES Schedules(schedule_id) ); 
INSERT INTO Collections (collection_id, bin_id, schedule_id, collection_time, waste_weight, duration, status) VALUES (1, 1, 1, '2024-12-17 06:15:00', 114.50, 8, 'Completed'), (2, 2, 2, '2024-12-17 16:20:00', 82.30, 6, 'Completed'), (3, 3, 3, '2024-12-17 07:25:00', 15.20, 4, 'Completed'), (4, 4, 4, '2024-12-17 08:30:00', 72.00, 7, 'In Progress'), (5, 5, 5, '2024-12-17 09:15:00', 40.50, 5, 'Scheduled'), (6, 6, 6, '2024-12-18 06:45:00', 105.60, 9, 'Scheduled'), (7, 7, 7, '2024-12-18 07:50:00', 30.00, 5, 'Scheduled'), (8, 8, 8, '2024-12-18 08:40:00', 84.00, 7, 'Scheduled'), (9, 9, 9, '2024-12-18 10:10:00', 68.00, 6, 'Scheduled'), (10, 10, 10, '2024-12-18 06:20:00', 60.00, 6, 'Scheduled'), (11, 11, 11, '2024-12-19 07:15:00', 10.00, 3, 'Scheduled'), (12, 12, 12, '2024-12-19 08:10:00', 138.00, 10, 'Scheduled'), (13, 13, 13, '2024-12-19 09:05:00', 43.20, 5, 'Scheduled'), (14, 14, 14, '2024-12-19 10:12:00', 121.80, 9, 'Scheduled'), (15, 15, 15, '2024-12-19 11:20:00', 20.00, 4, 'Scheduled'), (16, 16, 16, '2024-12-20 06:15:00', 66.00, 6, 'Scheduled'), (17, 17, 17, '2024-12-20 07:18:00', 139.50, 10, 'Scheduled'), (18, 18, 18, '2024-12-20 08:22:00', 42.00, 5, 'Scheduled'), (19, 19, 19, '2024-12-20 09:25:00', 25.20, 4, 'Scheduled'), (20, 20, 20, '2024-12-20 10:30:00', 80.10, 7, 'Scheduled');
-- 7. Create table 
CREATE TABLE Citizens ( citizen_id INT PRIMARY KEY, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, phone VARCHAR(20), email VARCHAR(100), address VARCHAR(255), area_id INT, registration_date DATE ); 
INSERT INTO Citizens (citizen_id, first_name, last_name, phone, email, address, area_id, registration_date) VALUES (1, 'Ali', 'Raza', '0300-1111111', 'ali.raza@gmail.com', '123 Main Blvd, Gulberg', 1, '2023-01-10'), (2, 'Sara', 'Khan', '0321-2222222', 'sara.khan@gmail.com', '456 DHA Phase 5', 2, '2023-02-15'), (3, 'Hamza', 'Iqbal', '0333-3333333', 'hamza.iqbal@gmail.com', '789 Model Town Link', 3, '2023-01-20'), (4, 'Aisha', 'Malik', '0345-4444444', 'aisha.malik@gmail.com', '321 Block H, Johar', 4, '2023-03-05'), (5, 'Bilal', 'Ahmed', '0300-5555555', 'bilal.ahmed@gmail.com', '654 Garden Town', 5, '2023-02-28'), (6, 'Fatima', 'Hassan', '0321-6666666', 'fatima.hassan@gmail.com', '987 Bahria Town', 6, '2023-01-15'), (7, 'Usman', 'Ali', '0333-7777777', 'usman.ali@gmail.com', '147 Allama Iqbal Town', 7, '2023-03-12'), (8, 'Zainab', 'Butt', '0345-8888888', 'zainab.butt@gmail.com', '258 Township', 8, '2023-02-08'), (9, 'Adnan', 'Sheikh', '0300-9999999', 'adnan.sheikh@gmail.com', '369 Shadman', 9, '2023-01-25'), (10, 'Hira', 'Noor', '0321-1010101', 'hira.noor@gmail.com', '741 Faisal Town', 10, '2023-03-18'), (11, 'Kamran', 'Yousaf', '0333-1212121', 'kamran.yousaf@gmail.com', '852 Wapda Town', 11, '2023-02-20'), (12, 'Mehreen', 'Javed', '0345-1313131', 'mehreen.javed@gmail.com', '963 Valencia Town', 12, '2023-01-30'), (13, 'Asad', 'Mirza', '0300-1414141', 'asad.mirza@gmail.com', '159 Cavalry Ground', 13, '2023-03-22'), (14, 'Nimra', 'Aziz', '0321-1515151', 'nimra.aziz@gmail.com', '357 Thokar', 14, '2023-02-12'), (15, 'Fahad', 'Waheed', '0333-1616161', 'fahad.waheed@gmail.com', '753 Ichhra', 15, '2023-01-08'), (16, 'Sadia', 'Nasir', '0345-1717171', 'sadia.nasir@gmail.com', '951 Samanabad', 16, '2023-03-25'), (17, 'Talha', 'Saleem', '0300-1818181', 'talha.saleem@gmail.com', '246 Muslim Town', 17, '2023-02-18'), (18, 'Kiran', 'Baig', '0321-1919191', 'kiran.baig@gmail.com', '468 Mustafa Town', 18, '2023-01-12'), (19, 'Owais', 'Siddiqui', '0333-2020202', 'owais.siddiqui@gmail.com', '579 Green Town', 19, '2023-03-08'), (20, 'Ayesha', 'Farooq', '0345-2121212', 'ayesha.farooq@gmail.com', '680 Canal Road', 20, '2023-02-22'); 
-- 9. Complaints Table
CREATE TABLE Complaints ( complaint_id INT PRIMARY KEY AUTO_INCREMENT, citizen_id INT, type VARCHAR(100), description TEXT, date DATE, status VARCHAR(20), assigned_to INT, FOREIGN KEY (citizen_id) REFERENCES Citizens(citizen_id), FOREIGN KEY (assigned_to) REFERENCES Employees(employee_id) );
INSERT INTO Complaints VALUES (1, 1, 'Missed Pickup', 'Bin not collected for 3 days', '2024-12-15', 'Pending', 2), (2, 2, 'Overflow', 'Bin is overflowing with waste', '2024-12-14', 'In Progress', 4), (3, 3, 'Damaged Bin', 'Bin lid is broken', '2024-12-16', 'Resolved', 10), (4, 4, 'Illegal Dumping', 'Waste dumped near bin area', '2024-12-13', 'Pending', 2), (5, 5, 'Odor Issue', 'Bad smell from collection area', '2024-12-17', 'Pending', 4), (6, 6, 'Late Pickup', 'Collection delayed by 2 hours', '2024-12-12', 'Resolved', 10), (7, 7, 'Missed Pickup', 'Schedule not followed', '2024-12-15', 'In Progress', 18), (8, 8, 'Damaged Bin', 'Bin has holes', '2024-12-11', 'Resolved', 10), (9, 9, 'Overflow', 'Waste spilling on street', '2024-12-16', 'Pending', 2), (10, 10, 'Illegal Dumping', 'Construction waste dumped', '2024-12-14', 'In Progress', 4), (11, 11, 'Late Pickup', 'Pickup not on time', '2024-12-17', 'Pending', 18), (12, 12, 'Odor Issue', 'Strong smell from bin', '2024-12-13', 'Resolved', 10), (13, 13, 'Missed Pickup', 'Bin not emptied today', '2024-12-12', 'Resolved', 2), (14, 14, 'Damaged Bin', 'Bin wheels broken', '2024-12-15', 'In Progress', 4), (15, 15, 'Overflow', 'Excessive waste accumulation', '2024-12-16', 'Pending', 10), (16, 16, 'Illegal Dumping', 'Medical waste found', '2024-12-11', 'Resolved', 18), (17, 17, 'Late Pickup', 'Evening pickup delayed', '2024-12-14', 'Pending', 2), (18, 18, 'Odor Issue', 'Rotting waste smell', '2024-12-17', 'In Progress', 4), (19, 19, 'Missed Pickup', 'Two days no collection', '2024-12-13', 'Pending', 10), (20, 20, 'Damaged Bin', 'Bin completely damaged', '2024-12-15', 'In Progress', 18);
-- 10. Payments Table
CREATE TABLE Payments ( payment_id INT PRIMARY KEY AUTO_INCREMENT, citizen_id INT, invoice_number VARCHAR(20), amount DECIMAL(10,2), payment_date DATE, method VARCHAR(30), status VARCHAR(20), FOREIGN KEY (citizen_id) REFERENCES Citizens(citizen_id) );
INSERT INTO Payments VALUES (1, 1, 'INV-2024-001', 3500.00, '2024-12-01', 'Bank Transfer', 'Paid'), (2, 2, 'INV-2024-002', 4200.00, '2024-12-02', 'Cash', 'Paid'), (3, 3, 'INV-2024-003', 3800.00, '2024-12-03', 'JazzCash', 'Paid'), (4, 4, 'INV-2024-004', 4500.00, '2024-12-04', 'EasyPaisa', 'Pending'), (5, 5, 'INV-2024-005', 3200.00, '2024-12-05', 'Bank Transfer', 'Paid'), (6, 6, 'INV-2024-006', 5000.00, '2024-12-06', 'Credit Card', 'Paid'), (7, 7, 'INV-2024-007', 4100.00, '2024-12-07', 'Cash', 'Paid'), (8, 8, 'INV-2024-008', 3600.00, '2024-12-08', 'JazzCash', 'Pending'), (9, 9, 'INV-2024-009', 2900.00, '2024-12-09', 'EasyPaisa', 'Paid'), (10, 10, 'INV-2024-010', 4300.00, '2024-12-10', 'Bank Transfer', 'Paid'), (11, 11, 'INV-2024-011', 3900.00, '2024-12-11', 'Cash', 'Paid'), (12, 12, 'INV-2024-012', 3400.00, '2024-12-12', 'JazzCash', 'Pending'), (13, 13, 'INV-2024-013', 3100.00, '2024-12-13', 'EasyPaisa', 'Paid'), (14, 14, 'INV-2024-014', 4400.00, '2024-12-14', 'Bank Transfer', 'Paid'), (15, 15, 'INV-2024-015', 4700.00, '2024-12-15', 'Credit Card', 'Paid'), (16, 16, 'INV-2024-016', 4000.00, '2024-12-16', 'Cash', 'Pending'), (17, 17, 'INV-2024-017', 3300.00, '2024-12-17', 'JazzCash', 'Paid'), (18, 18, 'INV-2024-018', 3700.00, '2024-12-10', 'EasyPaisa', 'Paid'), (19, 19, 'INV-2024-019', 3000.00, '2024-12-11', 'Bank Transfer', 'Paid'), (20, 20, 'INV-2024-020', 2800.00, '2024-12-12', 'Cash', 'Pending'); 
-- 11. Sensors Table 
CREATE TABLE Sensors ( sensor_id INT PRIMARY KEY AUTO_INCREMENT, bin_id INT, fill_percentage INT, temperature DECIMAL(4,1), timestamp DATETIME, battery INT, sensor_status VARCHAR(20), FOREIGN KEY (bin_id) REFERENCES Bins(bin_id) );
INSERT INTO Sensors VALUES (1, 1, 95, 28.5, '2024-12-17 08:30:00', 85, 'Active'), (2, 2, 55, 26.3, '2024-12-17 08:35:00', 90, 'Active'), (3, 3, 15, 24.7, '2024-12-17 08:40:00', 78, 'Active'), (4, 4, 90, 29.2, '2024-12-17 08:45:00', 92, 'Active'), (5, 5, 45, 25.8, '2024-12-17 08:50:00', 88, 'Active'), (6, 6, 88, 30.1, '2024-12-17 08:55:00', 75, 'Active'), (7, 7, 20, 23.5, '2024-12-17 09:00:00', 95, 'Active'), (8, 8, 60, 27.4, '2024-12-17 09:05:00', 82, 'Active'), (9, 9, 85, 28.9, '2024-12-17 09:10:00', 87, 'Active'), (10, 10, 50, 26.1, '2024-12-17 09:15:00', 91, 'Active'), (11, 11, 10, 24.2, '2024-12-17 09:20:00', 45, 'Low Battery'), (12, 12, 92, 31.3, '2024-12-17 09:25:00', 89, 'Active'), (13, 13, 48, 25.6, '2024-12-17 09:30:00', 93, 'Active'), (14, 14, 87, 29.7, '2024-12-17 09:35:00', 86, 'Active'), (15, 15, 25, 24.8, '2024-12-17 09:40:00', 79, 'Active'), (16, 16, 55, 26.9, '2024-12-17 09:45:00', 94, 'Active'), (17, 17, 93, 30.5, '2024-12-17 09:50:00', 81, 'Active'), (18, 18, 42, 25.3, '2024-12-17 09:55:00', 88, 'Active'), (19, 19, 18, 23.9, '2024-12-17 10:00:00', 90, 'Active'), (20, 20, 89, 29.4, '2024-12-17 10:05:00', 84, 'Active'); 
-- 12. Maintenance Table
CREATE TABLE Maintenance ( maintenance_id INT PRIMARY KEY AUTO_INCREMENT, item_type VARCHAR(20), item_id INT, maintenance_type VARCHAR(50), scheduled_date DATE, completed_date DATE, done_by INT, cost DECIMAL(10,2), FOREIGN KEY (done_by) REFERENCES Employees(employee_id) ); 
INSERT INTO Maintenance VALUES (1, 'Vehicle', 1, 'Oil Change', '2024-11-15', '2024-11-15', 2, 8500.00), (2, 'Bin', 3, 'Lid Replacement', '2024-11-18', '2024-11-19', 4, 2500.00), (3, 'Vehicle', 4, 'Engine Repair', '2024-09-25', '2024-09-28', 13, 45000.00), (4, 'Bin', 8, 'Wheel Repair', '2024-12-01', '2024-12-02', 10, 1800.00), (5, 'Vehicle', 2, 'Tire Replacement', '2024-10-20', '2024-10-20', 2, 32000.00), (6, 'Bin', 12, 'Body Repair', '2024-11-22', '2024-11-23', 18, 3200.00), (7, 'Vehicle', 9, 'Brake Service', '2024-09-10', '2024-09-12', 13, 18500.00), (8, 'Bin', 15, 'Paint Job', '2024-12-05', '2024-12-06', 4, 2200.00), (9, 'Vehicle', 5, 'AC Repair', '2024-11-10', '2024-11-11', 2, 12000.00), (10, 'Bin', 20, 'Sensor Installation', '2024-11-28', '2024-11-29', 10, 4500.00), (11, 'Vehicle', 14, 'Battery Replacement', '2024-10-22', '2024-10-23', 13, 25000.00), (12, 'Bin', 6, 'Lock Repair', '2024-12-08', '2024-12-09', 18, 1500.00), (13, 'Vehicle', 7, 'Suspension Work', '2024-11-18', '2024-11-20', 2, 28000.00), (14, 'Bin', 14, 'Handle Replacement', '2024-12-10', '2024-12-11', 4, 1900.00), (15, 'Vehicle', 3, 'Transmisareasbinsbinssion Service', '2024-11-05', '2024-11-07', 13, 38000.00), (16, 'Bin', 17, 'Body Welding', '2024-12-12', '2024-12-13', 10, 2800.00), (17, 'Vehicle', 12, 'Alignment Check', '2024-11-12', '2024-11-12', 2, 5500.00), (18, 'Bin', 9, 'Lid Hinge Repair', '2024-12-14', '2024-12-15', 18, 1600.00), (19, 'Vehicle', 6, 'Hydraulic System', '2024-10-30', '2024-11-01', 13, 42000.00), (20, 'Bin', 1, 'Full Overhaul', '2024-12-16', '2024-12-17', 4, 5200.00);

-- View all areas
SELECT * FROM Areas;   
-- List all bins with their status and fill level
SELECT bin_id, bin_type, status, fill_level
FROM Bins; 

SELECT first_name, last_name, address
FROM Citizens  
WHERE area_id = 1;  

SELECT vehicle_number, type, fuel_type
FROM Vehicles
WHERE status = 'Active'
AND fuel_type = 'Diesel'; 

-- Complaints of specific types
SELECT complaint_id, type, status
FROM Complaints
WHERE type IN ('Missed Pickup', 'Overflow'); 
--  Employees hired between two dates
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '2022-01-01' AND '2022-12-31'; 

-- INNER JOIN
-- Shows only bins that are linked with an area
SELECT 
    b.bin_id,
    b.bin_type,
    b.status,
    a.area_name
FROM Bins b
INNER JOIN Areas a
ON b.area_id = a.area_id;
-- LEFT JOIN
SELECT 
    c.first_name,
    c.last_name,
    co.type AS complaint_type,
    co.status
FROM Citizens c
LEFT JOIN Complaints co
ON c.citizen_id = co.citizen_id;

-- RIGHT JOIN
-- Shows all employees, even if no complaint is assigned to them

SELECT 
    e.first_name,
    e.job_role,
    co.type AS complaint_type,
    co.status
FROM Complaints co
RIGHT JOIN Employees e
ON co.assigned_to = e.employee_id; 

-- Count total number of bins
SELECT COUNT(*) AS total_bins
FROM Bins;

--  Total waste collected per bin
SELECT bin_id, SUM(waste_weight) AS total_waste
FROM Collections
GROUP BY bin_id;

-- Average fill percentage of all sensors
SELECT AVG(fill_percentage) AS avg_fill
FROM Sensors;

-- Total maintenance cost for vehicles
SELECT SUM(cost) AS total_vehicle_maintenance_cost
FROM Maintenance
WHERE item_type = 'Vehicle'; 

--  Areas with population above 40,000
SELECT area_name, population
FROM Areas
WHERE population > 40000
ORDER BY population DESC;  

--  Number of routes per priority level
SELECT priority, COUNT(*) AS total_routes
FROM Routes
GROUP BY priority
ORDER BY total_routes DESC;
