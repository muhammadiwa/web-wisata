-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table sitara.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.admin: ~2 rows (approximately)
INSERT INTO `admin` (`id`, `nama`, `email`, `password`, `foto_profil`, `remember_token`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', 'admin@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Super Admin 2', 'admin2@mail.com', '$2y$10$kSvHcLNaK4rk5jHktvTqquZiMgf4bKTFnVgdtapjrZsoIULaHr1K6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table sitara.admin_sk
DROP TABLE IF EXISTS `admin_sk`;
CREATE TABLE IF NOT EXISTS `admin_sk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_sk_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.admin_sk: ~1 rows (approximately)
INSERT INTO `admin_sk` (`id`, `nama`, `email`, `password`, `foto_profil`, `remember_token`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin SK', 'adminsk@mail.com', '$2y$10$kSvHcLNaK4rk5jHktvTqquZiMgf4bKTFnVgdtapjrZsoIULaHr1K6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table sitara.ambil_ijazah
DROP TABLE IF EXISTS `ambil_ijazah`;
CREATE TABLE IF NOT EXISTS `ambil_ijazah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pemohon_id` bigint unsigned NOT NULL,
  `nama_pemilik_ijazah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metode_pengambilan` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Diwakilkan,1=Ambil Sendiri',
  `nama_perwakilan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_ambil` date NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ambil_ijazah_pemohon_id_foreign` (`pemohon_id`),
  CONSTRAINT `ambil_ijazah_pemohon_id_foreign` FOREIGN KEY (`pemohon_id`) REFERENCES `pemohon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.ambil_ijazah: ~1 rows (approximately)
INSERT INTO `ambil_ijazah` (`id`, `pemohon_id`, `nama_pemilik_ijazah`, `metode_pengambilan`, `nama_perwakilan`, `path_surat`, `tanggal_ambil`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(4, 5, 'Surat Keputusan', 0, 'sasa', 'SURAT_KUASA_PENGAMBILAN_IJAZAH_SURATKEPUTUSAN_20230712073542.pdf', '2023-07-10', NULL, NULL, NULL, NULL, '2023-07-12 00:35:42', '2023-07-12 00:35:42');

-- Dumping structure for table sitara.asesor
DROP TABLE IF EXISTS `asesor`;
CREATE TABLE IF NOT EXISTS `asesor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nidn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asesor_nidn_unique` (`nidn`),
  UNIQUE KEY `asesor_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.asesor: ~7 rows (approximately)
INSERT INTO `asesor` (`id`, `nama`, `nidn`, `email`, `password`, `remember_token`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `foto_profil`) VALUES
	(1, 'Asesor 1', '123456', 'asesor1@mail.com', '$2y$10$5/cTn9ZkJ3Uxk5PBFTx6R.L48qVInr59HQ0ZMDzIEQWEClxDINOYG', 'Itceuxg2tAc5LvqlXtHSbkVgdtntGEEYmsDiimFe82MCWsA8xUxWHXRaPgs1', 1, NULL, NULL, NULL, NULL, '2023-09-04 09:23:19', 'd8bXTkVJl0vivAtt_1693819399.png'),
	(2, 'Asesor 2', '123457', 'asesor2@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 2, NULL, NULL, NULL, NULL, '2023-09-04 09:24:15', 'kOTpoiNz9KJwOusc_1693819455.png'),
	(3, 'Asesor 3', '123458', 'asesor3@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Asesor 4', '125486', 'asesor4@mail.com', '$2y$10$kSvHcLNaK4rk5jHktvTqquZiMgf4bKTFnVgdtapjrZsoIULaHr1K6', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 21:00:17', NULL),
	(5, 'Asesor 5', '154786', 'asesor5@mail.com', '$2y$10$V.rDDrvp7lvnwk4WaMedb.CvIlEa7xRCrqiTDCApIofcITUUA35P2', NULL, NULL, NULL, NULL, '2023-06-11 21:02:25', '2023-06-11 21:02:16', '2023-06-11 21:02:25', NULL),
	(6, 'Asesor 5', '123486', 'asesor44@mail.com', '$2y$10$HCqA33VlS45/QEEhMvgR5OcwB7OjdQMyWircznrU8lD5fRwsfRt16', NULL, NULL, NULL, NULL, NULL, '2023-06-11 21:31:20', '2023-06-12 00:32:40', NULL),
	(7, '123486', 'Asesor 4', 'asesor45@mail.com', '$2y$10$V.rDDrvp7lvnwk4WaMedb.CvIlEa7xRCrqiTDCApIofcITUUA35P2', NULL, NULL, NULL, NULL, '2023-06-11 23:26:42', '2023-06-11 23:20:29', '2023-06-11 23:26:42', NULL);

-- Dumping structure for table sitara.bimas
DROP TABLE IF EXISTS `bimas`;
CREATE TABLE IF NOT EXISTS `bimas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bimas_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.bimas: ~4 rows (approximately)
INSERT INTO `bimas` (`id`, `nama`, `email`, `password`, `foto_profil`, `remember_token`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Bimas 1', 'bimas1@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tRO0Sy7S9hNBwWMu_1693830198.png', 'cjstKIhzI9LszsP71vVBjO76ByJHaTpoS4CuwVy1G4fk9slTj0D25ZR14Dou', NULL, NULL, NULL, NULL, NULL, '2023-09-04 12:23:18'),
	(2, 'Bimas 2', 'bimas2@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Bimas 3', 'bimas3@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Bimas 4', 'bimas4@mail.com', '$2y$10$J4epEOr.0.BbKQR/KEIdR.EE6orQNSCu6ljlXVNsb23Axitp55qcW', 'xJKs4LK3q2QGIFRJ_1689129970.png', NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-11 19:46:10');

-- Dumping structure for table sitara.detail_asesor
DROP TABLE IF EXISTS `detail_asesor`;
CREATE TABLE IF NOT EXISTS `detail_asesor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `is_ketua` tinyint(1) NOT NULL DEFAULT '0',
  `permohonan_id` bigint unsigned NOT NULL,
  `asesor_id` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_asesor_permohonan_id_foreign` (`permohonan_id`),
  KEY `detail_asesor_asesor_id_foreign` (`asesor_id`),
  CONSTRAINT `detail_asesor_asesor_id_foreign` FOREIGN KEY (`asesor_id`) REFERENCES `asesor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_asesor_permohonan_id_foreign` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.detail_asesor: ~6 rows (approximately)
INSERT INTO `detail_asesor` (`id`, `is_ketua`, `permohonan_id`, `asesor_id`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(15, 0, 7, 1, NULL, NULL, NULL, NULL, '2023-08-30 20:53:07', '2023-08-30 20:53:07'),
	(16, 0, 7, 2, NULL, NULL, NULL, NULL, '2023-08-30 20:53:07', '2023-08-30 20:53:07'),
	(17, 0, 7, 3, NULL, NULL, NULL, NULL, '2023-08-30 20:53:07', '2023-08-30 20:53:07'),
	(18, 0, 8, 1, NULL, NULL, NULL, NULL, '2023-08-31 04:20:09', '2023-08-31 04:20:09'),
	(19, 0, 8, 2, NULL, NULL, NULL, NULL, '2023-08-31 04:20:09', '2023-08-31 04:20:09'),
	(20, 0, 8, 3, NULL, NULL, NULL, NULL, '2023-08-31 04:20:09', '2023-08-31 04:20:09');

-- Dumping structure for table sitara.dokumen_permohonan
DROP TABLE IF EXISTS `dokumen_permohonan`;
CREATE TABLE IF NOT EXISTS `dokumen_permohonan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permohonan_id` bigint unsigned NOT NULL,
  `jenis_dokumen_id` bigint unsigned NOT NULL,
  `dokumen_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint unsigned NOT NULL COMMENT '0=Ditolak,1=Diproses,2=Disetujui,3=Direvisi',
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dokumen_permohonan_permohonan_id_foreign` (`permohonan_id`),
  KEY `dokumen_permohonan_jenis_dokumen_id_foreign` (`jenis_dokumen_id`),
  CONSTRAINT `dokumen_permohonan_jenis_dokumen_id_foreign` FOREIGN KEY (`jenis_dokumen_id`) REFERENCES `jenis_dokumen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dokumen_permohonan_permohonan_id_foreign` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.dokumen_permohonan: ~18 rows (approximately)
INSERT INTO `dokumen_permohonan` (`id`, `permohonan_id`, `jenis_dokumen_id`, `dokumen_path`, `status`, `keterangan`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(75, 7, 1, 'foto_itb_31-08-2023_58l1q.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(76, 7, 2, 'kpak_itb_31-08-2023_7kkiz.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(77, 7, 4, 'pvln_itb_31-08-2023_ho3m3.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(78, 7, 5, 'sprp_itb_31-08-2023_y9slq.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(79, 7, 3, 'sloa_itb_31-08-2023_vi0es.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(80, 7, 10, 'tnss_itb_31-08-2023_2wmvm.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(81, 7, 11, 'skss_itb_31-08-2023_1dmbk.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(82, 7, 12, 'ijss_itb_31-08-2023_rqixr.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(83, 7, 13, 'tass_itb_31-08-2023_lngts.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:52:37'),
	(84, 8, 1, 'foto_unpad_31-08-2023_zpnit.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(85, 8, 2, 'kpak_unpad_31-08-2023_hb0bs.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(86, 8, 4, 'pvln_unpad_31-08-2023_c09md.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(87, 8, 5, 'sprp_unpad_31-08-2023_vdnba.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(88, 8, 3, 'sloa_unpad_31-08-2023_sy5r7.jpg', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(89, 8, 10, 'tnss_unpad_31-08-2023_qxael.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(90, 8, 11, 'skss_unpad_31-08-2023_d06vw.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(91, 8, 12, 'ijss_unpad_31-08-2023_wwcqx.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31'),
	(92, 8, 13, 'tass_unpad_31-08-2023_zzwcn.png', 2, NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:18:31');

-- Dumping structure for table sitara.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table sitara.fakultas
DROP TABLE IF EXISTS `fakultas`;
CREATE TABLE IF NOT EXISTS `fakultas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.fakultas: ~7 rows (approximately)
INSERT INTO `fakultas` (`id`, `nama`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Fakultas Teknik', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Fakultas Kedokteran', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Fakultas Keguruan', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Fakultas Bahasa', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Fakultas Teknologi Informasi', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'Fakultas Perikanan', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Fakultas Perikanan Ayam', NULL, NULL, NULL, NULL, NULL, '2023-06-12 00:11:22');

-- Dumping structure for table sitara.jenis_dokumen
DROP TABLE IF EXISTS `jenis_dokumen`;
CREATE TABLE IF NOT EXISTS `jenis_dokumen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `required_if` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `jenis_dokumen_chk_1` CHECK (json_valid(`required_if`))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.jenis_dokumen: ~23 rows (approximately)
INSERT INTO `jenis_dokumen` (`id`, `kode`, `nama`, `is_required`, `required_if`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'FOTO', 'Pas Foto Ukuran 4x6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'KPAK', 'Katalog/Pedoman Akademik yang memuat kurikulum pendidikan', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'SLOA', 'Scan Letter of Acceptance (LoA) atau bukti penerimaan sebagai mahasiswa dari Perguruan Tinggi asal', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'PVLN', 'Paspor dan Visa selama belajar di luar negeri', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'SPRP', 'Surat Perjanjian dari Sponsor/ Resident Permit / Dokumen sejenisnya untuk izin tinggal bagi pemohon yang studi dengan model full time study', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'STIB', 'Dokumen Tambahan Khusus PNS: Surat tugas/ izin belajar yang dikeluarkan oleh Sekretariat Negara atau Pejabat berwenang', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'SSTP', 'Dokumen Tambahan Khusus WNA: Surat dari sponsor di Indonesia yang menjelaskan tujuan dilakukan penyetaraan', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'TNNA', 'Dokumen Tambahan Khusus WNA: Transkrip nilai Akademik harus dilegalisir sesuai dengan ketentuan hukum pada negara tempat ijazah diterbitkan', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'SKTP', 'Dokumen Scan E-KTP', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'TNSS', 'Transkrip Nilai S1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'SKSS', 'SK Penyetaraan Ijazah S1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'IJSS', 'Scan Ijazah S1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'TASS', 'Tugas Akhir S1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'TNSD', 'Transkrip Nilai S2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'SKSD', 'SK Penyetaraan Ijazah S2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'IJSD', 'Scan Ijazah S2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 'TASD', 'Tugas Akhir S2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'TNST', 'Transkrip Nilai S3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 'SKST', 'SK Penyetaraan Ijazah S3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 'IJST', 'Scan Ijazah S3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 'TAST', 'Tugas Akhir S3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'PIST', 'Publikasi Ilmiah S3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'SKPI', 'Surat Kuasa Pengambilan Ijazah', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table sitara.jenjang
DROP TABLE IF EXISTS `jenjang`;
CREATE TABLE IF NOT EXISTS `jenjang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.jenjang: ~3 rows (approximately)
INSERT INTO `jenjang` (`id`, `kode`, `nama`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'S1', 'Sarjana', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(2, 'S2', 'Magister', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(3, 'S3', 'Doktor', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53');

-- Dumping structure for table sitara.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.jobs: ~0 rows (approximately)

-- Dumping structure for table sitara.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.migrations: ~32 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2020_07_11_064515_create_negara_table', 1),
	(6, '2020_07_11_065430_create_jenjang_table', 1),
	(7, '2020_07_11_150402_create_fakultas_table', 1),
	(8, '2020_07_11_164641_create_program_studi_table', 1),
	(9, '2020_07_14_131115_create_pimpinan_table', 1),
	(10, '2022_07_09_153110_create_jenis_dokumen_table', 1),
	(11, '2022_07_09_153220_create_pemohon_table', 1),
	(12, '2022_07_09_153336_create_admin_table', 1),
	(13, '2022_07_09_153336_create_bimas_table', 1),
	(14, '2022_07_09_153412_create_asesor_table', 1),
	(15, '2022_07_10_134550_create_permohonan_table', 1),
	(16, '2022_07_10_134831_create_riwayat_permohonan_table', 1),
	(17, '2022_07_10_135057_create_penilaian_table', 1),
	(18, '2022_07_10_135356_create_detail_asesor_table', 1),
	(19, '2022_07_10_135530_create_dokumen_permohonan_table', 1),
	(20, '2022_07_10_140448_create_riwayat_pendidikan_table', 1),
	(21, '2022_07_10_140511_create_riwayat_pekerjaan_table', 1),
	(22, '2022_07_13_061601_tambah_foto_profil_pemohon', 1),
	(23, '2022_07_14_141921_tambah_foto_profil_asesor', 1),
	(24, '2022_07_14_164755_tambah_foto_profil_pimpinan', 1),
	(25, '2022_07_18_050110_create_setting_table', 1),
	(26, '2022_07_18_084321_create_jobs_table', 1),
	(27, '2022_10_28_210957_create_ambil_ijazah_table', 1),
	(28, '2022_11_24_194434_create_admin_sk_table', 1),
	(29, '2023_07_11_034608_add_details_to_pemohon_table', 2),
	(30, '2023_07_11_035730_add_details_to_pemohon_table', 3),
	(31, '2023_07_11_035730_add_detail_to_pemohon_table', 4),
	(32, '2023_07_11_040946_add_details_to_pemohon_table', 5);

-- Dumping structure for table sitara.negara
DROP TABLE IF EXISTS `negara`;
CREATE TABLE IF NOT EXISTS `negara` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.negara: ~245 rows (approximately)
INSERT INTO `negara` (`id`, `nama`, `kode`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Afghanistan', 'AF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(2, 'Ã…land Islands', 'AX', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(3, 'Albania', 'AL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(4, 'Algeria', 'DZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(5, 'American Samoa', 'AS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(6, 'Andorra', 'AD', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(7, 'Angola', 'AO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(8, 'Anguilla', 'AI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(9, 'Antarctica', 'AQ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(10, 'Antigua and Barbuda', 'AG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(11, 'Argentina', 'AR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(12, 'Armenia', 'AM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(13, 'Aruba', 'AW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(14, 'Australia', 'AU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(15, 'Austria', 'AT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(16, 'Azerbaijan', 'AZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(17, 'Bahamas', 'BS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(18, 'Bahrain', 'BH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(19, 'Bangladesh', 'BD', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(20, 'Barbados', 'BB', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(21, 'Belarus', 'BY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(22, 'Belgium', 'BE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(23, 'Belize', 'BZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(24, 'Benin', 'BJ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(25, 'Bermuda', 'BM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(26, 'Bhutan', 'BT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(27, 'Bolivia', 'BO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(28, 'Bosnia and Herzegovina', 'BA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(29, 'Botswana', 'BW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(30, 'Bouvet Island', 'BV', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(31, 'Brazil', 'BR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(32, 'British Indian Ocean Territory', 'IO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(33, 'Brunei Darussalam', 'BN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(34, 'Bulgaria', 'BG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(35, 'Burkina Faso', 'BF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(36, 'Burundi', 'BI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(37, 'Cambodia', 'KH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(38, 'Cameroon', 'CM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(39, 'Canada', 'CA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(40, 'Cape Verde', 'CV', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(41, 'Cayman Islands', 'KY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(42, 'Central African Republic', 'CF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(43, 'Chad', 'TD', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(44, 'Chile', 'CL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(45, 'China', 'CN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(46, 'Christmas Island', 'CX', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(47, 'Cocos (Keeling) Islands', 'CC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(48, 'Colombia', 'CO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(49, 'Comoros', 'KM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(50, 'Congo', 'CG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(51, 'Congo, The Democratic Republic of the', 'CD', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(52, 'Cook Islands', 'CK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(53, 'Costa Rica', 'CR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(54, 'Cote D"Ivoire', 'CI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(55, 'Croatia', 'HR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(56, 'Cuba', 'CU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(57, 'Cyprus', 'CY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(58, 'Czech Republic', 'CZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(59, 'Denmark', 'DK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(60, 'Djibouti', 'DJ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(61, 'Dominica', 'DM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(62, 'Dominican Republic', 'DO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(63, 'Ecuador', 'EC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(64, 'Egypt', 'EG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(65, 'El Salvador', 'SV', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(66, 'Equatorial Guinea', 'GQ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(67, 'Eritrea', 'ER', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(68, 'Estonia', 'EE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(69, 'Ethiopia', 'ET', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(70, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(71, 'Faroe Islands', 'FO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(72, 'Fiji', 'FJ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(73, 'Finland', 'FI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(74, 'France', 'FR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(75, 'French Guiana', 'GF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(76, 'French Polynesia', 'PF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(77, 'French Southern Territories', 'TF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(78, 'Gabon', 'GA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(79, 'Gambia', 'GM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(80, 'Georgia', 'GE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(81, 'Germany', 'DE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(82, 'Ghana', 'GH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(83, 'Gibraltar', 'GI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(84, 'Greece', 'GR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(85, 'Greenland', 'GL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(86, 'Grenada', 'GD', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(87, 'Guadeloupe', 'GP', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(88, 'Guam', 'GU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(89, 'Guatemala', 'GT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(90, 'Guernsey', 'GG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(91, 'Guinea', 'GN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(92, 'Guinea-Bissau', 'GW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(93, 'Guyana', 'GY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(94, 'Haiti', 'HT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(95, 'Heard Island and Mcdonald Islands', 'HM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(96, 'Holy See (Vatican City State)', 'VA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(97, 'Honduras', 'HN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(98, 'Hong Kong', 'HK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(99, 'Hungary', 'HU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(100, 'Iceland', 'IS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(101, 'India', 'IN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(102, 'Indonesia', 'ID', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(103, 'Iran, Islamic Republic Of', 'IR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(104, 'Iraq', 'IQ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(105, 'Ireland', 'IE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(106, 'Isle of Man', 'IM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(107, 'Israel', 'IL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(108, 'Italy', 'IT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(109, 'Jamaica', 'JM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(110, 'Japan', 'JP', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(111, 'Jersey', 'JE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(112, 'Jordan', 'JO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(113, 'Kazakhstan', 'KZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(114, 'Kenya', 'KE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(115, 'Kiribati', 'KI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(116, 'Democratic People"s Republic of Korea', 'KP', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(117, 'Korea, Republic of', 'KR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(118, 'Kosovo', 'XK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(119, 'Kuwait', 'KW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(120, 'Kyrgyzstan', 'KG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(121, 'Lao People"s Democratic Republic', 'LA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(122, 'Latvia', 'LV', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(123, 'Lebanon', 'LB', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(124, 'Lesotho', 'LS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(125, 'Liberia', 'LR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(126, 'Libyan Arab Jamahiriya', 'LY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(127, 'Liechtenstein', 'LI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(128, 'Lithuania', 'LT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(129, 'Luxembourg', 'LU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(130, 'Macao', 'MO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(131, 'Macedonia, The Former Yugoslav Republic of', 'MK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(132, 'Madagascar', 'MG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(133, 'Malawi', 'MW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(134, 'Malaysia', 'MY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(135, 'Maldives', 'MV', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(136, 'Mali', 'ML', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(137, 'Malta', 'MT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(138, 'Marshall Islands', 'MH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(139, 'Martinique', 'MQ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(140, 'Mauritania', 'MR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(141, 'Mauritius', 'MU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(142, 'Mayotte', 'YT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(143, 'Mexico', 'MX', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(144, 'Micronesia, Federated States of', 'FM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(145, 'Moldova, Republic of', 'MD', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(146, 'Monaco', 'MC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(147, 'Mongolia', 'MN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(148, 'Montenegro', 'ME', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(149, 'Montserrat', 'MS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(150, 'Morocco', 'MA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(151, 'Mozambique', 'MZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(152, 'Myanmar', 'MM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(153, 'Namibia', 'NA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(154, 'Nauru', 'NR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(155, 'Nepal', 'NP', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(156, 'Netherlands', 'NL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(157, 'Netherlands Antilles', 'AN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(158, 'New Caledonia', 'NC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(159, 'New Zealand', 'NZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(160, 'Nicaragua', 'NI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(161, 'Niger', 'NE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(162, 'Nigeria', 'NG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(163, 'Niue', 'NU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(164, 'Norfolk Island', 'NF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(165, 'Northern Mariana Islands', 'MP', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(166, 'Norway', 'NO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(167, 'Oman', 'OM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(168, 'Pakistan', 'PK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(169, 'Palau', 'PW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(170, 'Palestinian Territory, Occupied', 'PS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(171, 'Panama', 'PA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(172, 'Papua New Guinea', 'PG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(173, 'Paraguay', 'PY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(174, 'Peru', 'PE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(175, 'Philippines', 'PH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(176, 'Pitcairn', 'PN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(177, 'Poland', 'PL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(178, 'Portugal', 'PT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(179, 'Puerto Rico', 'PR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(180, 'Qatar', 'QA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(181, 'Reunion', 'RE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(182, 'Romania', 'RO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(183, 'Russian Federation', 'RU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(184, 'Rwanda', 'RW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(185, 'Saint Helena', 'SH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(186, 'Saint Kitts and Nevis', 'KN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(187, 'Saint Lucia', 'LC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(188, 'Saint Pierre and Miquelon', 'PM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(189, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(190, 'Samoa', 'WS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(191, 'San Marino', 'SM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(192, 'Sao Tome and Principe', 'ST', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(193, 'Saudi Arabia', 'SA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(194, 'Senegal', 'SN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(195, 'Serbia', 'RS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(196, 'Seychelles', 'SC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(197, 'Sierra Leone', 'SL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(198, 'Singapore', 'SG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(199, 'Slovakia', 'SK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(200, 'Slovenia', 'SI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(201, 'Solomon Islands', 'SB', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(202, 'Somalia', 'SO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(203, 'South Africa', 'ZA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(204, 'South Georgia and the South Sandwich Islands', 'GS', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(205, 'Spain', 'ES', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(206, 'Sri Lanka', 'LK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(207, 'Sudan', 'SD', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(208, 'Suriname', 'SR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(209, 'Svalbard and Jan Mayen', 'SJ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(210, 'Swaziland', 'SZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(211, 'Sweden', 'SE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(212, 'Switzerland', 'CH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(213, 'Syrian Arab Republic', 'SY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(214, 'Taiwan', 'TW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(215, 'Tajikistan', 'TJ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(216, 'Tanzania, United Republic of', 'TZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(217, 'Thailand', 'TH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(218, 'Timor-Leste', 'TL', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(219, 'Togo', 'TG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(220, 'Tokelau', 'TK', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(221, 'Tonga', 'TO', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(222, 'Trinidad and Tobago', 'TT', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(223, 'Tunisia', 'TN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(224, 'Turkey', 'TR', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(225, 'Turkmenistan', 'TM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(226, 'Turks and Caicos Islands', 'TC', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(227, 'Tuvalu', 'TV', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(228, 'Uganda', 'UG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(229, 'Ukraine', 'UA', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(230, 'United Arab Emirates', 'AE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(231, 'United Kingdom', 'GB', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(232, 'United States', 'US', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(233, 'United States Minor Outlying Islands', 'UM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(234, 'Uruguay', 'UY', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(235, 'Uzbekistan', 'UZ', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(236, 'Vanuatu', 'VU', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(237, 'Venezuela', 'VE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(238, 'Viet Nam', 'VN', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(239, 'Virgin Islands, British', 'VG', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(240, 'Virgin Islands, U.S.', 'VI', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(241, 'Wallis and Futuna', 'WF', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(242, 'Western Sahara', 'EH', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(243, 'Yemen', 'YE', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(244, 'Zambia', 'ZM', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53'),
	(245, 'Zimbabwe', 'ZW', NULL, NULL, NULL, NULL, '2023-03-05 21:29:53', '2023-03-05 21:29:53');

-- Dumping structure for table sitara.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.password_resets: ~0 rows (approximately)

-- Dumping structure for table sitara.pemohon
DROP TABLE IF EXISTS `pemohon`;
CREATE TABLE IF NOT EXISTS `pemohon` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nidn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` enum('l','p') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `nama_ibu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pemohon_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.pemohon: ~5 rows (approximately)
INSERT INTO `pemohon` (`id`, `nama`, `email`, `password`, `remember_token`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `foto_profil`, `nidn`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nama_ibu`, `no_hp`, `alamat`) VALUES
	(1, 'Pemohon 1', 'pemohon1@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Pemohon 2', 'pemohon2@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Pemohon 3', 'pemohon3@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Pemohon 4', 'pemohon4@mail.com', '$2y$10$kSvHcLNaK4rk5jHktvTqquZiMgf4bKTFnVgdtapjrZsoIULaHr1K6', '0i2bPuuAYgNgO91SwnPSzdGbrxHO3TUFcT7ddr4fkdWuHo1INkCjpACQ1E2B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Joshua Sihombing', 'josh@mail.com', '$2y$10$Vp4n6ATMwOdsFfUorO2Z0eWCn3s4JJkgF/yQMcPJfRjdUMVpaEL9S', NULL, NULL, NULL, NULL, NULL, '2023-07-10 20:33:11', '2023-07-13 20:27:08', '1pHHMr0SKv12FCfN_1689305228.png', '999994654687', 'l', 'Cilacap', '2023-07-11', 'Micel', '12345678', 'Kedaung');

-- Dumping structure for table sitara.penilaian
DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE IF NOT EXISTS `penilaian` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permohonan_id` bigint unsigned NOT NULL,
  `asesor_id` bigint unsigned NOT NULL,
  `ijzh_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah',
  `ijzh_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah',
  `ijzh_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah',
  `ijzh_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah',
  `tnak_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik',
  `tnak_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik',
  `tnak_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik',
  `tnak_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik',
  `ijjs_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah Asli Jenjang Sebelumnya',
  `ijjs_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah Asli Jenjang Sebelumnya',
  `ijjs_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah Asli Jenjang Sebelumnya',
  `ijjs_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ijazah Asli Jenjang Sebelumnya',
  `skps_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SK Penyetaraan Jenjang Sebelumnya',
  `skps_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SK Penyetaraan Jenjang Sebelumnya',
  `skps_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SK Penyetaraan Jenjang Sebelumnya',
  `skps_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SK Penyetaraan Jenjang Sebelumnya',
  `tnas_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik Jenjang Sebelumnya',
  `tnas_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik Jenjang Sebelumnya',
  `tnas_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik Jenjang Sebelumnya',
  `tnas_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip Nilai Akademik Jenjang Sebelumnya',
  `dtts_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Disertasi/Tesis/Tugas Akhir atau Skripsi',
  `dtts_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Disertasi/Tesis/Tugas Akhir atau Skripsi',
  `dtts_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Disertasi/Tesis/Tugas Akhir atau Skripsi',
  `dtts_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Disertasi/Tesis/Tugas Akhir atau Skripsi',
  `jist_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Jurnal Internasional bagi Jenjang S3',
  `jist_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Jurnal Internasional bagi Jenjang S3',
  `jist_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Jurnal Internasional bagi Jenjang S3',
  `jist_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Jurnal Internasional bagi Jenjang S3',
  `skpi_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Keterangan bagi Perguruan Tinggi yang tidak mensyaratkan Publikasi Ilmiah',
  `skpi_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Keterangan bagi Perguruan Tinggi yang tidak mensyaratkan Publikasi Ilmiah',
  `skpi_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Keterangan bagi Perguruan Tinggi yang tidak mensyaratkan Publikasi Ilmiah',
  `skpi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Keterangan bagi Perguruan Tinggi yang tidak mensyaratkan Publikasi Ilmiah',
  `kpap_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Katalog/Pedoman Akademik yang memuat kurikulum pendidikan',
  `kpap_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Katalog/Pedoman Akademik yang memuat kurikulum pendidikan',
  `kpap_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Katalog/Pedoman Akademik yang memuat kurikulum pendidikan',
  `kpap_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Katalog/Pedoman Akademik yang memuat kurikulum pendidikan',
  `pvln_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Paspor dan Visa selama belajar di luar negeri',
  `pvln_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Paspor dan Visa selama belajar di luar negeri',
  `pvln_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Paspor dan Visa selama belajar di luar negeri',
  `pvln_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Paspor dan Visa selama belajar di luar negeri',
  `sprp_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Perjanjian dari Sponsor/ Resident Permit bagi full time study',
  `sprp_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Perjanjian dari Sponsor/ Resident Permit bagi full time study',
  `sprp_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Perjanjian dari Sponsor/ Resident Permit bagi full time study',
  `sprp_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat Perjanjian dari Sponsor/ Resident Permit bagi full time study',
  `stib_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat tugas/ izin belajar bagi PNS',
  `stib_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat tugas/ izin belajar bagi PNS',
  `stib_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat tugas/ izin belajar bagi PNS',
  `stib_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat tugas/ izin belajar bagi PNS',
  `ssia_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat dari sponsor di Indonesia yang menjelaskan tujuan dilakukan penyetaraan',
  `ssia_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat dari sponsor di Indonesia yang menjelaskan tujuan dilakukan penyetaraan',
  `ssia_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat dari sponsor di Indonesia yang menjelaskan tujuan dilakukan penyetaraan',
  `ssia_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Surat dari sponsor di Indonesia yang menjelaskan tujuan dilakukan penyetaraan',
  `tnaa_o` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip nilai Akademik harus dilegalisir sesuai dengan ketentuan hukum pada negara tempat ijazah diterbitkan (khusus WNA)',
  `tnaa_k` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip nilai Akademik harus dilegalisir sesuai dengan ketentuan hukum pada negara tempat ijazah diterbitkan (khusus WNA)',
  `tnaa_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip nilai Akademik harus dilegalisir sesuai dengan ketentuan hukum pada negara tempat ijazah diterbitkan (khusus WNA)',
  `tnaa_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transkrip nilai Akademik harus dilegalisir sesuai dengan ketentuan hukum pada negara tempat ijazah diterbitkan (khusus WNA)',
  `judul_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Judul TA,Skripsi,Disertasi',
  `penilaian_ta` tinyint unsigned NOT NULL COMMENT '4=Sangat Bermutu,3=Bermutu,2=Kurang Bermutu,1=Tidak Bermutu',
  `keputusan` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Tidak Diterima,1=Diterima',
  `gelar_disetarakan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dapat disetarakan dengan gelar',
  `gelar_digunakan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gelar yang akan digunakan',
  `bidang_studi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dasar_keputusan` text COLLATE utf8mb4_unicode_ci,
  `path_lembar_penilaian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penilaian_permohonan_id_foreign` (`permohonan_id`),
  KEY `penilaian_asesor_id_foreign` (`asesor_id`),
  CONSTRAINT `penilaian_asesor_id_foreign` FOREIGN KEY (`asesor_id`) REFERENCES `asesor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_permohonan_id_foreign` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.penilaian: ~3 rows (approximately)
INSERT INTO `penilaian` (`id`, `permohonan_id`, `asesor_id`, `ijzh_o`, `ijzh_k`, `ijzh_m`, `ijzh_ket`, `tnak_o`, `tnak_k`, `tnak_m`, `tnak_ket`, `ijjs_o`, `ijjs_k`, `ijjs_m`, `ijjs_ket`, `skps_o`, `skps_k`, `skps_m`, `skps_ket`, `tnas_o`, `tnas_k`, `tnas_m`, `tnas_ket`, `dtts_o`, `dtts_k`, `dtts_m`, `dtts_ket`, `jist_o`, `jist_k`, `jist_m`, `jist_ket`, `skpi_o`, `skpi_k`, `skpi_m`, `skpi_ket`, `kpap_o`, `kpap_k`, `kpap_m`, `kpap_ket`, `pvln_o`, `pvln_k`, `pvln_m`, `pvln_ket`, `sprp_o`, `sprp_k`, `sprp_m`, `sprp_ket`, `stib_o`, `stib_k`, `stib_m`, `stib_ket`, `ssia_o`, `ssia_k`, `ssia_m`, `ssia_ket`, `tnaa_o`, `tnaa_k`, `tnaa_m`, `tnaa_ket`, `judul_ta`, `penilaian_ta`, `keputusan`, `gelar_disetarakan`, `gelar_digunakan`, `bidang_studi`, `dasar_keputusan`, `path_lembar_penilaian`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(16, 7, 1, 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Bermutu', 'Bermutu', 'a', 'Bermutu', 'Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Bermutu', 'Bermutu', 'a', 'Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Bermutu', 'Sangat Bermutu', 'a', 'apasih', 4, 1, 'Hokage', 'Hokage ke 5', 'Kagebunshin', 'aseek', 'LEMBAR_CHECKLIST_KELENGKAPAN_DOKUMEN_AGUS_Asesor_1_Asesor_1.pdf', 1, 1, NULL, NULL, '2023-08-30 20:55:41', '2023-08-30 20:55:41'),
	(28, 8, 2, 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Bermutu', 'Bermutu', 'a', 'Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'a', 'aaa', 4, 1, 'aa', 'aa', 'aa', 'aa', 'LEMBAR_CHECKLIST_KELENGKAPAN_DOKUMEN_JONI_Asesor_2_Asesor_2.pdf', 2, 2, NULL, NULL, '2023-09-01 02:39:04', '2023-09-01 02:39:04'),
	(50, 8, 1, 'Bermutu', 'Bermutu', 'Sangat Bermutu', 'aa', 'Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Bermutu', 'Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Sangat Bermutu', 'Sangat Bermutu', 'aa', 'Sangat Bermutu', 'Bermutu', 'Sangat Bermutu', 'aa', 'aa', 4, 1, 'aa', 'aa', 'aa', 'aa', 'LEMBAR_CHECKLIST_KELENGKAPAN_DOKUMEN_JONI_Asesor_1_Asesor_1.pdf', 1, 1, NULL, NULL, '2023-09-18 08:59:59', '2023-09-18 08:59:59');

-- Dumping structure for table sitara.permohonan
DROP TABLE IF EXISTS `permohonan`;
CREATE TABLE IF NOT EXISTS `permohonan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pemohon_id` bigint unsigned NOT NULL,
  `fakultas_id` bigint unsigned NOT NULL,
  `negara_id` bigint unsigned NOT NULL,
  `jenjang_id` bigint unsigned NOT NULL,
  `prodi_id` bigint unsigned NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_pemohon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'L=Laki-laki,P=Perempuan',
  `is_pns` tinyint(1) NOT NULL DEFAULT '0',
  `is_wna` tinyint(1) NOT NULL DEFAULT '0',
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usulan_penyetaraan` enum('slta','s1','s2','s3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `akreditasi_pt` tinyint unsigned NOT NULL COMMENT '1=A,2=B,3=C,4=Unggul,5=Terakreditasi,6=Tidak Terakreditasi',
  `website_pt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_masuk_pt` year NOT NULL,
  `tahun_lulus_pt` year NOT NULL,
  `gelar_pt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_ijazah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_terbit_ijazah` date NOT NULL,
  `nomor_sk_penyetaraan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `judul_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya_pendidikan` tinyint unsigned NOT NULL COMMENT '1=Biaya Sendiri,2=Beasiswa,3=Lainnya',
  `hasil_verifikasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disposisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekomendasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint unsigned NOT NULL COMMENT '1=Pemohon Mengajukan Penyetaraan,2=Request Revisi Permohonan Pengajuan,3=Pemohon Telah Merevisi Permohonan,4=Tim Asesor Menilai Ijazah,5=Tim Asesor Telah Mengirim Hasil Penilaian,6=Pengajuan Penyetaraan Disetujui,7=Pengajuan Penyetaraan Ditolak',
  `path_bast` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_sk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permohonan_pemohon_id_foreign` (`pemohon_id`),
  KEY `permohonan_fakultas_id_foreign` (`fakultas_id`),
  KEY `permohonan_negara_id_foreign` (`negara_id`),
  KEY `permohonan_jenjang_id_foreign` (`jenjang_id`),
  KEY `permohonan_prodi_id_foreign` (`prodi_id`),
  CONSTRAINT `permohonan_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permohonan_jenjang_id_foreign` FOREIGN KEY (`jenjang_id`) REFERENCES `jenjang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permohonan_negara_id_foreign` FOREIGN KEY (`negara_id`) REFERENCES `negara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permohonan_pemohon_id_foreign` FOREIGN KEY (`pemohon_id`) REFERENCES `pemohon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permohonan_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `program_studi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.permohonan: ~2 rows (approximately)
INSERT INTO `permohonan` (`id`, `pemohon_id`, `fakultas_id`, `negara_id`, `jenjang_id`, `prodi_id`, `nip`, `nama_pemohon`, `jenis_kelamin`, `is_pns`, `is_wna`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `telepon`, `usulan_penyetaraan`, `nama_pt`, `akreditasi_pt`, `website_pt`, `tahun_masuk_pt`, `tahun_lulus_pt`, `gelar_pt`, `nomor_ijazah`, `tanggal_terbit_ijazah`, `nomor_sk_penyetaraan`, `judul_ta`, `biaya_pendidikan`, `hasil_verifikasi`, `disposisi`, `rekomendasi`, `status`, `path_bast`, `path_sk`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(7, 1, 1, 1, 1, 3, '1234567890123456', 'Agus', 'L', 0, 0, 'Cilacap', '2023-08-01', 'Bolang', '81294075513', 'slta', 'ITB', 1, 'lupa', '2020', '2023', 'Hokage', '13246548', '2023-08-30', NULL, 'Membuat aplikasi penghasil uang', 1, NULL, NULL, NULL, 6, NULL, NULL, 1, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:55:41'),
	(8, 1, 1, 1, 1, 3, '1234564694646498', 'Joni', 'L', 0, 0, 'Medan', '2023-08-01', 'Asad', '81294075513', 'slta', 'Unpad', 1, 'lupa', '2020', '2023', 'Raja Bajaklaut', '13246548', '2023-08-16', '123456789451265', 'Membuat aplikasi penghasil uang', 1, NULL, NULL, NULL, 7, 'BERITA_ACARA_SERAH_TERIMA_JONI_20230831111501.pdf', NULL, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-09-05 11:57:33');

-- Dumping structure for table sitara.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table sitara.pimpinan
DROP TABLE IF EXISTS `pimpinan`;
CREATE TABLE IF NOT EXISTS `pimpinan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pimpinan_nip_unique` (`nip`),
  UNIQUE KEY `pimpinan_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.pimpinan: ~7 rows (approximately)
INSERT INTO `pimpinan` (`id`, `nama`, `nip`, `email`, `password`, `remember_token`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `foto_profil`) VALUES
	(1, 'Pimpinan 1', '11111', 'pimpinan1@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Pimpinan 2', '22222', 'pimpinan2@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Pimpinan 3', '33333', 'pimpinan3@mail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Pimpinan 4', '44444', 'pimpinan4@mail.com', '$2y$10$kSvHcLNaK4rk5jHktvTqquZiMgf4bKTFnVgdtapjrZsoIULaHr1K6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Pimpinan 55', '55555', 'pimpinan5@mail.com', '$2y$10$WqoEa0ojx1/IF275wWRMEuV6EaCn/H5F36KzCSbg.v1EjIa9Q7S.i', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 21:04:58', NULL),
	(6, 'Pimpinan 55', '1234564694646498', 'pimpinan55@mail.com', '$2y$10$Lea8/lVpS9BPCptylkqlIuoTM86SwV/Li4fAjhTWFJOx4iyKo.gCa', NULL, NULL, NULL, NULL, '2023-06-11 21:17:31', NULL, '2023-06-11 21:17:31', NULL),
	(7, 'Pimpinan 55', '555555', 'pimpinan555@mail.com', '$2y$10$3RJzDUEYS4ItvjhJkoIjt.Fib1E5KJw/oS6cGmHeSy0GfYxNVsA9W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table sitara.program_studi
DROP TABLE IF EXISTS `program_studi`;
CREATE TABLE IF NOT EXISTS `program_studi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.program_studi: ~7 rows (approximately)
INSERT INTO `program_studi` (`id`, `nama`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Teknik Industri', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Teknik Kimia', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Teknik Nuklir', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Teknik Informatika', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Teknik Pertambangan', NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'Teknik Komputer', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'Teknik Fisika', NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table sitara.riwayat_pekerjaan
DROP TABLE IF EXISTS `riwayat_pekerjaan`;
CREATE TABLE IF NOT EXISTS `riwayat_pekerjaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pemohon_id` bigint unsigned NOT NULL,
  `jenis_pekerjaan` tinyint unsigned NOT NULL COMMENT '1=Sebelum ke Luar Negeri,2=Selama di Luar Negeri,3=Setelah Kembali dari Luar Negeri',
  `nama_perusahaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota_negara` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_masuk` date NOT NULL,
  `tahun_keluar` date DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_pekerjaan_pemohon_id_foreign` (`pemohon_id`),
  CONSTRAINT `riwayat_pekerjaan_pemohon_id_foreign` FOREIGN KEY (`pemohon_id`) REFERENCES `pemohon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.riwayat_pekerjaan: ~3 rows (approximately)
INSERT INTO `riwayat_pekerjaan` (`id`, `pemohon_id`, `jenis_pekerjaan`, `nama_perusahaan`, `jabatan`, `kota_negara`, `tahun_masuk`, `tahun_keluar`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 5, 1, 'EPRISI', 'Backend', 'JABODETABEK', '2021-02-01', '2023-07-11', NULL, NULL, NULL, NULL, NULL, '2023-07-11 03:49:57'),
	(2, 5, 2, 'jasesol', 'Developer', 'konoha', '2022-02-01', '2023-07-11', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 5, 2, 'Berukanya', 'Driver', 'konoha gakure', '2021-01-07', '2023-02-10', NULL, NULL, NULL, '2023-07-11 04:22:09', NULL, '2023-07-11 04:22:09');

-- Dumping structure for table sitara.riwayat_pendidikan
DROP TABLE IF EXISTS `riwayat_pendidikan`;
CREATE TABLE IF NOT EXISTS `riwayat_pendidikan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pemohon_id` bigint unsigned NOT NULL,
  `nama_lengkap_ijazah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir_ijazah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir_ijazah` date NOT NULL,
  `nama_lembaga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fakultas_id` bigint unsigned NOT NULL,
  `negara_id` bigint unsigned NOT NULL,
  `jenjang_id` bigint unsigned NOT NULL,
  `prodi_id` bigint unsigned NOT NULL,
  `akreditasi` tinyint unsigned NOT NULL,
  `tahun_lulus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_transkrip_nilai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_ijazah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_sk_penyetaraan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_tugas_akhir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_publikasi_ilmiah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'khusus s3',
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_pendidikan_pemohon_id_foreign` (`pemohon_id`),
  KEY `riwayat_pendidikan_fakultas_id_foreign` (`fakultas_id`),
  KEY `riwayat_pendidikan_negara_id_foreign` (`negara_id`),
  KEY `riwayat_pendidikan_jenjang_id_foreign` (`jenjang_id`),
  KEY `riwayat_pendidikan_prodi_id_foreign` (`prodi_id`),
  CONSTRAINT `riwayat_pendidikan_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_pendidikan_jenjang_id_foreign` FOREIGN KEY (`jenjang_id`) REFERENCES `jenjang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_pendidikan_negara_id_foreign` FOREIGN KEY (`negara_id`) REFERENCES `negara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_pendidikan_pemohon_id_foreign` FOREIGN KEY (`pemohon_id`) REFERENCES `pemohon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_pendidikan_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `program_studi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.riwayat_pendidikan: ~2 rows (approximately)
INSERT INTO `riwayat_pendidikan` (`id`, `pemohon_id`, `nama_lengkap_ijazah`, `tempat_lahir_ijazah`, `tanggal_lahir_ijazah`, `nama_lembaga`, `fakultas_id`, `negara_id`, `jenjang_id`, `prodi_id`, `akreditasi`, `tahun_lulus`, `path_transkrip_nilai`, `path_ijazah`, `path_sk_penyetaraan`, `path_tugas_akhir`, `path_publikasi_ilmiah`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 5, 'Josh Jonson', 'Medan', '2023-07-11', 'Masyarakat', 9, 4, 2, 4, 1, '2022', 'hxo7i_1_masyarakat.pdf', 'o3jbq_1_masyarakat.pdf', 'mdbub_1_masyarakat.pdf', 'ax9as_1_masyarakat.pdf', NULL, NULL, NULL, NULL, NULL, '2023-07-11 03:17:09', '2023-07-11 03:24:36'),
	(2, 5, 'Choky Napoleon', 'Cilacap', '2023-07-10', 'Masyarakat', 9, 6, 3, 3, 1, '2102', 'vfft6_3_masyarakat.pdf', '02sid_3_masyarakat.pdf', 'ifzlm_3_masyarakat.pdf', 'tswk0_3_masyarakat.pdf', NULL, NULL, NULL, NULL, NULL, '2023-07-11 03:27:04', '2023-07-11 03:27:04');

-- Dumping structure for table sitara.riwayat_permohonan
DROP TABLE IF EXISTS `riwayat_permohonan`;
CREATE TABLE IF NOT EXISTS `riwayat_permohonan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permohonan_id` bigint unsigned NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint unsigned NOT NULL COMMENT 'mengikuti status permohonan',
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_permohonan_permohonan_id_foreign` (`permohonan_id`),
  CONSTRAINT `riwayat_permohonan_permohonan_id_foreign` FOREIGN KEY (`permohonan_id`) REFERENCES `permohonan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.riwayat_permohonan: ~42 rows (approximately)
INSERT INTO `riwayat_permohonan` (`id`, `permohonan_id`, `keterangan`, `status`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(30, 7, 'Membuat Pengajuan Penyetaraan Ijazah', 2, NULL, NULL, NULL, NULL, '2023-08-30 20:49:26', '2023-08-30 20:49:26'),
	(31, 7, 'Tim Verifikator Telah Memverifikasi & Menerima Permohonan', 3, NULL, NULL, NULL, NULL, '2023-08-30 20:52:37', '2023-08-30 20:52:37'),
	(32, 7, 'Permohonana diteruskan ke tim penilai (asesor)', 5, NULL, NULL, NULL, NULL, '2023-08-30 20:53:07', '2023-08-30 20:53:07'),
	(33, 7, 'Penilai Asesor 1 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-30 20:55:41', '2023-08-30 20:55:41'),
	(34, 8, 'Membuat Pengajuan Penyetaraan Ijazah', 2, NULL, NULL, NULL, NULL, '2023-08-31 04:15:01', '2023-08-31 04:15:01'),
	(35, 8, 'Tim Verifikator Telah Memverifikasi & Menerima Permohonan', 3, NULL, NULL, NULL, NULL, '2023-08-31 04:18:31', '2023-08-31 04:18:31'),
	(36, 8, 'Permohonana diteruskan ke tim penilai (asesor)', 5, NULL, NULL, NULL, NULL, '2023-08-31 04:20:09', '2023-08-31 04:20:09'),
	(37, 8, 'Penilai Asesor 1 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 04:22:40', '2023-08-31 04:22:40'),
	(38, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 04:54:01', '2023-08-31 04:54:01'),
	(39, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 04:59:34', '2023-08-31 04:59:34'),
	(40, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 07:15:03', '2023-08-31 07:15:03'),
	(41, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 07:15:06', '2023-08-31 07:15:06'),
	(42, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 07:15:08', '2023-08-31 07:15:08'),
	(43, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 07:15:11', '2023-08-31 07:15:11'),
	(44, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 07:16:25', '2023-08-31 07:16:25'),
	(45, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 07:26:24', '2023-08-31 07:26:24'),
	(46, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-08-31 07:57:16', '2023-08-31 07:57:16'),
	(47, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 02:35:35', '2023-09-01 02:35:35'),
	(48, 8, 'Penilai Asesor 2 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 02:39:04', '2023-09-01 02:39:04'),
	(49, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 06:48:09', '2023-09-01 06:48:09'),
	(50, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 07:01:31', '2023-09-01 07:01:31'),
	(51, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 07:01:35', '2023-09-01 07:01:35'),
	(52, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 07:14:33', '2023-09-01 07:14:33'),
	(53, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 08:17:20', '2023-09-01 08:17:20'),
	(54, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 08:34:28', '2023-09-01 08:34:28'),
	(55, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 08:38:42', '2023-09-01 08:38:42'),
	(56, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 09:06:33', '2023-09-01 09:06:33'),
	(57, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 09:35:04', '2023-09-01 09:35:04'),
	(58, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 09:45:21', '2023-09-01 09:45:21'),
	(59, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 09:49:15', '2023-09-01 09:49:15'),
	(60, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 09:50:05', '2023-09-01 09:50:05'),
	(61, 8, 'Penilai Asesor 3 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-01 09:58:22', '2023-09-01 09:58:22'),
	(62, 8, 'Penilai Asesor 1 telah melakukan penilaian', 6, NULL, NULL, NULL, NULL, '2023-09-02 08:43:17', '2023-09-02 08:43:17'),
	(64, 8, 'Bimas Bimas 1 telah menerbitkan No.SK penyataraan', 7, NULL, NULL, NULL, NULL, '2023-09-05 11:57:33', '2023-09-05 11:57:33'),
	(65, 8, 'Penilai Asesor 3 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-07 09:35:01', '2023-09-07 09:35:01'),
	(66, 8, 'Penilai Asesor 3 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-07 09:45:02', '2023-09-07 09:45:02'),
	(67, 8, 'Penilai Asesor 3 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-07 09:55:40', '2023-09-07 09:55:40'),
	(68, 8, 'Penilai Asesor 3 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-07 10:28:19', '2023-09-07 10:28:19'),
	(69, 8, 'Penilai Asesor 3 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-07 10:42:06', '2023-09-07 10:42:06'),
	(70, 8, 'Penilai Asesor 3 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-07 10:56:44', '2023-09-07 10:56:44'),
	(71, 8, 'Penilai Asesor 3 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-07 11:19:18', '2023-09-07 11:19:18'),
	(72, 8, 'Penilai Asesor 1 telah melakukan penilaian', 7, NULL, NULL, NULL, NULL, '2023-09-18 08:59:59', '2023-09-18 08:59:59');

-- Dumping structure for table sitara.setting
DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nip_direktur_pendidikan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_direktur_pendidikan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttd_direktur_pendidikan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_direktur_jenderal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_direktur_jenderal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttd_direktur_jenderal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.setting: ~1 rows (approximately)
INSERT INTO `setting` (`id`, `nip_direktur_pendidikan`, `nama_direktur_pendidikan`, `ttd_direktur_pendidikan`, `nip_direktur_jenderal`, `nama_direktur_jenderal`, `ttd_direktur_jenderal`, `updated_by`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, '123654', 'Obama', 'ttd_direktur_pendidikan.png', '12345', 'Josbus', 'ttd_direktur_jenderal.png', NULL, NULL, NULL, NULL, '2023-06-11 21:18:14', '2023-06-11 21:18:14');

-- Dumping structure for table sitara.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sitara.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
