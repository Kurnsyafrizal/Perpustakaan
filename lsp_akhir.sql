-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 11 Apr 2019 pada 09.08
-- Versi Server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lsp_akhir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_buku`
--

CREATE TABLE IF NOT EXISTS `daftar_buku` (
  `kode_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`kode_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `daftar_buku`
--

INSERT INTO `daftar_buku` (`kode_buku`, `judul_buku`, `pengarang`, `kategori`) VALUES
(1011, 'Bahasa Indonesia', 'Earlangga', 'Edukasi'),
(1012, 'Bahasa Inggris', 'Earlangga', 'Edukasi'),
(1013, 'Kejuruan', 'Pak Adang', 'Edukasi'),
(12312, 'Matematika', 'Earlangga', 'Edukasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE IF NOT EXISTS `peminjaman` (
  `id_peminjam` int(11) NOT NULL AUTO_INCREMENT,
  `nama_peminjam` varchar(100) NOT NULL,
  `alamat_peminjam` text NOT NULL,
  `tanggal_peminjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `denda` int(11) DEFAULT NULL,
  `status_peminjam` varchar(111) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_peminjam`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_buku`
--

CREATE TABLE IF NOT EXISTS `stock_buku` (
  `nomor_rak` varchar(50) NOT NULL,
  `jumlah_buku` int(11) NOT NULL,
  `kode_buku` int(11) NOT NULL,
  PRIMARY KEY (`kode_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stock_buku`
--

INSERT INTO `stock_buku` (`nomor_rak`, `jumlah_buku`, `kode_buku`) VALUES
('E232', 112, 1011),
('E233', 50, 1012),
('E234', 12, 1013),
('E232', 122, 12312);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `alamat`, `status`) VALUES
(8, 'syafrizal', 'kurniadin1', '123', 'RawaBuaya', 'administrator'),
(10, 'syafrizal', 'kurniadin', '12', 'Cengkareng', 'administrator'),
(11, 'syafrizal', 'admin', '12', 'Cengkareng', 'administrator');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
