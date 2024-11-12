-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 12, 2024 at 10:46 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `steam1`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `game_id`) VALUES
(1, 2, 5),
(2, 2, 5),
(9, 5, 5),
(10, 5, 15),
(11, 5, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `developers`
--

CREATE TABLE `developers` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `logo_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `developers`
--

INSERT INTO `developers` (`id`, `name`, `logo_url`) VALUES
(1, 'Pocketpair', 'https://avatars.akamai.steamstatic.com/3b0fb115571fcc696965c1816ebf948d6de11a56_full.jpg'),
(2, 'Valve', 'https://steamuserimages-a.akamaihd.net/ugc/943956721786371332/100F146F88ED6C2ECD92A40E51123F3B22C0ECD2/?imw=1024&imh=682&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true'),
(3, 'KRAFTON, Inc.', 'https://avatars.akamai.steamstatic.com/3848e679856a3f1e68b27bda1f22f9f8dbacf4df_full.jpg'),
(4, 'Respawn Entertainment', 'https://avatars.akamai.steamstatic.com/ec27b116a739a9b545eec153622541ac78421199_full.jpg'),
(5, '24 Entertainment', 'https://www.gematsu.com/wp-content/uploads/2021/11/Company-Logo_24-Entertainment.png'),
(6, 'Rockstar North', 'https://avatars.akamai.steamstatic.com/d83a1786f23929deb5f20326f128bbc13a9a1e85_full.jpg'),
(7, 'Larian Studios', 'https://avatars.akamai.steamstatic.com/ba71798107fdd46eccc571ae9157a424c8d1cbb6_full.jpg'),
(8, 'Bandai Namco Studios Inc.', 'https://avatars.akamai.steamstatic.com/97ea9619ba3076b8549c1484bef9308a67f0c64d_full.jpg'),
(9, 'CD PROJEKT RED', 'https://avatars.akamai.steamstatic.com/4f1187c11ad41f8aa58b9109efd52c2f8bca9918_full.jpg'),
(10, 'Sky', ''),
(11, 'Ubisoft', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Ubisoft_logo.svg/2238px-Ubisoft_logo.svg.png'),
(12, 'EA Canada & EA Romania', 'https://static.wikia.nocookie.net/logo-timeline/images/9/91/EA_2006_%28Ecosystem%29_%282008%29.jpg/revision/latest/scale-to-width-down/400?cb=20230502074957');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `developer_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `premiere` date DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `title`, `description`, `developer_id`, `publisher_id`, `premiere`, `price`) VALUES
(1, 'Palworld', 'Fight, farm, build and work alongside mysterious creatures called \"Pals\" in this completely new multiplayer, open world survival and crafting game!', 1, 1, '2024-01-19', 139),
(2, 'Counter-Strike 2', 'For over two decades, Counter-Strike has offered an elite competitive experience, one shaped by millions of players from across the globe. And now the next chapter in the CS story is about to begin. This is Counter-Strike 2.', 2, 2, '2012-08-21', 70),
(3, 'Dota 2', 'Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it\'s their 10th hour of play or 1,000th, there\'s always something new to discover. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has taken on a life of its own.', 2, 2, '2013-07-09', 0),
(4, 'PUBG: BATTLEGROUNDS', 'Play PUBG: BATTLEGROUNDS for free. Land on strategic locations, loot weapons and supplies, and survive to become the last team standing across various, diverse Battlegrounds. Squad up and join the Battlegrounds for the original Battle Royale experience that only PUBG: BATTLEGROUNDS can offer.', 3, 3, '2017-12-21', 0),
(5, 'Apex Legends', 'Apex Legends is the award-winning, free-to-play Hero Shooter from Respawn Entertainment. Master an ever-growing roster of legendary characters with powerful abilities, and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.\r\n\r\n', 4, 4, '2020-11-05', 0),
(6, 'NARAKA: BLADEPOINT', 'Dive into the legends of the Far East in NARAKA: BLADEPOINT; team up with friends in fast-paced melee fights for a Battle Royale experience unlike any other. Find your playstyle with a varied cast of heroes with unique skills. More than 20 million players have already joined the fray, play free now!', 5, 5, '2024-09-24', 0),
(7, 'Grand Theft Auto V', 'Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.', 6, 6, '2015-04-13', 65),
(8, 'Baldur\'s Gate 3', 'Baldur’s Gate 3 is a story-rich, party-based RPG set in the universe of Dungeons & Dragons, where your choices shape a tale of fellowship and betrayal, survival and sacrifice, and the lure of absolute power.', 7, 7, '2023-08-03', 249),
(9, 'TEKKEN 8', 'Get ready for the next chapter in the legendary fighting game franchise, TEKKEN 8.', 8, 8, '2024-01-25', 289),
(10, 'Cyberpunk 2077', 'Cyberpunk 2077 is an open-world, action-adventure RPG set in the dark future of Night City — a dangerous megalopolis obsessed with power, glamor, and ceaseless body modification.', 9, 9, '2020-12-10', 199),
(11, 'Banana', 'Banana is a clicker Game, in which you click a Banana! In Banana you click the Banana to gain even more Bananas! Every 3, you get dropped a banana. Each banana is also made by the community in discord. Come hang out with us and let\'s grow into something awesome !', 10, 10, '2024-09-06', 0),
(12, 'Assassin\'s Creed Odyssey', 'Choose your fate in Assassin\'s Creed® Odyssey. From outcast to living legend, embark on an odyssey to uncover the secrets of your past and change the fate of Ancient Greece.', 11, 11, '2018-10-05', 250),
(13, 'Far Cry® 3', 'Discover the dark secrets of a lawless island ruled by violence and take the fight to the enemy as you try to escape. You’ll need more than luck to escape alive!', 11, 11, '2012-12-04', 80),
(14, 'The Witcher 3: Wild Hunt', 'You are Geralt of Rivia, mercenary monster slayer. Before you stands a war-torn, monster-infested continent you can explore at will. Your current contract? Tracking down Ciri — the Child of Prophecy, a living weapon that can alter the shape of the world.', 9, 9, '2015-05-18', 100),
(15, 'The Witcher 2: Assassins of Kings Enhanced Edition', 'A time of untold chaos has come. Mighty forces clash behind the scenes in a struggle for power and influence. The Northern Kingdoms mobilize for war. But armies on the march are not enough to stop a bloody conspiracy...', 9, 9, '2012-04-17', 40),
(16, 'Assassin\'s Creed Revelations', 'Ezio Auditore walks in the footsteps of the legendary mentor Altair, on a dangerous journey of discovery and revelation.', 11, 11, '2011-11-29', 60),
(17, 'Far Cry 5', 'Discover the open world of Hope County, Montana, besieged by a fanatical doomsday cult. Dive into the action solo or two-player co-op in the story campaign, use a vast arsenal of weapons and allies, and free Hope County from Joseph Seed and his cult.', 11, 11, '2018-03-27', 250),
(18, 'Grand Theft Auto 2', 'Grand Theft Auto is back. The cars are faster. The streets are busier. The bad guys are nastier. The police are angrier. And now, the FBI and the Army are getting involved... Seven ruthless gangs are involved in a ruthless power struggle and it is up to you to make a name for yourself. Respect is earned, not given.', 6, 6, '2008-01-04', 30),
(19, 'Grand Theft Auto: Vice City - The Definitive Edition', 'Welcome to the 1980s. From the decade of big hair and pastel suits comes the story of one man\'s rise to the top of the criminal pile. Grand Theft Auto returns with Tommy Vercetti’s tale of betrayal and revenge in a neon-soaked tropical town full of excess and brimming with possibilities', 6, 6, '2023-01-19', 270),
(20, 'EA SPORTS™ FIFA 23', 'FIFA 23 brings The World’s Game to the pitch, with HyperMotion2 Technology, men’s and women’s FIFA World Cup™, women’s club teams, cross-play features**, and more.', 12, 12, '2022-09-30', 299);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `game_library`
--

CREATE TABLE `game_library` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_library`
--

INSERT INTO `game_library` (`id`, `user_id`, `game_id`) VALUES
(1, 1, 5),
(2, 1, 10),
(3, 2, 10),
(4, 2, 2),
(5, 2, 7),
(6, 3, 9),
(7, 3, 4),
(17, 5, 18),
(25, 5, 6),
(35, 5, 13),
(36, 5, 20),
(37, 5, 1),
(38, 5, 9),
(39, 5, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `game_tags`
--

CREATE TABLE `game_tags` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_tags`
--

INSERT INTO `game_tags` (`id`, `game_id`, `tag_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 10, 8),
(4, 10, 5),
(5, 10, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `publishers`
--

CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `logo_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `logo_url`) VALUES
(1, 'Pocketpair', 'https://avatars.akamai.steamstatic.com/3b0fb115571fcc696965c1816ebf948d6de11a56_full.jpg'),
(2, 'Valve', 'https://steamuserimages-a.akamaihd.net/ugc/943956721786371332/100F146F88ED6C2ECD92A40E51123F3B22C0ECD2/?imw=1024&imh=682&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true'),
(3, 'KRAFTON, Inc.', 'https://avatars.akamai.steamstatic.com/3848e679856a3f1e68b27bda1f22f9f8dbacf4df_full.jpg'),
(4, 'Electronic Arts', 'https://avatars.akamai.steamstatic.com/618cc2a46fad78ed1259df505c2de5bb4d806532_full.jpg'),
(5, 'NetEase Games Global', 'https://r.res.easebar.com/pic/20220505/70a5431f-4480-4e2b-8373-fb67272e03f9.jpg'),
(6, 'Rockstar Games', 'https://avatars.akamai.steamstatic.com/d83a1786f23929deb5f20326f128bbc13a9a1e85_full.jpg'),
(7, 'Larian Studios', 'https://steamuserimages-a.akamaihd.net/ugc/1754694721903875532/2CCC36BA0760101AAF196D0C37550D5DEB2AD1F3/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true'),
(8, 'Bandai Namco Entertainment', 'https://avatars.akamai.steamstatic.com/97ea9619ba3076b8549c1484bef9308a67f0c64d_full.jpg'),
(9, 'CD PROJEKT RED', 'https://www.cdprojekt.com/pl/wp-content/uploads-pl/2016/01/cdp_004-1024x760-1024x760.jpg'),
(10, 'Sky', ''),
(11, 'Ubisoft', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Ubisoft_logo.svg/2238px-Ubisoft_logo.svg.png'),
(12, 'Electronic Arts', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtHkMk1uIcXQT0BCVqO4LoVAe4diFoDTNQNw&s');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `contents` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `game_id`, `user_id`, `feedback`, `date`, `contents`) VALUES
(58, 1, 1, 1, '2023-08-12', 'Amazing game! I really enjoyed the storyline and the graphics.'),
(59, 1, 2, 0, '2023-07-22', 'The game was okay, but it had too many bugs.'),
(60, 1, 3, 1, '2023-06-18', 'A solid experience. Highly recommend it to anyone who loves RPGs.'),
(61, 1, 4, 1, '2023-09-10', 'Fantastic multiplayer experience with friends.'),
(62, 1, 5, 0, '2023-05-14', 'I expected more from this game. The mechanics felt clunky.'),
(63, 1, 6, 1, '2023-08-01', 'This is one of the best games I have played this year.'),
(64, 1, 7, 0, '2023-07-30', 'Disappointed by the ending, it felt rushed and unfinished.'),
(65, 1, 8, 1, '2023-08-05', 'I had a great time playing, the open world is breathtaking.'),
(66, 1, 9, 0, '2023-06-24', 'Too many microtransactions ruined the experience for me.'),
(67, 1, 10, 1, '2023-08-20', 'Great value for the price. Excellent gameplay and story.'),
(68, 1, 11, 0, '2023-08-21', 'Graphics are nice, but the gameplay could be better.'),
(69, 1, 12, 1, '2023-07-25', 'I loved every minute of it, a must-play for sure!'),
(70, 1, 13, 0, '2023-07-14', 'The game had potential, but the bugs were unbearable.'),
(71, 1, 14, 1, '2023-09-01', 'Incredible game design and engaging story.'),
(72, 1, 15, 0, '2023-07-01', 'I didn’t enjoy the combat system at all.'),
(73, 1, 16, 1, '2023-08-28', 'Best open-world game I’ve played in years.'),
(74, 1, 17, 0, '2023-06-10', 'Multiplayer mode is full of glitches and lags.'),
(75, 1, 18, 1, '2023-05-09', 'Great graphics and smooth gameplay.'),
(76, 1, 19, 0, '2023-09-04', 'It’s too repetitive after a while.'),
(77, 1, 20, 1, '2023-07-13', 'The storyline was fantastic, kept me hooked till the end.'),
(78, 1, 21, 0, '2023-08-07', 'Expected more from the hype, but it was average.'),
(79, 1, 22, 1, '2023-06-11', 'A very immersive experience with lots of things to do.'),
(80, 1, 23, 0, '2023-07-19', 'Server issues made the multiplayer unplayable.'),
(81, 1, 24, 1, '2023-09-09', 'Good game, but the ending felt a bit rushed.'),
(82, 1, 25, 1, '2023-05-22', 'The exploration aspect of the game is really fun!'),
(83, 1, 26, 0, '2023-06-25', 'It’s just not worth the price, even on sale.'),
(84, 1, 27, 1, '2023-08-03', 'The attention to detail in this game is amazing.'),
(85, 1, 28, 0, '2023-07-05', 'The game had great potential but poor execution.'),
(86, 1, 29, 1, '2023-06-02', 'Loved the combat mechanics, very fluid and responsive.'),
(87, 1, 30, 1, '2023-08-09', 'I enjoyed the characters and the story arc.'),
(88, 1, 31, 0, '2023-06-20', 'The game had too many bugs on launch day.'),
(89, 1, 32, 1, '2023-09-11', 'Fantastic visuals and immersive environments.'),
(90, 1, 33, 0, '2023-07-15', 'The controls were difficult to get used to.'),
(91, 1, 34, 1, '2023-05-11', 'One of the best RPGs I’ve played in a long time.'),
(92, 1, 35, 0, '2023-06-22', 'Lackluster story, didn’t keep me engaged.'),
(93, 1, 36, 1, '2023-08-19', 'I absolutely loved this game! So much to explore.'),
(94, 1, 37, 0, '2023-09-02', 'Too many issues with the AI in single-player mode.'),
(95, 1, 38, 1, '2023-07-07', 'A solid game with great potential for DLCs.'),
(96, 1, 39, 1, '2023-06-29', 'Very enjoyable experience, highly recommend it.'),
(97, 1, 40, 0, '2023-08-16', 'I regret buying it, the bugs were too much.'),
(98, 1, 41, 1, '2023-07-17', 'A beautiful game, and very entertaining.'),
(99, 1, 42, 0, '2023-06-27', 'I expected more content for the price.'),
(100, 1, 43, 1, '2023-09-13', 'Amazing soundtrack, really sets the mood.'),
(101, 1, 44, 0, '2023-05-27', 'The game crashed too often to enjoy it.'),
(102, 1, 45, 1, '2023-06-04', 'A captivating world that I couldn’t stop exploring.'),
(103, 1, 46, 0, '2023-07-11', 'I didn’t like the voice acting at all.'),
(104, 1, 47, 1, '2023-08-23', 'A perfect mix of action and adventure.'),
(105, 1, 48, 1, '2023-06-19', 'Every aspect of this game is well done.'),
(106, 1, 49, 0, '2023-09-12', 'Too many fetch quests, not enough real content.'),
(107, 1, 50, 1, '2023-07-09', 'This game is a masterpiece! The best in its genre.'),
(108, 1, 51, 0, '2023-06-15', 'Not what I expected, was very underwhelmed.'),
(109, 1, 52, 1, '2023-09-08', 'A great time with friends, especially in co-op mode.'),
(110, 1, 53, 0, '2023-08-02', 'The game feels incomplete, maybe after a few patches.'),
(111, 1, 54, 1, '2023-07-29', 'It’s been a joy to play from start to finish.'),
(112, 1, 55, 0, '2023-05-06', 'Not worth the money, even on sale.'),
(113, 2, 56, 1, '2023-07-18', 'Amazing sequel with better mechanics!'),
(114, 2, 57, 0, '2023-06-10', 'The story was too predictable and lacked depth.'),
(115, 2, 58, 1, '2023-05-22', 'Great game, the combat system is vastly improved.'),
(116, 2, 59, 0, '2023-07-02', 'The graphics were nice, but the game is too short.'),
(117, 2, 60, 1, '2023-08-12', 'I loved the character progression and customization.'),
(118, 2, 61, 0, '2023-06-18', 'The controls were clunky and unresponsive.'),
(119, 2, 62, 1, '2023-08-22', 'A fantastic experience, well worth the money.'),
(120, 2, 63, 0, '2023-09-01', 'The AI was frustratingly bad in many situations.'),
(121, 2, 64, 1, '2023-05-11', 'Incredible game design, I was hooked for hours.'),
(122, 2, 65, 0, '2023-08-30', 'It was fun at first, but became repetitive quickly.'),
(123, 2, 66, 1, '2023-06-05', 'Best multiplayer mode I’ve played in a while!'),
(124, 2, 67, 0, '2023-07-21', 'The game has too many bugs, I couldn’t finish it.'),
(125, 2, 68, 1, '2023-08-15', 'Highly enjoyable with friends, the co-op is great.'),
(126, 2, 69, 0, '2023-06-27', 'The microtransactions were a huge disappointment.'),
(127, 2, 70, 1, '2023-09-10', 'The storyline kept me engaged till the very end.'),
(128, 2, 71, 0, '2023-08-07', 'I found the gameplay mechanics outdated.'),
(129, 2, 72, 1, '2023-07-14', 'One of the best games I’ve played this year!'),
(130, 2, 73, 0, '2023-06-20', 'It lacks innovation, felt like more of the same.'),
(131, 2, 74, 1, '2023-05-28', 'Superb graphics and engaging gameplay.'),
(132, 2, 75, 0, '2023-09-05', 'Not worth the full price, maybe on sale.'),
(133, 2, 76, 1, '2023-08-02', 'A fantastic RPG experience with lots of depth.'),
(134, 2, 77, 0, '2023-07-23', 'The multiplayer was full of glitches and lags.'),
(135, 2, 78, 1, '2023-09-13', 'Loved the character customization and progression.'),
(136, 2, 79, 0, '2023-05-19', 'It’s just too repetitive after the first few hours.'),
(137, 2, 80, 1, '2023-08-27', 'A beautiful game with a captivating story.'),
(138, 2, 81, 0, '2023-06-08', 'The controls felt unresponsive and awkward.'),
(139, 2, 82, 1, '2023-09-02', 'The soundtrack and graphics were top-notch.'),
(140, 2, 83, 0, '2023-07-05', 'It’s not a bad game, but it lacks excitement.'),
(141, 2, 84, 1, '2023-08-17', 'A thoroughly enjoyable experience, I loved it!'),
(142, 2, 85, 0, '2023-06-15', 'The game had potential, but felt incomplete.'),
(143, 2, 86, 1, '2023-07-27', 'The world-building is absolutely stunning.'),
(144, 2, 87, 0, '2023-09-03', 'The voice acting was poor and unconvincing.'),
(145, 2, 88, 1, '2023-05-24', 'A game I will remember for a long time.'),
(146, 2, 89, 0, '2023-07-19', 'Too many fetch quests, not enough action.'),
(147, 2, 90, 1, '2023-06-25', 'Great game with hours of replayability.'),
(148, 2, 91, 0, '2023-08-20', 'The multiplayer didn’t live up to the hype.'),
(149, 2, 92, 1, '2023-09-11', 'I loved every minute of it, totally worth it!'),
(150, 2, 93, 0, '2023-07-12', 'Too many bugs on launch day, it was unplayable.'),
(151, 2, 94, 1, '2023-08-09', 'The co-op mode is where this game truly shines.'),
(152, 2, 95, 0, '2023-06-01', 'The game crashed too often, ruining the experience.'),
(153, 2, 96, 1, '2023-09-04', 'The art style is beautiful, I was captivated.'),
(154, 2, 97, 0, '2023-05-31', 'The mechanics were too clunky for my taste.'),
(155, 2, 98, 1, '2023-08-04', 'The story was amazing and full of twists.'),
(156, 2, 99, 0, '2023-07-09', 'Not enough content to justify the price.'),
(157, 2, 100, 1, '2023-06-26', 'One of the most polished games I’ve played this year.'),
(158, 2, 1, 0, '2023-09-07', 'It felt too rushed, not enough attention to detail.'),
(159, 2, 2, 1, '2023-08-14', 'Incredible graphics and smooth gameplay.'),
(160, 2, 3, 0, '2023-06-03', 'The ending was disappointing, left too many loose ends.'),
(161, 2, 4, 1, '2023-09-08', 'Loved the combat system, very fluid and responsive.'),
(162, 3, 5, 1, '2023-07-10', 'The open world was breathtaking, I spent hours exploring.'),
(163, 3, 6, 0, '2023-06-19', 'I was bored after the first few hours, it’s too slow.'),
(164, 3, 7, 1, '2023-09-12', 'The best RPG I have ever played!'),
(165, 3, 8, 0, '2023-08-01', 'The mechanics are outdated and need improvement.'),
(166, 3, 9, 1, '2023-07-26', 'The graphics were stunning, and the gameplay was smooth.'),
(167, 3, 10, 0, '2023-06-22', 'It was too short for the price I paid.'),
(168, 3, 11, 1, '2023-05-17', 'Great game with tons of content and replayability.'),
(169, 3, 12, 0, '2023-09-14', 'I encountered too many game-breaking bugs.'),
(170, 3, 13, 1, '2023-07-16', 'Amazing multiplayer, I had so much fun with friends.'),
(171, 3, 14, 0, '2023-08-03', 'The microtransactions were frustrating and unnecessary.'),
(172, 3, 15, 1, '2023-05-25', 'Beautiful world, and the story was engaging.'),
(173, 3, 16, 0, '2023-07-08', 'It felt rushed and unpolished, not what I expected.'),
(174, 3, 17, 1, '2023-06-29', 'Loved the character customization options.'),
(175, 3, 18, 0, '2023-08-28', 'The voice acting was horrible, it ruined the immersion.'),
(176, 3, 19, 1, '2023-09-09', 'A fantastic RPG experience with a great story.'),
(177, 3, 20, 0, '2023-07-18', 'Too repetitive and lacking in variety.'),
(178, 3, 21, 1, '2023-06-16', 'The DLC content was worth every penny.'),
(179, 3, 22, 0, '2023-05-20', 'It’s just not fun to play, too many issues.'),
(180, 3, 23, 1, '2023-09-06', 'The art style and world-building are top-tier.'),
(181, 3, 24, 0, '2023-08-10', 'The game was fun at first, but it got boring quickly.'),
(182, 3, 25, 1, '2023-07-13', 'A masterpiece of storytelling and gameplay.'),
(183, 3, 26, 0, '2023-06-13', 'Too many bugs and glitches, it was unplayable.'),
(184, 3, 27, 1, '2023-05-31', 'The best RPG I’ve played in years!'),
(185, 3, 28, 0, '2023-08-05', 'The controls were clunky and difficult to master.'),
(186, 3, 29, 1, '2023-07-20', 'Fantastic graphics and an amazing soundtrack.'),
(187, 3, 30, 0, '2023-06-07', 'The ending was a letdown, it felt rushed.'),
(188, 3, 31, 1, '2023-05-10', 'I couldn’t put it down, every moment was exciting.'),
(189, 3, 32, 0, '2023-09-03', 'The multiplayer was full of lag and connection issues.'),
(190, 3, 33, 1, '2023-08-24', 'The combat system was smooth and intuitive.'),
(191, 3, 34, 0, '2023-07-06', 'It’s just not worth the money, very disappointing.'),
(192, 3, 35, 1, '2023-06-04', 'The open world was vast and fun to explore.'),
(193, 3, 36, 0, '2023-08-31', 'The game was too short, not enough content.'),
(194, 3, 37, 1, '2023-07-15', 'An absolute joy to play from start to finish.'),
(195, 3, 38, 0, '2023-06-09', 'The graphics were amazing, but the gameplay lacked depth.'),
(196, 3, 39, 1, '2023-09-11', 'The side quests were engaging and rewarding.'),
(197, 3, 40, 0, '2023-08-20', 'I encountered too many bugs and glitches.'),
(198, 3, 41, 1, '2023-07-04', 'A must-play for any RPG fan, truly excellent!'),
(199, 3, 42, 0, '2023-06-15', 'The AI was frustratingly bad in most parts.'),
(200, 3, 43, 1, '2023-05-21', 'I was blown away by the level of detail in the world.'),
(201, 3, 44, 0, '2023-09-05', 'Too many microtransactions, it ruined the experience.'),
(202, 3, 45, 1, '2023-08-06', 'The story had me hooked from beginning to end.'),
(203, 3, 46, 0, '2023-07-03', 'The combat system was unresponsive and clunky.'),
(204, 3, 47, 1, '2023-05-18', 'One of the best RPGs I’ve ever played.'),
(205, 3, 48, 0, '2023-06-21', 'The game was fun at first, but got boring quickly.'),
(206, 3, 49, 1, '2023-08-26', 'The open world was beautiful, I enjoyed exploring it.'),
(207, 3, 50, 0, '2023-07-29', 'The game was too short, not enough content.'),
(208, 3, 51, 1, '2023-09-02', 'Fantastic experience, well worth the price.'),
(209, 3, 52, 0, '2023-08-13', 'The voice acting was horrible, it ruined the game.'),
(210, 3, 53, 1, '2023-06-17', 'An absolute joy to play, highly recommend it.'),
(211, 3, 54, 0, '2023-05-29', 'The game was full of bugs, I couldn’t finish it.'),
(212, 4, 55, 1, '2023-07-09', 'Amazing storyline with excellent character development.'),
(213, 4, 56, 0, '2023-08-04', 'The game was too repetitive and felt like a chore.'),
(214, 4, 57, 1, '2023-06-11', 'I loved the open world and the freedom to explore.'),
(215, 4, 58, 0, '2023-09-03', 'Too many microtransactions, not enough real content.'),
(216, 4, 59, 1, '2023-07-22', 'Fantastic combat mechanics and fluid gameplay.'),
(217, 4, 60, 0, '2023-06-16', 'It was fun at first, but quickly became boring.'),
(218, 4, 61, 1, '2023-05-12', 'The graphics and art style are absolutely stunning.'),
(219, 4, 62, 0, '2023-08-15', 'I was expecting more, it was just okay.'),
(220, 4, 63, 1, '2023-09-09', 'I enjoyed every minute of this game, highly recommend it!'),
(221, 4, 64, 0, '2023-07-29', 'The voice acting was bad, it ruined the immersion.'),
(222, 4, 65, 1, '2023-08-12', 'The open world was full of life and secrets to discover.'),
(223, 4, 66, 0, '2023-06-18', 'I encountered too many bugs, the game was unplayable.'),
(224, 4, 67, 1, '2023-09-13', 'A fantastic experience with a great story and characters.'),
(225, 4, 68, 0, '2023-07-02', 'The ending was disappointing, it felt rushed.'),
(226, 4, 69, 1, '2023-06-07', 'Incredible world-building and atmosphere.'),
(227, 4, 70, 0, '2023-05-19', 'The controls were difficult to get used to.'),
(228, 4, 71, 1, '2023-08-01', 'I was blown away by the level of detail.'),
(229, 4, 72, 0, '2023-07-21', 'It was just too slow for my taste.'),
(230, 4, 73, 1, '2023-08-20', 'The combat was challenging but rewarding.'),
(231, 4, 74, 0, '2023-09-06', 'Too many fetch quests, not enough excitement.'),
(232, 4, 75, 1, '2023-07-25', 'The world felt alive and full of possibilities.'),
(233, 4, 76, 0, '2023-06-02', 'The game was buggy and crashed too often.'),
(234, 4, 77, 1, '2023-09-08', 'An absolute must-play for RPG fans!'),
(235, 4, 78, 0, '2023-07-14', 'I was expecting more from the game, it was underwhelming.'),
(236, 4, 79, 1, '2023-08-17', 'The graphics were top-notch, and the gameplay was fun.'),
(237, 4, 80, 0, '2023-05-15', 'It just wasn’t for me, too slow and repetitive.'),
(238, 4, 81, 1, '2023-06-24', 'Loved the characters and the storyline, well done.'),
(239, 4, 82, 0, '2023-09-11', 'The voice acting was horrible, couldn’t take it seriously.'),
(240, 4, 83, 1, '2023-08-26', 'I couldn’t stop playing, the game is so addictive!'),
(241, 4, 84, 0, '2023-07-10', 'The game was fun at first, but got boring fast.'),
(242, 4, 85, 1, '2023-06-20', 'The side quests were just as fun as the main story.'),
(243, 4, 86, 0, '2023-08-23', 'Too many bugs and not enough content.'),
(244, 4, 87, 1, '2023-07-04', 'I loved the multiplayer mode, so much fun with friends.'),
(245, 4, 88, 0, '2023-09-04', 'The microtransactions ruined what could’ve been a great game.'),
(246, 4, 89, 1, '2023-06-29', 'The world was beautiful, and I loved exploring it.'),
(247, 4, 90, 0, '2023-05-30', 'The game was too short, not worth the price.'),
(248, 4, 91, 1, '2023-08-30', 'One of the best games I’ve played in a while.'),
(249, 4, 92, 0, '2023-07-17', 'Too many fetch quests, it felt like busywork.'),
(250, 4, 93, 1, '2023-06-13', 'Fantastic combat, I loved every moment of it.'),
(251, 4, 94, 0, '2023-09-12', 'The game didn’t live up to the hype, it was disappointing.'),
(252, 4, 95, 1, '2023-08-06', 'A solid RPG with great story and characters.'),
(253, 4, 96, 0, '2023-07-01', 'The game was fun, but it felt too short.'),
(254, 4, 97, 1, '2023-05-28', 'The game had me hooked from start to finish.'),
(255, 4, 98, 0, '2023-09-01', 'The voice acting was horrible, I couldn’t get into it.'),
(256, 4, 99, 1, '2023-08-13', 'The combat was fluid, and the world was well-designed.'),
(257, 4, 100, 0, '2023-06-03', 'The game was too buggy and unpolished for me.'),
(258, 4, 1, 1, '2023-09-05', 'A fantastic RPG experience with tons of content.'),
(259, 4, 2, 0, '2023-07-27', 'It felt like a cash grab, too many microtransactions.'),
(260, 4, 4, 0, '2023-06-21', 'The gameplay was too repetitive for my taste.'),
(261, 4, 5, 1, '2023-09-10', 'Fantastic experience, I loved every minute of it!'),
(262, 4, 6, 0, '2023-08-16', 'Too many bugs and glitches, it was frustrating.'),
(263, 4, 7, 1, '2023-05-16', 'The multiplayer mode is a lot of fun with friends.'),
(264, 5, 3, 1, '2023-07-19', 'Amazing graphics, I was blown away by the details.'),
(265, 5, 4, 0, '2023-06-21', 'The gameplay was too repetitive for my taste.'),
(266, 5, 5, 1, '2023-09-10', 'Fantastic experience, I loved every minute of it!'),
(267, 5, 6, 0, '2023-08-16', 'Too many bugs and glitches, it was frustrating.'),
(268, 5, 7, 1, '2023-05-16', 'The multiplayer mode is a lot of fun with friends.'),
(269, 5, 8, 0, '2023-09-07', 'I couldn’t enjoy it, the game kept crashing.'),
(270, 5, 9, 1, '2023-07-26', 'The story was immersive, and I was hooked till the end.'),
(271, 5, 10, 0, '2023-06-19', 'The controls were clunky, and the game was hard to play.'),
(272, 5, 11, 1, '2023-05-30', 'A must-play for any RPG fan, highly recommended.'),
(273, 5, 12, 0, '2023-08-25', 'It felt like a cash grab with all the microtransactions.'),
(274, 5, 13, 1, '2023-09-11', 'The world was huge and full of secrets to explore.'),
(275, 5, 14, 0, '2023-07-03', 'The story was too predictable and lacked depth.'),
(276, 5, 15, 1, '2023-06-12', 'One of the best RPGs I’ve played in recent years.'),
(277, 5, 16, 0, '2023-08-14', 'The combat felt stiff and unresponsive at times.'),
(278, 5, 17, 1, '2023-09-01', 'The side quests were just as fun as the main story.'),
(279, 5, 18, 0, '2023-07-22', 'I didn’t enjoy the game, it was too slow for me.'),
(280, 5, 19, 1, '2023-05-23', 'Great combat mechanics, I loved every fight.'),
(281, 5, 20, 0, '2023-08-03', 'The game was full of bugs, couldn’t even finish it.'),
(282, 5, 21, 1, '2023-09-08', 'The art style and soundtrack were top-notch.'),
(283, 5, 22, 0, '2023-06-22', 'It was fun at first, but it got boring fast.'),
(284, 5, 23, 1, '2023-07-12', 'I had so much fun exploring the open world!'),
(285, 5, 24, 0, '2023-09-13', 'The microtransactions ruined the experience for me.'),
(286, 5, 25, 1, '2023-06-26', 'The game was well worth the price, I highly recommend it.'),
(287, 5, 26, 0, '2023-08-09', 'It’s just not worth the full price, wait for a sale.'),
(288, 5, 27, 1, '2023-07-27', 'The world-building was incredible, I was immersed.'),
(289, 5, 28, 0, '2023-05-21', 'The voice acting was bad, it ruined the story.'),
(290, 5, 29, 1, '2023-08-24', 'I loved every minute of the game, well done!'),
(291, 5, 30, 0, '2023-09-05', 'The game felt rushed and unpolished, disappointing.'),
(292, 5, 31, 1, '2023-06-14', 'One of the best RPGs out there, a fantastic experience.'),
(293, 5, 32, 0, '2023-07-17', 'Too many fetch quests, not enough action.'),
(294, 5, 33, 1, '2023-09-03', 'The multiplayer mode is a blast with friends!'),
(295, 5, 34, 0, '2023-08-11', 'I was expecting more, but the game was a letdown.'),
(296, 5, 35, 1, '2023-05-29', 'The graphics were incredible, and the story was gripping.'),
(297, 5, 36, 0, '2023-06-27', 'Too many bugs at launch, couldn’t even play it.'),
(298, 5, 37, 1, '2023-07-07', 'A great RPG experience, worth every penny.'),
(299, 5, 38, 0, '2023-09-06', 'The game was too short, not enough content.'),
(300, 5, 39, 1, '2023-06-09', 'Amazing combat mechanics and a fun world to explore.'),
(301, 5, 40, 0, '2023-07-30', 'The game was fun at first, but got repetitive quickly.'),
(302, 5, 41, 1, '2023-08-19', 'The characters were well-written, I loved the story.'),
(303, 5, 42, 0, '2023-09-04', 'The voice acting was bad, it was hard to take seriously.'),
(304, 5, 43, 1, '2023-06-08', 'The open world was massive and fun to explore.'),
(305, 5, 44, 0, '2023-07-21', 'I didn’t enjoy the game, it wasn’t what I expected.'),
(306, 5, 45, 1, '2023-08-07', 'The side quests were fun and rewarding.'),
(307, 5, 46, 0, '2023-09-12', 'The controls were awkward and hard to use.'),
(308, 5, 47, 1, '2023-06-17', 'One of the best games I’ve played this year.'),
(309, 5, 48, 0, '2023-08-29', 'Too many microtransactions, it ruined the fun.'),
(310, 5, 49, 1, '2023-07-05', 'I couldn’t put the game down, it was that good.'),
(311, 5, 50, 0, '2023-09-02', 'The game had too many issues, I couldn’t enjoy it.'),
(312, 5, 51, 1, '2023-06-28', 'The world was beautiful, and I enjoyed every moment.'),
(313, 5, 52, 0, '2023-08-21', 'The game was too short, not worth the price.'),
(314, 5, 53, 1, '2023-07-01', 'The combat was smooth, and the story was well-written.'),
(315, 5, 54, 0, '2023-09-09', 'I couldn’t finish the game, it was too boring.'),
(316, 6, 58, 1, '2023-09-10', 'One of the best RPGs I’ve played in years.'),
(317, 6, 59, 0, '2023-08-04', 'The game was too short, I expected more content.'),
(318, 6, 60, 1, '2023-07-18', 'Great storyline and fantastic character development!'),
(319, 7, 61, 1, '2023-06-14', 'An immersive world and engaging gameplay, highly enjoyable.'),
(320, 7, 62, 0, '2023-08-19', 'The controls were clunky and difficult to use.'),
(321, 7, 63, 1, '2023-09-11', 'Fantastic soundtrack and stunning visuals, highly recommended.'),
(322, 8, 64, 1, '2023-05-24', 'The world-building in this game is second to none.'),
(323, 8, 65, 0, '2023-06-12', 'The game lacked depth and felt repetitive.'),
(324, 8, 66, 1, '2023-07-29', 'A true masterpiece of storytelling and design.'),
(325, 9, 67, 1, '2023-07-09', 'The open world was vast and fun to explore.'),
(326, 9, 68, 0, '2023-09-03', 'The game was too buggy to be enjoyable.'),
(327, 9, 69, 1, '2023-06-20', 'Great combat mechanics, I enjoyed every battle.'),
(328, 10, 70, 1, '2023-08-17', 'Amazing graphics and an emotional storyline.'),
(329, 10, 71, 0, '2023-07-05', 'Too many technical issues, it was hard to enjoy.'),
(330, 10, 72, 1, '2023-06-30', 'The characters were well-written, and the story was gripping.'),
(331, 11, 73, 1, '2023-08-11', 'One of the most fun multiplayer experiences I’ve had.'),
(332, 11, 74, 0, '2023-09-09', 'The game lacked polish and felt unfinished.'),
(333, 11, 75, 1, '2023-07-07', 'Fantastic world design and fun quests to complete.'),
(334, 12, 76, 1, '2023-05-30', 'The story had me hooked from start to finish.'),
(335, 12, 77, 0, '2023-06-18', 'The gameplay felt outdated and clunky.'),
(336, 12, 78, 1, '2023-07-14', 'A great mix of action and story, I highly recommend it.'),
(337, 13, 79, 1, '2023-08-06', 'I was blown away by the graphics and level design.'),
(338, 13, 80, 0, '2023-09-04', 'Too many glitches, it ruined the experience.'),
(339, 13, 81, 1, '2023-07-01', 'An absolute joy to play, I couldn’t stop.'),
(340, 14, 82, 1, '2023-07-13', 'The story was deep and thought-provoking.'),
(341, 14, 83, 0, '2023-06-22', 'The combat was clunky and not very fun.'),
(342, 14, 84, 1, '2023-08-29', 'A fantastic open-world RPG with a lot to offer.'),
(343, 15, 85, 1, '2023-09-07', 'I enjoyed every minute of this game, highly recommend.'),
(344, 15, 86, 0, '2023-07-20', 'Too many bugs, not worth the money.'),
(345, 15, 87, 1, '2023-08-16', 'The world was beautiful, and the gameplay was fun.'),
(346, 16, 88, 1, '2023-06-09', 'An incredible story and great character development.'),
(347, 16, 89, 0, '2023-07-25', 'The game was full of glitches and very frustrating.'),
(348, 16, 90, 1, '2023-09-02', 'Fantastic combat and a well-designed world.'),
(349, 17, 91, 1, '2023-06-03', 'One of the best RPGs I’ve ever played.'),
(350, 17, 92, 0, '2023-08-05', 'It was okay, but not as good as I expected.'),
(351, 17, 93, 1, '2023-07-08', 'Great story and engaging gameplay, highly recommended.'),
(352, 18, 94, 1, '2023-05-17', 'Amazing graphics and smooth combat mechanics.'),
(353, 18, 95, 0, '2023-06-27', 'The game was too short and felt unfinished.'),
(354, 18, 96, 1, '2023-08-21', 'A solid game with a lot of great content.'),
(355, 19, 97, 1, '2023-07-23', 'The world-building and atmosphere were top-notch.'),
(356, 19, 98, 0, '2023-09-01', 'Too many bugs and glitches, not enjoyable.'),
(357, 19, 99, 1, '2023-08-08', 'Great combat and a fantastic story, well worth the price.'),
(358, 20, 100, 1, '2023-09-12', 'A masterpiece of storytelling and gameplay.'),
(359, 20, 1, 0, '2023-07-11', 'Too repetitive and not very engaging.'),
(360, 20, 2, 1, '2023-06-15', 'Incredible experience from start to finish.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `token`) VALUES
(10, 5, '4b0341b3m5h5uq7r7mdkeu5h3n'),
(14, 5, 'ramqfu0vt8a8sslolsp3hggedc');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `tag_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_name`) VALUES
(1, 'Multiplayer'),
(2, 'Open World'),
(3, 'Creature Collector'),
(4, 'Survival'),
(5, 'RPG'),
(6, 'Singleplayer'),
(7, 'Action RPG'),
(8, 'Sci-fi');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`) VALUES
(1, 'kuba@example.com'),
(2, 'tomek@example.com'),
(3, 'sebastian@example.com'),
(4, 'user21@example.com'),
(5, 'user22@example.com'),
(6, 'user23@example.com'),
(7, 'user24@example.com'),
(8, 'user25@example.com'),
(9, 'user26@example.com'),
(10, 'user27@example.com'),
(11, 'user28@example.com'),
(12, 'user29@example.com'),
(13, 'user30@example.com'),
(14, 'user31@example.com'),
(15, 'user32@example.com'),
(16, 'user33@example.com'),
(17, 'user34@example.com'),
(18, 'user35@example.com'),
(19, 'user36@example.com'),
(20, 'user37@example.com'),
(21, 'user38@example.com'),
(22, 'user39@example.com'),
(23, 'user40@example.com'),
(24, 'user41@example.com'),
(25, 'user42@example.com'),
(26, 'user43@example.com'),
(27, 'user44@example.com'),
(28, 'user45@example.com'),
(29, 'user46@example.com'),
(30, 'user47@example.com'),
(31, 'user48@example.com'),
(32, 'user49@example.com'),
(33, 'user50@example.com'),
(34, 'user51@example.com'),
(35, 'user52@example.com'),
(36, 'user53@example.com'),
(37, 'user54@example.com'),
(38, 'user55@example.com'),
(39, 'user56@example.com'),
(40, 'user57@example.com'),
(41, 'user58@example.com'),
(42, 'user59@example.com'),
(43, 'user60@example.com'),
(44, 'user61@example.com'),
(45, 'user62@example.com'),
(46, 'user63@example.com'),
(47, 'user64@example.com'),
(48, 'user65@example.com'),
(49, 'user66@example.com'),
(50, 'user67@example.com'),
(51, 'user68@example.com'),
(52, 'user69@example.com'),
(53, 'user70@example.com'),
(54, 'user71@example.com'),
(55, 'user72@example.com'),
(56, 'user73@example.com'),
(57, 'user74@example.com'),
(58, 'user75@example.com'),
(59, 'user76@example.com'),
(60, 'user77@example.com'),
(61, 'user78@example.com'),
(62, 'user79@example.com'),
(63, 'user80@example.com'),
(64, 'user81@example.com'),
(65, 'user82@example.com'),
(66, 'user83@example.com'),
(67, 'user84@example.com'),
(68, 'user85@example.com'),
(69, 'user86@example.com'),
(70, 'user87@example.com'),
(71, 'user88@example.com'),
(72, 'user89@example.com'),
(73, 'user90@example.com'),
(74, 'user91@example.com'),
(75, 'user92@example.com'),
(76, 'user93@example.com'),
(77, 'user94@example.com'),
(78, 'user95@example.com'),
(79, 'user96@example.com'),
(80, 'user97@example.com'),
(81, 'user98@example.com'),
(82, 'user99@example.com'),
(83, 'user100@example.com'),
(84, 'user4@example.com'),
(85, 'user5@example.com'),
(86, 'user6@example.com'),
(87, 'user7@example.com'),
(88, 'user8@example.com'),
(89, 'user9@example.com'),
(90, 'user10@example.com'),
(91, 'user11@example.com'),
(92, 'user12@example.com'),
(93, 'user13@example.com'),
(94, 'user14@example.com'),
(95, 'user15@example.com'),
(96, 'user16@example.com'),
(97, 'user17@example.com'),
(98, 'user18@example.com'),
(99, 'user19@example.com'),
(100, 'user20@example.com'),
(101, 'user101@example.com'),
(102, 'user102@example.com'),
(103, 'user103@example.com'),
(104, 'user104@example.com'),
(105, 'user105@example.com'),
(106, 'user106@example.com'),
(107, 'user107@example.com'),
(108, 'user108@example.com'),
(109, 'user109@example.com'),
(110, 'user110@example.com'),
(111, 'user111@example.com'),
(112, 'user112@example.com'),
(113, 'user113@example.com'),
(114, 'user114@example.com'),
(115, 'user115@example.com'),
(116, 'user116@example.com'),
(117, 'user117@example.com'),
(118, 'user118@example.com'),
(119, 'user119@example.com'),
(120, 'user120@example.com'),
(121, 'user121@example.com'),
(122, 'user122@example.com'),
(123, 'user123@example.com'),
(124, 'user124@example.com'),
(125, 'user125@example.com'),
(126, 'user126@example.com'),
(127, 'user127@example.com'),
(128, 'user128@example.com'),
(129, 'user129@example.com'),
(130, 'user130@example.com'),
(131, 'user131@example.com'),
(132, 'user132@example.com'),
(133, 'user133@example.com'),
(134, 'user134@example.com'),
(135, 'user135@example.com'),
(136, 'user136@example.com'),
(137, 'user137@example.com'),
(138, 'user138@example.com'),
(139, 'user139@example.com'),
(140, 'user140@example.com'),
(141, 'user141@example.com'),
(142, 'user142@example.com'),
(143, 'user143@example.com'),
(144, 'user144@example.com'),
(145, 'user145@example.com'),
(146, 'user146@example.com'),
(147, 'user147@example.com'),
(148, 'user148@example.com'),
(149, 'user149@example.com'),
(150, 'user150@example.com'),
(151, 'user151@example.com'),
(152, 'user152@example.com'),
(153, 'user153@example.com'),
(154, 'user154@example.com'),
(155, 'user155@example.com'),
(156, 'user156@example.com'),
(157, 'user157@example.com'),
(158, 'user158@example.com'),
(159, 'user159@example.com'),
(160, 'user160@example.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, '1', '2'),
(2, 'ada', '$2y$10$BY7hd.PQMNAYtLAPdY4H8u8oYafFjsvaeZta22PF71.ZPbdc7gNqC'),
(3, 'asd', '$2y$10$UPLBhb5OYB3LagTmzLB//.2XpsdVq2bYtOm6.81oZW.XifDaf.qc6'),
(4, 'sebatogej', '$2y$10$BZgbh16KpA29aE0AIbchPOJOEO0hs4i.UpfGOBMfnsCGwBJp6wGyW'),
(5, 'test', '$2y$10$AWWIo8rImpInKSQY5UcPQu6ANm86S0X3jz9s4j7saDACLJ8jWzl/y');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indeksy dla tabeli `developers`
--
ALTER TABLE `developers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `developer_id` (`developer_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indeksy dla tabeli `game_library`
--
ALTER TABLE `game_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `game_tags`
--
ALTER TABLE `game_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indeksy dla tabeli `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test` (`game_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `developers`
--
ALTER TABLE `developers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `game_library`
--
ALTER TABLE `game_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `game_tags`
--
ALTER TABLE `game_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`);

--
-- Constraints for table `game_library`
--
ALTER TABLE `game_library`
  ADD CONSTRAINT `game_library_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `game_library_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `game_tags`
--
ALTER TABLE `game_tags`
  ADD CONSTRAINT `game_tags_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `game_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
