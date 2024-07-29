-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jul 2024 pada 16.48
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simandor`
--
CREATE DATABASE IF NOT EXISTS `simandor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `simandor`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blok`
--

CREATE TABLE `blok` (
  `id_blok` int(15) NOT NULL,
  `nama_blok` varchar(100) NOT NULL,
  `luas` varchar(15) NOT NULL,
  `tahun_tanam` year(4) NOT NULL,
  `jumlah_pokok` int(15) NOT NULL,
  `jenis_tanah` varchar(100) NOT NULL,
  `id_divisi` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `blok`
--

INSERT INTO `blok` (`id_blok`, `nama_blok`, `luas`, `tahun_tanam`, `jumlah_pokok`, `jenis_tanah`, `id_divisi`, `created_at`) VALUES
(2, 'H09', '6,56', 2017, 121, 'inti', 55, '2024-07-06 08:26:51'),
(3, 'A01', '3,5', 2014, 200, 'inti', 55, '2024-07-06 08:26:51'),
(4, 'A01B', '5,69', 2014, 20, 'inti', 55, '2024-07-06 08:39:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` int(15) NOT NULL,
  `nama_divisi` varchar(100) NOT NULL,
  `jumlah_blok` int(15) NOT NULL,
  `nama_asisten` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`, `jumlah_blok`, `nama_asisten`, `created_at`) VALUES
(55, 'divisi 1', 30, 'krisna', '2024-07-06 08:28:08'),
(56, 'divisi 2', 35, 'basuki', '2024-07-06 08:28:08'),
(57, 'divisi 3', 36, 'manik', '2024-07-06 08:28:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(15) NOT NULL,
  `nama_karyawan` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `hp` int(15) NOT NULL,
  `id_divisi` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `alamat`, `tanggal_lahir`, `jenis_kelamin`, `hp`, `id_divisi`, `created_at`) VALUES
(3, 'sopian', 'lamboy', '2023-03-08', 'laki-laki', 8225545, 56, '2024-07-06 08:27:22'),
(4, 'ewinda', 'lamboy', '2024-06-06', 'perempuan', 85585, 56, '2024-07-06 08:27:22'),
(5, 'bian', 'pakit', '2024-06-26', 'laki-laki', 2147483647, 57, '2024-07-06 08:27:22'),
(6, 'Dede Sunaryo', 'ketapang', '2024-06-27', 'laki-laki', 832332, 57, '2024-07-06 08:27:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_harian`
--

CREATE TABLE `laporan_harian` (
  `id_laporan` int(15) NOT NULL,
  `datetimeinput` varchar(20) NOT NULL,
  `absensi` varchar(50) NOT NULL,
  `luas` int(20) NOT NULL,
  `janjang` int(20) NOT NULL,
  `catatan` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(15) NOT NULL,
  `id_divisi` int(15) NOT NULL,
  `id_blok` int(15) NOT NULL,
  `id_karyawan` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laporan_harian`
--

INSERT INTO `laporan_harian` (`id_laporan`, `datetimeinput`, `absensi`, `luas`, `janjang`, `catatan`, `created_at`, `updated_at`, `id_user`, `id_divisi`, `id_blok`, `id_karyawan`) VALUES
(56, '2024-Jun-29', 'kerja', 12, 121, 'Tidak ada Lembur', '2024-06-29 02:58:19', '2024-06-29 02:58:19', 16, 57, 3, 6),
(61, '2024-07-11', 'Kerja', 5, 25, 'sopian lembur Rp 24.000', '2024-07-11 07:25:20', '2024-07-11 07:25:20', 17, 55, 3, 3),
(62, '2024-07-27', 'Kerja', 3, 32, 'Tidak ada Lembur', '2024-07-29 13:09:25', '2024-07-29 13:09:25', 16, 57, 4, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mandor`
--

CREATE TABLE `mandor` (
  `id_mandor` int(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mandor`
--

INSERT INTO `mandor` (`id_mandor`, `username`, `password`) VALUES
(1, 'sopian', '1111'),
(2, 'user', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(15) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `id_divisi` int(15) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `alamat`, `username`, `password`, `level`, `id_divisi`, `foto`, `created_at`) VALUES
(14, 'administrator', 'ketapang', 'admin', '123', 'admin', 55, 'assets/6698a7a9ee38b9.78137871.png', '2024-07-06 08:24:24'),
(16, 'Blasius Sarbian', 'pakit', 'bian', '1212', 'mandor', 55, 'assets/6694d18b4e9ed5.84646516.png', '2024-07-06 08:24:24'),
(17, 'Petrus Sopian', 'ketapang', 'sopian', '12345', 'mandor', 56, '', '2024-07-06 08:24:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blok`
--
ALTER TABLE `blok`
  ADD PRIMARY KEY (`id_blok`),
  ADD KEY `id_divisi` (`id_divisi`);

--
-- Indeks untuk tabel `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_divisi` (`id_divisi`);

--
-- Indeks untuk tabel `laporan_harian`
--
ALTER TABLE `laporan_harian`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_divisi` (`id_divisi`),
  ADD KEY `id_blok` (`id_blok`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indeks untuk tabel `mandor`
--
ALTER TABLE `mandor`
  ADD PRIMARY KEY (`id_mandor`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_divisi` (`id_divisi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blok`
--
ALTER TABLE `blok`
  MODIFY `id_blok` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `laporan_harian`
--
ALTER TABLE `laporan_harian`
  MODIFY `id_laporan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT untuk tabel `mandor`
--
ALTER TABLE `mandor`
  MODIFY `id_mandor` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `blok`
--
ALTER TABLE `blok`
  ADD CONSTRAINT `blok_ibfk_1` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laporan_harian`
--
ALTER TABLE `laporan_harian`
  ADD CONSTRAINT `laporan_harian_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_harian_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_harian_ibfk_3` FOREIGN KEY (`id_blok`) REFERENCES `blok` (`id_blok`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_harian_ibfk_4` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
