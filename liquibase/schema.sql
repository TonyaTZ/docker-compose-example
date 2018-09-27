-- MySQL dump 10.16  Distrib 10.2.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: adventureworks
-- ------------------------------------------------------
-- Server version	10.2.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `AddressLine1` varchar(60) NOT NULL,
  `AddressLine2` varchar(60) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `StateProvinceID` int(11) NOT NULL,
  `PostalCode` varchar(15) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=32522 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `addresstype`
--

DROP TABLE IF EXISTS `addresstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresstype` (
  `AddressTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AddressTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awbuildversion`
--

DROP TABLE IF EXISTS `awbuildversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awbuildversion` (
  `SystemInformationID` int(11) NOT NULL AUTO_INCREMENT,
  `Database Version` varchar(25) NOT NULL,
  `VersionDate` datetime NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SystemInformationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billofmaterials`
--

DROP TABLE IF EXISTS `billofmaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billofmaterials` (
  `BillOfMaterialsID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductAssemblyID` int(11) DEFAULT NULL,
  `ComponentID` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `UnitMeasureCode` varchar(3) NOT NULL,
  `BOMLevel` smallint(6) NOT NULL,
  `PerAssemblyQty` decimal(8,2) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`BillOfMaterialsID`)
) ENGINE=InnoDB AUTO_INCREMENT=3483 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `NameStyle` bit(1) NOT NULL,
  `Title` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `MiddleName` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `LastName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Suffix` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `EmailAddress` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `EmailPromotion` int(11) NOT NULL,
  `Phone` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `PasswordHash` varchar(40) CHARACTER SET latin1 NOT NULL,
  `PasswordSalt` varchar(10) CHARACTER SET latin1 NOT NULL,
  `AdditionalContactInfo` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB AUTO_INCREMENT=19978 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactcreditcard`
--

DROP TABLE IF EXISTS `contactcreditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactcreditcard` (
  `ContactID` int(11) NOT NULL,
  `CreditCardID` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ContactID`,`CreditCardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacttype`
--

DROP TABLE IF EXISTS `contacttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacttype` (
  `ContactTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ContactTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countryregion`
--

DROP TABLE IF EXISTS `countryregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countryregion` (
  `CountryRegionCode` varchar(3) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CountryRegionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countryregioncurrency`
--

DROP TABLE IF EXISTS `countryregioncurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countryregioncurrency` (
  `CountryRegionCode` varchar(3) CHARACTER SET latin1 NOT NULL,
  `CurrencyCode` varchar(3) CHARACTER SET latin1 NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CountryRegionCode`,`CurrencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard` (
  `CreditCardID` int(11) NOT NULL AUTO_INCREMENT,
  `CardType` varchar(50) NOT NULL,
  `CardNumber` varchar(25) NOT NULL,
  `ExpMonth` tinyint(4) NOT NULL,
  `ExpYear` smallint(6) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CreditCardID`)
) ENGINE=InnoDB AUTO_INCREMENT=19238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culture`
--

DROP TABLE IF EXISTS `culture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culture` (
  `CultureID` varchar(6) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CultureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `CurrencyCode` varchar(3) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CurrencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currencyrate`
--

DROP TABLE IF EXISTS `currencyrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencyrate` (
  `CurrencyRateID` int(11) NOT NULL AUTO_INCREMENT,
  `CurrencyRateDate` datetime NOT NULL,
  `FromCurrencyCode` varchar(3) NOT NULL,
  `ToCurrencyCode` varchar(3) NOT NULL,
  `AverageRate` double NOT NULL,
  `EndOfDayRate` double NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CurrencyRateID`)
) ENGINE=InnoDB AUTO_INCREMENT=13533 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `TerritoryID` int(11) DEFAULT NULL,
  `AccountNumber` varchar(10) NOT NULL,
  `CustomerType` varchar(1) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=29484 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customeraddress`
--

DROP TABLE IF EXISTS `customeraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customeraddress` (
  `CustomerID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `AddressTypeID` int(11) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerID`,`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `databaselog`
--

DROP TABLE IF EXISTS `databaselog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databaselog` (
  `DatabaseLogID` int(11) NOT NULL AUTO_INCREMENT,
  `PostTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DatabaseUser` varchar(128) NOT NULL,
  `Event` varchar(128) NOT NULL,
  `Schema` varchar(128) DEFAULT NULL,
  `Object` varchar(128) DEFAULT NULL,
  `TSQL` mediumtext NOT NULL,
  `XmlEvent` mediumtext NOT NULL,
  PRIMARY KEY (`DatabaseLogID`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `GroupName` varchar(50) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `DocumentID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `FileName` mediumtext NOT NULL,
  `FileExtension` varchar(8) NOT NULL,
  `Revision` varchar(5) NOT NULL,
  `ChangeNumber` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `DocumentSummary` mediumtext DEFAULT NULL,
  `Document` blob DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`DocumentID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `NationalIDNumber` varchar(15) NOT NULL,
  `ContactID` int(11) NOT NULL,
  `LoginID` varchar(256) NOT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `Title` varchar(50) NOT NULL,
  `BirthDate` datetime NOT NULL,
  `MaritalStatus` varchar(1) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `HireDate` datetime NOT NULL,
  `SalariedFlag` bit(1) NOT NULL,
  `VacationHours` smallint(6) NOT NULL,
  `SickLeaveHours` smallint(6) NOT NULL,
  `CurrentFlag` bit(1) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeeaddress`
--

DROP TABLE IF EXISTS `employeeaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeaddress` (
  `EmployeeID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EmployeeID`,`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeedepartmenthistory`
--

DROP TABLE IF EXISTS `employeedepartmenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeedepartmenthistory` (
  `EmployeeID` int(11) NOT NULL,
  `DepartmentID` smallint(6) NOT NULL,
  `ShiftID` tinyint(4) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EmployeeID`,`DepartmentID`,`ShiftID`,`StartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeepayhistory`
--

DROP TABLE IF EXISTS `employeepayhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeepayhistory` (
  `EmployeeID` int(11) NOT NULL,
  `RateChangeDate` datetime NOT NULL,
  `Rate` double NOT NULL,
  `PayFrequency` tinyint(4) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EmployeeID`,`RateChangeDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `errorlog`
--

DROP TABLE IF EXISTS `errorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `errorlog` (
  `ErrorLogID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserName` varchar(128) NOT NULL,
  `ErrorNumber` int(11) NOT NULL,
  `ErrorSeverity` int(11) DEFAULT NULL,
  `ErrorState` int(11) DEFAULT NULL,
  `ErrorProcedure` varchar(126) DEFAULT NULL,
  `ErrorLine` int(11) DEFAULT NULL,
  `ErrorMessage` mediumtext NOT NULL,
  PRIMARY KEY (`ErrorLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `illustration`
--

DROP TABLE IF EXISTS `illustration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illustration` (
  `IllustrationID` int(11) NOT NULL AUTO_INCREMENT,
  `Diagram` text DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IllustrationID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `individual` (
  `CustomerID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL,
  `Demographics` text CHARACTER SET latin1 DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobcandidate`
--

DROP TABLE IF EXISTS `jobcandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobcandidate` (
  `JobCandidateID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) DEFAULT NULL,
  `Resume` text DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`JobCandidateID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `CostRate` double NOT NULL,
  `Availability` decimal(8,2) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ProductNumber` varchar(25) NOT NULL,
  `MakeFlag` bit(1) NOT NULL,
  `FinishedGoodsFlag` bit(1) NOT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `SafetyStockLevel` smallint(6) NOT NULL,
  `ReorderPoint` smallint(6) NOT NULL,
  `StandardCost` double NOT NULL,
  `ListPrice` double NOT NULL,
  `Size` varchar(5) DEFAULT NULL,
  `SizeUnitMeasureCode` varchar(3) DEFAULT NULL,
  `WeightUnitMeasureCode` varchar(3) DEFAULT NULL,
  `Weight` decimal(8,2) DEFAULT NULL,
  `DaysToManufacture` int(11) NOT NULL,
  `ProductLine` varchar(2) DEFAULT NULL,
  `Class` varchar(2) DEFAULT NULL,
  `Style` varchar(2) DEFAULT NULL,
  `ProductSubcategoryID` int(11) DEFAULT NULL,
  `ProductModelID` int(11) DEFAULT NULL,
  `SellStartDate` datetime NOT NULL,
  `SellEndDate` datetime DEFAULT NULL,
  `DiscontinuedDate` datetime DEFAULT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcategory` (
  `ProductCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productcosthistory`
--

DROP TABLE IF EXISTS `productcosthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcosthistory` (
  `ProductID` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `StandardCost` double NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductID`,`StartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productdescription`
--

DROP TABLE IF EXISTS `productdescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productdescription` (
  `ProductDescriptionID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` mediumtext NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductDescriptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productdocument`
--

DROP TABLE IF EXISTS `productdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productdocument` (
  `ProductID` int(11) NOT NULL,
  `DocumentID` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductID`,`DocumentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productinventory`
--

DROP TABLE IF EXISTS `productinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productinventory` (
  `ProductID` int(11) NOT NULL,
  `LocationID` smallint(6) NOT NULL,
  `Shelf` varchar(10) NOT NULL,
  `Bin` tinyint(4) NOT NULL,
  `Quantity` smallint(6) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductID`,`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productlistpricehistory`
--

DROP TABLE IF EXISTS `productlistpricehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productlistpricehistory` (
  `ProductID` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `ListPrice` double NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductID`,`StartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productmodel`
--

DROP TABLE IF EXISTS `productmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productmodel` (
  `ProductModelID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `CatalogDescription` text DEFAULT NULL,
  `Instructions` text DEFAULT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productmodelillustration`
--

DROP TABLE IF EXISTS `productmodelillustration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productmodelillustration` (
  `ProductModelID` int(11) NOT NULL,
  `IllustrationID` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductModelID`,`IllustrationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productmodelproductdescriptionculture`
--

DROP TABLE IF EXISTS `productmodelproductdescriptionculture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productmodelproductdescriptionculture` (
  `ProductModelID` int(11) NOT NULL,
  `ProductDescriptionID` int(11) NOT NULL,
  `CultureID` varchar(6) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductModelID`,`ProductDescriptionID`,`CultureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productphoto`
--

DROP TABLE IF EXISTS `productphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productphoto` (
  `ProductPhotoID` int(11) NOT NULL AUTO_INCREMENT,
  `ThumbNailPhoto` blob DEFAULT NULL,
  `ThumbnailPhotoFileName` varchar(50) DEFAULT NULL,
  `LargePhoto` blob DEFAULT NULL,
  `LargePhotoFileName` varchar(50) DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductPhotoID`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productproductphoto`
--

DROP TABLE IF EXISTS `productproductphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productproductphoto` (
  `ProductID` int(11) NOT NULL,
  `ProductPhotoID` int(11) NOT NULL,
  `Primary` bit(1) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductID`,`ProductPhotoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productreview`
--

DROP TABLE IF EXISTS `productreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productreview` (
  `ProductReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `ReviewerName` varchar(50) DEFAULT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comments` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `Status` ENUM('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING',
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductReviewID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productsubcategory`
--

DROP TABLE IF EXISTS `productsubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productsubcategory` (
  `ProductSubcategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategoryID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductSubcategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productvendor`
--

DROP TABLE IF EXISTS `productvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productvendor` (
  `ProductID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `AverageLeadTime` int(11) NOT NULL,
  `StandardPrice` double NOT NULL,
  `LastReceiptCost` double DEFAULT NULL,
  `LastReceiptDate` datetime DEFAULT NULL,
  `MinOrderQty` int(11) DEFAULT NULL,
  `MaxOrderQty` int(11) NOT NULL,
  `OnOrderQty` int(11) DEFAULT NULL,
  `UnitMeasureCode` varchar(3) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProductID`,`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchaseorderdetail`
--

DROP TABLE IF EXISTS `purchaseorderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorderdetail` (
  `PurchaseOrderID` int(11) NOT NULL,
  `PurchaseOrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `DueDate` datetime NOT NULL,
  `OrderQty` smallint(6) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UnitPrice` double NOT NULL,
  `LineTotal` double NOT NULL,
  `ReceivedQty` decimal(8,2) NOT NULL,
  `RejectedQty` decimal(8,2) NOT NULL,
  `StockedQty` decimal(9,2) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PurchaseOrderDetailID`,`PurchaseOrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=8789 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchaseorderheader`
--

DROP TABLE IF EXISTS `purchaseorderheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorderheader` (
  `PurchaseOrderID` int(11) DEFAULT NULL,
  `RevisionNumber` tinyint(4) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `VendorID` int(11) DEFAULT NULL,
  `ShipMethodID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `ShipDate` datetime DEFAULT NULL,
  `SubTotal` double DEFAULT NULL,
  `TaxAmt` double DEFAULT NULL,
  `Freight` double DEFAULT NULL,
  `TotalDue` double DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesorderdetail`
--

DROP TABLE IF EXISTS `salesorderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorderdetail` (
  `SalesOrderID` int(11) NOT NULL,
  `SalesOrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `CarrierTrackingNumber` varchar(25) DEFAULT NULL,
  `OrderQty` smallint(6) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `SpecialOfferID` int(11) NOT NULL,
  `UnitPrice` double NOT NULL,
  `UnitPriceDiscount` double NOT NULL,
  `LineTotal` double NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesOrderDetailID`,`SalesOrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=121318 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesorderheader`
--

DROP TABLE IF EXISTS `salesorderheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorderheader` (
  `SalesOrderID` int(11) NOT NULL,
  `RevisionNumber` tinyint(4) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `DueDate` datetime NOT NULL,
  `ShipDate` datetime NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `OnlineOrderFlag` bit(1) NOT NULL,
  `SalesOrderNumber` varchar(25) NOT NULL,
  `PurchaseOrderNumber` varchar(25) DEFAULT NULL,
  `AccountNumber` varchar(15) DEFAULT NULL,
  `CustomerID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL,
  `SalesPersonID` int(11) DEFAULT NULL,
  `TerritoryID` int(11) DEFAULT NULL,
  `BillToAddressID` int(11) NOT NULL,
  `ShipToAddressID` int(11) NOT NULL,
  `ShipMethodID` int(11) NOT NULL,
  `CreditCardID` int(11) DEFAULT NULL,
  `CreditCardApprovalCode` varchar(15) DEFAULT NULL,
  `CurrencyRateID` int(11) DEFAULT NULL,
  `SubTotal` double NOT NULL,
  `TaxAmt` double NOT NULL,
  `Freight` double NOT NULL,
  `TotalDue` double NOT NULL,
  `Comment` varchar(128) DEFAULT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesorderheadersalesreason`
--

DROP TABLE IF EXISTS `salesorderheadersalesreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorderheadersalesreason` (
  `SalesOrderID` int(11) NOT NULL,
  `SalesReasonID` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesOrderID`,`SalesReasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesperson` (
  `SalesPersonID` int(11) NOT NULL,
  `TerritoryID` int(11) DEFAULT NULL,
  `SalesQuota` double DEFAULT NULL,
  `Bonus` double NOT NULL,
  `CommissionPct` double NOT NULL,
  `SalesYTD` double NOT NULL,
  `SalesLastYear` double NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salespersonquotahistory`
--

DROP TABLE IF EXISTS `salespersonquotahistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salespersonquotahistory` (
  `SalesPersonID` int(11) NOT NULL,
  `QuotaDate` datetime NOT NULL,
  `SalesQuota` double NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesPersonID`,`QuotaDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesreason`
--

DROP TABLE IF EXISTS `salesreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesreason` (
  `SalesReasonID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ReasonType` varchar(50) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesReasonID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salestaxrate`
--

DROP TABLE IF EXISTS `salestaxrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salestaxrate` (
  `SalesTaxRateID` int(11) NOT NULL AUTO_INCREMENT,
  `StateProvinceID` int(11) NOT NULL,
  `TaxType` tinyint(4) NOT NULL,
  `TaxRate` double NOT NULL,
  `Name` varchar(50) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesTaxRateID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesterritory`
--

DROP TABLE IF EXISTS `salesterritory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesterritory` (
  `TerritoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `CountryRegionCode` varchar(3) NOT NULL,
  `Group` varchar(50) NOT NULL,
  `SalesYTD` double NOT NULL,
  `SalesLastYear` double NOT NULL,
  `CostYTD` double NOT NULL,
  `CostLastYear` double NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TerritoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesterritoryhistory`
--

DROP TABLE IF EXISTS `salesterritoryhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesterritoryhistory` (
  `SalesPersonID` int(11) NOT NULL,
  `TerritoryID` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalesPersonID`,`TerritoryID`,`StartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scrapreason`
--

DROP TABLE IF EXISTS `scrapreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrapreason` (
  `ScrapReasonID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ScrapReasonID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `ShiftID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ShiftID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shipmethod`
--

DROP TABLE IF EXISTS `shipmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipmethod` (
  `ShipMethodID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ShipBase` double NOT NULL DEFAULT 0,
  `ShipRate` double NOT NULL DEFAULT 0,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ShipMethodID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shoppingcartitem`
--

DROP TABLE IF EXISTS `shoppingcartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcartitem` (
  `ShoppingCartItemID` int(11) NOT NULL AUTO_INCREMENT,
  `ShoppingCartID` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `ProductID` int(11) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ShoppingCartItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialoffer`
--

DROP TABLE IF EXISTS `specialoffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialoffer` (
  `SpecialOfferID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `DiscountPct` double NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `MinQty` int(11) NOT NULL DEFAULT 0,
  `MaxQty` int(11) DEFAULT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SpecialOfferID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialofferproduct`
--

DROP TABLE IF EXISTS `specialofferproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialofferproduct` (
  `SpecialOfferID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SpecialOfferID`,`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stateprovince`
--

DROP TABLE IF EXISTS `stateprovince`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stateprovince` (
  `StateProvinceID` int(11) NOT NULL AUTO_INCREMENT,
  `StateProvinceCode` varchar(3) NOT NULL,
  `CountryRegionCode` varchar(3) NOT NULL,
  `IsOnlyStateProvinceFlag` bit(1) NOT NULL DEFAULT b'1',
  `Name` varchar(50) NOT NULL,
  `TerritoryID` int(11) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StateProvinceID`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `SalesPersonID` int(11) DEFAULT NULL,
  `Demographics` text DEFAULT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storecontact`
--

DROP TABLE IF EXISTS `storecontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storecontact` (
  `CustomerID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL,
  `ContactTypeID` int(11) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerID`,`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactionhistory`
--

DROP TABLE IF EXISTS `transactionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactionhistory` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `ReferenceOrderID` int(11) NOT NULL,
  `ReferenceOrderLineID` int(11) NOT NULL DEFAULT 0,
  `TransactionDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `TransactionType` varchar(1) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ActualCost` double NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=213443 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactionhistoryarchive`
--

DROP TABLE IF EXISTS `transactionhistoryarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactionhistoryarchive` (
  `TransactionID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ReferenceOrderID` int(11) NOT NULL,
  `ReferenceOrderLineID` int(11) NOT NULL DEFAULT 0,
  `TransactionDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `TransactionType` varchar(1) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ActualCost` double NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unitmeasure`
--

DROP TABLE IF EXISTS `unitmeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitmeasure` (
  `UnitMeasureCode` varchar(3) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`UnitMeasureCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `VendorID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CreditRating` tinyint(4) NOT NULL,
  `PreferredVendorStatus` bit(1) NOT NULL DEFAULT b'1',
  `ActiveFlag` bit(1) NOT NULL DEFAULT b'1',
  `PurchasingWebServiceURL` mediumtext DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendoraddress`
--

DROP TABLE IF EXISTS `vendoraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendoraddress` (
  `VendorID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `AddressTypeID` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`VendorID`,`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendorcontact`
--

DROP TABLE IF EXISTS `vendorcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendorcontact` (
  `VendorID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL,
  `ContactTypeID` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`VendorID`,`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workorder`
--

DROP TABLE IF EXISTS `workorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workorder` (
  `WorkOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `OrderQty` int(11) NOT NULL,
  `StockedQty` int(11) NOT NULL,
  `ScrappedQty` smallint(6) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `DueDate` datetime NOT NULL,
  `ScrapReasonID` smallint(6) DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`WorkOrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=72592 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workorderrouting`
--

DROP TABLE IF EXISTS `workorderrouting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workorderrouting` (
  `WorkOrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `OperationSequence` smallint(6) NOT NULL,
  `LocationID` smallint(6) NOT NULL,
  `ScheduledStartDate` datetime NOT NULL,
  `ScheduledEndDate` datetime NOT NULL,
  `ActualStartDate` datetime DEFAULT NULL,
  `ActualEndDate` datetime DEFAULT NULL,
  `ActualResourceHrs` decimal(9,4) DEFAULT NULL,
  `PlannedCost` double NOT NULL,
  `ActualCost` double DEFAULT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`WorkOrderID`,`ProductID`,`OperationSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-27 16:11:39
