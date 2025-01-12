CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contactNum VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact VARCHAR(50) NOT NULL,
    parentcontact VARCHAR(50) NOT NULL,
    studentid VARCHAR(50) NOT NULL,
    grade VARCHAR(50) NOT NULL
);

CREATE TABLE teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    schoolName VARCHAR(255) NOT NULL,
    contactNumber VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    state VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- Create school table
CREATE TABLE `school` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `code` varchar(50) NOT NULL,
    `name` varchar(255) NOT NULL,
    `state` varchar(100),
    `teacher_in_charge` varchar(255),
    `version_number` int(11) DEFAULT 1,
    `status` varchar(50) DEFAULT 'PENDING',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create version table
CREATE TABLE `version` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `school_id` int(11),
    `version_number` int(11) DEFAULT 1,
    `logo_file` varchar(255),
    `corner_file` varchar(255),
    `record_file` varchar(255),
    `upload_file` varchar(255),
    `recordio_file` varchar(255),
    `collab_file` varchar(255),
    `tech_file` varchar(255),
    `logo_verified` boolean DEFAULT FALSE,
    `corner_verified` boolean DEFAULT FALSE,
    `record_verified` boolean DEFAULT FALSE,
    `upload_verified` boolean DEFAULT FALSE,
    `recordio_verified` boolean DEFAULT FALSE,
    `collab_verified` boolean DEFAULT FALSE,
    `tech_verified` boolean DEFAULT FALSE,
    `status` varchar(50) DEFAULT 'PENDING',
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`school_id`) REFERENCES `school`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
