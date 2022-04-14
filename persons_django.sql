-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 14 2022 г., 12:21
-- Версия сервера: 5.7.36
-- Версия PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `persons_django`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add menu', 7, 'add_menu'),
(26, 'Can change menu', 7, 'change_menu'),
(27, 'Can delete menu', 7, 'delete_menu'),
(28, 'Can view menu', 7, 'view_menu'),
(29, 'Can add Famous persons', 8, 'add_person'),
(30, 'Can change Famous persons', 8, 'change_person'),
(31, 'Can delete Famous persons', 8, 'delete_person'),
(32, 'Can view Famous persons', 8, 'view_person'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add captcha store', 10, 'add_captchastore'),
(38, 'Can change captcha store', 10, 'change_captchastore'),
(39, 'Can delete captcha store', 10, 'delete_captchastore'),
(40, 'Can view captcha store', 10, 'view_captchastore'),
(41, 'Can add feedback', 11, 'add_feedback'),
(42, 'Can change feedback', 11, 'change_feedback'),
(43, 'Can delete feedback', 11, 'delete_feedback'),
(44, 'Can view feedback', 11, 'view_feedback');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$D2lKqL2xnSTgcaaixmChrJ$h2oOiR2r3Y2/+wVIr2rHA3dOVGvWOuLBgtpJYY6ln2E=', '2022-04-14 11:54:58.934393', 1, 'admin', '', '', '', 1, 1, '2022-04-04 12:55:43.581516'),
(2, 'pbkdf2_sha256$320000$7Rk3oCX2BMP1STdYsxJEtY$9PEQH5+e9cj4ZdKGQDK4XYKJHcShG8pEgQO7arpoWVo=', '2022-04-13 10:29:43.033003', 0, 'wspjoy', '', '', 'wspjoy2011@gmail.com', 0, 1, '2022-04-11 13:16:26.666878'),
(3, 'pbkdf2_sha256$320000$cqiUEsB9WhCofAzChElbLt$TB/TC6MeF2n+M8DY0xoKKhRn8pZnxSKbFPta4mK0A2Y=', '2022-04-13 10:37:06.183301', 0, 'wspjoy1', '', '', 'wspjoy2011@gmail.com', 0, 1, '2022-04-13 10:37:05.938303');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `base_category`
--

DROP TABLE IF EXISTS `base_category`;
CREATE TABLE IF NOT EXISTS `base_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `base_category_name_2fe410e9_uniq` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `base_category`
--

INSERT INTO `base_category` (`id`, `name`, `slug`) VALUES
(1, 'Hackers', 'hackers'),
(2, 'Athletes', 'athletes'),
(3, 'Rappers', 'rappers');

-- --------------------------------------------------------

--
-- Структура таблицы `base_feedback`
--

DROP TABLE IF EXISTS `base_feedback`;
CREATE TABLE IF NOT EXISTS `base_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `time_create` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_feedback_name_4eed7839` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `base_feedback`
--

INSERT INTO `base_feedback` (`id`, `name`, `email`, `content`, `time_create`) VALUES
(1, 'Angry user', 'angry_user@gmail.com', 'I wanna send you to hell!!!', '2022-04-14 10:18:58.826370');

-- --------------------------------------------------------

--
-- Структура таблицы `base_menu`
--

DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE IF NOT EXISTS `base_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_menu_name_62c41c84_uniq` (`name`),
  UNIQUE KEY `base_menu_url_name_7c243cf7_uniq` (`url_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `base_menu`
--

INSERT INTO `base_menu` (`id`, `name`, `url_name`) VALUES
(1, 'Add article', 'add_page'),
(2, 'Feedback', 'feedback'),
(3, 'About', 'about');

-- --------------------------------------------------------

--
-- Структура таблицы `base_person`
--

DROP TABLE IF EXISTS `base_person`;
CREATE TABLE IF NOT EXISTS `base_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time_create` datetime(6) NOT NULL,
  `time_update` datetime(6) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `base_person_cat_id_0de9ec02` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `base_person`
--

INSERT INTO `base_person` (`id`, `title`, `slug`, `content`, `photo`, `time_create`, `time_update`, `is_published`, `cat_id`) VALUES
(1, 'Dr. Dre', 'dr-dre', 'Andre Romelle Young (born February 18, 1965), known professionally as Dr. Dre, is an American rapper, record producer, and entrepreneur. He is the founder and CEO of Aftermath Entertainment and Beats Electronics, and previously co-founded, co-owned, and was the president of Death Row Records. Dr. Dre began his career as a member of the World Class Wreckin\' Cru in 1985 and later found fame with the gangsta rap group N.W.A. The group popularized explicit lyrics in hip hop to detail the violence of street life. During the early 1990s, Dre was credited as a key figure in the crafting and popularization of West Coast G-funk, a subgenre of hip hop characterized by a synthesizer foundation and slow, heavy beats.\r\n\r\nDre\'s solo debut studio album The Chronic (1992), released under Death Row Records, made him one of the best-selling American music artists of 1993. It earned him a Grammy Award for Best Rap Solo Performance for the single \"Let Me Ride\", as well as several accolades for the single \"Nuthin\' but a \'G\' Thang\". That year, he produced Death Row labelmate Snoop Doggy Dogg\'s debut album Doggystyle and mentored producers such as his stepbrother Warren G (leading to the multi-platinum debut Regulate...G Funk Era in 1994) and Snoop Dogg\'s cousin Daz Dillinger (leading to the double-platinum debut Dogg Food by Tha Dogg Pound in 1995), as well as mentor to upcoming producers Sam Sneed and Mel-Man. In 1996, Dr. Dre left Death Row Records to establish his own label, Aftermath Entertainment. He produced a compilation album, Dr. Dre Presents the Aftermath, in 1996, and released a solo album, 2001, in 1999.\r\n\r\nDuring the 2000s, Dre focused on producing other artists, occasionally contributing vocals. He signed Eminem in 1998 and 50 Cent in 2002, and co-produced their albums. He has produced albums for and overseen the careers of many other rappers, including the D.O.C., Snoop Dogg, Xzibit, Knoc-turn\'al, the Game, Kendrick Lamar, and Anderson .Paak. Dre has also had acting roles in movies such as Set It Off, The Wash, and Training Day. He has won six Grammy Awards, including Producer of the Year, Non-Classical. Rolling Stone ranked him number 56 on the list of 100 Greatest Artists of All Time. He was the second-richest figure in hip hop as of 2018 with an estimated net worth of $800 million.\r\n\r\nAccusations of Dre\'s violence against women have been widely publicized. Following his assault of television host Dee Barnes, he was fined $2,500, given two years\' probation, ordered to undergo 240 hours of community service, and given a spot on an anti-violence public service announcement. A civil suit was settled out of court. In 2015, Michel\'le, the mother of one of his children, accused him of domestic violence during their time together as a couple. Their abusive relationship is portrayed in her 2016 biopic Surviving Compton: Dre, Suge & Michel\'le. Lisa Johnson, the mother of three of Dr. Dre\'s children, stated that he beat her many times, including while she was pregnant. She was granted a restraining order against him. Former labelmate Tairrie B claimed that Dre assaulted her at a party in 1990, in response to her track \"Ruthless Bitch\". Two weeks following the release of his third album, Compton in August 2015, he issued an apology to the women \"I\'ve hurt\".[1]', 'photos/2022/04/04/dr_dre.jpg', '2022-04-04 12:59:41.822276', '2022-04-04 12:59:41.822276', 1, 3),
(2, 'Schoolboy Q', 'schoolboy-q', 'Quincy Matthew Hanley (born October 26, 1986), better known by his stage name Schoolboy Q (stylized as ScHoolboy Q), is an American rapper from South Central Los Angeles, California. In 2009, Hanley signed to Carson-based independent record label Top Dawg Entertainment (TDE) and in late 2011, secured a recording contract with major label Interscope Records. Hanley is also a member of the hip-hop supergroup Black Hippy, alongside label-mates and fellow California-based rappers Ab-Soul, Jay Rock, and Kendrick Lamar.\r\n\r\nIn 2008, Hanley released his first full-length project, a mixtape titled ScHoolboy Turned Hustla. He later released a follow-up in 2009, titled Gangsta & Soul. He then returned in January 2011, with his first independent album, titled Setbacks. The project, released under TDE, to digital retailers only, reached number 100 on the US Billboard 200 chart. A little over a year later, his second independent album Habits & Contradictions, was also released exclusively to digital retailers. The album received generally favorable reviews and debuted at number 111 on the US Billboard 200.\r\n\r\nAfter signing with Interscope, Hanley subsequently began recording his major-label debut studio album, titled Oxymoron (2014). The album debuted at number one on the US Billboard 200 and was preceded by the singles \"Collard Greens\" (featuring Kendrick Lamar), \"Man of the Year\", \"Studio\" (featuring BJ the Chicago Kid) and \"Hell of a Night\". The first three singles all charted on the US Billboard Hot 100 chart, with \"Studio\" remaining his best-performing as a lead artist to date.', 'photos/2022/04/04/schoolboyq_.jpg', '2022-04-04 13:00:32.817562', '2022-04-04 13:00:32.817562', 1, 3),
(3, 'Anonymous (hacker group)', 'anonymous-hachers', 'Anonymous is a decentralized international activist and hacktivist collective and movement primarily known for its various cyberattacks against several governments, government institutions and government agencies, corporations and the Church of Scientology.\r\n\r\nAnonymous originated in 2003 on the imageboard 4chan representing the concept of many online and offline community users simultaneously existing as an \"anarchic\", digitized \"global brain\" or \"hivemind\".[2][3][4] Anonymous members (known as anons) can sometimes be distinguished in public by the wearing of Guy Fawkes masks in the style portrayed in the graphic novel and film V for Vendetta.[5] Some anons also opt to mask their voices through voice changers or text-to-speech programs.\r\n\r\nIn its early form, the concept was adopted by a decentralized online community acting anonymously in a coordinated manner, usually toward a loosely self-agreed goal and primarily focused on entertainment (or lulz). Beginning with Project Chanology in 2008—a series of protests, pranks, and hacks targeting the Church of Scientology—the Anonymous collective became increasingly associated with collaborative hacktivism on a number of issues internationally. Individuals claiming to align themselves with Anonymous undertook protests and other actions (including direct action) in retaliation against copyright-focused campaigns by motion picture and recording industry trade associations. Later targets of Anonymous hacktivism included government agencies of the United States, Israel, Tunisia, Uganda and others; the Islamic State; child pornography sites; copyright protection agencies; the Westboro Baptist Church; and corporations such as PayPal, MasterCard, Visa, and Sony. Anons have publicly supported WikiLeaks and the Occupy movement. Related groups LulzSec and Operation AntiSec carried out cyberattacks on U.S. government agencies, media, companies, military contractors, military personnel, and police officers, resulting in the attention of law enforcement to the groups\' activities.\r\n\r\nDozens of people have been arrested for involvement in Anonymous cyberattacks in countries including the United States, the United Kingdom, Australia, the Netherlands, Spain, India, and Turkey. Evaluations of the group\'s actions and effectiveness vary widely. Supporters have called the group \"freedom fighters\"[6] and digital Robin Hoods,[7] while critics have described them as \"a cyber lynch-mob\"[8] or \"cyber terrorists\".[9] In 2012, Time called Anonymous one of the \"100 most influential people\" in the world.[10] Anonymous\' media profile diminished by 2018,[11][12] but the group re-emerged in 2020 to support the George Floyd protests and other causes.[13][14]', 'photos/2022/04/04/anonymous.jpg', '2022-04-04 13:01:16.699645', '2022-04-04 13:01:16.699645', 1, 1),
(6, 'Panda', 'panda', 'Content about panda', 'photos/2022/04/06/dr_dre.jpg', '2022-04-06 10:21:39.920205', '2022-04-11 11:59:55.662077', 1, 1),
(13, 'Mike Tyson', 'mike-tyson', 'Michael Gerard Tyson (born June 30, 1966) is an American former professional boxer who competed from 1985 to 2005. Nicknamed \"Iron Mike\"[3] and \"Kid Dynamite\" in his early career, and later known as \"The Baddest Man on the Planet\",[4] Tyson is considered to be one of the greatest heavyweight boxers of all time.[5] He reigned as the undisputed world heavyweight champion from 1987 to 1990. Tyson won his first 19 professional fights by knockout, 12 of them in the first round. Claiming his first belt at 20 years, four months, and 22 days old, Tyson holds the record as the youngest boxer ever to win a heavyweight title.[6] He was the first heavyweight boxer to simultaneously hold the WBA, WBC and IBF titles, as well as the only heavyweight to unify them in succession. The following year, Tyson became the lineal champion when he knocked out Michael Spinks in 91 seconds of the first round.[7] In 1990, Tyson was knocked out by underdog Buster Douglas[8] in one of the biggest upsets in history.\r\n\r\nIn 1992, Tyson was convicted of rape and sentenced to six years in prison, although he was released on parole after three years.[9][10][11] After his release in 1995, he engaged in a series of comeback fights, regaining the WBA and WBC titles in 1996 to join Floyd Patterson, Muhammad Ali, Tim Witherspoon, Evander Holyfield and George Foreman as the only men in boxing history to have regained a heavyweight championship after losing it. After being stripped of the WBC title in the same year, Tyson lost the WBA title to Evander Holyfield by an eleventh round stoppage. Their 1997 rematch ended when Tyson was disqualified for biting Holyfield\'s ears, one bite notoriously being strong enough to remove a portion of his right ear. In 2002, Tyson fought for the world heavyweight title, losing by knockout to Lennox Lewis.\r\n\r\nTyson was known for his ferocious and intimidating boxing style as well as his controversial behavior inside and outside the ring. With a knockout-to-win percentage of 88%,[12] he was ranked 16th on The Ring magazine\'s list of 100 greatest punchers of all time,[13] and first on ESPN\'s list of \"The Hardest Hitters in Heavyweight History\".[14] Sky Sports described him as \"perhaps the most ferocious fighter to step into a professional ring\".[15] He has been inducted into the International Boxing Hall of Fame and the World Boxing Hall of Fame.', 'photos/2022/04/11/mike_tyson.jpg', '2022-04-11 11:06:49.181391', '2022-04-11 11:06:49.181391', 1, 2),
(14, 'pagination', 'pagination', 'test pagination', 'photos/2022/04/11/ua_payment_54_EyfxvOL.jpg', '2022-04-11 12:03:31.634983', '2022-04-11 12:03:31.634983', 1, 1),
(12, 'te4', 'te4', 'asdasdasd', 'photos/2022/04/11/schoolboyq_.jpg', '2022-04-11 09:44:07.211814', '2022-04-11 09:44:07.212816', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE IF NOT EXISTS `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `response` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `hashkey` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `captcha_captchastore`
--

INSERT INTO `captcha_captchastore` (`id`, `challenge`, `response`, `hashkey`, `expiration`) VALUES
(7, 'ZRFP', 'zrfp', '0188b8dd8b4ca11f534df9d71b36271502f6dcfe', '2022-04-14 10:27:47.373965');

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-04-04 12:56:42.410471', '1', 'Hackers', 1, '[{\"added\": {}}]', 9, 1),
(2, '2022-04-04 12:56:46.523540', '2', 'Athletes', 1, '[{\"added\": {}}]', 9, 1),
(3, '2022-04-04 12:56:54.825540', '3', 'Rappers', 1, '[{\"added\": {}}]', 9, 1),
(4, '2022-04-04 12:57:37.455548', '1', 'Add article', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-04-04 12:57:51.558119', '2', 'Feedback', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-04-04 12:58:06.849567', '3', 'About', 1, '[{\"added\": {}}]', 7, 1),
(7, '2022-04-04 12:58:23.112577', '4', 'Login', 1, '[{\"added\": {}}]', 7, 1),
(8, '2022-04-04 12:59:41.823274', '1', 'Dr. Dre', 1, '[{\"added\": {}}]', 8, 1),
(9, '2022-04-04 13:00:32.818563', '2', 'Schoolboy Q', 1, '[{\"added\": {}}]', 8, 1),
(10, '2022-04-04 13:01:16.700645', '3', 'Anonymous (hacker group)', 1, '[{\"added\": {}}]', 8, 1),
(11, '2022-04-04 13:12:02.348832', '2', 'Athletes', 2, '[{\"changed\": {\"fields\": [\"URL\"]}}]', 9, 1),
(12, '2022-04-04 13:12:08.424209', '1', 'Hackers', 2, '[{\"changed\": {\"fields\": [\"URL\"]}}]', 9, 1),
(13, '2022-04-04 13:12:15.401630', '3', 'Rappers', 2, '[{\"changed\": {\"fields\": [\"URL\"]}}]', 9, 1),
(14, '2022-04-11 11:59:55.664027', '6', 'Panda', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 8, 1),
(15, '2022-04-11 12:03:31.635980', '14', 'pagination', 1, '[{\"added\": {}}]', 8, 1),
(16, '2022-04-11 12:20:32.637207', '4', 'Login', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'base', 'menu'),
(8, 'base', 'person'),
(9, 'base', 'category'),
(10, 'captcha', 'captchastore'),
(11, 'base', 'feedback');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-04 12:54:50.227608'),
(2, 'auth', '0001_initial', '2022-04-04 12:54:50.363941'),
(3, 'admin', '0001_initial', '2022-04-04 12:54:50.397941'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-04 12:54:50.407012'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-04 12:54:50.416944'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-04-04 12:54:50.446941'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-04-04 12:54:50.461941'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-04-04 12:54:50.475941'),
(9, 'auth', '0004_alter_user_username_opts', '2022-04-04 12:54:50.484946'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-04-04 12:54:50.499944'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-04-04 12:54:50.502940'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-04 12:54:50.510942'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-04-04 12:54:50.529942'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-04 12:54:50.543940'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-04-04 12:54:50.557942'),
(16, 'auth', '0011_update_proxy_permissions', '2022-04-04 12:54:50.566948'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-04 12:54:50.581950'),
(18, 'sessions', '0001_initial', '2022-04-04 12:54:50.593941'),
(19, 'base', '0001_initial', '2022-04-04 12:55:09.738653'),
(20, 'base', '0002_alter_person_slug', '2022-04-04 12:56:06.584890'),
(21, 'base', '0003_category_slug', '2022-04-04 13:11:31.657646'),
(22, 'base', '0004_alter_category_slug', '2022-04-04 13:13:06.136030'),
(23, 'captcha', '0001_initial', '2022-04-14 09:44:27.913299'),
(24, 'captcha', '0002_alter_captchastore_id', '2022-04-14 09:44:27.919299'),
(25, 'base', '0005_feedback_alter_category_name_alter_menu_name_and_more', '2022-04-14 10:09:27.848533');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('nw7htbfeuvl3kgi5htrs1w3ezsydrnfq', '.eJxVjEsOwiAUAO_C2hC-hbp07xnI4_GQqoGktCvj3ZWkC93OTObFAuxbCXunNSyJnZlkp18WAR9Uh0h3qLfGsdVtXSIfCT9s59eW6Hk52r9BgV7GVhB64Y2JOmcy2oMFI0iJrI0E7REVThZ9_lKdvYrOSWHtTJM2ysmZvT_XDDcH:1ney3v:ylHnfofhSGrr4LOuPkyfrgCndjeL72OhNzouNfoVAlo', '2022-04-28 11:54:59.018464'),
('dysl9vuoum8k6bss5ty89evesf3oc9b7', '.eJxVjEsOwiAUAO_C2hC-hbp07xnI4_GQqoGktCvj3ZWkC93OTObFAuxbCXunNSyJnZlkp18WAR9Uh0h3qLfGsdVtXSIfCT9s59eW6Hk52r9BgV7GVhB64Y2JOmcy2oMFI0iJrI0E7REVThZ9_lKdvYrOSWHtTJM2ysmZvT_XDDcH:1ndqvq:Jx5LaFumydeCmvJM_ioEed3hBZEXoZixuZ2Q0F-RFLQ', '2022-04-25 10:06:02.427321');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
