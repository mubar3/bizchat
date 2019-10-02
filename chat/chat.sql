-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2019 at 06:00 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(1, 2, 1, 'hai', '2019-09-21 12:46:20', 0),
(2, 1, 2, 'iya', '2019-09-21 12:47:21', 0),
(3, 2, 1, 'bisa kesini', '2019-09-21 12:47:36', 0),
(4, 1, 4, 'sdaw', '2019-09-21 14:11:51', 1),
(5, 4, 5, 'hi', '2019-10-02 03:04:00', 0),
(6, 5, 4, 'iya ada apa', '2019-10-02 03:04:11', 0),
(7, 5, 4, 'iya ada apa', '2019-10-02 03:04:13', 0),
(8, 4, 5, 'ini bisa apa ya?', '2019-10-02 03:04:25', 0),
(9, 5, 4, 'oke tentu', '2019-10-02 03:04:35', 0),
(10, 5, 4, 'oke tentu', '2019-10-02 03:04:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status_akun` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`, `status_akun`) VALUES
(1, 'johnsmith', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396', 'penjual'),
(2, 'peterParker', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396', NULL),
(3, 'davidMoore', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396', NULL),
(4, 'a', '$2y$10$NUgxW/pnW..F8Hx/gkgk3.2/xxL7NAlgSsErurJSPweXTVi8y2AXW', NULL),
(5, 'barok', '$2y$10$D4E6KILAC5ri.3U8d6wDdujel41jfE1KwHswo6ALmyNZPyWpMM7Xm', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_type` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(1, 1, '2019-09-21 12:56:57', 'no'),
(2, 2, '2019-09-21 12:54:52', 'no'),
(3, 1, '2019-09-21 13:03:54', 'no'),
(4, 1, '2019-09-21 13:46:09', 'no'),
(5, 4, '2019-09-21 14:11:54', 'no'),
(6, 5, '2019-10-02 03:10:19', 'no'),
(7, 4, '2019-10-02 03:47:59', 'no'),
(8, 5, '2019-10-02 04:00:16', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
