-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2016 at 06:43 PM
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
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assistance_types`
--

INSERT INTO `assistance_types` (`id`, `name`, `img`) VALUES
  (1, 'Configurations', ''),
  (2, 'Monitoring costs and payments', ''),
  (3, 'Technical support', ''),
  (4, 'Smart life services', '');

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
  (3, 'HTC'),
  (5, 'LG'),
  (4, 'One Plus'),
  (1, 'Samsung');

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
  `img` text NOT NULL,
  `full_description` text NOT NULL,
  `specs` text NOT NULL,
  `titles` text NOT NULL,
  `img_pres` text NOT NULL,
  `colors` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `price`, `brand_id`, `os_id`, `type_id`, `popular`, `creation_date`, `short_description`, `img`, `full_description`, `specs`, `titles`, `img_pres`, `colors`) VALUES
  (1, 'Galaxy S7', 699, 1, 1, 1, 1, '2016-05-30 08:59:32', 'The Samsung Galaxy S7 unlocks a Galaxy of technology that takes your smartphone experience to a new level. The bigger, more stunning screen completes the slimmer design. Why not have a phone that’s water resistant, too? ', '25095652471_9b7e146ff6_o.png||back-cover-sandstone-black.png', 'Worry less about daily wear and tear of your phone. Galaxy S7 has an IP68 rating** meaning not only protection against dust, it also repels splashes, spills and even dunks. Simply wipe it off and move along.||The Samsung Galaxy S7 proves that less can actually be more. The big screen on an incredibly slim design keeps you fully engaged in movies, games and more. Plus, with the always on display, you get the time or notifications without waking your screen. And when you’re finished, just slip Galaxy S7 back into the pocket of your favorite jeans.||Fast, wireless charging++ lets you power Galaxy S7 from 0–100% in virtually no time. And with Samsung Galaxy’s biggest battery* (3000 mAH) in their thinnest device, Galaxy S7 gives you power to keep going even on those extra long days.', 'XLTE Ready:Doubling our 4G LTE bandwidth in cities coast to coast.||\r\nWorld Device: Works in over 200 countries||\r\nStandby Time: Up to 12 days‡||\r\nUsage Time: Up to 27 hrs‡||\r\nCamera: 12 MP||\r\nWidth: 2.74 in||\r\nWeight: 5.36 oz||\r\nHeight: 5.61 in||\r\nScreen: 5.1” Quad HD, Super Amoled, 577 PPI; Full Touch Bar||\r\nBattery: 3,000mAH, Non-removable||\r\nOperating System: Android Marshmallow (6.0.1)||\r\nStorage	RAM: 4G, Flash 32GB (Actual formatted capacity is less)||\r\nExpandable Memory: Removable microSD up to 200GB (sold separately)||\r\nColors: Black Onyx or Gold Platinum (Subject to availability)||\r\nSAR: Head 1.24 W/kg; Body 1.41 W/kg||\r\nHearing Aid Compatibility: M4/T3||\r\nNetwork: CDMA 1X and EvDO Rev 0/RevA; LTE (Domestic) B13, B4, B2, B5\r\nGlobal Network	LTE (Global) B3, B7, B20; GSM Quad B5, B8, B3, B2 (850/900/1800/1900Mhz) UMTS Quad B5, B8, B2, B1 (850, 900, 1900, 2100 MHz); TDS CDMA 34, 39 TDD LTE 38, 39, 40, CAT 4 / CAT 6 / (CAT 9 capable)||\r\nProcessor :Qualcomm® Snapdragon™ 820 Quad Core processor (MSM8996, Quad-Core, 2.15GHz + 1.6GHz)||\r\nHD Voice: Experience HD Voice, Video Calling and Simultaneous Voice & Data. Enable Wi-Fi Calling and make calls anywhere you have a Wi-Fi connection.||', 'Water resistant smartphone||Big on screen, slim on profile||Take charge of the charge ', 'hero-pdp-image-2112016-2.jpg||hero-pdp-image-2112016-3.jpeg||hero-pdp-image-2112016-4.jpg', '#000000||#666666'),
  (2, 'iPad pro', 779, 2, 2, 2, 1, '2016-05-30 08:59:32', 'With its epic Retina display, the 12.9–inch iPad Pro is the largest and most powerful iPad ever designed, yet it’s only 6.9mm thin and weighs just over 1.5 pounds. It turns advanced tasks into brilliant, immersive experiences.', 'ipad-pro-space-gray.png||apple_ipad_mini_3_display_back_spacegray_large.png', 'With 5.6 million pixels, iPad Pro features the highest-resolution Retina display of any iOS device. The 12.9-inch screen makes everything you do — editing 4K video, designing presentations, running a business — easier, faster, and more engaging. And the Multi-Touch subsystem has been reengineered, expanding the ways you can interact with iPad.||At the heart of iPad Pro lies the new A9X, a third-generation chip with 64-bit desktop-class architecture. It delivers up to 1.8 times the CPU performance and double the graphics performance of iPad Air 2. So even the most demanding apps run effortlessly.||IPad Pro runs iOS 9, the world\'s most intuitive, advanced, and secure mobile operating system. And with improved built-in apps and multitasking features like Slide Over, Split View, and Picture in Picture, iOS 9 helps you get more done in powerful yet simple ways. ', '', 'A canvas designed for your biggest ideas||Apple\'s most powerful chip for its most capable device.||A better experience with every touch.', 'ipad-pro-pdp-1-canvas-designed-for-your-biggest-ideas-d-11112015.jpg||ipad-pro-pdp-2-most-powerful-chip-d-11112015.jpg||ipad-pro-pdp-3-better-experience-with-every-touch-d-11112015.jpg', '#000000||#FFFFFF'),
  (3, 'watch', 369, 2, 2, 3, 0, '2016-05-30 08:59:32', 'Instantly receive and respond to your favorite notifications. Get the motivation you need to stay active and healthy. Express your personal style in a whole new way. ', 'topic-apple-watch-edition.png||Apple-Watch-back.png', 'Throughout the day, Apple Watch measures your workouts, tracks your activity, and helps encourage healthy routines. All adding up to a better you.||Because it’s on your wrist, Apple Watch lets you receive notifications immediately and conveniently. The moment the people or apps you care about have something to say, you’ll feel a gentle tap. Then you can send just the right response. Just like that.||Because it’s on your wrist, Apple Watch lets you receive notifications immediately and conveniently. The moment the people or apps you care about have something to say, you’ll feel a gentle tap. Then you can send just the right response. Just like that.', '', 'Stay motivated. Stay healthy||Never miss what matters||You. At a glance.', 'apple_watch_activity-100413684-medium.jpg||call_watch.png||heart.png', '#3366FF||#000000||#FFFFFF'),
  (4, 'Two', 349, 4, 1, 4, 0, '2016-05-30 08:59:32', 'Corpore  manebat inter volucres dedit pinus liberioris traxit pugnabant terrenae nubes flamma nabataeaque erectos umor? ', 'phone-front-face.png||back-cover-sandstone-black.png', 'The OnePlus 2 runs OxygenOS, our light, powerful software built on Android. We\'ve kept the best of the stock experience and enhanced it with a handful of thoughtful features and optimizations.||We use our smartphones to stay connected to the world around us. A lot of time is spent looking at our smartphone’s screen, so it should be amazing. The OnePlus 2’s 5.5” IPS LCD display produces incredibly sharp lines and true-to-life colors. Experience crystal clear images, video, and text in any setting.||Never be tied down. The OnePlus 2 comes carrier-unlocked with wide range band support for service providers worldwide. And, with dual SIM capabilities, you can connect to two networks simultaneously to travel with ease. Manage your work life and personal life without the need to carry around two phones. It’s one device, for everything.', '', 'A Breath of Fresh Air||See More. Do More.||Born Global', 'one_plus_f2.png||one_plus_f1.png||born-global-img.png', '#000000'),
  (5, 'Iphone 6S', 729, 2, 2, 1, 0, '2016-07-14 16:41:55', 'With 3D Touch, Live Photos, 7000 Series aluminum, A9 chip, advanced cameras, and so much more, you’ll see how with iPhone 6s, the only thing that’s changed is everything. ', 'Apple-iPhone-6.png||3-2486-iphone 6 silver back.png-Basic-size-300x400.jpg', 'iPhone now senses how deeply you press the display, opening up new possibilities for how you interact with your content and letting you do all kinds of essential things more quickly and simply.||The world\'s most popular camera is even better than ever. The advanced 12-mexapixel iSight camera now includes Live Photos — allowing you to capture a still photo, together with what happens before and after your picture, and bring it to life with a simple press.||The most advanced chip ever in a smartphone is even faster and now features an integrated M9 motion coprocessor.', '', '3D Touch The next generation of Multi-Touch.||12MP pictures. 4K video.||A9 chip with 64-bit architecture.', 'iphone-6s-pdp-feature-1-3d-touch-dt.jpg||iphone-6s-pdp-feature-2-camera-dt.jpg||iphone-6s-pdp-feature-3-a9-chip-dt.jpg', '#000000||#FFFFFF||#FFCC99');

-- --------------------------------------------------------

--
-- Table structure for table `devices_types`
--

CREATE TABLE `devices_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices_types`
--

INSERT INTO `devices_types` (`id`, `name`, `img`) VALUES
  (1, 'Smartphones', 'smartphones_icon.png'),
  (2, 'Tablets', 'tablets_icon.png'),
  (3, 'Wearable', 'wearables_icon.jpg'),
  (4, 'Outlet', 'deals_icon.jpg');

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
-- Table structure for table `promotions_device`
--

CREATE TABLE `promotions_device` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promotions_device`
--

INSERT INTO `promotions_device` (`id`, `device_id`, `title`, `description`, `img`) VALUES
  (1, 1, 'Test', 'test test', 'ipad-pro-space-gray.png');

-- --------------------------------------------------------

--
-- Table structure for table `promotions_service`
--

CREATE TABLE `promotions_service` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promotions_service`
--

INSERT INTO `promotions_service` (`id`, `service_id`, `title`, `description`, `img`) VALUES
  (1, 1, 'Test', 'test test', 'test');

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
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services_types`
--

INSERT INTO `services_types` (`id`, `name`, `img`) VALUES
  (1, 'Stay connected', ''),
  (2, 'Stay amused', ''),
  (3, 'Stay secure', '');

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
-- Indexes for table `promotions_device`
--
ALTER TABLE `promotions_device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `promotions_service`
--
ALTER TABLE `promotions_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
-- AUTO_INCREMENT for table `promotions_device`
--
ALTER TABLE `promotions_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `promotions_service`
--
ALTER TABLE `promotions_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- Constraints for table `promotions_device`
--
ALTER TABLE `promotions_device`
  ADD CONSTRAINT `device3` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promotions_service`
--
ALTER TABLE `promotions_service`
  ADD CONSTRAINT `service2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services-types` FOREIGN KEY (`type_id`) REFERENCES `services_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
