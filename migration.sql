-- Migration for Student Table
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact VARCHAR(255) NOT NULL,
    parentcontact VARCHAR(255) NOT NULL,
    studentid VARCHAR(255) NOT NULL,
    grade VARCHAR(255) NOT NULL
);

-- Migration for CrewApplication Table
CREATE TABLE crew_application (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    student_id INT NOT NULL,
    ic_number VARCHAR(255) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    matric_number VARCHAR(255) NOT NULL,
    school VARCHAR(255) NOT NULL,
    phone_no VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    youtube_link VARCHAR(255),
    application_reason TEXT NOT NULL,
    isApproved BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE
);

CREATE TABLE teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    schoolName VARCHAR(255) NOT NULL,
    contactNumber VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);