-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 alhl.shop 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `productNum` int(11) DEFAULT NULL,
  `reCount` int(11) DEFAULT 0,
  `checkOutTime` datetime DEFAULT NULL,
  PRIMARY KEY (`shopId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 alhl.shop:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` (`shopId`, `userId`, `productNum`, `reCount`, `checkOutTime`) VALUES
	(1, 'root', 1, 300, '2020-07-20 12:12:12');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;

-- 테이블 alhl.shop_product 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_product` (
  `spId` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` int(11) DEFAULT NULL,
  `productName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `benefit` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  PRIMARY KEY (`spId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 alhl.shop_product:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` (`spId`, `productNum`, `productName`, `benefit`, `price`) VALUES
	(1, 0, '애곰이', 20, 0),
	(2, 1, '곰곰이', 300, 1000),
	(3, 2, '꿀곰이', 1000, 3000),
	(4, 3, '불곰이', 9999, 5000);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;

-- 테이블 alhl.userdata 구조 내보내기
CREATE TABLE IF NOT EXISTS `userdata` (
  `userId` varchar(12) COLLATE utf8_bin NOT NULL,
  `userName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `userPassword` mediumtext COLLATE utf8_bin DEFAULT NULL,
  `userBirth` date DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `userGender` tinyint(2) DEFAULT NULL,
  `userEmail` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `userEmailHash` mediumtext COLLATE utf8_bin DEFAULT NULL,
  `userEmailCertified` tinyint(2) DEFAULT NULL,
  `userAuthority` tinyint(4) DEFAULT 0,
  `cash` int(11) DEFAULT 0,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 alhl.userdata:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` (`userId`, `userName`, `userPassword`, `userBirth`, `creatTime`, `userGender`, `userEmail`, `userEmailHash`, `userEmailCertified`, `userAuthority`, `cash`) VALUES
	('ding', '송해', '508ebd3d440c37d681e4edb5b84f94b1fe4b708e98281c1e1de002d5813d54e8', '1910-01-01', '2020-06-17 01:27:55', 1, 'zing@naver.com', NULL, NULL, 0, 0),
	('root', '곽지용', '508ebd3d440c37d681e4edb5b84f94b1fe4b708e98281c1e1de002d5813d54e8', '1994-06-27', '2020-06-16 23:08:17', 1, 'rhkrwldyd@naver.com', NULL, NULL, 0, 3000);
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
