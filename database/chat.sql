-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Okt 2019 pada 18.37
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.6

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
-- Struktur dari tabel `chat_message`
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
-- Dumping data untuk tabel `chat_message`
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
(10, 5, 4, 'oke tentu', '2019-10-02 03:04:37', 0),
(11, 9, 10, 'alha', '2019-10-05 06:33:52', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `katalog`
--

CREATE TABLE `katalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ukuran` int(11) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `deksripsi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status_akun` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`, `status_akun`, `email`) VALUES
(10, 'h', '$2y$10$aTVGMKoTpoPeh6eu7458Pe9r6HZ30DccagvHqb4FDHYf4QXohIMFO', 'pembeli', 'khusnul.mubar@yahoo.'),
(11, 'zenn04', '$2y$10$T8rggop8MjnGKgdXizc/b.BiYWFcCbndEVZ0K5iadHEKOCy1uvtPm', 'penjual', 'humamatabilhaq04@gma');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_type` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(1, 1, '2019-09-21 12:56:57', 'no'),
(2, 2, '2019-09-21 12:54:52', 'no'),
(3, 1, '2019-09-21 13:03:54', 'no'),
(4, 1, '2019-09-21 13:46:09', 'no'),
(5, 4, '2019-09-21 14:11:54', 'no'),
(6, 5, '2019-10-02 03:10:19', 'no'),
(7, 4, '2019-10-02 03:47:59', 'no'),
(8, 5, '2019-10-02 04:01:35', 'no'),
(9, 4, '2019-10-02 15:59:01', 'no'),
(10, 4, '2019-10-05 04:35:52', 'no'),
(11, 4, '2019-10-05 04:54:40', 'no'),
(12, 9, '2019-10-05 05:36:25', 'no'),
(13, 9, '2019-10-05 06:35:16', 'no'),
(14, 10, '2019-10-05 05:47:14', 'no'),
(15, 10, '2019-10-05 05:51:10', 'no'),
(16, 10, '2019-10-06 04:42:49', 'no'),
(17, 9, '2019-10-06 04:40:43', 'no'),
(18, 9, '2019-10-06 12:06:48', 'no'),
(19, 11, '2019-10-09 14:05:57', 'no'),
(20, 11, '2019-10-09 16:33:23', 'no');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indeks untuk tabel `katalog`
--
ALTER TABLE `katalog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `katalog`
--
ALTER TABLE `katalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
