/*Removes database if already there and creates fresh copy*/
DROP DATABASE IF EXISTS `arduino-site-users`;
CREATE DATABASE `arduino-site-users`;
USE `arduino-site-users`;

/*Creates the main module table*/
CREATE TABLE IF NOT EXISTS `module` (
  `mod_modulegroupcode` varchar(25) NOT NULL,
  `mod_modulegroupname` varchar(50) NOT NULL,
  `mod_modulecode` varchar(25) NOT NULL,
  `mod_modulename` varchar(50) NOT NULL,
  `mod_modulegrouporder` int(3) NOT NULL,
  `mod_moduleorder` int(3) NOT NULL,
  `mod_modulepagename` varchar(255) NOT NULL,
  PRIMARY KEY (`mod_modulegroupcode`,`mod_modulecode`),
  UNIQUE(`mod_modulecode`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Creates the user roles table*/
CREATE TABLE IF NOT EXISTS `role` (
  `role_rolecode` varchar(50) NOT NULL,
  `role_rolename` varchar(50) NOT NULL,
  PRIMARY KEY (`role_rolecode`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Creates the users permissions table*/
CREATE TABLE IF NOT EXISTS role_rights (
	rr_rolecode varchar(50) NOT NULL,
	rr_modulecode varchar(25) NOT NULL,
	rr_create varchar(25) NOT NULL,
	rr_edit varchar(25) NOT NULL,
	rr_delete varchar(25) NOT NULL,
	rr_view varchar(25) NOT NULL,
	FOREIGN KEY (rr_rolecode) REFERENCES role (role_rolecode) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (rr_modulecode) REFERENCES module (mod_modulecode) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8;


/*Creates the main users table*/
CREATE TABLE IF NOT EXISTS `system_users` (
  `u_userid` int(11) AUTO_INCREMENT  NOT NULL,
  `u_username` varchar(100) NOT NULL,
  `u_password` varchar(255) NOT NULL,
  `u_rolecode` varchar(50) NOT NULL,
  PRIMARY KEY (`u_userid`),
  FOREIGN KEY (`u_rolecode`) REFERENCES `role` (`role_rolecode`)  ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8;


/*Populating the Roles*/
INSERT INTO `role` (`role_rolecode`, `role_rolename`) VALUES
('ADMIN', 'Administrator'),
('VALVEADMIN', 'Valve Admin'),
('VALVETESTER', 'Valve Tester'),
('GUEST', 'Guest');

/*Creates user accounts for testing*/
INSERT INTO `system_users` (`u_username`, `u_password`, `u_rolecode`) VALUES
('carlwilding', '123456', 'ADMIN'),
('zlatan', 'ibrahimovic', 'VALVEADMIN'),
('romelu', 'lukaku', 'VALVETESTER'),
('guest', 'guest', 'GUEST');

/*Populating the module table with data to organise on the website etc*/
INSERT INTO module (mod_modulegroupcode, mod_modulegroupname, mod_modulecode, mod_modulename, mod_modulegrouporder, mod_moduleorder, mod_modulepagename) VALUES 
("VALVES","Valves", "VALVESTATUS","Valve Status", 2, 1,'valve_status.php'),
("VALVES","Valves", "VALVETEST","Valve Testing", 2, 2,'valve_test.php'),
("VALVES","Valves", "TESTRESULTS","Valve Test Results", 2, 3,'test_results.php'),
("OTHER","Other","ABOUT","About", 3, 3,'about.php');




INSERT INTO `role_rights` (`rr_rolecode`, `rr_modulecode`, `rr_create`, `rr_edit`, `rr_delete`, `rr_view`) VALUES
('ADMIN', 'VALVESTATUS', 'yes', 'yes', 'yes', 'yes'),
('ADMIN', 'VALVETEST', 'yes', 'yes', 'yes', 'yes'),
('ADMIN', 'TESTRESULTS', 'yes', 'yes', 'yes', 'yes'),
('ADMIN', 'ABOUT', 'yes', 'yes', 'yes', 'yes'),


('VALVEADMIN', 'VALVESTATUS', 'yes', 'yes', 'yes', 'yes'),
('VALVEADMIN', 'VALVETEST', 'no', 'no', 'no', 'yes'),
('VALVEADMIN', 'TESTRESULTS', 'no', 'no', 'no', 'no'),
('VALVEADMIN', 'ABOUT', 'no', 'no', 'no', 'yes'),


('VALVETESTER', 'VALVESTATUS', 'no', 'no', 'no', 'yes'),
('VALVETESTER', 'VALVETEST', 'yes', 'yes', 'yes', 'yes'),
('VALVETESTER', 'TESTRESULTS', 'no', 'no', 'no', 'yes'),
('VALVETESTER', 'ABOUT', 'no', 'no', 'no', 'yes'),


('GUEST', 'VALVESTATUS', 'no', 'no', 'no', 'yes'),
('GUEST', 'VALVETEST', 'no', 'no', 'no', 'no'),
('GUEST', 'TESTRESULTS', 'no', 'no', 'no', 'no'),
('GUEST', 'ABOUT', 'no', 'no', 'no', 'yes');
