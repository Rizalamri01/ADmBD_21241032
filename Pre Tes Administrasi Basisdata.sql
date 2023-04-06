CREATE TABLE `productlines` (
  `Productline` int PRIMARY KEY,
  `textDecription` varchar(255),
  `htmlDecription` varchar(255),
  `image` image
);

CREATE TABLE `employees` (
  `employeesNumber` int PRIMARY KEY,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `ektension` bool,
  `email` varchar(255),
  `officeCode` int,
  `reportTo` varchar(255),
  `jobTitle` varchar(255)
);

CREATE TABLE `product` (
  `productCode` int PRIMARY KEY,
  `productName` varchar(255),
  `productLine` varchar(255),
  `productScale` varchar(255),
  `productVendor` varchar(255),
  `productDecription` text,
  `QuantityInStock` varchar(255),
  `buyPrice` varchar(255),
  `MSRP` varchar(255)
);

CREATE TABLE `offices` (
  `officeCode` int PRIMARY KEY,
  `city` varchar(255),
  `phone` int,
  `addressLine` text,
  `addressLine2` text,
  `state` varchar(255),
  `country` varchar(255),
  `postalcode` int,
  `territory` varchar(255)
);

CREATE TABLE `customers` (
  `CustomerNumber` int PRIMARY KEY,
  `customerName` char,
  `contactLastName` char,
  `contactFirstName` char,
  `phone` int,
  `addressLine1` text,
  `addressLine2` text,
  `city` varchar(255),
  `state` varchar(255),
  `postalCode` int,
  `country` varchar(255),
  `salesRepEmployeeNumber` int,
  `creditLimit` int
);

CREATE TABLE `orderDetails` (
  `orderNumber` int PRIMARY KEY,
  `productCode` int,
  `quantityOrdered` varchar(255),
  `priceEach` int,
  `orderLineNumber` int
);

CREATE TABLE `order` (
  `orderNumber` int PRIMARY KEY,
  `orderDate` date,
  `requiredDate` date,
  `shippedDate` date,
  `status` varchar(255),
  `comment` text,
  `customerNumber` int
);

CREATE TABLE `payment` (
  `customerName` int PRIMARY KEY,
  `checkNumber` int,
  `PaymentDate` datetime,
  `amount` varchar(255)
);

ALTER TABLE `product` ADD FOREIGN KEY (`productLine`) REFERENCES `productlines` (`Productline`);

ALTER TABLE `customers` ADD FOREIGN KEY (`CustomerNumber`) REFERENCES `employees` (`jobTitle`);

ALTER TABLE `orderDetails` ADD FOREIGN KEY (`quantityOrdered`) REFERENCES `product` (`productLine`);

ALTER TABLE `order` ADD FOREIGN KEY (`status`) REFERENCES `customers` (`customerName`);

ALTER TABLE `payment` ADD FOREIGN KEY (`customerName`) REFERENCES `customers` (`postalCode`);

ALTER TABLE `orderDetails` ADD FOREIGN KEY (`orderLineNumber`) REFERENCES `order` (`orderNumber`);

ALTER TABLE `employees` ADD FOREIGN KEY (`firstName`) REFERENCES `offices` (`addressLine`);

ALTER TABLE `employees` ADD FOREIGN KEY (`employeesNumber`) REFERENCES `employees` (`reportTo`);
