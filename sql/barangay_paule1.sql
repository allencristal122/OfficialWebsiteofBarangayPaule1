-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 31, 2024 at 07:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangay_paule1`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `photos` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `photos`, `date`, `activity`, `description`) VALUES
(10, 'logo1.png', '2024-04-12', 'Concreting of Pathways ', 'This made due to many have been accident.'),
(11, 'image001.png', '2024-04-13', 'Repair of Line Canal ', 'This made so that prevent people dumping.'),
(12, 'image001.png', '2024-04-19', 'Installation Of CCTV Cameras', 'To have better security'),
(14, 'logo1.png', '2024-04-05', 'test1', 'test'),
(15, 'logo1.png', '2024-04-19', 'Feeding Program', 'Make people happy'),
(16, 'logo1.png', '2024-04-12', 'Laguna', 'Allen'),
(17, 'logo1.png', '2024-04-04', 'Laguna', 'Make people happy');

-- --------------------------------------------------------

--
-- Table structure for table `barangay_officials`
--

CREATE TABLE `barangay_officials` (
  `id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `fullName` varchar(100) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `startOfTerm` date DEFAULT NULL,
  `endOfTerm` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay_officials`
--

INSERT INTO `barangay_officials` (`id`, `position`, `photo`, `fullName`, `contact`, `address`, `startOfTerm`, `endOfTerm`) VALUES
(1, 'Barangay Captain', 'image024.png', 'Nestor Mojado', '09568998450', 'Rizal', '2024-04-03', '2024-05-11'),
(2, 'Kagawad', 'image019.jpg', 'Rohm Isleta', '09568998450', 'Paule1, Rizal, Laguna', '2024-04-16', '2024-05-02'),
(3, 'Kagawad', 'image027.jpg', 'Jared Formales', '09568998450', 'Paule1, Rizal, Laguna', '2024-04-09', '2024-05-02'),
(4, 'Kagawad', 'image018.jpg', 'Roel Mendoza', '09568998450', 'Paule1, Rizal, Laguna', '2024-04-22', '2024-04-22'),
(5, 'Kagawad', 'image028.jpg', 'Oscar Punsalang', '09568998450', 'Paule1, Rizal, Laguna', '2024-04-22', '2024-04-22'),
(6, 'Kagawad', 'image026.png', 'Elsa Cruzin', '09568998450', 'Paule1, Rizal, Laguna', '2024-04-22', '2024-04-22'),
(7, 'Kagawad', 'image015.jpg', 'Eunice Oro', '09568998450', 'Paule1, Rizal, Laguna', '2024-04-22', '2024-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `blotterrecords`
--

CREATE TABLE `blotterrecords` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `complainant` varchar(255) DEFAULT NULL,
  `age1` int(11) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `contact1` varchar(20) DEFAULT NULL,
  `personToComplaint` varchar(255) DEFAULT NULL,
  `age2` int(11) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `contact2` varchar(20) DEFAULT NULL,
  `actionTaken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blotterrecords`
--

INSERT INTO `blotterrecords` (`id`, `status`, `complainant`, `age1`, `address1`, `contact1`, `personToComplaint`, `age2`, `address2`, `contact2`, `actionTaken`) VALUES
(5, 'Dismissed', 'test', 12, 'test', 'test', 'test', 13, '13', 'test', 'test'),
(6, 'Not Active', 'Allen', 10, 'Rizal', '09566888221', 'Allen', 12, '12', '09566888221', 'Arson'),
(8, 'Not Active', 'Bob', 12, 'Rizal', '09566888221', 'Allen', 12, 'Rizal', '09566888221', 'Arson');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(6) UNSIGNED NOT NULL,
  `certificate_name` varchar(255) NOT NULL,
  `requirements` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `certificate_name`, `requirements`, `file`, `created_at`) VALUES
(2, 'Barangay Clearance', 'Validation ID\r\n2 x 2 Picture with white background\r\nProof of Residency', 'Barangay-Clearance.pdf', '2024-04-07 06:04:28'),
(4, 'Business Clearance', 'Barangay Clearance Application Form\r\nProof of Residence\r\nBusiness Permit or License', 'Business-Clearance.pdf', '2024-04-24 00:03:59'),
(5, 'Certificate of Indigency', 'Residence Proof of Indentity\r\nPersonal Information\r\nPurpose Statement', 'Certificate-of-Indigency.pdf', '2024-04-24 00:08:43'),
(6, 'Certificate of Residency', 'Proof of Length of Residency\r\nIdentification Documentation\r\nPurpose Statement', 'Cetificate-of-Residency.pdf', '2024-04-24 00:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `contacts` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `label`, `description`, `contacts`) VALUES
(1, 'Phone Number', 'Barangay Paule 1 Phone Number', '09261777007'),
(2, 'Email', 'Barangay Paule 1 Email', ' brgypauleuno111@gmail.com'),
(3, 'Facebook', 'Barangay Paule 1 Facebook', 'web.facebook.com/paule.uno'),
(4, 'Location', 'Barangay Paule 1 Location', 'https://maps.app.goo.gl/t514G1wjcyxUBbrt9');

-- --------------------------------------------------------

--
-- Table structure for table `economics`
--

CREATE TABLE `economics` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `economics`
--

INSERT INTO `economics` (`id`, `message`) VALUES
(4, 'hpoowow\r'),
(5, 'ioooooo\r'),
(6, 'yowwwww');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(6) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `date`) VALUES
(2, 'How many hours?', '11 pm', '2024-05-03'),
(3, 'How many hours?', '10 pm', '2024-04-26'),
(5, 'What is the office hours?', '9 am - 10 pm', '2024-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `context` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `context`) VALUES
(1, 'The town of Rizal was formerly a Barrio of Nagcarlan during the Spanish era. It was then called Barrio Paule, named after a river that passes through the Barrio towards a site called Alibumbungan, which leads to Lake Kalibato. Barrio Paule was separated from the town of Nagcarlan and became a small town during the American period. Captain Mariano Isles was the president of this Barrio at that time. However, due to the small population and inability to stand alone as a town, it was returned to Nagcarlan.\r\n\r\nPaule was separated from Nagcarlan for the second time through the efforts of Mr. Pedro Urrea to make it a town. However, since the residents couldn\'t support the requirements for it to be a town, it was again returned to Nagcarlan. In 1919, Mr. Fortunato Arban and Mr. Agustin Vista led the organization of this Barrio to become a town, hence it was separated from Nagcarlan for the third time.\r\n\r\nWhen this Barrio became a full-fledged town, it was divided into various sections, and the former center of Barrio Paule became the Poblacion. The small part of the town retained its original name as Barrio Paule. The southern part of it was called Sitio Alibumbungan. Eventually, due to the increasing population in Sitio Alibumbungan, it was made into another Barrio called Barrio Pauli 2. The original Barrio Paule was called Barrio Paule 1. When the term \"barrio\" was changed to Barangay during the time of former President Marcos, the place became known and referred to as Barangay Paule 1.');

-- --------------------------------------------------------

--
-- Table structure for table `importantinfo`
--

CREATE TABLE `importantinfo` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `monthly_income` decimal(10,2) NOT NULL,
  `number_of_years` int(11) NOT NULL,
  `number_household` int(11) NOT NULL,
  `allergies_conditions` text DEFAULT NULL,
  `education` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `importantinfo`
--

INSERT INTO `importantinfo` (`id`, `address`, `barangay`, `city`, `province`, `occupation`, `monthly_income`, `number_of_years`, `number_household`, `allergies_conditions`, `education`, `created_at`) VALUES
(1, '64', 'Barangay Paule 1', 'Rizal', 'Laguna', 'Student', 12.00, 13, 12, 'None', 'College', '2024-04-28 16:33:47'),
(2, '64', 'Barangay Paule 1', 'Rizal', 'Laguna', 'Student', 123.00, 34, 12, 'None', 'College', '2024-04-28 15:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `introduction`
--

CREATE TABLE `introduction` (
  `id` int(11) NOT NULL,
  `paragraph` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `introduction`
--

INSERT INTO `introduction` (`id`, `paragraph`) VALUES
(2, 'Located in the heart of Barangay Paule 1 stands as a vibrant community teeming with rich cultural heritage and diverse traditions. With its picturesque landscapes and close-knit neighborhoods, Paule 1 gives a serene and welcoming environment for residents and visitors alike. From its bustling markets to its tranquil parks, this barangay embodies the essence of harmonious living and community spirit.');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `User_IP` varchar(255) DEFAULT NULL,
  `User_Host` varchar(255) DEFAULT NULL,
  `User_Logdate` datetime DEFAULT NULL,
  `Action` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `major_business`
--

CREATE TABLE `major_business` (
  `id` int(6) UNSIGNED NOT NULL,
  `business_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major_business`
--

INSERT INTO `major_business` (`id`, `business_text`) VALUES
(1, 'Bakery'),
(2, 'Hardware'),
(3, 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `major_income`
--

CREATE TABLE `major_income` (
  `id` int(6) UNSIGNED NOT NULL,
  `income_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major_income`
--

INSERT INTO `major_income` (`id`, `income_text`) VALUES
(1, 'Bakery'),
(2, 'Hardware'),
(3, 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `map_statics`
--

CREATE TABLE `map_statics` (
  `id` int(11) NOT NULL,
  `total_land_area` decimal(10,2) DEFAULT NULL,
  `land_used` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `map_statics`
--

INSERT INTO `map_statics` (`id`, `total_land_area`, `land_used`) VALUES
(1, 39.97, 32.00);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(6) UNSIGNED NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mission`
--

CREATE TABLE `mission` (
  `id` int(11) NOT NULL,
  `paragraph` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mission`
--

INSERT INTO `mission` (`id`, `paragraph`) VALUES
(2, 'Isusulong ang mga programang pangkaunlaran at pangkatahimikan. Hihikayatin ang mga mamamayan na maki-isa sa pangangalaga ng kapaligiran. Pagpapagawa ng mga proyektong panginprastraktura at pagbili ng mga kagamitang pangpalakasan. Ipatutupad ang mga programang pangkalusugan at pangkabuhayan. Paghubog sa wastong pag-uugali ng mga kabataan upang kanilang bigyang halaga ang edukasyon at kinabukasan.');

-- --------------------------------------------------------

--
-- Table structure for table `population`
--

CREATE TABLE `population` (
  `id` int(11) NOT NULL,
  `number_of_population` int(11) NOT NULL,
  `average_household_size` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `population`
--

INSERT INTO `population` (`id`, `number_of_population`, `average_household_size`) VALUES
(1, 1539, 4);

-- --------------------------------------------------------

--
-- Table structure for table `profiledata`
--

CREATE TABLE `profiledata` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `religion` varchar(50) NOT NULL,
  `status` enum('Single','Married','Divorced','Widowed') NOT NULL,
  `emergency_person` varchar(100) NOT NULL,
  `emergency_contact` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiledata`
--

INSERT INTO `profiledata` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `birthdate`, `email`, `contact`, `religion`, `status`, `emergency_person`, `emergency_contact`, `created_at`) VALUES
(1, 'Choselet', 'Durano', 'Cristal', 'Male', '2024-04-24', 'allencristal23@gmail.com', '09566888226', 'Church of Christ', 'Single', 'Rosalie Cristal', '09566888226', '2024-04-28 15:46:38'),
(2, 'Sunshine', 'Durano', 'Cristal', 'Male', '2024-04-02', 'allencristal12@gmail.com', '09566888221', 'Church of Christ', 'Single', 'Rosalie Cristal', '09566888221', '2024-04-28 16:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `proof_of_identity`
--

CREATE TABLE `proof_of_identity` (
  `id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `valid_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proof_of_identity`
--

INSERT INTO `proof_of_identity` (`id`, `picture`, `valid_id`, `created_at`) VALUES
(1, 'profile_pic/123456.jpg', 'valid_id/Allen - Passport Size.jpg', '2024-04-28 16:34:28'),
(2, 'profile_pic/123456.jpg', 'valid_id/Allen - Passport Size.jpg', '2024-04-28 15:50:30');

-- --------------------------------------------------------

--
-- Table structure for table `receivemessages`
--

CREATE TABLE `receivemessages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receivemessages`
--

INSERT INTO `receivemessages` (`id`, `name`, `age`, `email`, `message`, `created_at`) VALUES
(1, 'eweweq', 12, 'allencristal23@gmail.com', 'qwewewqe', '2024-04-08 18:04:01'),
(2, 'Vince Allen', 12, 'allencristal23@gmail.com', 'Hello', '2024-04-26 13:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `total_households` int(11) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `blood_type` varchar(2) DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `monthly_income` decimal(10,2) DEFAULT NULL,
  `household` int(11) DEFAULT NULL,
  `length_of_stay` int(11) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`id`, `photo`, `full_name`, `birth_date`, `birth_place`, `age`, `total_households`, `contact`, `blood_type`, `civil_status`, `occupation`, `monthly_income`, `household`, `length_of_stay`, `religion`, `nationality`, `gender`, `education`) VALUES
(4, 'logo1.png', 'Vince Allen D. Cristal', '2003-12-24', 'San Pablo', 20, 4, '09566888221', 'O', 'Single', 'Student', 1000.00, 500, 20, 'Church of Christ', 'Filipino', 'Male', 'College');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `founding_years` int(11) DEFAULT NULL,
  `environmental_health_status` int(11) DEFAULT NULL,
  `partnerships_organization` int(11) DEFAULT NULL,
  `projects_made` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `founding_years`, `environmental_health_status`, `partnerships_organization`, `projects_made`) VALUES
(1, 2024, 99, 5, 50);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userType` enum('Admin','Resident') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userName`, `password`, `userType`) VALUES
(5, 'Allen', 'allencristal23@gmail.com', 'Allen@125', 'Admin'),
(6, 'Vince Allen Cristal', 'allencristal12@gmail.com', 'Allen@134567', 'Admin'),
(10, 'Vince Allen Cristal', 'allencristal20@gmail.com', 'allen@189989', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `vision`
--

CREATE TABLE `vision` (
  `id` int(11) NOT NULL,
  `paragraph` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vision`
--

INSERT INTO `vision` (`id`, `paragraph`) VALUES
(3, 'Isang maunlad at matahimik na Barangay. Huwaran sa kalinisan at sa pagtutulungan ng mga mamamayan. Mayroong pasilidad at\r\nkumpleto sa kagamitang pampalakasan. May hanap-buhay na mamamayan, nag-aaral at malusog na kabataan.\r\n'),
(4, 'Isang maunlad at matahimik na Barangay. Huwaran sa kalinisan at sa pagtutulungan ng mga mamamayan. Mayroong pasilidad at kumpleto sa kagamitang pampalakasan. May hanap-buhay na mamamayan, nag-aaral at malusog na kabataan.\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blotterrecords`
--
ALTER TABLE `blotterrecords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `economics`
--
ALTER TABLE `economics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `importantinfo`
--
ALTER TABLE `importantinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `introduction`
--
ALTER TABLE `introduction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `major_business`
--
ALTER TABLE `major_business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `major_income`
--
ALTER TABLE `major_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `map_statics`
--
ALTER TABLE `map_statics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mission`
--
ALTER TABLE `mission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `population`
--
ALTER TABLE `population`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiledata`
--
ALTER TABLE `profiledata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proof_of_identity`
--
ALTER TABLE `proof_of_identity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receivemessages`
--
ALTER TABLE `receivemessages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vision`
--
ALTER TABLE `vision`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `barangay_officials`
--
ALTER TABLE `barangay_officials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blotterrecords`
--
ALTER TABLE `blotterrecords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `economics`
--
ALTER TABLE `economics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `introduction`
--
ALTER TABLE `introduction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `major_business`
--
ALTER TABLE `major_business`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `major_income`
--
ALTER TABLE `major_income`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `map_statics`
--
ALTER TABLE `map_statics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mission`
--
ALTER TABLE `mission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `population`
--
ALTER TABLE `population`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profiledata`
--
ALTER TABLE `profiledata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receivemessages`
--
ALTER TABLE `receivemessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vision`
--
ALTER TABLE `vision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
