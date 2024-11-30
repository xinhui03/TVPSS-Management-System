DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aemail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@wpdc.com', '123');

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appoid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  PRIMARY KEY (`appoid`),
  KEY `pid` (`pid`),
  KEY `scheduleid` (`scheduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(1, 1, 1, 1, '2024-06-25'),
(2, 2, 2, 2, '2024-06-25');

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL,
  PRIMARY KEY (`docid`),
  KEY `specialties` (`specialties`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `doctor` (`docid`, `docemail`, `docname`, `docpassword`, `docnic`, `doctel`, `specialties`) VALUES
(1, 'doctor01@wpdc.com', 'Dr One', '123', '950102011234', '0111111111', 1),
(2, 'doctor02@wpdc.com', 'Dr Two', '123', '9850102011234', '0122222222', 2),
(3, 'doctor03@wpdc.com', 'Dr Three', '123', '9650102011234', '0133333333', 3),
(4, 'doctor04@wpdc.com', 'Dr Four', '123', '9750102011234', '0144444444', 4),
(5, 'doctor05@wpdc.com', 'Dr Five', '123', '9850102011234', '0155555555', 5),
(6, 'doctor06@wpdc.com', 'Dr Six', '123', '0050102011234', '0166666666', 6);

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(1, 'yuting@gmail.com', 'Wang Yu Ting', '123', '123,Skudai', '0110000000', '2002-06-03', '0130000000'),
(2, 'xinhui@gmail.com', 'Lee Xin Hui', '123', '123,Skudai', '0120000000', '2003-11-13', '0140000000'),
(3, 'zhiyong@gmail.com', 'Teoh Zhi Yong', '123', '123,Skudai', '0130000000', '2001-12-12', '0150000000'),
(4, 'elvis@gmail.com', 'Elvis Chang Feng Jie', '123', '123,Skudai', '0140000000', '2000-07-23', '0160000000');

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL,
  PRIMARY KEY (`scheduleid`),
  KEY `docid` (`docid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(1, '1', 'Invisalign', '2024-06-25', '11:00:00', 2),
(2, '2', 'Invisalign', '2024-06-25', '15:00:00', 1),
(3, '3', 'Extraction', '2024-06-26', '09:30:00', 1),
(4, '4', 'Extraction', '2024-06-27', '10:30:00', 2),
(5, '5', 'Whitening', '2024-06-27', '11:30:00', 3),
(6, '6', 'Scaling & Polishing', '2024-06-28', '09:00:00', 1),
(7, '1', 'Denture', '2024-06-29', '10:30:00', 2),
(8, '2', 'Root Canal Treatment', '2024-06-30', '13:00:00', 1);

DROP TABLE IF EXISTS `specialties`;
CREATE TABLE IF NOT EXISTS `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `specialties` (`id`, `sname`) VALUES
(1, 'Invisalign'),
(2, 'Dental Implant'),
(3, 'Extraction'),
(4, 'Restoration'),
(5, 'Orthodontic (Self-Ligating)'),
(6, 'Composite Veneers'),
(7, 'Whitening'),
(8, 'Scaling & Polishing'),
(9, 'Minor Oral Surgery'),
(10, 'Porcelain Veneers'),
(11, 'Denture'),
(12, 'Dental Crown/Bridge'),
(13, 'Dental Radiographic Imaging'),
(14, 'Root Canal Treatment');

DROP TABLE IF EXISTS `webuser`;
CREATE TABLE IF NOT EXISTS `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@wpdc.com', 'a'),
('doctor01@wpdc.com', 'd'),
('doctor02@wpdc.com', 'd'),
('doctor03@wpdc.com', 'd'),
('doctor04@wpdc.com', 'd'),
('doctor05@wpdc.com', 'd'),
('doctor06@wpdc.com', 'd'),
('yuting@gmail.com', 'p'),
('xinhui@gmail.com', 'p'),
('zhiyong@gmail.com', 'p'),
('elvis@gmail.com', 'p');
