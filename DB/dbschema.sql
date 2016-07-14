-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2016 at 03:27 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `thecseai_hypermedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistance`
--

CREATE TABLE `assistance` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assistance`
--

INSERT INTO `assistance` (`id`, `name`, `description`, `type_id`) VALUES
  (1, 'iOS configuration', 'The best assistance in the world', 1),
  (2, 'Refund', 'The best assistance in the world', 2),
  (3, 'Device specific support', 'The best assistance in the world', 3),
  (4, 'Unsubscribe', 'The best assistance in the world', 4);

-- --------------------------------------------------------

--
-- Table structure for table `assistance_types`
--

CREATE TABLE `assistance_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assistance_types`
--

INSERT INTO `assistance_types` (`id`, `name`) VALUES
  (1, 'Configurations'),
  (2, 'Monitoring costs and payments'),
  (3, 'Technical support'),
  (4, 'Smart life services');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
  (2, 'Apple'),
  (1, 'Samsung'),
  (3, 'Sony');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `brand_id` int(11) NOT NULL,
  `os_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `popular` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `short_description` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `full_description` text NOT NULL,
  `specs` text NOT NULL,
  `titles` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `price`, `brand_id`, `os_id`, `type_id`, `popular`, `creation_date`, `short_description`, `img`, `full_description`, `specs`, `titles`) VALUES
  (1, 'Samsung Galaxy S7', 699, 1, 1, 1, 1, '2016-05-30 08:59:32', 'Great performances, amazing display and expandible memory', '', 'Worry less about daily wear and tear of your phone. Galaxy S7 has an IP68 rating** meaning not only protection against dust, it also repels splashes, spills and even dunks. Simply wipe it off and move along.||The Samsung Galaxy S7 proves that less can actually be more. The big screen on an incredibly slim design keeps you fully engaged in movies, games and more. Plus, with the always on display, you get the time or notifications without waking your screen. And when you’re finished, just slip Galaxy S7 back into the pocket of your favorite jeans.||Fast, wireless charging++ lets you power Galaxy S7 from 0–100% in virtually no time. And with Samsung Galaxy’s biggest battery* (3000 mAH) in their thinnest device, Galaxy S7 gives you power to keep going even on those extra long days.', 'XLTE Ready:Doubling our 4G LTE bandwidth in cities coast to coast.||\r\nWorld Device: Works in over 200 countries||\r\nStandby Time: Up to 12 days‡||\r\nUsage Time: Up to 27 hrs‡||\r\nCamera: 12 MP||\r\nWidth: 2.74 in||\r\nWeight: 5.36 oz||\r\nHeight: 5.61 in||\r\nScreen: 5.1” Quad HD, Super Amoled, 577 PPI; Full Touch Bar||\r\nBattery: 3,000mAH, Non-removable||\r\nOperating System: Android Marshmallow (6.0.1)||\r\nStorage	RAM: 4G, Flash 32GB (Actual formatted capacity is less)||\r\nExpandable Memory: Removable microSD up to 200GB (sold separately)||\r\nColors: Black Onyx or Gold Platinum (Subject to availability)||\r\nSAR: Head 1.24 W/kg; Body 1.41 W/kg||\r\nHearing Aid Compatibility: M4/T3||\r\nNetwork: CDMA 1X and EvDO Rev 0/RevA; LTE (Domestic) B13, B4, B2, B5\r\nGlobal Network	LTE (Global) B3, B7, B20; GSM Quad B5, B8, B3, B2 (850/900/1800/1900Mhz) UMTS Quad B5, B8, B2, B1 (850, 900, 1900, 2100 MHz); TDS CDMA 34, 39 TDD LTE 38, 39, 40, CAT 4 / CAT 6 / (CAT 9 capable)||\r\nProcessor :Qualcomm® Snapdragon™ 820 Quad Core processor (MSM8996, Quad-Core, 2.15GHz + 1.6GHz)||\r\nHD Voice: Experience HD Voice, Video Calling and Simultaneous Voice & Data. Enable Wi-Fi Calling and make calls anywhere you have a Wi-Fi connection.||', 'Water resistant smartphone||Big on screen, slim on profile||Take charge of the charge '),
  (2, 'Apple iPad pro', 300, 2, 2, 2, 1, '2016-05-30 08:59:32', 'The best device in the world', '', '', '', ''),
  (3, 'Apple watch', 250, 2, 2, 3, 0, '2016-05-30 08:59:32', 'The best device in the world', '', '', '', ''),
  (4, 'Sony smart band', 150, 3, 1, 4, 0, '2016-05-30 08:59:32', 'The best device in the world', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `devices_types`
--

CREATE TABLE `devices_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices_types`
--

INSERT INTO `devices_types` (`id`, `name`) VALUES
  (1, 'Smartphones'),
  (2, 'Tablets'),
  (3, 'Wearable'),
  (4, 'Outlet');

-- --------------------------------------------------------

--
-- Table structure for table `device_assistance`
--

CREATE TABLE `device_assistance` (
  `device_id` int(11) NOT NULL,
  `assistance_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `device_service`
--

CREATE TABLE `device_service` (
  `device_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `os`
--

CREATE TABLE `os` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `os`
--

INSERT INTO `os` (`id`, `name`) VALUES
  (1, 'Android'),
  (2, 'iOS');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `price` double NOT NULL,
  `type_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `full_description` text NOT NULL,
  `features` text NOT NULL,
  `rules` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `short_description`, `price`, `type_id`, `img`, `full_description`, `features`, `rules`) VALUES
  (1, 'Verizon next', 'Tired with having an obsolete device? With Verizon Next you can exchange your device at no expenses with a more recent one so you will be always ahed', 19.99, 1, '', 'Verizon Next is a verizon service that lets you replace easily your smartphone with a new one year by year at a small montly fee of 19,99 €. You can for example buy a Samsung Galaxy S7 today and replace with the new S8 within a year from the bought of the latter.', 'Get the latest smartphone ready to be used with a small monthly fee||We will configure your new smartphone right away. No time spent to find out to restore your contacts anymore||Your new smartphone will come with an extended 3 year warranty by default', 'The service works only with a specific set of smartphones that are shown above||To enjoy the service you are required to own a smartphone purchased from Verizon or to buy a new one from verizon when you subscribe to the service||In order to get the chance to replace year by year your smartphone a montly fee of 19,99€ is required and will constitute the cost of the service||The service\'s monthly fee must be payed with a credit card that belongs to one of the following payment circuits: Mastercard, Visa, American Express'),
  (2, 'Verizon music', 'The best service in the world', 300, 2, '', '', '', ''),
  (3, 'verizon beSafe', 'The best service in the world', 250, 3, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `services_types`
--

CREATE TABLE `services_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services_types`
--

INSERT INTO `services_types` (`id`, `name`) VALUES
  (1, 'Stay connected'),
  (2, 'Stay amused'),
  (3, 'Stay secure');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assistance`
--
ALTER TABLE `assistance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`type_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `assistance_types`
--
ALTER TABLE `assistance_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`brand_id`,`os_id`,`type_id`),
  ADD KEY `os_id` (`os_id`) USING BTREE,
  ADD KEY `type_id` (`type_id`) USING BTREE,
  ADD KEY `brand_id` (`brand_id`) USING BTREE;

--
-- Indexes for table `devices_types`
--
ALTER TABLE `devices_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `device_assistance`
--
ALTER TABLE `device_assistance`
  ADD KEY `device_id` (`device_id`),
  ADD KEY `assistance_id` (`assistance_id`);

--
-- Indexes for table `device_service`
--
ALTER TABLE `device_service`
  ADD KEY `device_id` (`device_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name-type_id` (`name`,`type_id`) USING BTREE,
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `services_types`
--
ALTER TABLE `services_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assistance`
--
ALTER TABLE `assistance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `assistance_types`
--
ALTER TABLE `assistance_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `devices_types`
--
ALTER TABLE `devices_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `os`
--
ALTER TABLE `os`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `services_types`
--
ALTER TABLE `services_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistance`
--
ALTER TABLE `assistance`
  ADD CONSTRAINT `assistance-type` FOREIGN KEY (`type_id`) REFERENCES `assistance_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `os` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `type` FOREIGN KEY (`type_id`) REFERENCES `devices_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_assistance`
--
ALTER TABLE `device_assistance`
  ADD CONSTRAINT `device` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assistance` FOREIGN KEY (`assistance_id`) REFERENCES `assistance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_service`
--
ALTER TABLE `device_service`
  ADD CONSTRAINT `service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device2` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services-types` FOREIGN KEY (`type_id`) REFERENCES `services_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
