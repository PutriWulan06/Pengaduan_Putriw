-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2023 at 05:18 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_pengaduan_putriw`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_masyarakat`
--

CREATE TABLE `tb_masyarakat` (
  `id_masyarakat` int(11) NOT NULL,
  `nama` varchar(35) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `telp` varchar(13) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nik` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_masyarakat`
--

INSERT INTO `tb_masyarakat` (`id_masyarakat`, `nama`, `username`, `password`, `telp`, `deleted_at`, `nik`) VALUES
(1, '', 'ya', '$2y$10$t6u6KoEcRxC0jYN/4CfaMu1gM3XPcucVP2azkFZRY4qPxZp4jvOGi', '355779975538', '2023-02-23 02:25:04', '4975905'),
(2, NULL, 'ya', '$2y$10$e5dTWg5HKhthMmYXIP/2wOYodrU3Wy3qG8sXAWj5LFlt50b59KFoq', '355779975538', '2023-02-21 01:39:11', '4975905'),
(3, 'desi', 'p', '$2y$10$A6wlMaWkDYvpCT2B0yUDHudqUdAXoABsffq30udIUOAfbpz/T63Ii', NULL, '2023-02-22 19:32:35', '12345'),
(4, 'desi', 'ya', '$2y$10$2bFrns6gSuu0lpeglsl4pOWZVOdkE0Rc8SV.wX2EEqCp1fdrdKyb.', '46879809', NULL, '3446'),
(5, 'putri', 'p', '$2y$10$bu2ZdHTYctIs9SgYA.iQ1O5XHP4JfCWLDSgW1AlDWzwFCbJFKAuYy', '46879809', NULL, '09887'),
(6, 'silvi', 'wulan', '$2y$10$JvKrEmYcDGueUKxLoMvo6OUncl1moeUlQNf9AfFDL.Q1rXSHTjTg2', NULL, NULL, '442876453'),
(7, 'nita', 'pewe', '$2y$10$MN89hT.lRJj8D2yWNY54d.AjBzsnbM7ryY339rkNVrkje.s3lb6B2', '085356568769', NULL, '12345'),
(8, 'nita', 'y', '$2y$10$FClxrYP8sZCtz01rsgjYLeZz.l6QS/zqYCh5sWlsz6JM59s5U.jd.', '24576990', NULL, '6447888');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaduan`
--

CREATE TABLE `tb_pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` date DEFAULT NULL,
  `nik` char(16) DEFAULT NULL,
  `isi_laporan` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` enum('0','proses','selesai','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengaduan`
--

INSERT INTO `tb_pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(1, '2023-02-23', '12345', 'fgdg', '1677131527_9a00d14f4b7717ceb29b.jpeg', 'selesai'),
(2, '2023-02-23', '12345', 'gdyh', '1677132331_cf001f8aa10014d7072e.jpg', 'selesai'),
(3, '2023-02-23', '12345', 'penculikan anak', '1677138099_4cd77965154ed81c2f0e.jpg', '0'),
(4, '2023-02-23', '12345', 'longsor', '1677144278_07886543f1ab21ceee47.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `telp` varchar(13) DEFAULT NULL,
  `level` enum('admin','petugas','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `level`) VALUES
(2, 'nana', 'ga', '$2y$10$IPn8qA8ITIub3bKQ9fnZ5utii/o3lv.nRJO.z6bYBJYbi1ta2zB5K', '085356568769', 'petugas'),
(4, 'selvia', 'p', '$2y$10$atI8v84rRoLTGT86L6Q8uObzj0MAHaVYGkoqpY9v7unc1fxR/OTyC', '7865443435', 'petugas'),
(5, '', 'a', '$2y$10$KQ2JklRZki6LVqTDoKWtzeHOjv8qv5r28jxcPs6Nol5m/I6tfMp4m', '', 'admin'),
(7, '', 'ga', '$2y$10$2FnwtFp.pJzP50Zs19fAzOgb571Pjlw3sN8WLYklXDJgkfBbx2OBG', '', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tanggapan`
--

CREATE TABLE `tb_tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) DEFAULT NULL,
  `tgl_tanggapan` date DEFAULT NULL,
  `tanggapan` text DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tanggapan`
--

INSERT INTO `tb_tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(1, 1, '0000-00-00', 'Testing', 5),
(2, 1, '0000-00-00', 'asjkdgakwd', 5),
(3, 1, '0000-00-00', 'asjkdgakwd', 5),
(4, 1, '0000-00-00', 'asdasdawda', 5),
(5, 1, '0000-00-00', 'testing', 5),
(6, 2, '0000-00-00', 'asdghajwdasd', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  ADD PRIMARY KEY (`id_masyarakat`);

--
-- Indexes for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tb_tanggapan`
--
ALTER TABLE `tb_tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_masyarakat`
--
ALTER TABLE `tb_masyarakat`
  MODIFY `id_masyarakat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_tanggapan`
--
ALTER TABLE `tb_tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
