-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2020 at 11:04 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thrive_health_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `admission_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `patient_fullname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `weigth` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `allergies` varchar(50) NOT NULL,
  `temperature` varchar(50) DEFAULT NULL,
  `admission_date` date NOT NULL,
  `discharged_date` date DEFAULT NULL,
  `health_state` varchar(40) NOT NULL,
  `condition` varchar(40) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `time_in` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drug_inventory`
--

CREATE TABLE `drug_inventory` (
  `inventory_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `drug_name` varchar(300) DEFAULT NULL,
  `service_provider_id` varchar(300) DEFAULT NULL,
  `quantity` int(20) NOT NULL,
  `stock_status` varchar(300) DEFAULT NULL,
  `stock_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) NOT NULL,
  `state` varchar(225) NOT NULL,
  `country` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `patient_fullname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `genotype` varchar(50) DEFAULT NULL,
  `marital_status` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(300) DEFAULT NULL,
  `password` varchar(225) NOT NULL,
  `address` varchar(300) NOT NULL,
  `state` varchar(225) NOT NULL,
  `country` varchar(225) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `admission_date` date NOT NULL,
  `discharged_date` date DEFAULT NULL,
  `hmo_card_no` varchar(20) DEFAULT NULL,
  `purpose` varchar(40) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `hmo_id` int(11) DEFAULT NULL,
  `hmo_name` varchar(225) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `time_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `date_paid` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `service_provider_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `hospital_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `full_name` varchar(225) NOT NULL,
  `job_id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `hospital_id` int(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(225) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_notification`
--

CREATE TABLE `staff_notification` (
  `notification_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `gateman_id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `symptoms_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `symptoms` varchar(225) NOT NULL,
  `diagnosis` varchar(50) NOT NULL,
  `recommendation` varchar(300) DEFAULT NULL,
  `drug_prescription` varchar(300) DEFAULT NULL,
  `admission_date` date NOT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `user_type` enum('super_admin','admin','doctor','nurse','patient','receptionist','pharmacist') DEFAULT NULL,
  `password` varchar(225) NOT NULL,
  `photo` varchar(100) DEFAULT 'noimage.jpg',
  `hospital_id` int(11) DEFAULT NULL,
  `hmo_card_no` varchar(50) DEFAULT NULL,
  `hmo_name` varchar(225) DEFAULT NULL,
  `role` enum('0','1','2','3','4','5','6') NOT NULL,
  `verifycode` varchar(55) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `email`, `user_type`, `password`, `photo`, `hospital_id`, `hmo_card_no`, `hmo_name`, `role`, `verifycode`, `email_verified_at`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'sikie yah', NULL, 'sa@mail.com', NULL, '$2y$10$hmcqIrTckt8zecR0Wi8Poe8qnZkEQGLhJiebm38nOoit2gaIWEk82', NULL, NULL, NULL, NULL, '0', '5eea77', '2020-03-31 21:04:45', NULL, '2020-03-31 22:04:45', '2020-03-31 21:04:45'),
(2, 'James Jon', NULL, 'jjn@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2020-03-31 21:48:44', '2020-03-30 13:02:53'),
(3, 'sikie Seun', NULL, 'san@mail.com', NULL, '$2y$10$hmcqIrTckt8zecR0Wi8Poe8qnZkEQGLhJiebm38nOoit2gaIWEk82', NULL, NULL, NULL, NULL, '0', '5eea77', '2020-03-31 20:04:45', NULL, '2020-04-01 17:16:15', '0000-00-00 00:00:00'),
(4, 'James Jones', NULL, 'jon@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2020-04-01 17:16:15', '0000-00-00 00:00:00'),
(5, 'Jide Jones', NULL, 'jide@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '4', NULL, NULL, NULL, '2020-04-01 17:16:15', '0000-00-00 00:00:00'),
(6, 'Lara Lans', NULL, 'lans@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '4', NULL, NULL, NULL, '2020-04-01 17:16:15', '0000-00-00 00:00:00'),
(7, 'Akin Duo', NULL, 'akin@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2020-04-01 17:16:15', '0000-00-00 00:00:00'),
(8, 'Gift She', NULL, 'shake@mail.com', NULL, '$2y$10$hmcqIrTckt8zecR0Wi8Poe8qnZkEQGLhJiebm38nOoit2gaIWEk82', NULL, NULL, NULL, NULL, '0', '5eea77', '2020-03-31 20:04:45', NULL, '2020-04-01 17:20:24', '0000-00-00 00:00:00'),
(9, 'James Wale', NULL, 'wale@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2020-04-01 17:20:24', '0000-00-00 00:00:00'),
(10, 'Jide Lagbaja', NULL, 'gbaja@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '5', NULL, NULL, NULL, '2020-04-01 17:20:24', '0000-00-00 00:00:00'),
(11, 'Ade Tonny', NULL, 'ade@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '5', NULL, NULL, NULL, '2020-04-01 17:20:24', '0000-00-00 00:00:00'),
(12, 'Haruna Duo', NULL, 'har@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '3', NULL, NULL, NULL, '2020-04-01 17:20:24', '0000-00-00 00:00:00'),
(13, 'Alimo Seun', NULL, 'alim@mail.com', NULL, '$2y$10$hmcqIrTckt8zecR0Wi8Poe8qnZkEQGLhJiebm38nOoit2gaIWEk82', NULL, NULL, NULL, NULL, '1', '5eea77', '2020-03-31 20:04:45', NULL, '2020-04-01 17:24:56', '0000-00-00 00:00:00'),
(14, 'Shola Jones', NULL, 'shola@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2020-04-01 17:24:56', '0000-00-00 00:00:00'),
(15, 'Maria Jones', NULL, 'maria@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2020-04-01 17:24:56', '0000-00-00 00:00:00'),
(16, 'Beauty Dale', NULL, 'dale@mail.com', NULL, '$2y$10$PM3hajTZWN4lJNr2DQp0OO5kT1zx3AJAuNUTOdUpduvu3vpaRXzcO', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2020-04-01 17:24:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `ward_id` int(11) NOT NULL,
  `ward_type` varchar(50) NOT NULL,
  `ward_gender` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `pateint_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`service_provider_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `service_provider_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
