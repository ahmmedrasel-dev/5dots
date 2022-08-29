-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 28, 2022 at 10:49 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_5dots`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Size', '[\"SM\",\"LG\",\"MD\",\"XL\"]', '2022-08-27 10:49:04', '2022-08-27 10:49:04'),
(2, 'Color', '[\"Red\",\"Green\",\"Blue\",\"Black\",\"Yellow\"]', '2022-08-27 10:49:27', '2022-08-27 10:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` text COLLATE utf8mb4_unicode_ci,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `type` enum('Default','Deleteable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Deleteable',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `banner`, `icon`, `type`, `status`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Default category', NULL, NULL, 'Default', 'Active', 'default_category', 'Default category', 'Default description', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(2, 'Womens', '1661594367_j3gYGThZ3KKT2IBG.png', NULL, 'Deleteable', 'Active', 'womens', 'Womens', 'Womens Category', '2022-08-27 09:59:27', '2022-08-27 09:59:27'),
(3, 'Mens', '1661594397_vdMLuMBuytDzHKFU.png', NULL, 'Deleteable', 'Active', 'mens', 'mens', 'mens category', '2022-08-27 09:59:57', '2022-08-27 09:59:57'),
(4, 'Health & Beauty', '1661594574_P44XTq7O7wjy1kdZ.png', NULL, 'Deleteable', 'Active', 'health-&-beauty', 'Health & Beauty', 'Health & Beauty Category', '2022-08-27 10:02:54', '2022-08-27 10:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `state_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(8,2) NOT NULL,
  `longitude` decimal(8,2) NOT NULL,
  `flag` double(8,2) UNSIGNED NOT NULL,
  `wikiDataId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `state_code`, `country_id`, `country_code`, `latitude`, `longitude`, `flag`, `wikiDataId`, `created_at`, `updated_at`) VALUES
(102804, 'Abha', 2853, '14', 194, 'SA', '18.22', '42.51', 1.00, 'Q190948', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102805, 'Abqaiq', 2856, '04', 194, 'SA', '25.93', '49.67', 1.00, 'Q27177', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102806, 'Abū ‘Arīsh', 2858, '09', 194, 'SA', '16.97', '42.83', 1.00, 'Q2821731', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102807, 'Ad Darb', 2858, '09', 194, 'SA', '17.72', '42.25', 1.00, 'Q31868833', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102808, 'Ad Dawādimī', 2849, '01', 194, 'SA', '24.51', '44.39', 1.00, 'Q27258', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102809, 'Ad Dilam', 2849, '01', 194, 'SA', '23.99', '47.16', 1.00, 'Q31868886', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102810, 'Adh Dhibiyah', 2861, '05', 194, 'SA', '26.03', '43.16', 1.00, 'Q31868886', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102811, 'Afif', 2849, '01', 194, 'SA', '23.91', '42.92', 1.00, 'Q27139', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102812, 'Ain AlBaraha', 2849, '01', 194, 'SA', '24.76', '43.77', 1.00, 'Q27139', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102813, 'Al Arţāwīyah', 2849, '01', 194, 'SA', '26.50', '45.35', 1.00, 'Q31871949', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102814, 'Al Awjām', 2856, '04', 194, 'SA', '26.56', '49.94', 1.00, 'Q4164621', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102815, 'Al Bahah', 2859, '11', 194, 'SA', '20.01', '41.47', 1.00, 'Q27176', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102816, 'Al Baţţālīyah', 2856, '04', 194, 'SA', '25.43', '49.63', 1.00, 'Q31872122', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102817, 'Al Bukayrīyah', 2861, '05', 194, 'SA', '26.14', '43.66', 1.00, 'Q31872259', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102818, 'Al Fuwayliq', 2861, '05', 194, 'SA', '26.44', '43.25', 1.00, 'Q31872595', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102819, 'Al Hadā', 2850, '02', 194, 'SA', '21.37', '40.29', 1.00, 'Q4703935', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102820, 'Al Hufūf', 2856, '04', 194, 'SA', '25.36', '49.59', 1.00, 'Q27136', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102821, 'Al Jafr', 2856, '04', 194, 'SA', '25.38', '49.72', 1.00, 'Q31873138', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102822, 'Al Jarādīyah', 2858, '09', 194, 'SA', '16.58', '42.91', 1.00, 'Q4704123', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102823, 'Al Jubayl', 2856, '04', 194, 'SA', '27.02', '49.62', 1.00, 'Q27430', '2019-10-05 19:17:54', '2019-10-05 19:17:54'),
(102824, 'Al Jumūm', 2850, '02', 194, 'SA', '21.62', '39.70', 1.00, 'Q12185747', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102825, 'Al Khafjī', 2856, '04', 194, 'SA', '28.44', '48.49', 1.00, 'Q31873774', '2019-10-05 19:17:54', '2020-05-01 13:23:14'),
(102826, 'Al Kharj', 2849, '01', 194, 'SA', '24.16', '47.33', 1.00, 'Q2162128', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102827, 'Al Majāridah', 2853, '14', 194, 'SA', '19.12', '41.91', 1.00, 'Q31874518', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102828, 'Al Markaz', 2856, '04', 194, 'SA', '25.40', '49.73', 1.00, 'Q31874729', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102829, 'Al Mindak', 2859, '11', 194, 'SA', '20.16', '41.28', 1.00, 'Q31875144', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102830, 'Al Mithnab', 2861, '05', 194, 'SA', '25.86', '44.22', 1.00, 'Q31875144', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102831, 'Al Mubarraz', 2856, '04', 194, 'SA', '25.41', '49.59', 1.00, 'Q31875209', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102832, 'Al Munayzilah', 2856, '04', 194, 'SA', '25.38', '49.67', 1.00, 'Q31875344', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102833, 'Al Muwayh', 2850, '02', 194, 'SA', '22.43', '41.76', 1.00, 'Q31875487', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102834, 'Al Muţayrifī', 2856, '04', 194, 'SA', '25.48', '49.56', 1.00, 'Q31875523', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102835, 'Al Qaţīf', 2856, '04', 194, 'SA', '26.57', '50.01', 1.00, 'Q31875721', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102836, 'Al Qurayn', 2856, '04', 194, 'SA', '25.48', '49.60', 1.00, 'Q31875811', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102837, 'Al Qārah', 2856, '04', 194, 'SA', '25.42', '49.67', 1.00, 'Q31875851', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102838, 'Al Wajh', 2852, '07', 194, 'SA', '26.25', '36.45', 1.00, 'Q27251', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102839, 'Al-`Ula', 2851, '03', 194, 'SA', '26.61', '37.92', 1.00, 'Q27242', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102840, 'An Nimāş', 2853, '14', 194, 'SA', '19.15', '42.12', 1.00, 'Q31882853', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102841, 'Ar Rass', 2861, '05', 194, 'SA', '25.87', '43.50', 1.00, 'Q1878991', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102842, 'Arar', 2854, '08', 194, 'SA', '30.98', '41.04', 1.00, 'Q1878991', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102843, 'As Saffānīyah', 2856, '04', 194, 'SA', '27.97', '48.73', 1.00, 'Q31890141', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102844, 'As Sulayyil', 2849, '01', 194, 'SA', '20.46', '45.58', 1.00, 'Q27221', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102845, 'Ash Shafā', 2850, '02', 194, 'SA', '21.07', '40.31', 1.00, 'Q4804436', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102846, 'At Tūbī', 2856, '04', 194, 'SA', '26.56', '49.99', 1.00, 'Q31892461', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102847, 'Az Zulfī', 2849, '01', 194, 'SA', '26.30', '44.82', 1.00, 'Q31894563', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102848, 'Aţ Ţaraf', 2856, '04', 194, 'SA', '25.36', '49.73', 1.00, 'Q31895318', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102849, 'Badr Ḩunayn', 2851, '03', 194, 'SA', '23.78', '38.79', 1.00, 'Q27256', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102850, 'Buraydah', 2861, '05', 194, 'SA', '26.33', '43.97', 1.00, 'Q259253', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102851, 'Dammam', 2856, '04', 194, 'SA', '26.43', '50.10', 1.00, 'Q160320', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102852, 'Dhahran', 2856, '04', 194, 'SA', '26.29', '50.11', 1.00, 'Q268915', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102853, 'Duba', 2852, '07', 194, 'SA', '27.35', '35.69', 1.00, 'Q268915', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102854, 'Farasān', 2858, '09', 194, 'SA', '16.70', '42.12', 1.00, 'Q268915', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102855, 'Ghran', 2850, '02', 194, 'SA', '21.98', '39.37', 1.00, 'Q268915', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102856, 'Ha\'il', 2855, '06', 194, 'SA', '27.52', '41.69', 1.00, 'Q675568', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102857, 'Hafar Al-Batin', 2856, '04', 194, 'SA', '28.43', '45.97', 1.00, 'Q27400', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102858, 'Jeddah', 2850, '02', 194, 'SA', '21.54', '39.20', 1.00, 'Q374365', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102859, 'Jizan', 2858, '09', 194, 'SA', '16.89', '42.55', 1.00, 'Q27660', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102860, 'Julayjilah', 2856, '04', 194, 'SA', '25.50', '49.60', 1.00, 'Q32130900', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102861, 'Khamis Mushait', 2853, '14', 194, 'SA', '18.30', '42.73', 1.00, 'Q759381', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102862, 'Khobar', 2856, '04', 194, 'SA', '26.28', '50.21', 1.00, 'Q311266', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102863, 'Marāt', 2849, '01', 194, 'SA', '25.07', '45.46', 1.00, 'Q32139417', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102864, 'Mecca', 2850, '02', 194, 'SA', '21.43', '39.83', 1.00, 'Q5806', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102865, 'Medina', 2851, '03', 194, 'SA', '24.47', '39.61', 1.00, 'Q35484', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102866, 'Mislīyah', 2858, '09', 194, 'SA', '17.46', '42.56', 1.00, 'Q32140978', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102867, 'Mizhirah', 2858, '09', 194, 'SA', '16.83', '42.73', 1.00, 'Q32141037', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102868, 'Mulayjah', 2856, '04', 194, 'SA', '27.27', '48.42', 1.00, 'Q32141302', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102869, 'Najrān', 2860, '10', 194, 'SA', '17.49', '44.13', 1.00, 'Q27174', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102870, 'Qaisumah', 2856, '04', 194, 'SA', '28.31', '46.13', 1.00, 'Q3543647', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102871, 'Qal‘at Bīshah', 2853, '14', 194, 'SA', '20.00', '42.61', 1.00, 'Q27135', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102872, 'Qurayyat', 2857, '12', 194, 'SA', '31.33', '37.34', 1.00, 'Q2829401', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102873, 'Raḩīmah', 2856, '04', 194, 'SA', '26.71', '50.06', 1.00, 'Q2829401', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102874, 'Riyadh', 2849, '01', 194, 'SA', '24.69', '46.72', 1.00, 'Q3692', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102875, 'Rābigh', 2850, '02', 194, 'SA', '22.80', '39.03', 1.00, 'Q27274', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102876, 'Sabt Al Alayah', 2853, '14', 194, 'SA', '19.70', '41.92', 1.00, 'Q27274', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102877, 'Sakakah', 2857, '12', 194, 'SA', '29.97', '40.21', 1.00, 'Q27469', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102878, 'Sayhāt', 2856, '04', 194, 'SA', '26.48', '50.05', 1.00, 'Q2744182', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102879, 'Sulţānah', 2851, '03', 194, 'SA', '24.49', '39.59', 1.00, 'Q7636782', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102880, 'Sājir', 2849, '01', 194, 'SA', '25.18', '44.60', 1.00, 'Q32188864', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102881, 'Tabuk', 2852, '07', 194, 'SA', '28.40', '36.57', 1.00, 'Q244232', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102882, 'Tabālah', 2853, '14', 194, 'SA', '19.95', '42.40', 1.00, 'Q32189185', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102883, 'Tanūmah', 2861, '05', 194, 'SA', '27.10', '44.13', 1.00, 'Q32189686', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102884, 'Ta’if', 2850, '02', 194, 'SA', '21.27', '40.42', 1.00, 'Q182640', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102885, 'Tumayr', 2849, '01', 194, 'SA', '25.70', '45.87', 1.00, 'Q32190410', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102886, 'Turabah', 2850, '02', 194, 'SA', '21.21', '41.63', 1.00, 'Q32190427', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102887, 'Turaif', 2854, '08', 194, 'SA', '31.67', '38.66', 1.00, 'Q32190427', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102888, 'Tārūt', 2856, '04', 194, 'SA', '26.57', '50.04', 1.00, 'Q32190514', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102889, 'Umm Lajj', 2852, '07', 194, 'SA', '25.02', '37.27', 1.00, 'Q32190969', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102890, 'Umm as Sāhik', 2856, '04', 194, 'SA', '26.65', '49.92', 1.00, 'Q32190880', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102891, 'Wed Alnkil', 2861, '05', 194, 'SA', '25.43', '42.83', 1.00, 'Q32190880', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102892, 'Yanbu', 2851, '03', 194, 'SA', '24.09', '38.06', 1.00, 'Q466027', '2019-10-05 19:17:55', '2019-10-05 19:17:55'),
(102893, 'shokhaibٍ', 2849, '01', 194, 'SA', '24.49', '46.27', 1.00, 'Q466027', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102894, 'Şabyā', 2858, '09', 194, 'SA', '17.15', '42.63', 1.00, 'Q32219237', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102895, 'Şafwá', 2856, '04', 194, 'SA', '26.65', '49.96', 1.00, 'Q27234', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102896, 'Şuwayr', 2857, '12', 194, 'SA', '30.12', '40.39', 1.00, 'Q32219471', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102897, 'Şāmitah', 2858, '09', 194, 'SA', '16.60', '42.94', 1.00, 'Q4164177', '2019-10-05 19:17:55', '2020-05-01 13:23:14'),
(102898, 'Ţubarjal', 2857, '12', 194, 'SA', '30.50', '38.22', 1.00, 'Q4164177', '2019-10-05 19:17:55', '2020-05-01 13:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subregion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezones` text COLLATE utf8mb4_unicode_ci,
  `translations` text COLLATE utf8mb4_unicode_ci,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `emoji` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emojiU` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `wikiDataId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `phonecode`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(194, 'Saudi Arabia', 'SAU', 'SA', '966', 'Riyadh', 'SAR', '﷼', '.sa', 'العربية السعودية', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia\\/Riyadh\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"br\":\"Arábia Saudita\",\"pt\":\"Arábia Saudita\",\"nl\":\"Saoedi-Arabië\",\"hr\":\"Saudijska Arabija\",\"fa\":\"عربستان سعودی\",\"de\":\"Saudi-Arabien\",\"es\":\"Arabia Saudí\",\"fr\":\"Arabie Saoudite\",\"ja\":\"サウジアラビア\",\"it\":\"Arabia Saudita\"}', '25.00000000', '45.00000000', '🇸🇦', 'U+1F1F8 U+1F1E6', '2018-07-20 20:11:03', '2021-02-20 14:24:49', 1, 'Q851');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('Amount','Percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Amount',
  `max_discount_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `min_shopping_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `type` enum('Cart','Product','Category') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cart',
  `start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` text COLLATE utf8mb4_unicode_ci,
  `product_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_logo_white` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_logo_black` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(8,2) NOT NULL DEFAULT '30.00',
  `shipping_days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '7',
  `tax` int(11) NOT NULL DEFAULT '15',
  `app_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_copyright_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` text COLLATE utf8mb4_unicode_ci,
  `mail_type` enum('SMTP','GMAIL') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_encryption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `app_name`, `app_logo_white`, `app_logo_black`, `shipping_cost`, `shipping_days`, `tax`, `app_phone`, `app_email`, `app_address`, `app_copyright_text`, `seo_title`, `seo_description`, `seo_keywords`, `mail_type`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encryption`, `mail_address`, `mail_from_name`, `app_id`, `app_secret`, `created_at`, `updated_at`) VALUES
(1, '5dots', '', '', '30.00', '7', 15, '0534588012', 'info@5dots.sa', 'Al-Khobar', 'Copyright © 2022 [5dots.sa] All rights reserved.', '5dots', 'Laravel Ecommerce', 'Laravel, Ecommerce', 'SMTP', '5dots.sa', '465', 'support@5dots.sa', 'Pt!bPT{fJ1UC', 'ssl', 'support@5dots.sa', '5dots', NULL, 'gocspx-9ewp-0f0a6x1ba1fl3o0nw95ax_d', '2022-08-27 09:41:00', '2022-08-27 10:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_02_01_030511_create_payment_invoices_table', 1),
(6, '2021_12_22_053039_create_categories_table', 1),
(7, '2021_12_22_064753_create_subcategories_table', 1),
(8, '2021_12_22_090930_create_coupons_table', 1),
(9, '2021_12_31_120832_create_general_settings_table', 1),
(10, '2022_01_13_075341_create_attributes_table', 1),
(11, '2022_04_02_110929_create_sliders_table', 1),
(12, '2022_04_03_080520_create_products_table', 1),
(13, '2022_04_03_080549_create_product_images_table', 1),
(14, '2022_05_08_100031_create_subscriptions_table', 1),
(15, '2022_05_08_100639_create_subscription_options_table', 1),
(16, '2022_05_11_105008_create_shops_table', 1),
(17, '2022_05_17_100953_create_states_table', 1),
(18, '2022_05_17_101032_create_cities_table', 1),
(19, '2022_05_17_111404_create_countries_table', 1),
(20, '2022_06_21_065945_create_user_details_table', 1),
(21, '2022_06_21_070032_create_orders_table', 1),
(22, '2022_06_21_071020_create_transactions_table', 1),
(23, '2022_06_21_072329_create_order_details_table', 1),
(24, '2022_08_22_233442_create_withdraws_table', 1),
(25, '2022_08_26_230710_create_seller_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_discount_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` enum('Card','COD') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'COD',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Accept','Complete','Cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `coupon_id`, `coupon_discount_amount`, `shipping_cost`, `tax`, `amount`, `payment_method`, `note`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, NULL, 0.00, 30, 24.57, 163.80, 'COD', 'Qucik Delivery', 'Pending', '2022-08-28 08:07:40', '2022-08-28 08:07:40'),
(3, 3, NULL, 0.00, 30, 45.74, 304.95, 'COD', 'helwo', 'Pending', '2022-08-28 09:51:01', '2022-08-28 09:51:01'),
(4, 3, NULL, 0.00, 30, 27.81, 185.40, 'COD', 'hwllow', 'Pending', '2022-08-28 09:51:50', '2022-08-28 09:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'seller_id',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` double(10,2) NOT NULL DEFAULT '0.00',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `user_id`, `product_id`, `unit_price`, `color`, `size`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 5, 163.80, 'Black', '', 1, '2022-08-28 08:07:40', '2022-08-28 08:07:40'),
(2, 3, 2, 3, 304.95, '', '', 1, '2022-08-28 09:51:01', '2022-08-28 09:51:01'),
(3, 4, 2, 1, 185.40, 'Yellow', 'MD', 1, '2022-08-28 09:51:50', '2022-08-28 09:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_invoices`
--

CREATE TABLE `payment_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `InvoiceId` bigint(20) UNSIGNED NOT NULL,
  `InvoiceStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvoiceValue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvoiceDisplayValue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionId` bigint(20) UNSIGNED NOT NULL,
  `TransactionStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentGateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentId` bigint(20) UNSIGNED NOT NULL,
  `CardNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_invoices`
--

INSERT INTO `payment_invoices` (`id`, `order_id`, `client_id`, `InvoiceId`, `InvoiceStatus`, `InvoiceValue`, `Currency`, `InvoiceDisplayValue`, `TransactionId`, `TransactionStatus`, `PaymentGateway`, `PaymentId`, `CardNumber`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 1630964, 'Paid', '89.756', 'KD', '1,104.000 SR', 1630964, 'Succss', 'VISA/MASTER', 7071630964124383973, '450875xxxxxx1019', '2022-08-27 11:03:21', '2022-08-27 11:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` text COLLATE utf8mb4_unicode_ci,
  `pdf` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `purchase_price` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `discount_type` enum('Percent','Flat') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `isCashAvailable` tinyint(1) NOT NULL DEFAULT '1',
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_image` text COLLATE utf8mb4_unicode_ci,
  `is_draft` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `sub_category_id`, `name`, `slug`, `product_sku`, `description`, `thumbnail`, `pdf`, `status`, `purchase_price`, `price`, `discount_type`, `discount`, `unit`, `min`, `max`, `quantity`, `tags`, `isCashAvailable`, `attributes`, `meta_title`, `meta_description`, `meta_image`, `is_draft`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 1, 'Calvin Benson', 'Nostrum at ab dolore', 'RA-5593-2', '<p>Dolor qui perspiciat.&nbsp;Dolor qui perspiciat.&nbsp;Dolor qui perspiciat.&nbsp;Dolor qui perspiciat.</p>', '1661598902_71lYxVMUXN0FAP6K.jpg', NULL, 'Active', '150.00', '206.00', 'Percent', 10, 'Pieces', 1, 10, 20, 'Doloremque asperiore', 0, '[\"[\\\"2\\\",\\\"Black\\\"]\",\"[\\\"2\\\",\\\"Yellow\\\"]\",\"[\\\"1\\\",\\\"MD\\\"]\"]', 'Odio recusandae Qui', 'Error consequatur s', NULL, 0, '2022-08-27 11:15:02', '2022-08-28 06:21:42'),
(2, 2, 3, 6, 'Tate Guerrero Watch', 'tate-guerrero-watch', 'RA-1589-2', '<p>Reprehenderit earum .&nbsp;Reprehenderit earum .&nbsp;Reprehenderit earum .</p>', '1661599075_7FPtno4tUVDuvug0.png', NULL, 'Active', '200.00', '350.00', 'Percent', 12, 'Pieces', 1, 10, 100, 'Blanditiis quia dolo', 0, '[\"[\\\"2\\\",\\\"Green\\\"]\",\"[\\\"2\\\",\\\"Blue\\\"]\",\"[\\\"2\\\",\\\"Black\\\"]\"]', 'Quia asperiores non', 'Libero ad reprehende', NULL, 0, '2022-08-27 11:17:55', '2022-08-28 06:21:20'),
(3, 2, 4, 10, 'Nathan Mcker', 'nathan-mcker', 'RA-9401-2', '<p>Aliqua. Eius accusam.</p>', '1661667119_YtvNFPLviBP1oBFf.png', NULL, 'Active', '200.00', '321.00', 'Percent', 5, 'Pieces', 1, 10, 100, 'Sunt alias neque dol', 0, NULL, 'Omnis dolor cumque n', 'Anim nulla vel earum', NULL, 0, '2022-08-28 06:11:59', '2022-08-28 06:28:56'),
(4, 2, 4, 12, 'Vivian Franklin', 'Cillum vel eligendi', 'RA-8952-2', '<p>In commodo ea eligen.</p>', '1661668850_8ZWgBAgIV7HbCRNU.jpeg', NULL, 'Active', '100.00', '150.00', 'Flat', 20, 'Sint qui provident', 1, 20, 100, 'Ut aut nostrum tempo', 0, NULL, 'Id nulla eaque volup', 'Voluptatem dolore as', NULL, 0, '2022-08-28 06:40:50', '2022-08-28 06:49:37'),
(5, 2, 2, 4, 'Donna Douglas', 'Voluptas nihil digni', 'RA-5279-2', '<p>Rerum in ratione arc.</p>', '1661669109_ikvKHVfsGztFLXCq.png', NULL, 'Active', '120.00', '180.00', 'Percent', 9, 'Pieces', 1, 10, 100, 'Distinctio Sint off', 0, '[\"[\\\"2\\\",\\\"Green\\\"]\",\"[\\\"2\\\",\\\"Blue\\\"]\",\"[\\\"2\\\",\\\"Black\\\"]\"]', 'Libero aspernatur et', 'Facere anim dolorem', NULL, 0, '2022-08-28 06:45:09', '2022-08-28 06:49:23'),
(6, 2, 2, 4, 'Sloane Mcconnell', 'Esse adipisci nihil', 'RA-7163-2', '<p>Et voluptate dicta m.</p>', '1661669265_rJZePQghCAoNLSdd.png', NULL, 'Active', '100.00', '180.00', NULL, NULL, 'Pieces', 1, 10, 100, 'Facere dolor laborum', 0, '[\"[\\\"2\\\",\\\"Red\\\"]\",\"[\\\"2\\\",\\\"Green\\\"]\",\"[\\\"2\\\",\\\"Blue\\\"]\",\"[\\\"1\\\",\\\"LG\\\"]\",\"[\\\"1\\\",\\\"MD\\\"]\"]', 'In quo cupidatat qui', 'Pariatur Suscipit e', NULL, 0, '2022-08-28 06:47:17', '2022-08-28 06:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '1661598902_qebjn29xVApkFRwU.jpg', '2022-08-27 11:15:02', '2022-08-27 11:15:02'),
(2, 1, '1661598902_930bGOrU7pJSeohf.jpeg', '2022-08-27 11:15:02', '2022-08-27 11:15:02'),
(3, 1, '1661598902_rORneA9lh2UiS4V8.png', '2022-08-27 11:15:02', '2022-08-27 11:15:02'),
(4, 1, '1661598902_ZvF9YzZ52AibvwF7.png', '2022-08-27 11:15:02', '2022-08-27 11:15:02'),
(5, 1, '1661598902_CgdnjvDPeAKZlCHt.png', '2022-08-27 11:15:03', '2022-08-27 11:15:03'),
(6, 1, '1661598903_0V4gZQ2AZ4xXd90X.png', '2022-08-27 11:15:03', '2022-08-27 11:15:03'),
(7, 2, '1661599075_bM4TDJ0DLiOxW5ny.jpeg', '2022-08-27 11:17:55', '2022-08-27 11:17:55'),
(8, 2, '1661599075_vVV8ZLUpZAwLkP8x.jpeg', '2022-08-27 11:17:55', '2022-08-27 11:17:55'),
(9, 2, '1661599075_SfqlmqPeHB7jlmdn.png', '2022-08-27 11:17:55', '2022-08-27 11:17:55'),
(10, 2, '1661599075_AwgqSoPVu0Q03ghE.jpeg', '2022-08-27 11:17:55', '2022-08-27 11:17:55'),
(11, 3, '1661667119_eT4rHxqZAfWsMNB9.png', '2022-08-28 06:11:59', '2022-08-28 06:11:59'),
(12, 3, '1661667119_EpftZH63x09Mzjxz.png', '2022-08-28 06:11:59', '2022-08-28 06:11:59'),
(13, 3, '1661667119_zPUoO5c0eDepUFk6.png', '2022-08-28 06:12:00', '2022-08-28 06:12:00'),
(14, 3, '1661667120_fdFoMinOVMT770WV.png', '2022-08-28 06:12:00', '2022-08-28 06:12:00'),
(15, 4, '1661668850_yT5hKCzESjpcgIIp.jpeg', '2022-08-28 06:40:50', '2022-08-28 06:40:50'),
(16, 4, '1661668850_LPjDjyCIbAGvrof2.jpeg', '2022-08-28 06:40:50', '2022-08-28 06:40:50'),
(17, 4, '1661668850_VitBOZeUG1dhjYjo.jpeg', '2022-08-28 06:40:50', '2022-08-28 06:40:50'),
(18, 4, '1661668850_5KK7gvzz5P7HqvYt.jpeg', '2022-08-28 06:40:50', '2022-08-28 06:40:50'),
(19, 5, '1661669109_f2dLFU6HfRjyU9lz.png', '2022-08-28 06:45:09', '2022-08-28 06:45:09'),
(20, 5, '1661669109_HX3rMjvv9GZLBgQg.png', '2022-08-28 06:45:09', '2022-08-28 06:45:09'),
(21, 5, '1661669109_7F9yhIXXWEiv398H.png', '2022-08-28 06:45:10', '2022-08-28 06:45:10'),
(22, 5, '1661669110_h3wFEyAuWSVUOJkd.jpg', '2022-08-28 06:45:10', '2022-08-28 06:45:10'),
(23, 6, '1661669237_8N4Pn1yyr0Alrxli.png', '2022-08-28 06:47:17', '2022-08-28 06:47:17'),
(24, 6, '1661669237_EZEKb85qFR0CGPKu.png', '2022-08-28 06:47:17', '2022-08-28 06:47:17'),
(25, 6, '1661669237_1oKJcARtDir6MxXQ.png', '2022-08-28 06:47:17', '2022-08-28 06:47:17'),
(26, 6, '1661669237_W5xe48gUyUtMcGlB.jpeg', '2022-08-28 06:47:18', '2022-08-28 06:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `seller_transactions`
--

CREATE TABLE `seller_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_transactions`
--

INSERT INTO `seller_transactions` (`id`, `user_id`, `payment_invoice_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '1,104.000 SR', '2022-08-27 11:03:21', '2022-08-27 11:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_logo` text COLLATE utf8mb4_unicode_ci,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `subscription_id`, `shop_name`, `shop_logo`, `state`, `city`, `postal_code`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'rahmmed', '1661597920_7IiAdpP7jlfLrdXE.png', '2849', '102809', '32437', '3161 King Abdulaziz Rd, Ar Rabiyah, Dammam', 'Active', '2022-08-27 10:58:41', '2022-08-27 11:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `category_id`, `title`, `sub_title`, `banner`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Womens Fashion', 'New Collection', '1661596611_fIz8NDrgDntTVfRR.jpeg', 'Active', '2022-08-27 10:36:51', '2022-08-27 10:36:51'),
(2, 3, 'Mens Fashion', 'New Collection', '1661596654_xRADm0pAkH9GlrGV.jpeg', 'Active', '2022-08-27 10:37:34', '2022-08-27 10:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` mediumint(8) UNSIGNED NOT NULL,
  `country_code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fips_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `wikiDataId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `country_code`, `fips_code`, `iso2`, `latitude`, `longitude`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(2849, 'Riyadh Region', 194, 'SA', '10', '01', '22.75543850', '46.20915470', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q1249255'),
(2850, 'Makkah Region', 194, 'SA', '14', '02', '21.52355840', '41.91964710', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q234167'),
(2851, 'Al Madinah Region', 194, 'SA', '05', '03', '24.84039770', '39.32062410', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q236027'),
(2852, 'Tabuk Region', 194, 'SA', '19', '07', '28.24533350', '37.63866220', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q1315953'),
(2853, '\'Asir Region', 194, 'SA', '11', '14', '19.09690620', '42.86378750', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q779855'),
(2854, 'Northern Borders Region', 194, 'SA', '15', '08', '30.07991620', '42.86378750', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q201781'),
(2855, 'Ha\'il Region', 194, 'SA', '13', '06', '27.70761430', '41.91964710', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q243656'),
(2856, 'Eastern Province', 194, 'SA', '06', '04', NULL, NULL, '2019-10-05 17:48:50', '2019-10-05 17:48:50', 1, 'Q953508'),
(2857, 'Al Jawf Region', 194, 'SA', '20', '12', '29.88735600', '39.32062410', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q1471266'),
(2858, 'Jizan Region', 194, 'SA', '17', '09', '17.17381760', '42.70761070', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q269973'),
(2859, 'Al Bahah Region', 194, 'SA', '02', '11', '20.27227390', '41.44125100', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q852774'),
(2860, 'Najran Region', 194, 'SA', '16', '10', '18.35146640', '45.60071080', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q464718'),
(2861, 'Al-Qassim Region', 194, 'SA', '08', '05', '26.20782600', '43.48373800', '2019-10-05 17:48:50', '2020-12-21 15:50:25', 1, 'Q1105411');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` text COLLATE utf8mb4_unicode_ci,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `banner`, `icon`, `status`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 2, 'Women Cloths', NULL, '1661594790_l1jwhMUsAII3IJx0.png', 'Active', 'women-cloths', 'Women Cloths', 'Women Cloths Subcategory', '2022-08-27 10:06:30', '2022-08-27 10:06:30'),
(2, 2, 'Women Shoes', NULL, '1661594912_rpJhwraRNKAkZLhU.png', 'Active', 'women-shoes', 'Women Shoes', 'Women Shoes Subcategory', '2022-08-27 10:08:32', '2022-08-27 10:08:32'),
(3, 2, 'Jewellery', NULL, '1661595010_fqJGb9BITPWzKmfc.png', 'Active', 'jewellery', 'Jewellery', 'Jewellery Subcategory', '2022-08-27 10:10:10', '2022-08-27 10:10:10'),
(4, 2, 'Women Bags', NULL, '1661595153_u58jdlGK9jPNjnbX.png', 'Active', 'women-bags', 'Women Bags', 'Women Bags Subcategory', '2022-08-27 10:12:34', '2022-08-27 10:12:34'),
(5, 3, 'Men\'s Clothes', NULL, '1661595302_cNQN2mmxXwFzqVfQ.png', 'Active', 'men\'s-clothes', 'Men\'s Clothes', 'Men\'s Clothes Subcategory', '2022-08-27 10:15:02', '2022-08-27 10:15:02'),
(6, 3, 'Men\'s Watches', NULL, '1661595729_6RQLXWj2tlXRwvr2.png', 'Active', 'men\'s-watches', 'Men\'s Watches', 'Men\'s Watches Subcateogry', '2022-08-27 10:22:09', '2022-08-27 10:22:09'),
(7, 3, 'Men\'s Shoes', NULL, '1661595798_TDAqqKIiKWbo1CJP.png', 'Active', 'men\'s-shoes', 'Men\'s Shoes', 'Men\'s Shoes Subcategory', '2022-08-27 10:23:18', '2022-08-27 10:23:18'),
(8, 4, 'Men\'s Care', NULL, '1661595932_hq2DC2JmjXj4Dtpf.png', 'Active', 'men\'s-care', 'Men\'s Care', 'Men\'s Care Subcategory', '2022-08-27 10:25:33', '2022-08-27 10:31:16'),
(9, 3, 'Eye-were', NULL, '1661596056_PtrsjFOgUaJBFhpa.png', 'Active', 'eye-were', 'Eye-were', 'Eye-were Subcategory', '2022-08-27 10:27:36', '2022-08-27 10:30:40'),
(10, 4, 'Fragrances', NULL, '1661596146_0DFYOuXQA61dvnr6.png', 'Active', 'fragrances', 'Fragrances', 'Fragrances Subcategory', '2022-08-27 10:29:07', '2022-08-27 10:29:07'),
(11, 4, 'Women\'s Care', NULL, '1661596362_IDxKhPXb6huy539a.png', 'Active', 'women\'s-care', 'Women\'s Care', 'Women\'s Care Subcategory', '2022-08-27 10:32:42', '2022-08-27 10:32:42'),
(12, 4, 'Accessories', NULL, '1661596491_XeiKYlpv6r0GF0cS.png', 'Active', 'accessories', 'Accessories', 'Accessories Subcategory', '2022-08-27 10:34:51', '2022-08-27 10:34:51');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '30',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `name`, `price`, `days`, `created_at`, `updated_at`) VALUES
(1, 'Basic', '960.00', '30', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(2, 'Silver', '2880.00', '90', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(3, 'Gold', '5570.00', '180', '2022-08-27 09:41:00', '2022-08-27 09:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_options`
--

CREATE TABLE `subscription_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_options`
--

INSERT INTO `subscription_options` (`id`, `subscription_id`, `option`, `created_at`, `updated_at`) VALUES
(1, 1, 'Marketing', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(2, 1, 'Storage', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(3, 1, 'Packaging', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(4, 1, 'Shipping', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(5, 2, '1 Months free', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(6, 2, 'Marketing', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(7, 2, 'Storage', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(8, 2, 'Packaging', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(9, 2, 'Shipping', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(10, 3, '3 Months Free', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(11, 3, 'Marketing', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(12, 3, 'Storage', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(13, 3, 'Packaging', '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(14, 3, 'Shipping', '2022-08-27 09:41:00', '2022-08-27 09:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `status` enum('Pending','Complete','Failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 163.8, 'Pending', '2022-08-28 08:07:40', '2022-08-28 08:07:40'),
(2, 3, 3, 304.95, 'Pending', '2022-08-28 09:51:01', '2022-08-28 09:51:01'),
(3, 3, 4, 185.4, 'Pending', '2022-08-28 09:51:50', '2022-08-28 09:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `role` enum('Admin','Seller','Customer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Customer',
  `phone_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `due_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `provider_id`, `provider`, `avatar`, `role`, `phone_1`, `phone_2`, `balance`, `due_balance`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Farish Ahmmed', '5dots@gmail.com', '2022-08-27 09:41:00', '$2y$10$N0ApoYgIqCgTO9gWaeO61esg5a04F8JTltCdWT6gZWY6TNRgpJlti', NULL, NULL, NULL, 'Admin', NULL, NULL, '0.00', '0.00', NULL, NULL, '2022-08-27 09:41:00', '2022-08-27 09:41:00'),
(2, 'Rasel Ahmmed', 'rahmmed.info@gmail.com', '2022-08-27 11:06:02', '$2y$10$01NphdqtDGNbAseGMmqLP.ocgN/NC7QOCHqGx6Nn3cfphhpv26Que', NULL, NULL, NULL, 'Seller', '0587934940', NULL, '0.00', '0.00', '3161 King Abdulaziz Rd, Ar Rabiyah, Dammam', NULL, '2022-08-27 10:58:40', '2022-08-27 11:06:02'),
(3, 'Ahmmed Rasel', 'rahmmed.bd24@gmail.com', '2022-08-28 08:03:12', '$2y$10$c/r5qTDoz04vXLiCLK9wc./Tf/QEvOzjg8AdGM8C3ryGEGYIVAEFq', NULL, NULL, NULL, 'Customer', NULL, NULL, '0.00', '0.00', NULL, NULL, '2022-08-28 08:01:31', '2022-08-28 08:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `state_id`, `city_id`, `phone`, `postal_code`, `address`, `created_at`, `updated_at`) VALUES
(2, 3, 2850, 102824, '94305543', '34345', 'Demo Address', '2022-08-28 08:07:40', '2022-08-28 09:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('Pending','Accept','Paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_invoices`
--
ALTER TABLE `payment_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_product_sku_unique` (`product_sku`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `seller_transactions`
--
ALTER TABLE `seller_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_category_id_foreign` (`category_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_region` (`country_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_slug_unique` (`slug`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_options`
--
ALTER TABLE `subscription_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102899;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_invoices`
--
ALTER TABLE `payment_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `seller_transactions`
--
ALTER TABLE `seller_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2862;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscription_options`
--
ALTER TABLE `subscription_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
