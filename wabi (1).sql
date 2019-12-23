-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 23, 2019 at 06:53 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wabi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `details_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `new_or_used` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `availability` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name_id`, `model_id`, `details_id`, `year`, `price`, `new_or_used`, `time_created`, `availability`, `feature_id`, `dealer_id`) VALUES
(1, 1, 1, 1, 2017, '2,500,000 ', 0, '2019-12-23 05:07:57', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_name`
--

CREATE TABLE `car_name` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_name`
--

INSERT INTO `car_name` (`id`, `name`) VALUES
(1, 'Mercedes Benz');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Luxury');

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_no` int(11) NOT NULL,
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`id`, `name`, `phone_no`, `latitude`, `longitude`) VALUES
(1, 'Sami car dealership', 978444345, '23.321', '21.543'),
(2, 'Geneve car dealership', 923008877, '22.134', '24.312');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `origin` text NOT NULL,
  `mileage` text NOT NULL,
  `capacity` text NOT NULL,
  `power` text NOT NULL,
  `fuel_id` int(11) NOT NULL,
  `fuel_consumption` text NOT NULL,
  `seat_no` text NOT NULL,
  `door_no` text NOT NULL,
  `transmission_id` int(11) NOT NULL,
  `color` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `category_id`, `origin`, `mileage`, `capacity`, `power`, `fuel_id`, `fuel_consumption`, `seat_no`, `door_no`, `transmission_id`, `color`) VALUES
(1, 1, 'German', '0 Km', '2000 cc', '550 hp', 1, '8 km/L', '4', '4', 1, 'Red');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `ac` text NOT NULL,
  `air_bag` text NOT NULL,
  `rear_camera` text NOT NULL,
  `cd_player` text NOT NULL,
  `fm_radio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `ac`, `air_bag`, `rear_camera`, `cd_player`, `fm_radio`) VALUES
(1, '1', '1', '1', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `fuel`
--

CREATE TABLE `fuel` (
  `id` int(11) NOT NULL,
  `fuel` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fuel`
--

INSERT INTO `fuel` (`id`, `fuel`) VALUES
(1, 'diesel');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `path_1` text NOT NULL,
  `path_2` text NOT NULL,
  `path_3` text NOT NULL,
  `path_4` text NOT NULL,
  `path_5` text NOT NULL,
  `path_6` text NOT NULL,
  `car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `path_1`, `path_2`, `path_3`, `path_4`, `path_5`, `path_6`, `car_id`) VALUES
(1, 'uploads/29-09-2019/1/mercedes.png', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `model` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `model`) VALUES
(1, 'v-8');

-- --------------------------------------------------------

--
-- Table structure for table `transmission`
--

CREATE TABLE `transmission` (
  `id` int(11) NOT NULL,
  `transmission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transmission`
--

INSERT INTO `transmission` (`id`, `transmission`) VALUES
(1, 'automatic');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `username` text NOT NULL,
  `password` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_name`
--
ALTER TABLE `car_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuel`
--
ALTER TABLE `fuel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transmission`
--
ALTER TABLE `transmission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `car_name`
--
ALTER TABLE `car_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fuel`
--
ALTER TABLE `fuel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transmission`
--
ALTER TABLE `transmission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
