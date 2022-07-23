-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2022 pada 17.02
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_antrian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `gambar` varchar(255) NOT NULL DEFAULT 'default.png',
  `theme` varchar(20) NOT NULL DEFAULT 'sb_admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama`, `status`, `gambar`, `theme`) VALUES
(2, 'admin@admin.com', 'admin', 'admin', 1, 'default.png', 'sb_admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `antrian`
--

CREATE TABLE `antrian` (
  `id_antrian` int(4) NOT NULL,
  `tgl_antrian` date NOT NULL,
  `no_antrian` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `antrian`
--

INSERT INTO `antrian` (`id_antrian`, `tgl_antrian`, `no_antrian`) VALUES
(17, '2022-05-22', '1'),
(18, '2022-05-22', '2'),
(19, '2022-05-22', '3'),
(20, '2022-06-05', '1'),
(21, '2022-06-05', '2'),
(22, '2022-06-06', '1'),
(23, '2022-06-12', '1'),
(24, '2022-06-12', '2'),
(25, '2022-06-12', '3'),
(26, '2022-06-12', '4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `antrian_poli`
--

CREATE TABLE `antrian_poli` (
  `id_antrian_poli` int(4) NOT NULL,
  `id_antrian` int(4) NOT NULL,
  `id_pasien` int(4) NOT NULL,
  `id_poli` int(2) NOT NULL,
  `no_antrian_poli` varchar(10) NOT NULL,
  `tgl_antrian_poli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `antrian_poli`
--

INSERT INTO `antrian_poli` (`id_antrian_poli`, `id_antrian`, `id_pasien`, `id_poli`, `no_antrian_poli`, `tgl_antrian_poli`) VALUES
(1, 0, 2, 2, '1', '2022-06-12'),
(2, 0, 1, 8, '1', '2022-06-12'),
(3, 0, 3, 2, '2', '2022-06-12'),
(4, 0, 2, 8, '2', '2022-06-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `antrian_sekarang`
--

CREATE TABLE `antrian_sekarang` (
  `id_sekarang` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `antrian_sekarang`
--

INSERT INTO `antrian_sekarang` (`id_sekarang`, `id_poli`) VALUES
(1, 1),
(2, 8),
(3, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_poli`
--

CREATE TABLE `kategori_poli` (
  `id_poli` int(2) NOT NULL,
  `kode_poli` varchar(5) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `jumlah_maksimal` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_poli`
--

INSERT INTO `kategori_poli` (`id_poli`, `kode_poli`, `nama_poli`, `jumlah_maksimal`) VALUES
(1, 'PLUM', 'Poli Umum', '30'),
(2, 'PLGG', 'Poli Gigi', '30'),
(3, 'PLGZ', 'Poli Gizi', '30'),
(4, 'PLKL', 'Poli Konseling', '30'),
(5, 'PLTK', 'Poli Tb dan Kusta', '30'),
(6, 'PLAN', 'Poli Anak', '30'),
(7, 'PLKIA', 'Poli Kia', '30'),
(8, 'PLKB', 'Poli Kb', '30'),
(9, 'PLKR', 'Poli Kesehatan Remaja', '30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(4) NOT NULL,
  `no_medis` varchar(25) NOT NULL,
  `no_bpjs` varchar(25) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jenis_kelamin` enum('Perempuan','Laki-Laki') NOT NULL,
  `usia` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `no_medis`, `no_bpjs`, `nama`, `jenis_kelamin`, `usia`, `alamat`, `username`, `password`) VALUES
(1, '012/455/1223/1', '018 913 124 123', 'user1', 'Laki-Laki', '22 Tahun', 'anjir', 'ufi', '726da51afacac648bbbc74138ac48175'),
(2, '012/455/1223/2', '018 913 124 129', 'user2', 'Laki-Laki', '22 Tahun', 'anjir', 'tes', '28b662d883b6d76fd96e4ddc5e9ba780'),
(3, '012/455/1223/3', '018 913 124 123', 'user3', 'Laki-Laki', '22 Tahun', 'a', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tjm_menu`
--

CREATE TABLE `tjm_menu` (
  `id` int(11) NOT NULL,
  `parent_menu` int(11) NOT NULL DEFAULT 1,
  `nama_menu` varchar(50) NOT NULL,
  `url_menu` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `urutan` tinyint(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` enum('Admin') NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tjm_menu`
--

INSERT INTO `tjm_menu` (`id`, `parent_menu`, `nama_menu`, `url_menu`, `icon`, `urutan`, `status`, `type`) VALUES
(1, 1, 'root', '/', '', 0, 0, 'Admin'),
(2, 1, 'dashboard', 'admin/dashboard', 'fa fa-fw fa-dashboard', 1, 1, 'Admin'),
(3, 1, 'User Admin', 'admin/useradmin', 'fa fa-users', 99, 0, 'Admin'),
(4, 1, 'Menu', 'admin/menu', 'fa fa-gear', 100, 1, 'Admin'),
(25, 1, 'Master', 'admin/master', 'fa fa-ticket', 2, 0, 'Admin'),
(31, 1, 'Data Pasien', 'admin/pasien', 'glyphicon glyphicon-user', 2, 1, 'Admin'),
(32, 1, 'Poli', 'admin/poli', 'glyphicon glyphicon-list-alt', 3, 1, 'Admin'),
(33, 1, 'Antrian Poli', 'admin/antrian_poli', 'glyphicon glyphicon-list', 4, 1, 'Admin'),
(34, 1, 'Nomor Antrian', 'admin/nomor', 'fa fa-list-ol', 5, 1, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id_antrian`);

--
-- Indeks untuk tabel `antrian_poli`
--
ALTER TABLE `antrian_poli`
  ADD PRIMARY KEY (`id_antrian_poli`);

--
-- Indeks untuk tabel `antrian_sekarang`
--
ALTER TABLE `antrian_sekarang`
  ADD PRIMARY KEY (`id_sekarang`);

--
-- Indeks untuk tabel `kategori_poli`
--
ALTER TABLE `kategori_poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `tjm_menu`
--
ALTER TABLE `tjm_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id_antrian` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `antrian_poli`
--
ALTER TABLE `antrian_poli`
  MODIFY `id_antrian_poli` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `antrian_sekarang`
--
ALTER TABLE `antrian_sekarang`
  MODIFY `id_sekarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kategori_poli`
--
ALTER TABLE `kategori_poli`
  MODIFY `id_poli` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tjm_menu`
--
ALTER TABLE `tjm_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
