CREATE DATABASE ClinicDB;
USE ClinicDB;

CREATE TABLE Doctor (
    doctorID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    ContactInfo VARCHAR(355) NOT NULL UNIQUE,
    Speciality VARCHAR(30) NOT NULL
);

CREATE TABLE Patients (
    patientID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    DOB DATE NOT NULL,
    ContactInfo VARCHAR(355) NOT NULL UNIQUE,
    medicalHistory TEXT
);

CREATE TABLE Appointments (
    apptID INT PRIMARY KEY AUTO_INCREMENT,
    patientID INT NOT NULL,
    doctorID INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Canceled') DEFAULT 'Scheduled',
    FOREIGN KEY (patientID) REFERENCES Patients(patientID) ON DELETE CASCADE,
    FOREIGN KEY (doctorID) REFERENCES Doctor(doctorID) ON DELETE CASCADE
);

CREATE TABLE Billing (
    billingID INT PRIMARY KEY AUTO_INCREMENT,
    patientID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    payMethod VARCHAR(30) NOT NULL,
    status ENUM('Paid', 'Pending', 'Overdue') DEFAULT 'Pending',
    insurance VARCHAR(30),
    FOREIGN KEY (patientID) REFERENCES Patients(patientID) ON DELETE CASCADE
);

CREATE TABLE MedicalRecords (
    mdrID INT PRIMARY KEY AUTO_INCREMENT,
    patientID INT NOT NULL,
    doctorID INT NOT NULL,
    diagnosis VARCHAR(255) NOT NULL,
    treatment TEXT NOT NULL,
    prescription TEXT,
    FOREIGN KEY (patientID) REFERENCES Patients(patientID) ON DELETE CASCADE,
    FOREIGN KEY (doctorID) REFERENCES Doctor(doctorID) ON DELETE CASCADE
);