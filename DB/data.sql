-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 26, 2016 at 04:18 PM
-- Server version: 5.7.12-0ubuntu1
-- PHP Version: 7.0.4-7ubuntu2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hypermedia`
--

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(2, 'Apple'),
(1, 'Samsung'),
(3, 'Sony');

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `price`, `brand_id`, `os_id`, `type_id`) VALUES
(9, 'Samsung galaxy S7', 200, 1, 1, 1),
(10, 'Apple iPad pro', 300, 2, 2, 2),
(11, 'Apple watch', 250, 2, 2, 3),
(12, 'Sony smart band', 150, 3, 1, 4);

--
-- Dumping data for table `devices_types`
--

INSERT INTO `devices_types` (`id`, `name`) VALUES
(1, 'Smartphones'),
(2, 'Tablets'),
(3, 'Wearable'),
(4, 'Outlet');

--
-- Dumping data for table `os`
--

INSERT INTO `os` (`id`, `name`) VALUES
(1, 'Android'),
(2, 'iOS');
