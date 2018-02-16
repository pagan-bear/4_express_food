-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 16, 2018 at 08:39 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `express_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccessControl`
--

CREATE TABLE `AccessControl` (
  `accessControlID` smallint(5) UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Will be hashed out for production release',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateOfBirth` date NOT NULL,
  `userType` enum('customer','employee','chef','courier','ecommGateway') COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultPhone` char(14) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Format: ''(nnn) nnn-nnnn''',
  `altPhone` char(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAvailable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AccessControl`
--

INSERT INTO `AccessControl` (`accessControlID`, `username`, `password`, `email`, `dateOfBirth`, `userType`, `defaultPhone`, `altPhone`, `isAvailable`) VALUES
(1, 'jwilliams', '########', 'j.williams@email.com', '1973-08-21', 'customer', '(646) 123 4567', '', 0),
(2, 'dwilliams', '########', 'd_williams@email.com', '1971-12-22', 'customer', '(646) 123 4567', '(349) 777 7798', 0),
(3, 'ld_devlin', '########', 'ld_devlin@email.com', '1985-05-26', 'courier', '(212) 667 1234', '(646) 883 1234', 0),
(4, 'jddoe', '########', 'j.d.doe@email.com', '1964-01-27', 'chef', '(212) 325 1987', '(718) 333 5544', 0),
(5, 'ld_devlin', '########', 'ld_devline@email.com', '1985-05-26', 'customer', '(212) 667 1234', '(646) 883 1234', 0),
(6, 'jkingjr', '########', 'jking@email.com', '2001-03-17', 'employee', '(212) 708 6372', '(646) 332 1010', 0),
(7, 'foodie', '########', 'food_lover@email.com', '1975-08-21', 'customer', '(718) 440 1212', '', 0),
(8, 'snackattack', '########', 'snack.attack@email.com', '1998-02-12', 'courier', '(646) 387 2956', '(212) 557 6352', 1),
(9, 'jblundel', '########', 'jblundel@email.com', '1952-12-25', 'customer', '(212) 325 9999', '', 0),
(10, 'lady_gaga', '########', 'lady_gaga@email.com', '1978-04-21', 'courier', '(718) 332 8984', '(646) 8734522', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `addressesID` smallint(5) UNSIGNED NOT NULL,
  `userID` smallint(5) UNSIGNED NOT NULL,
  `streetAddress` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipCode` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDefaultAddress` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`addressesID`, `userID`, `streetAddress`, `zipCode`, `city`, `state`, `isDefaultAddress`) VALUES
(1, 1, '555 EAST SYCAMORE STREET', '10133-3498', 'NEW YORK', 'NY', 1),
(2, 2, '555 EAST SYCAMORE STREET', '10133-3498', 'NEW YORK', 'NY', 1),
(3, 3, '123 EAST STREET', '10003-4983', 'NEW YORK', 'NY', 1),
(4, 4, '234 WEST ASH STREET #3C', '10203-4983', 'NEW YORK', 'NY', 1),
(5, 5, '555 EAST SYCAMORE STREET', '10133-3498', 'NEW YORK', 'NY', 1),
(6, 6, '123 EAST STREET', '10003-4983', 'NEW YORK', 'NY', 1),
(7, 7, '234 WEST ASH STREET #3C', '10203-4983', 'NEW YORK', 'NY', 1),
(8, 8, '555 EAST SYCAMORE STREET', '10133-3498', 'NEW YORK', 'NY', 1),
(9, 9, '234 WEST ASH STREET #3C', '10203-4983', 'NEW YORK', 'NY', 1),
(10, 10, '555 EAST SYCAMORE STREET', '10133-3498', 'NEW YORK', 'NY', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Basket`
--

CREATE TABLE `Basket` (
  `orderID` smallint(5) UNSIGNED NOT NULL,
  `itemID` smallint(5) UNSIGNED NOT NULL,
  `quantity` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Basket`
--

INSERT INTO `Basket` (`orderID`, `itemID`, `quantity`) VALUES
(1, 1, 2),
(1, 2, 3),
(1, 8, 3),
(1, 10, 2),
(2, 1, 3),
(2, 2, 2),
(2, 8, 2),
(2, 10, 3),
(6, 3, 3),
(6, 4, 3),
(6, 7, 3),
(7, 9, 3),
(8, 2, 7),
(8, 5, 3),
(8, 6, 5),
(8, 10, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `courier_deliveries`
-- (See below for the actual view)
--
CREATE TABLE `courier_deliveries` (
`COURIER` varchar(20)
,`QTY` tinyint(4) unsigned
,`DISH` varchar(60)
,`PRICE` decimal(4,2)
,`TOTAL` decimal(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `courier_details`
-- (See below for the actual view)
--
CREATE TABLE `courier_details` (
`FIRSTNAME` varchar(20)
,`LASTNAME` varchar(40)
,`USERNAME` varchar(20)
,`EMAIL` varchar(40)
,`USERTYPE` enum('customer','employee','chef','courier','ecommGateway')
);

-- --------------------------------------------------------

--
-- Table structure for table `Dishes`
--

CREATE TABLE `Dishes` (
  `dishID` smallint(5) UNSIGNED NOT NULL COMMENT 'Max 65535 rows',
  `dish` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('ENTREE','DESSERT','','') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Dishes`
--

INSERT INTO `Dishes` (`dishID`, `dish`, `description`, `category`) VALUES
(1, 'Beef Stroganoff with Egg Noodles', 'A Russian dish of sautéed pieces of beef served in a sauce with smetana (sour cream). Served on a bed of thick, egg noodles.', 'ENTREE'),
(2, 'Beef Bourguignon', 'A stew prepared with beef braised in red wine, (Burgundy), and beef broth, flavoured with garlic, onions and a bouquet garni, with pearl onions and mushrooms added towards the end of cooking.', 'ENTREE'),
(3, 'Pie Floater', 'A pie floater consists of a traditional Australian-style meat pie, usually sitting in a bowl of thick pea soup made from blue boiler peas.', 'ENTREE'),
(4, 'Beef Wellington', 'A whole tenderloin wrapped in puff pastry, baked, and then sliced for eating! Served with steamed, seasonal vegetables.', 'ENTREE'),
(5, 'Ratatouille Nicoise', 'Sautéed garlic, onions, zucchini, eggplant, bell peppers cooked in a roast tomato base spiced with marjoram, fennel and basil. Served with steamed baby potatoes.', 'ENTREE'),
(6, 'Jambalaya', 'A Cajun dish comprised of andouille, pork, chicken, crawfish, and rice. seasoned with onion, celery, and green bell pepper.', ''),
(7, 'Pavlova', 'An Australian meringue dessert with a crisp crust and soft, marshmallowy inside, topped with fresh seasonal fruit and whipped cream.', 'DESSERT'),
(8, 'Brandy Snaps', 'A crisp shell made from golden syrup, flour, ginger, cream, sugar, butter and lemon juice piped full of whipped cream.', 'DESSERT'),
(9, 'Steamed Chocolate Pudding', 'Comprised of flour,  sugar, whole eggs, vanilla extract, and cocoa powder or chocolate, mixed together to make a batter and steamed over boiling water. Served with a thick creamy custard and whipped cream.', 'DESSERT'),
(10, 'Spotted Dick', 'A flat sheet of suet pastry sprinkled with dried fruits, which is then rolled up into a circular pudding. Steamed to perfection and served with our thick, creamy custard.', 'DESSERT');

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `itemID` smallint(5) UNSIGNED NOT NULL COMMENT 'Up to 65535 rows of data',
  `dishID` smallint(5) UNSIGNED NOT NULL,
  `datetime` date NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `availStock` tinyint(3) UNSIGNED NOT NULL COMMENT 'Up to 255 of each item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`itemID`, `dishID`, `datetime`, `price`, `availStock`) VALUES
(1, 1, '2018-02-01', '10.00', 20),
(2, 3, '2018-02-01', '8.50', 12),
(3, 2, '2018-02-02', '12.95', 7),
(4, 6, '2018-02-02', '11.50', 12),
(5, 1, '2018-02-05', '10.75', 23),
(6, 6, '2018-02-05', '11.50', 14),
(7, 7, '2018-02-01', '6.95', 3),
(8, 9, '2018-02-01', '6.95', 11),
(9, 8, '2018-02-02', '5.25', 15),
(10, 10, '2018-02-02', '5.50', 12),
(11, 9, '2018-02-05', '6.95', 7),
(12, 8, '2018-02-05', '5.25', 12);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `orderID` smallint(5) UNSIGNED NOT NULL,
  `customerID` smallint(5) UNSIGNED NOT NULL,
  `courierID` smallint(5) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`orderID`, `customerID`, `courierID`, `timestamp`) VALUES
(1, 1, 3, '2018-02-01 00:00:00'),
(2, 4, 8, '2018-02-01 00:00:00'),
(3, 1, 3, '2018-02-01 00:00:00'),
(4, 4, 8, '2018-02-01 00:00:00'),
(5, 5, 10, '2018-02-01 00:00:00'),
(6, 2, 10, '2018-02-02 00:00:00'),
(7, 6, 10, '2018-02-02 00:00:00'),
(8, 7, 8, '2018-02-03 00:00:00'),
(9, 9, 8, '2018-02-03 00:00:00'),
(10, 2, 10, '2018-02-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `OrderStatus`
--

CREATE TABLE `OrderStatus` (
  `orderStatusID` smallint(5) UNSIGNED NOT NULL,
  `orderID` smallint(5) UNSIGNED NOT NULL,
  `status` enum('TX OK','TX FAIL','TX CONFIRM','PREPARING','READY','EN ROUTE','DELIVERED','CANCELED','RETURNED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `OrderStatus`
--

INSERT INTO `OrderStatus` (`orderStatusID`, `orderID`, `status`, `timestamp`) VALUES
(1, 1, 'DELIVERED', '2018-02-01 19:23:55'),
(2, 2, 'CANCELED', '2018-02-01 19:32:59'),
(3, 3, 'DELIVERED', '2018-02-01 20:12:12'),
(4, 4, 'DELIVERED', '2018-02-01 21:32:14'),
(5, 5, 'RETURNED', '2018-02-01 22:02:15'),
(6, 6, 'DELIVERED', '2018-02-02 19:03:17'),
(7, 7, 'DELIVERED', '2018-02-02 19:21:37'),
(8, 8, 'EN ROUTE', '2018-02-03 12:52:18'),
(9, 9, 'READY', '2018-02-03 12:55:17'),
(10, 10, 'TX CONFIRM', '2018-02-03 13:01:06'),
(11, 10, 'DELIVERED', '2018-02-03 13:15:17');

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_summary`
-- (See below for the actual view)
--
CREATE TABLE `order_summary` (
`FIRSTNAME` varchar(20)
,`LASTNAME` varchar(40)
,`TIMESTAMP` datetime
,`ORDERID` smallint(5) unsigned
,`QUANTITY` tinyint(4) unsigned
,`DISH` varchar(60)
,`UNIT_PRICE` decimal(4,2)
,`TOTAL` decimal(8,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userID` smallint(5) UNSIGNED NOT NULL,
  `accessControlID` smallint(5) UNSIGNED NOT NULL,
  `firstName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middleName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generation` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `accessControlID`, `firstName`, `middleName`, `lastName`, `generation`) VALUES
(1, 1, 'Joan', 'V', 'Williams', ''),
(2, 2, 'Dave', 'X', 'Williams', 'III'),
(3, 3, 'Louis', 'D', 'Devlin', ''),
(4, 4, 'Jonathan', 'P', 'Doe', ''),
(5, 5, 'Leighton', 'Davenish', 'Devine', 'II'),
(6, 6, 'Johnathon', '', 'King', 'Jr'),
(7, 7, 'Francine', 'Eloisa', 'Fishpaw', ''),
(8, 8, 'Monica', '', 'Geller', ''),
(9, 9, 'James', 'T', 'Blundel', ''),
(10, 10, 'Lady', '', 'Gaga', '');

-- --------------------------------------------------------

--
-- Structure for view `courier_deliveries`
--
DROP TABLE IF EXISTS `courier_deliveries`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `courier_deliveries`  AS  select `U`.`firstName` AS `COURIER`,`B`.`quantity` AS `QTY`,`D`.`dish` AS `DISH`,`I`.`price` AS `PRICE`,(`B`.`quantity` * `I`.`price`) AS `TOTAL` from ((((`users` `U` join `orders` `O` on((`U`.`userID` = `O`.`courierID`))) join `basket` `B` on((`O`.`orderID` = `B`.`orderID`))) join `items` `I` on((`I`.`itemID` = `B`.`itemID`))) join `dishes` `D` on((`D`.`dishID` = `I`.`dishID`))) group by `O`.`courierID`,`I`.`dishID` ;

-- --------------------------------------------------------

--
-- Structure for view `courier_details`
--
DROP TABLE IF EXISTS `courier_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `courier_details`  AS  select `US`.`firstName` AS `FIRSTNAME`,`US`.`lastName` AS `LASTNAME`,`AC`.`username` AS `USERNAME`,`AC`.`email` AS `EMAIL`,`AC`.`userType` AS `USERTYPE` from (`users` `US` join `accesscontrol` `AC` on((`US`.`accessControlID` = `AC`.`accessControlID`))) where (`AC`.`userType` = 'COURIER') order by `US`.`lastName` ;

-- --------------------------------------------------------

--
-- Structure for view `order_summary`
--
DROP TABLE IF EXISTS `order_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_summary`  AS  select `U`.`firstName` AS `FIRSTNAME`,`U`.`lastName` AS `LASTNAME`,`O`.`timestamp` AS `TIMESTAMP`,`O`.`orderID` AS `ORDERID`,`B`.`quantity` AS `QUANTITY`,`D`.`dish` AS `DISH`,`I`.`price` AS `UNIT_PRICE`,(`B`.`quantity` * `I`.`price`) AS `TOTAL` from ((((`users` `U` join `orders` `O` on((`O`.`customerID` = `U`.`userID`))) join `basket` `B` on((`B`.`orderID` = `O`.`orderID`))) join `items` `I` on((`I`.`itemID` = `B`.`itemID`))) join `dishes` `D` on((`D`.`dishID` = `I`.`dishID`))) order by `O`.`orderID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AccessControl`
--
ALTER TABLE `AccessControl`
  ADD PRIMARY KEY (`accessControlID`);

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`addressesID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Basket`
--
ALTER TABLE `Basket`
  ADD KEY `orderID` (`orderID`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `Dishes`
--
ALTER TABLE `Dishes`
  ADD PRIMARY KEY (`dishID`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `dishID` (`dishID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`orderID`) USING BTREE,
  ADD KEY `courierID` (`courierID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `OrderStatus`
--
ALTER TABLE `OrderStatus`
  ADD PRIMARY KEY (`orderStatusID`),
  ADD KEY `orderID` (`orderID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `accessControlID` (`accessControlID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AccessControl`
--
ALTER TABLE `AccessControl`
  MODIFY `accessControlID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `addressesID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Dishes`
--
ALTER TABLE `Dishes`
  MODIFY `dishID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Max 65535 rows', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `itemID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Up to 65535 rows of data', AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `orderID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `OrderStatus`
--
ALTER TABLE `OrderStatus`
  MODIFY `orderStatusID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `Basket`
--
ALTER TABLE `Basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `Items` (`itemID`);

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`dishID`) REFERENCES `Dishes` (`dishID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`courierID`) REFERENCES `Users` (`userID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `OrderStatus`
--
ALTER TABLE `OrderStatus`
  ADD CONSTRAINT `orderstatus_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`accessControlID`) REFERENCES `AccessControl` (`accessControlID`);
