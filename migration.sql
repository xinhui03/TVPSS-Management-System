-- Migration for Student Table
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact VARCHAR(255) NOT NULL,
    parentcontact VARCHAR(255) NOT NULL,
    grade VARCHAR(255) NOT NULL
);

-- Migration for CrewApplication Table
CREATE TABLE crew_application (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    ic_number VARCHAR(255) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    matric_number VARCHAR(255) NOT NULL,
    school VARCHAR(255) NOT NULL,
    phone_no VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    youtube_link VARCHAR(255),
    application_reason TEXT NOT NULL,
    is_approved BOOLEAN DEFAULT FALSE,
    is_rejected BOOLEAN DEFAULT FALSE
);

INSERT INTO crew_application (
    student_name, ic_number, gender, matric_number, school, phone_no, email, youtube_link, application_reason, is_approved, is_rejected
) VALUES
('Ali Bin Ahmad', '910202-08-5678', 'Male', 'A20EC1234', 'School of Computing', '0123456789', 'ali.ahmad@example.com', 'https://youtube.com/shorts/xyz1', 'I am passionate about contributing to the team and learning new skills.', TRUE, FALSE),
('Fatimah Binti Hassan', '990505-10-1234', 'Female', 'A20EC5678', 'School of Business', '0198765432', 'fatimah.hassan@example.com', NULL, 'I want to gain experience in event management and teamwork.', FALSE, TRUE),
('John Doe', '880303-07-9876', 'Male', 'A20EC3456', 'School of Engineering', '0187654321', 'john.doe@example.com', 'https://youtube.com/shorts/abc2', 'I have previous experience in organizing events and want to utilize my skills.', FALSE, FALSE),
('Nurul Ain', '000707-05-4321', 'Female', 'A20EC7890', 'School of Architecture', '0134567890', 'nurul.ain@example.com', NULL, 'I am enthusiastic about being part of a creative team.', TRUE, FALSE),
('Ahmad Zamri', '920101-09-1122', 'Male', 'A20EC1011', 'School of Multimedia', '0145678901', 'ahmad.zamri@example.com', 'https://youtube.com/shorts/def3', 'I believe this opportunity will help me grow personally and professionally.', FALSE, FALSE);


CREATE TABLE teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    schoolName VARCHAR(255) NOT NULL,
    contactNumber VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);