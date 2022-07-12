-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for selling_book
CREATE DATABASE IF NOT EXISTS `selling_book` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `selling_book`;

-- Dumping structure for table selling_book.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.admin: ~2 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`ID`, `username`, `password`, `name`) VALUES
	(1, 'admin001', 'admin001', 'admin khong mot'),
	(2, 'admin002', 'admin002', 'admin khong hai');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table selling_book.guest
CREATE TABLE IF NOT EXISTS `guest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.guest: ~2 rows (approximately)
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` (`ID`, `username`, `password`, `address`, `phoneNumber`, `name`) VALUES
	(1, 'user001', 'user001', 'ngõ 151, định công', '0123456789', 'user khong mot'),
	(2, 'user002', 'user002', 'ngõ 151, định công', '0987654321', 'user khong hai');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- Dumping structure for table selling_book.bill
CREATE TABLE IF NOT EXISTS `bill` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `dateBill` datetime NOT NULL,
  `status` enum('PENDING','PAID','CANCELLED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`ID`),
  KEY `FK_bill_guest` (`username`),
  CONSTRAINT `FK_bill_guest` FOREIGN KEY (`username`) REFERENCES `guest` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.bill: ~0 rows (approximately)
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;

-- Dumping structure for table selling_book.book
CREATE TABLE IF NOT EXISTS `book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `createAt` date NOT NULL DEFAULT '2021-11-11',
  `soldNumber` int(10) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `publishYear` int(10) unsigned NOT NULL DEFAULT '2022',
  `image` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `discount` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  
  PRIMARY KEY (`ID`),
  KEY `FK_book_guest` (`username`),
  CONSTRAINT `FK_book_guest` FOREIGN KEY (`username`) REFERENCES `admin` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table selling_book.bill_book
CREATE TABLE IF NOT EXISTS `bill_book` (
  `billId` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `totalPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `bookId` int(11) NOT NULL,
  KEY `billId_bookId` (`billId`,`bookId`),
  KEY `FK_billbook_book` (`bookId`),
  CONSTRAINT `FK_billbook_bill` FOREIGN KEY (`billId`) REFERENCES `bill` (`ID`),
  CONSTRAINT `FK_billbook_book` FOREIGN KEY (`bookId`) REFERENCES `book` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.bill_book: ~0 rows (approximately)
/*!40000 ALTER TABLE `bill_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_book` ENABLE KEYS */;

-- Dumping structure for table selling_book.category
CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.book: ~0 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`ID`, `createAt`, `soldNumber`, `username`, `available`, `author`, `price`, `publishYear`, `image`, `publisher`, `size`, `content`, `discount`, `title`) VALUES
	(1,'2021-11-11',0, 'admin001', 1, 'Ken Wakui', 97750, 2022, 'https://product.hstatic.net/200000287623/product/tokyo_revengers_2_c4f45afa33eb4fd68ee01e63d8b5fb60_master.jpg https://product.hstatic.net/200000287623/product/tokyo-revengers-2-ban-dac-biet__1__7f71b2e839dd4fd0ae5bc90851894509_master.jpg https://product.hstatic.net/200000287623/product/tokyo-revengers-2-ban-thuong__1__8bff6593dc594a1c8b8ee0cc837aef94_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nMời các bạn thưởng thức Tokyo 卍 Revengers tập 2, phiên bản 2 trong 1 của Việt Nam (tương đương tập 3 và 4 bản Nhật), in trên giấy Bãi Bằng 80 gms! Không chỉ vậy, phiên bản này còn có OBI và PHỤ BẢN MÀU GẬP 3 chỉ có tại thị trường Việt Nam!', 15, 'Tokyo 卍 Revengers - 2'),
	(2,'2021-11-12',0, 'admin001', 1, 'KINUGASA SYOUGO', 96000, 2022, 'https://product.hstatic.net/200000287623/product/chao_mung_den_lop_hoc_2_-_bia_1_6b2e803d335141579aaebe29117a73a8_master.jpg https://product.hstatic.net/200000287623/product/chao-mung-den-lop-hoc-2__dac-biet___1__7b4154bd16cd46e78f24bd7ce4f1ffa9_master.jpg https://product.hstatic.net/200000287623/product/chao-mung-den-lop-hoc-2__1__8f52afae6c9b4354a3987e12c8c2d3ac_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nĐược cô bạn xinh xắn tốt bụng Kushida Kikyo khẩn cầu, nam sinh lớp D Ayanokoji Kiyotaka quyết định giúp đỡ Sudo - cậu bạn ngỗ nghịch vừa mắc mưu lớp C và có nguy cơ bị đình chỉ học. Kiyotaka đã nhờ cô bạn bàn bên Horikita Suzune giúp đỡ, nhưng cô lại tỏ ra thờ ơ. Gợi ý duy nhất mà cô nàng Suzune thông minh tiết lộ chính là Sakura Airi - một thành viên kém nổi bật của lớp D. Trong quá trình dõi theo người nắm giữ chìa khóa của vụ việc, nhóm Kiyokata đã phát hiện những bí mật mà Airi luôn chôn giấu…', 20, 'Chào Mừng Đến Lớp Học Đề Cao Thực Lực - 2'),
	(3,'2021-11-13',0, 'admin001', 1, 'Naoya Matsumoto', 49300, 2022, 'https://product.hstatic.net/200000287623/product/monster_8_2_ban_dac_biet_bright_ban_thuong_-_bia1_917a8f9fbff1400f9fb0d5c4b25ac044_master.jpg https://product.hstatic.net/200000287623/product/m8-2-_bright-thuong___1__f23f2b2370e34c38aa4923d7251fb304_master.jpg ', 'Hồng Đức', '12 x 18 cm', 'Nội dung: \nPhần thi cuối cùng của kì thi tuyển Lực lượng Phòng vệ đã kết thúc. Song, quái chính (rõ ràng đã bị tiêu diệt) lại được một quái vật bí ẩn dạng người giúp hồi sinh, từ đó tấn công Shinomiya Kikoru và các thí sinh khác. Ngay lúc Kikoru rơi vào đường cùng, Hibino Kafka đột nhiên xuất hiện trong hình dạng quái vật…! Rốt cuộc con quái vật dạng người kia là ai? Mục đích của nó là gì?Mời các bạn thưởng thức tập 2 ngập tràn bí ẩn!', 15, 'Monster #8 - 2'),
	(4,'2021-11-14',0, 'admin001', 1, 'Naoya Matsumoto', 57800, 2022, 'https://product.hstatic.net/200000287623/product/monster_8_2_ban_dac_biet_bright_ban_thuong_-_bia1_59420fbd20404d93abd65268af470191_master.jpg https://product.hstatic.net/200000287623/product/m8-2-_bright-dac-biet___1__401504a074d34552a0bda4518d79e300_master.jpg ', 'Hồng Đức', '12 x 18 cm', 'Nội dung: \nPhần thi cuối cùng của kì thi tuyển Lực lượng Phòng vệ đã kết thúc. Song, quái chính (rõ ràng đã bị tiêu diệt) lại được một quái vật bí ẩn dạng người giúp hồi sinh, từ đó tấn công Shinomiya Kikoru và các thí sinh khác. Ngay lúc Kikoru rơi vào đường cùng, Hibino Kafka đột nhiên xuất hiện trong hình dạng quái vật…! Rốt cuộc con quái vật dạng người kia là ai? Mục đích của nó là gì?Mời các bạn thưởng thức tập 2 ngập tràn bí ẩn!', 15, 'Monster #8 - 2 (Bright Ver. - Bản Đặc Biệt)'),
	(5,'2021-11-15',0, 'admin001', 1, 'Naoya Matsumoto', 57800, 2022, 'https://product.hstatic.net/200000287623/product/monster_8_2_ban_dac_biet_dark_-_bia1_e506d366af3c4313a7ddf5abaa20c32c_master.jpg https://product.hstatic.net/200000287623/product/m8-2-_dark___1__d0c61f53d23b4cb8a28a36223c32e4c4_master.jpg ', 'Hồng Đức', '12 x 18 cm', 'Nội dung: \nPhần thi cuối cùng của kì thi tuyển Lực lượng Phòng vệ đã kết thúc. Song, quái chính (rõ ràng đã bị tiêu diệt) lại được một quái vật bí ẩn dạng người giúp hồi sinh, từ đó tấn công Shinomiya Kikoru và các thí sinh khác. Ngay lúc Kikoru rơi vào đường cùng, Hibino Kafka đột nhiên xuất hiện trong hình dạng quái vật…! Rốt cuộc con quái vật dạng người kia là ai? Mục đích của nó là gì?Mời các bạn thưởng thức tập 2 ngập tràn bí ẩn!', 15, 'Monster #8 - 2 (Dark Ver. - Bản Đặc Biệt)'),
	(6,'2021-11-16',0, 'admin001', 1, 'Sanbe Kei', 49300, 2022, 'https://product.hstatic.net/200000287623/product/thi-tran-1_de3f287001ac4795aa659a0f7b3f90ed_master.jpg https://product.hstatic.net/200000287623/product/thi-tran-1__1__91810cdb279c495d9f4e05a89615e0b8_master.jpg https://product.hstatic.net/200000287623/product/thi-tran-1-khong-qua__1__d933b316bab946dd85176e6bc1e07699_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nDẫu cuộc sống không như ý, Fujinuma Satoru vẫn phải vật lộn với nó mỗi ngày. Tuy sở hữu năng lực “tua lại” giúp anh quay ngược thời gian, nhưng những gì nó đem đến chỉ toàn tiêu cực…Nhưng rồi một ngày, mọi thứ thay đổi. Một vụ án lớn đã khiến cuộc sống của anh đảo lộn. Liệu năng lực “tua lại” có thể giúp Satoru thoát khỏi tình cảnh hiểm nghèo và sửa chữa sai lầm trong quá khứ không? Hãy đón đọc tập 1 của Thị trấn vắng mình tôi của tác giả Sanbe Kei.', 15, 'Thị Trấn Vắng Mình Tôi - 1'),
	(7,'2021-11-17',0, 'admin001', 1, 'Akiko Higashimura', 49300, 2022, 'https://product.hstatic.net/200000287623/product/ve-voi-van-vo-1_af90b88bcae84445b19ae7edad63cb27_master.jpg https://product.hstatic.net/200000287623/product/ve-voi-1__1__9b7709ce2b2044269500741b0d8a2627_master.jpg https://product.hstatic.net/200000287623/product/ve-voi-1-khong-qua__1__2f1a081aa1074ae2b5d57d10e337fda5_master.jpg ', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nVẽ vời vẩn vơ là những trang hồi ký về hành trình học tập và trở thành họa sĩ truyện tranh của chính tác giả Higashimura. Tập trung vào quãng thời gian cô ở bên vị ân sư tuy nghiêm khắc nhưng luôn hết lòng vì ước mơ hội họa của các học trò.Trải qua nhiều thăng trầm với con đường hội họa và nghề truyện tranh, Higashimura hiện tại là một trong số những tác giả truyện tranh thiếu nữ ăn khách nhất, với nhiều tác phẩm đoạt giải và được chuyển thể thành phim ảnh.', 15, 'Vẽ Vời Vẩn Vơ - 1'),
	(8,'2021-11-18',0, 'admin001', 1, 'Tsurutani Kaori', 49300, 2022, 'https://product.hstatic.net/200000287623/product/ba-gia-doc-boyslove-111_afc7bce47d204534a1d2fc3f5bf69d1a_master.jpg https://product.hstatic.net/200000287623/product/ba-gia-1__1__341d125d3c944288a513c363694e23a9_master.jpg https://product.hstatic.net/200000287623/product/ba-gia-1-khong-qua__1__833d6ce9db204e70843108861fb78660_master.jpg ', 'Hà Nội', '14.5 x 20.5 cm', 'Nội dung: \nBà cụ 75 tuổi Ichinoi sống một mình đã lâu, chỉ vì một lần lỡ mua nhầm truyện mà chính thức bước vào “thế giới mới”. Chính bà Ichinoi cũng chẳng thể ngờ, cuốn truyện Boys Love vô tình mua phải hôm ấy lại khiến bà “lọt hố”, thành lính mới tò te trên con đường “fangirl”. Càng kì diệu hơn, sự cố ấy đã gắn kết cụ bà 75 tuổi với cô nữ sinh trung học Urara 17 tuổi theo cách không ai ngờ đến.Chuyến tàu hồi xuân và hành trình lan tỏa yêu thương của bà cụ đã đi gần hết đời người, xin được bắt đầu.', 15, 'Dưới Hiên Nhà Bà Già Đọc Boys Love - 1'),
	(9,'2021-11-19',0, 'admin001', 1, 'Chan Ho Kei', 77000, 2022, 'https://product.hstatic.net/200000287623/product/hinh_canh_mat_tri_-_bia1_2262bb99f94a471987133299366fe435_master.jpg https://product.hstatic.net/200000287623/product/hinh-canh-mat-tri_56c0a28eeac542e58ad4f4f9ee7f6a6b_master.jpg ', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nKhác với triển khai đồ sộ của 13.67 và Người trong lưới, Hình cảnh mất trí đi theo hướng nhẹ nhàng, nhanh nhẹn và đơn tuyến hơn. Tuy nhiên, cuốn sách cho thấy tác giả vẫn luôn nhất quán về phong cách đan xen trinh thám và thực tại Hồng Kông, cùng thái độ “bi quan nhưng không tuyệt vọng” về tiết tấu xã hội xung quanh.Hình cảnh mất trí là tác phẩm đoạt giải Nhất Trinh thám Soji Shimada năm 2011, và là cú hích để Chan Ho Kei toàn tâm toàn ý đi theo con đường sáng tác chuyên nghiệp, từ đó mới có 13.67 và Người trong lưới về sau.', 23, 'Hình Cảnh Mất Trí'),
	(10,'2021-11-21',0, 'admin001', 1, 'ymz', 144500, 2022, 'https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_db_thuong_595597133c774a18893ada9b58749a04_master.jpg https://product.hstatic.net/200000287623/product/rau__chuong_-_bia_1_ca4cf115794b431a92c6724fc4e4b16e_master.jpg https://product.hstatic.net/200000287623/product/ga_con_-_bia_1_1b31c65805c74780945f4d77f04705b3_master.jpg https://product.hstatic.net/200000287623/product/que-sera_-box_db__1__0c6fce2e17904b529632dc7f5d1dbdfe_master.jpg https://product.hstatic.net/200000287623/product/que-sera_-box_thuong__1__7b1e916b1e3643dd9e8f43812f475a43_master.jpg https://product.hstatic.net/200000287623/product/que-sera_-book__1__f6da016b8b98451ca89a0d8eac7e5f3c_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nQue Sera, Sera - Biết ra sao ngày mai là boxset bao gồm hai tập truyện sau đây của tác giả ymz: Râu, chuông, bong bóng xà phòng và Gà con, màn đêm, công viên giải trí.Hai tập truyện tưởng chừng kể về hai cặp đôi riêng rẽ, nhưng giữa bốn người vẫn có những kết nối: ngoài việc thật sự quen biết nhau, ở họ còn cùng thấp thoáng tinh thần yêu đời, vui sống, nhìn thế giới xung quanh bằng đôi mắt trong veo mà cũng rất đỗi nồng cháy. Để rồi Que Sera, Sera - Biết ra sao ngày mai cũng tựa như hương trà, để lại dư âm phảng phất mà vấn vương lòng người.', 15, 'Que Sera, Sera - Biết Ra Sao Ngày Mai'),
	(11,'2022-11-11',0, 'admin001', 1, 'ymz', 280250, 2022, 'https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_gioi_han_d8cbfa90c8e9429a9ace2fab9d025974_master.jpg https://product.hstatic.net/200000287623/product/rau__chuong_-_bia_1_64aa7ae71b0d42feb416d6f21ee86097_master.jpg https://product.hstatic.net/200000287623/product/ga_con_-_bia_1_09b77d907ea846bf8be38af2a695c85d_master.jpg https://product.hstatic.net/200000287623/product/que-sera_-box_gh_573c3ddda99649acb487a52a3c148f85_master.jpg https://product.hstatic.net/200000287623/product/que-sera_-book__1__751bd6548bc44ff9a7f2c1d3c57d5218_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nQue Sera, Sera - Biết ra sao ngày mai là boxset bao gồm hai tập truyện sau đây của tác giả ymz: Râu, chuông, bong bóng xà phòng và Gà con, màn đêm, công viên giải trí.Hai tập truyện tưởng chừng kể về hai cặp đôi riêng rẽ, nhưng giữa bốn người vẫn có những kết nối: ngoài việc thật sự quen biết nhau, ở họ còn cùng thấp thoáng tinh thần yêu đời, vui sống, nhìn thế giới xung quanh bằng đôi mắt trong veo mà cũng rất đỗi nồng cháy. Để rồi Que Sera, Sera - Biết ra sao ngày mai cũng tựa như hương trà, để lại dư âm phảng phất mà vấn vương lòng người.', 5, 'Que Sera, Sera - Biết Ra Sao Ngày Mai (Bản Giới Hạn)'),
	(12,'2021-05-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_15_-_bia_1_a61b83f49cba4777b6af90f0e16d3665_master.jpg https://product.hstatic.net/200000287623/product/horimiya-15-_dacbiet___1__e8452b6053f34b3e80f518b3bf2f8149_master.jpg https://product.hstatic.net/200000287623/product/horimiya-15-_thuong___1__d1b31e98bceb4d4caa1331f91682fb66_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Thầy Nakamine bí ẩn dạy Vật lý và Yuki bỗng dưng lại thân nhau!? Có người hết sức bồn chồn dõi theo hai người họ, ấy là Toru và… Yasuda…? (Ha ha)Mời các bạn thưởng thức tập 15 của bộ truyện học đường ngọt sâu răng với hai phần truyện về ngày Valentine do tác giả HERO mới sáng tác!', 15, 'Horimiya - 15'),
	(13,'2021-06-11',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_12__manga__-_bia_1_8a333ef9313c4302ae4cd8495b1fd5c7_master.jpg https://product.hstatic.net/200000287623/product/overlord-12_manga__1__b4a84baaf1f64563ae081d945bf42cf6_master.jpg https://product.hstatic.net/200000287623/product/overlord-12_manga-_ko-qua___1__3882bfe497a94540ba325738aa4e2e33_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nCùng lúc cuộc chiến giữa cánh quân của Climb với Sáu Tay đang diễn ra, một trận đối đầu nảy lửa khác cũng bùng nổ giữa nhóm Blue Rose và Entoma tại một cơ sở của Tám Ngón.Những tưởng cuộc chiến sẽ sớm ngã ngũ, nhưng sự đảo chiều liên tục đã dẫn đến một kết quả không thể lường trước, với đỉnh điểm là sự xuất hiện của tên ác quỷ hùng mạnh Jaldabaoth và ngọn lửa luyện ngục bao trùm một phần vương đô.', 15, 'Overlord - 12 (Manga)'),
	(14,'2021-11-01',0, 'admin001', 1, 'Yokomizo Seishi', 108000, 2022, 'https://product.hstatic.net/200000287623/product/thon_tam_mo_-_bia_1_2e377c88c426414fa1abc4e29a91df0a_master.jpg https://product.hstatic.net/200000287623/product/thon-tam-mo__1__367c925559474976936b7582f354dd82_master.jpg ', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nKết thúc Thế chiến 2, Tatsuya xuất ngũ về lại thành phố quê hương, không còn người thân, không xu dính túi, công việc bấp bênh. Bất thần anh nghe trên đài phát tin gia đình giàu có thất lạc từ lâu đang tìm mình.Tatsuya bèn đến nơi gửi tin, gặp được người thân đầu tiên chừng vài phút thì người này mất mạng trước mắt anh.Tatsuya về thôn làng mình chào đời, sang hôm sau thì người thân thứ hai mất mạng trước mắt anh.Sau đó, cứ một vài hôm lại thêm một người mất mạng trước mắt Tatsuya. Anh nghiễm nhiên biến thành kẻ tình nghi lớn nhất, thành kẻ gieo rắc tai ương trong thôn. Tatsuya đi từ ngạc nhiên đến kinh hoàng, khi phát hiện ra đây là nhân quả của tội nghiệt do tổ tiên mình để lại.', 20, 'Thôn Tám Mộ'),
	(15,'2021-12-11',0, 'admin001', 1, 'Asato Asato', 116000, 2022, 'https://product.hstatic.net/200000287623/product/86_ep.5_-_bia1_b7fe25c78619431c8c2f8b5efef5de2a_master.jpg https://product.hstatic.net/200000287623/product/86-tap-5_475c0d97910c42a7a465b7c3b2c748ff_master.jpg https://product.hstatic.net/200000287623/product/86-tap-5-khong-qua_bb4e423feafd44bcafae0b6350872b04_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Tới tìm ta đi.”Sau khi Shin “nhìn” thấy lời nhắn được cho là của Zelena - người phát minh ra Legion, Lena cùng Lữ đoàn Biệt kích Cơ động 86 bước sang chiến trường Vương quốc Liên hiệp Roa Gracia - nơi phát hiện con Ameise màu trắng nghi là Zelena. Tuy nhiên…Chẳng rõ là nhạo báng sự sống hay khinh nhờn cái chết, Vương quốc Liên hiệp đang áp dụng một chiến lược đi chệch luân thường để chống Legion, khiến ngay cả các Tám Sáu còn phải rùng mình. Tại đây, kẻ thù lẩn khuất trong rừng sâu lạnh giá và “cái chết” sát sườn không ngừng trêu đùa nhóm thiếu niên.“Lũ quái vật ẩn mình trong núi tuyết mỉm cười hỏi họ…”', 20, '86 - Eightysix - 5'),
	(16,'2022-01-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_1_-_bia1_c949531f15a248508bf8de4efa93f36a_master.jpg https://product.hstatic.net/200000287623/product/xuong-phep-thuat-9-_dacbiet__cddf538533b846fea28df42ba68df8e3_master.jpg https://product.hstatic.net/200000287623/product/xuong-phep-thuat-9-_thuong__4f7f5c841bcd4c82a5f683acc3dc9649_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCoco cùng các bạn bắt đầu chuẩn bị cho lễ hội đêm bạc diễn ra tại đảo Ezrest. Dòng người tấp nập đổ về đây, bao gồm phù thủy, người thường, và cả những vị khách không mời. Cùng lúc đó, cuộc gặp mặt giữa tam hiền giả và các vị vua của bán đảo Zozah cũng chuẩn bị diễn ra. Mời các bạn đón đọc tập 9 của Xưởng phép thuật, phần mở màn của lễ hội đêm bạc đầy bất ngờ và biến động.', 15, 'Xưởng Phép Thuật - 9'),
	(17,'2021-11-10',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_14_-_bia1_81992d247db14cf996682ef82bdf71f3_master.jpg https://product.hstatic.net/200000287623/product/horimiya-14-_dacbiet__3f1de08b916c486da50dcc39d6cd2855_master.jpg https://product.hstatic.net/200000287623/product/horimiya-14-_thuong__63636cd6995e4ea68cb0d7a39014a42e_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Hội Học sinh luôn tình thương mến thương, song ai chẳng có lúc giận dỗi, cáu bẳn…! Có tranh cãi mới là tuổi trẻ!Mời các bạn thưởng thức tập 14 của bộ truyện học đường ngọt sâu răng với một câu chuyện do tác giả HERO mới sáng tác!', 15, 'Horimiya - 14'),
	(18,'2022-05-11',0, 'admin001', 1, 'Sugaru Miaki', 96000, 2022, 'https://product.hstatic.net/200000287623/product/dau_oi_bay_di_bia_1_020fa4d8277b4323a277b6e3699f4f45_master.jpg https://product.hstatic.net/200000287623/product/dau-oi-bay-di__1__a10b40dabee64a6e85e3db8eddf7fba2_master.jpg https://product.hstatic.net/200000287623/product/dau-oi-bay-di-khong-qua__1__1c95ef282b6043219d8212738c5f533f_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Tôi chết rồi. Anh tính sao đây?”Mùa thu năm 22 tuổi, tôi, một thanh niên đơn độc bị tất cả ruồng bỏ, đáng lẽ đã thành kẻ sát nhân…Nhưng cô gái thiệt mạng dưới tay tôi lại có thể “trì hoãn” cái chết trong mười ngày. Cô quyết định dành mười ngày quý giá đó để trả thù những kẻ đã hủy hoại đời cô.“Tất nhiên, anh cũng phải giúp tôi một tay đấy, Sát Nhân ạ.”Quá trình trả thù đã vô tình dẫn chúng tôi đến với sự thật ẩn giấu đằng sau cuộc gặp gỡ giữa tôi và cô gái.Đó là kỉ niệm về những ngày đau thương mà ấm áp, cùng lời tạm biệt ngày ấy.', 20, 'Đau Ơi Bay Đi!'),
	(19,'2021-11-01',0, 'admin001', 1, 'Tappei Nagatsuki', 96000, 2022, 'https://product.hstatic.net/200000287623/product/re_zero_12_-_bia_1_9a49f946f4e24eafa0616179c8f52617_master.jpg https://product.hstatic.net/200000287623/product/rezero_batdauothegioikhac-12_co-qua___1__a8af312922a245f68da53e92c4184788_master.jpg https://product.hstatic.net/200000287623/product/rezero_batdauothegioikhac-12__1__2c7ad6938f6d48ac89c3602077baf054_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCứ mỗi lần lặp lại, Thánh vực lại phát triển theo một diễn biến khác với kí ức của Subaru. Ở lượt lặp thứ tư, cậu đã giáp mặt một kẻ đáng ra không nên tồn tại: Phù thủy Đố kị.Khi Thánh vực bị bóng ảnh nuốt chửng, Garfiel dù đối địch với Subaru vẫn ra sức tương trợ. Nhờ đó Subaru tìm ra sự thật về nơi chốn vốn là tràng thí nghiệm thất bại này… Nhưng cuối cùng tất cả vẫn cười nhạo vào nỗ lực của cậu, và thế giới bị vùi lấp trong kết cục trắng toát.Hi vọng rồi tuyệt vọng, khám phá sự thật để rồi suy sụp, Subaru vẫn không từ bỏ tương lai, cậu đi tới phần mộ với mong muốn hỏi ý kiến phù thủy. Ở đây, cậu phải đối mặt với “hiện tại không nên tồn tại”…', 20, 'Re: Zero - Bắt Đầu Lại Ở Thế Giới Khác - 12'),
	(20,'2021-11-03',0, 'admin001', 1, 'Akihito Tsukushi', 51000, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_10_-_bia1_9921360783a24a3d86c4a6151af00a88_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-10__1__b88e61813f4244b5bb4c6ffe06234aae_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-10_ko-qua___1__2dbc107a7bc64057b32b402ffd353f6e_master.jpg ', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nReg không thể ngăn được cơn thịnh nộ của Faputa và bị đánh cho bất tỉnh. Tuy nhiên, sau khi tỉnh khỏi giấc mộng dài, Nanachi cùng một nhân vật không ai ngờ tới đã xuất hiện để ngăn cản cuộc chiến. Mỗi người giờ sẽ phải đưa ra lựa chọn của riêng mình. Mời các bạn đón đọc tập 10 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa cơn giận và nỗi buồn!', 15, 'Made In Abyss - 10'),
	(21,'2021-05-11',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_11__manga__-_bia_1_dd77bf7176ed4216bfc58321f7131188_master.jpg https://product.hstatic.net/200000287623/product/overlord-11_manga_a6416a85f41c4a99ab796d06a6da3b03_master.jpg https://product.hstatic.net/200000287623/product/overlord-11_manga-_ko-qua__196697cfc64143c1ab86a7cde0b045ff_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTrở về sau cuộc triệt phá bộ phận mua bán nô lệ của Tám Ngón, Sebas phải ra tay với Tuare để chứng minh lòng trung thành của mình dành cho đấng tối cao. May thay, Ainz đã cho ông và cô gái loài người một cơ hội để họ có thể ở bên nhau tại đại lăng mộ Nazarick. Thế nhưng, bè lũ Sáu Tay vẫn chưa buông tha cho Tuare…Mặt khác, công chúa Renner cùng Blue Rose đang tập hợp đồng minh để loại bỏ tận gốc Tám Ngón khỏi Re-Estize. Các anh hùng Vương quốc một lần nữa tụ hội, đập tan âm mưu của Sáu Tay, những kẻ mạnh nhất Tám Ngón, diệt trừ hoàn toàn thế lực đen tối đang gặm nhấm cả Vương quốc.Thế nhưng, đằng sau tất cả, một kế hoạch to lớn của đại lăng mộ Nazarick mang tên Gehenna dần lộ diện.', 15, 'Overlord - 11 (Manga)'),
	(22,'2021-06-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_13_-_bia_1_d261c67a8db54a939bde8bdfc8311011_master.jpg https://product.hstatic.net/200000287623/product/horimiya-13-_dacbiet___1__d3496f7d82ad46aa8b5e3a9998de1a8b_master.jpg https://product.hstatic.net/200000287623/product/horimiya-13-_thuong___1__5a06f3250b3248c1a77e3cb63216a099_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nỞ trường, Iura là cậu chàng nhặng xị nhưng vẫn được mọi người yêu mến. Về nhà, Iura lại thành người anh nghiêm khắc mà tốt bụng. Cũng như Hori và Miyamura ngày trước, những gì mọi người thấy bên ngoài không phải là tất cả.', 15, 'Horimiya - 13'),
	(23,'2021-07-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_8_-_bia1_f2f2d6d4477a4064a44284e3db9ecac9_master.jpg https://product.hstatic.net/200000287623/product/xuong-phep-thuat-8-_dacbiet__713f50f426d7425e9158bf6f1e0d4063_master.jpg https://product.hstatic.net/200000287623/product/xuong-phep-thuat-8-_thuong__1a71e0ec03e94335b6c8cd7332e8c78c_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTrở về xưởng sau bài kiểm tra tại Đại giảng đường, các phù thủy tập sự bất ngờ được cậu bé Tartah mời tham gia mở cửa hàng tại lễ hội đêm bạc. Trong lúc tất bật chuẩn bị, Coco bất ngờ gặp lại một cậu bé mà cô từng cứu ở sông bậc thang…', 15, 'Xưởng Phép Thuật - 8'),
	(24,'2021-08-11',0, 'admin001', 1, 'Mikage Eiji', 301840, 2022, 'https://product.hstatic.net/200000287623/product/chiechoprongvamaria_1_0549726d971546918c2cb0109336defc_master.jpg https://product.hstatic.net/200000287623/product/chiechoprongvamaria-2_df996b69991c404d82f60fa3a75190af_master.jpg https://product.hstatic.net/200000287623/product/maria_lan_0_3_fd691a32404046389b47ba5069e39a11_master.jpg https://product.hstatic.net/200000287623/product/chiechoprongvamarialan0_4_bia_1_ee4f3c715d61419c8c5285d394d02ea2_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTháng Ba. Lớp học đón chào Otonashi Aya, học sinh mới chuyển tới vào một thời điểm hết sức nửa vời. Trong khi cả lớp còn đang sửng sốt không thốt nên lời trước dung nhan xinh đẹp của bạn học mới, cô bước lên bục giảng và chỉ lạnh lùng nói tên mình. Ai cũng đợi cô tiếp tục… “Hoshino Kazuki.” Không hiểu sao cô ấy lại gọi tên tôi. “Tôi tới để hủy hoại cậu.” Một lời tuyên chiến đường đột. Thâm ý đằng sau những lời lẽ đanh thép nhưng cũng vô cùng thản nhiên của cô gái đang khẽ mỉm cười ấy là gì…!? Tác phẩm đầy li kì, hồi hộp với những điểm nhấn thú vị bất ngờ của tác giả Mikage Eiji sẽ không làm các bạn thất vọng!\n\n\n\n\n\nDefault Title - 301,840₫\n\n\n\n\n\nSố lượng\n\n\n\n\n \n\n \n									Thêm vào giỏ\n								\n\n									Mua ngay\n								\n\n \n\n\n\n						SKU: \n\n\n						Danh mục: \n						\nSách Mới  , \n							\n							Light Novel\n\n\n\n\n\n\n							Tags:\n\n							\nHọc Đường\n								 , \n								\n								\n								\n								\n								\n								\n								\n								\n								\n								Mikage Eiji\n								 ,', 23, 'Combo Chiếc Hộp Rỗng Và Maria Lần 0 - 1 Đến 4'),
	(25,'2021-09-11',0, 'admin001', 1, 'Mikage Eiji', 78400, 2022, 'https://product.hstatic.net/200000287623/product/chiechoprongvamarialan0_4_bia_1_21af76bbe85544fb87bc9027d34b7619_master.jpg https://product.hstatic.net/200000287623/product/maria-lan-0-4__1__7a1fa5a3a02f4c23b8e2f5ce24fd14a1_master.jpg https://product.hstatic.net/200000287623/product/maria-lan-0-4-khong-qua__1__1ada061331dc40288e959591c834035d_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“À… Thôi được rồi. Tôi, chính tôi đây, sẽ trở thành ‘vua’ của các người.”Trong không gian biệt lập đậm chất trung cổ của trò chơi nhập vai điên rồ mang tên Vương quốc Hạ bệ, người chơi phải thông qua những cuộc họp mặt và mật đàm để trừ khử nhau, nhờ đó sống sót và giành chiến thắng.Hoshino Kazuki vẫn chưa thoát khỏi trò chơi lừa gạt kể trên. Để phá vỡ tình trạng bế tắc hiện tại, cậu quyết định trở thành “vua”. Kẻ nắm giữ chìa khóa của mọi vấn đề chính là Omine Daiya, một ẩn số hai mặt. Rốt cuộc Kazuki cũng lần ra sự thật về chủ sở hữu, nhưng…Cuối cùng Vương quốc Hạ bệ cũng hạ màn!', 20, 'Chiếc Hộp Rỗng Và Maria Lần 0 - Tập 4'),
	(26,'2021-10-11',0, 'admin001', 1, 'Tanabe Seiko', 136000, 2022, 'https://product.hstatic.net/200000287623/product/josee__ho_va_ca_boxset_mat_truoc_50c380a87fe941e5b74febb0086a2a6a_master.jpg https://product.hstatic.net/200000287623/product/josee_tai_ban_2d35b685c39844e4a4b0ddefa95b74bc_master.jpg https://product.hstatic.net/200000287623/product/josee__ho_va_ca_1_bia_1_f70587b32b844ba68f3d56c3015b74d3_master.jpg https://product.hstatic.net/200000287623/product/josee__ho_va_ca_2_bia_1_d73838db34784033b5c4de78c33d359b_master.jpg https://product.hstatic.net/200000287623/product/josee-manga_8c91af6b11c745598fce725b5cce7f9e_master.jpg ', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nCậu sinh viên Tsuneo ôm ước mơ du học Mexico vì muốn ngắm nhìn loài cá kì diệu nọ.Cô gái khuyết tật bẩm sinh Josee bị “trói buộc” vào xe lăn, luôn sống khép kín trong thế giới riêng.Ngày nọ, hai con người tưởng như ở hai thế giới khác biệt ấy tình cờ gặp gỡ. Từ thái độ căm ghét, ngượng ngùng ban đầu, cả hai dần dần nảy sinh tình cảm với nhau.Đây là câu chuyện tình yêu đầy sắc màu giữa chàng hoàng tử biển khơi và nàng tiên cá mặt đất.', 15, 'Josee, Hổ Và Cá'),
	(27,'2021-11-16',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord-10-_manga__0319e32ebbe04e939d31bbb7f9b5e658_master.jpg https://product.hstatic.net/200000287623/product/overlord-10_manga_5bbd962ea31c450da05d380905dd0b32_master.jpg https://product.hstatic.net/200000287623/product/overlord-10_manga-_ko-qua__c926c798a90744a384468997ca91b33f_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTrong tình cảnh éo le, đối diện với thế lực đen tối đang nhăm nhe nuốt chửng cả Vương quốc, những người đàn ông của chính nghĩa không hẹn mà tụ hội.Mỗi người một câu chuyện: cậu thiếu niên Climb khát khao sức mạnh để xứng đáng đứng cạnh người mình yêu, gã lính đánh thuê Brain tuyệt vọng khi nhận ra mình quá bé nhỏ trước những quái vật hùng mạnh, và quản gia Sebas Tian của đại lăng mộ Nazarick đang đau đầu giữa lựa chọn cứu giúp cô gái loài người đáng thương hay làm tròn bổn phận của mình.Họ tập hợp lại và cùng chung chiến tuyến vì ngưỡng mộ tinh thần chính nghĩa, sự gan dạ và sức mạnh của nhau, mở ra câu chuyện về những anh hùng của Vương quốc.', 15, 'Overlord - 10 (Manga)'),
	(28,'2021-11-17',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_manga__9_-_bia_1_30c72df692e541c996ffe8977c91bf64_master.jpg https://product.hstatic.net/200000287623/product/overlord_9__manga__-_bia_1_-_mat_trong_d3acca888d6d41e4bc5f40a93fb0f1bb_master.jpg https://product.hstatic.net/200000287623/product/overlord-9_manga_537f2afb3ed044faa3c57907afd5f5c2_master.jpg https://product.hstatic.net/200000287623/product/overlord-9_manga-_ko-qua__ede008daa29a460f85c7c5738201962b_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nNhững cơn sóng ngầm trong Vương quốc Re-Estize đang cuộn trào mạnh mẽ. Các thế lực đen tối không ngừng vươn xúc tu nghiền nát những mảnh đời yếu thế.Sebas Tian phải đứng trước sự giằng co giữa lý tưởng chính nghĩa của bản thân và sứ mệnh của quản gia đại lăng mộ Nazarick.Ẩn sâu dưới Vương quốc trầm lặng, tuy cũ kĩ mà không kém phần lộng lẫy, một bức tranh đầy bi thảm và đau khổ đã được khắc họa qua số phận cô gái loài người đáng thương lỡ sa vào địa ngục. Để rồi từ địa ngục, cô được bầy tôi của sứ giả cái chết cứu vớt và sưởi ấm trái tim đã vỡ vụn.', 15, 'Overlord - 9 (Manga)'),
	(29,'2022-01-11',0, 'admin001', 1, 'Thời Thần', 69300, 2022, 'https://product.hstatic.net/200000287623/product/guong_soi_toi_loi_-_bia1_00dc3b44b26144209ebe4ea5e28710b0_master.jpg https://product.hstatic.net/200000287623/product/guong_soi_toi_loi__5cfcb68fa82846f186b6ca562b799d2d_master.jpg ', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nTrên đảo nhỏ ngoài khơi, có một bệnh viện đặc biệt chuyên thu nhận tội phạm tâm thần. Những kẻ phạm tội hình sự nhưng không thể thụ án vì trở ngại đầu óc sẽ được đưa ra đây để khỏi tiếp tục gây hại cho xã hội.Bầu không khí hung bạo và loạn óc ở đảo có lẽ gây ảnh hưởng đến cả những người tỉnh táo nhất. Chính giám đốc bệnh viện một ngày nọ cũng cầm dao đâm lung tung, mau chóng được giám định tâm thần và đưa vào diện điều trị.', 23, 'Gương Soi Tội Lỗi'),
	(30,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_9_-_bia1_77fe36ef03df4284ae0ebec5e581432d_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-9_9a9fbe96c28b489098bfd3e593534740_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-9_ko-qua__2e1ad5828ab14683a256937b59789de3_master.jpg ', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nSau khi nghe kể về đội cảm tử Ganja, Riko đã biết được sự thật khủng khiếp về Iruburu. Cùng lúc ấy, Reg đang đi với Faputa tới làng để cứu Nanachi. Cậu bé người máy không hề biết rằng hành động của mình sẽ là khởi nguồn cho một cuộc chiến đẫm máu…Mời các bạn đón đọc tập 9 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa lòng nhân từ và sự tôn kính!', 15, 'Made In Abyss - 9'),
	(31,'2021-11-11',0, 'admin001', 1, 'Kareno Akira', 72000, 2022, 'https://product.hstatic.net/200000287623/product/tan_the_neu_khong_ban_ex_-_bia_1_541e642388c846b3ab10f264fdc40ffc_master.jpg https://product.hstatic.net/200000287623/product/tan-the-ex__1__27391aa0b564418c9afed8b5062e4592_master.jpg https://product.hstatic.net/200000287623/product/tan-the-ex-khong-qua__1__4c618632b9d74058bd61bb5bfcc6b7d6_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTrong nắng xuân ấm áp, chiến binh yêu tinh nhí Lakhesh ôm thanh Seniorious và chìm vào ảo mộng…Cô bé mơ về chuyện của 500 năm trước, xoay quanh Legal Brave Lillia 14 tuổi cùng Quasi Brave Willem 15 tuổi và cuộc sống thường ngày của hai sư huynh muội - những người bảo vệ nhân loại khỏi sự đe dọa của Visitor. Toàn chuyện vặt vãnh không đâu, nhưng cũng thật rực rỡ. Và những chuyện cách đây không lâu. Về Chtholly - chiến binh yêu tinh tồn tại với vận mệnh hi sinh, cùng Kĩ sư Vũ khí ếm Hạng nhì Willem Kmetsch. Từng phút, từng giây thương nhớ hóa thành giấc mộng chẳng thể nào quên của hai người.', 20, 'Tận Thế Nếu Không Bận, Anh Cứu Chúng Em Nhé? #EX'),
	(32,'2021-11-11',0, 'admin001', 1, 'Kenji Inoue', 68000, 2022, 'https://product.hstatic.net/200000287623/product/lu_ngoc_12.5_bia_1_96dfca9cc70046b3bec54a2d73d21710_master.jpg https://product.hstatic.net/200000287623/product/lu-ngoc-12_5__1__c5d1f5966b0c4184a857eb9bf59dd559_master.jpg https://product.hstatic.net/200000287623/product/lu-ngoc-12_5-khong-qua__1__947754807f9845ac8a7c062ee9ca6090_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nNhóm Akihisa cùng khối Mười một giành chiến thắng kịch tính trong trận đấu linh thú với khối Mười hai. Nhờ thế, lớp F giành được phòng học xịn với trang thiết bị tử tế, tha hồ tận hưởng cuộc sống học đường thoải mái.Hiện giờ điều đang chiếm trọn sự quan tâm của cả lớp chính là Giáng Sinh! Nhưng cả đám không hề biết rằng hiệu trưởng lại bắt đầu để mắt đến chúng, dẫn đến chuỗi sự kiện “Tôi, đêm Giáng sinh và vòng xoáy âm mưu” gồm hai phần. Tiếp đó, vì không cam lòng chịu đựng cách đối xử của hội con gái, lũ ngốc đã quyết tâm báo thù trong “Tôi, đồng bọn và phi vụ tốc váy”.Tất cả có trong tuyển tập truyện ngắn thứ sáu về thời thanh xuân đầy bùng nổ!', 20, 'Lũ Ngốc, Bài Thi Và Linh Thú Triệu Hồi - 12.5'),
	(33,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_7_ban_thuong_-_bia1_012e444f87c340709fffbbe599f83781_master.jpg https://product.hstatic.net/200000287623/product/xuong-phep-thuat-7-_thuong__7cd2271d2596419d8a3eb7492629dcd2_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau khi hoàn thành xuất sắc bài kiểm tra, Coco được hiền giả Beldaruit triệu tập lúc đêm khuya. Ông ngỏ ý mời cô bé làm đệ tử của mình, đồng thời tiết lộ mối duyên nợ giữa Qifrey và phe phù thủy “mũ vành”. Trong lúc bối rối vì không biết nên tiếp tục làm đệ tử của Qifrey hay không, Coco quyết định tới tháp sách để tìm kiếm câu trả lời!', 15, 'Xưởng Phép Thuật - 7'),
	(34,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_12_-_bia1_b5214d5f4c644781a1d429b8ce16f8e0_master.jpg https://product.hstatic.net/200000287623/product/horimiya-12-_thuong__0b19b2fbba9e40c7aa173808abc18717_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị! Sakura luôn điềm đạm cũng có lúc bồn chồn không yên… vì một bộ truyện tranh thiếu niên! Trùng hợp thay, Yanagi cũng thích đọc truyện tranh thiếu niên…? Mời các bạn thưởng thức tập 12 của bộ truyện học đường ngọt sâu răng với nhiều điều bí mật chưa được bật mí!', 15, 'Horimiya - 12'),
	(35,'2021-11-11',0, 'admin001', 1, 'Mori Kaoru', 46750, 2022, 'https://product.hstatic.net/200000287623/product/emma-10_82ec462bdc424a80aa2b63cbfa421ca8_master.jpg https://product.hstatic.net/200000287623/product/emma-10__1__b5e674207e3d410ea451fb19509cf416_master.jpg https://product.hstatic.net/200000287623/product/emma-10-khong-qua__1__e4e6ad5edbc04b47b12e8feaa6687fb1_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTại sao Adele luôn nghiêm túc trong công việc và không quan tâm tới chuyện kết hôn?Maria và Alma thời mới tới dinh thự ra sao?Arthur có thời học sinh thế nào ở trường nội trú?Eleanor liệu đã tìm được hạnh phúc của riêng cô chưa?Ngoài ra, Emma và William thì sao? Cuối cùng họ có được bên nhau lâu dài?Tập 10 này là tập ngoại truyện thứ ba, cũng là tập cuối của Emma. Bộ truyện kết thúc nhưng sẽ đem tớihình ảnh một nước Anh đã bước sang thời kì mới, thế kỉ mới, cùng những con người đáng yêu, luôn tràntrề hi vọng vào tương lai phía trước.', 15, 'Emma - 10'),
	(36,'2021-11-11',0, 'admin001', 1, 'Asato Asato', 96000, 2022, 'https://product.hstatic.net/200000287623/product/86_ep.4_bia_1_66f1c9ee51614364bb95b654cab2e619_master.jpg https://product.hstatic.net/200000287623/product/86-tap-4-khong-qua__1__3ea476928bdd4ef6aa67473dbab8169e_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau cuộc hội ngộ định mệnh, Shin và Lena nhanh chóng xích lại gần nhau, làm Frederica và Crena ngay ngáy lo sợ, còn Raiden và những người khác phải giữ ý đến phát mệt. Tuy nhiên, quãng thời gian nghỉ ngơi ngắn ngủi nhanh chóng kết thúc. Đơn vị mới do Lena chỉ huy tác chiến nhận được nhiệm vụ đầu tiên. Dưới ga tàu điện ngầm tại thành phố phía Bắc Cộng hòa, căn cứ khổng lồ của Legion đang đón đợi họ. Thứ ẩn sâu dưới đó là “mặt tối”. Của Legion. Của Cộng hòa. Và của cả những con người từng bị tổ quốc bức hại. “Tiếng gọi vọng lên từ lòng đất, báo hiệu thử thách mới cho nhóm thiếu niên.”', 20, '86 - Eightysix - 4'),
	(37,'2021-11-11',0, 'admin001', 1, 'Yoshino Satsuki', 264600, 2012, 'https://product.hstatic.net/200000287623/product/handa-1_091ac6631b5c4670b6e5997266ccae9a_master.jpg https://product.hstatic.net/200000287623/product/handa-7_651fc39207db4d668e08c696514c7ec1_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCombo Trọn Bộ Handa - 1 Đến 7HANDA là bộ truyện kể về thời đi học của nhà thư pháp Handa Seishu, nhân vật chính của BARAKAMON. Mời các bạn thưởng thức bộ truyện hài hước mà cũng bế tắc bởi những hiểu lầm tuổi thanh xuân!', 16, 'Combo Trọn Bộ Handa - 1 Đến 7'),
	(38,'2021-11-11',0, 'admin001', 1, 'Yoshino Satsuki', 38250, 2022, 'https://product.hstatic.net/200000287623/product/handa-7_62d69a9b50c042bdb81579c085273d97_master.jpg https://product.hstatic.net/200000287623/product/handa-7__1__0447254298a84072b9b6b4d4135cc05a_master.jpg https://product.hstatic.net/200000287623/product/handa-7-khong-qua__1__9ba5eb3259184ff983aa6bd90cd15ded_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTập 7 là tuyển tập gồm ba ngoại truyện được vẽ sau khi phần truyện chính của Handa kết thúc, truyện màu bốn khung chỉ xuất hiện trên tạp chí Nguyệt san Thiếu niên Gan Gan và những phụ trương do chính tác giả Yoshino Satsuki vẽ thêm mỗi khi ra tập mới. Ngoài ra còn có đôi lời giải thích, tâm sự của tác giả.Đây thật sự là tập cuối của Handa!', 15, 'Handa - 7'),
	(39,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_8_-_bia1_d593dda377084ba987932aa808d05827_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-8-_thuong___1__9281331ec5544de4909a65789bf2125c_master.jpg ', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nSau khi bị chia cắt với Reg và Nanachi, Riko đã tìm thấy một nơi ở rìa ngôi làng gọi là “Hốc mắt” và gặp cô gái mang tên Vueko. Để cứu bạn mình, Riko quyết tâm tìm hiểu về Faputa. Quá khứ đen tối của ngôi làng đang dần hé lộ…Mời các bạn đón đọc tập 8 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa mong muốn và từ bỏ!', 15, 'Made In Abyss - 8'),
	(40,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_11_-_bia_1_39e1f716b31a4a8fbb384c14e9c6c3c8_master.jpg https://product.hstatic.net/200000287623/product/horimiya-11-_thuong___1__61534b5e1ef64906b88e7dc4b1db841c_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nYuki vẫn chưa xác định được tình cảm mình dành cho Toru là tình yêu hay tình bạn. Mặc dù mối quan hệ với Yuki còn mập mờ, Toru vẫn rất quý trọng khoảng thời gian “khó hiểu” mà bình yên bên cạnh cô ấy…Những tháng ngày êm đềm của học kì 3 lớp 12 dần trôi qua. Mời các bạn thưởng thức tập 11 của bộ truyện học đường ngọt sâu răng!', 15, 'Horimiya - 11'),
	(41,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_6_-_bia_1_ab0ab409c8824613baf55caa8153f494_master.jpg https://product.hstatic.net/200000287623/product/xuong-phep-thuat-6-_thuong___1__77ad11ccfa4a419cbaeadc60a123616e_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau khi đụng độ phe “mũ vành”, Qifrey và được đưa về Đại giảng đường, nơi các phù thủy sinh sống. Ở đây, Coco và những người bạn đã gặp Beldaruit, một trong tam hiền giả đứng đầu thế giới phù thủy, và được ông cho phép kiểm tra lại vòng hai. Liệu nhóm Coco có thể đưa ra đáp án mà vị hiền giả tinh thông mọi phép thuật này yêu cầu không?', 15, 'Xưởng Phép Thuật - 6'),
	(42,'2021-11-11',0, 'admin001', 1, 'Reki Kawahara', 140000, 2022, 'https://product.hstatic.net/200000287623/product/sao_22_-_bia_1_d8c52d3fb2094fba973e06e4936ca5d7_master.jpg https://product.hstatic.net/200000287623/product/sao-22-_full-qua___1__1792ad763ff441d98a6d845f03bfe93b_master.jpg https://product.hstatic.net/200000287623/product/sao-22-_bookmark___1__14010394b54b493da36a924d76d927f4_master.jpg https://product.hstatic.net/200000287623/product/sao-22-_ko-qua___1__e170d90cc42249c8b7e77a807631551d_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nMột MMO hay thường sẽ có vô vàn quest phụ để bổ sung cho cốt truyện chính. Ý tưởng này đã tạo nên Sword Art Online 022 “Kiss and Fly”, vén mở một góc nhìn chi tiết hơn vào thế giới trò chơi của Kirito và bạn bè, thông qua bốn truyện ngắn.', 20, 'Sword Art Online - 22'),
	(43,'2021-11-11',0, 'admin001', 1, 'Mori Kaoru', 40800, 2022, 'https://product.hstatic.net/200000287623/product/emma_9_bia_1_fb52656341ee44db9d291c130cbebe9e_master.jpg https://product.hstatic.net/200000287623/product/emma-9__1__529addd799544d5f9a7434d2da180c23_master.jpg https://product.hstatic.net/200000287623/product/emma-9-khong-qua__1__015264623d524e318675e79599456a75_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nBước sang tập 9 cũng là tập ngoại truyện thứ hai, tác giả Mori Kaoru tiếp tục tiết lộ những câu chuyện nhỏ thú vị về gia đình Mölders cùng các cô hầu gái, thời nhỏ của William và Hakim, thậm chí cả câu chuyện về các ca sĩ opera từng xuất hiện trong các tập trước.', 15, 'Emma - 9'),
	(44,'2021-11-11',0, 'admin001', 1, 'Lôi Mễ', 129360, 2022, 'https://product.hstatic.net/200000287623/product/nang_tien_ca_-_bia_1_a07f6767f571461cae17ab5c91db61c5_master.jpg https://product.hstatic.net/200000287623/product/nang-tien-ca-__1__778e2408ee2542fa809aa973aff45274_master.jpg https://product.hstatic.net/200000287623/product/nang-tien-ca_ko-qua___1__758bf1793e8745f29139babce9f8d367_master.jpg ', 'Hồng Đức', '15.5 x 24 cm', 'Nội dung: \nSau khi gieo mình xuống biển, nàng tiên cá phải chịu đựng ba trăm năm thử thách mới được ban cho linh hồn bất diệt. Nếu nàng gặp được trẻ ngoan, thời gian thử thách rút đi một năm. Chẳng may gặp phải trẻ ác, thử thách lại tăng thêm một ngày.', 23, 'Nàng Tiên Cá (Trinh Thám)'),
	(45,'2021-11-11',0, 'admin001', 1, 'Kenji Inoue', 68000, 2022, 'https://product.hstatic.net/200000287623/product/lu_ngoc_12_bia_1_c2c6a39a1bdf4135b07ea23f1b4278d2_master.jpg https://product.hstatic.net/200000287623/product/lu-ngoc-12_9059e56121e444f79f4392512b52f050_master.jpg https://product.hstatic.net/200000287623/product/lu-ngoc-12-khong-qua_e12ea83effb94ec5a36943e0dd9d6ccb_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nThua đến nơi rồi sao!? Cuối cùng, bên bại trận phải cống nạp… Không! Nhờ kế sách của Yuji, ngày đầu tiên của cuộc chiến triệu hồi đã kết thúc với tình thế còn một tia hi vọng cho khối Mười một. Bước sang ngày thứ hai, chênh lệch chiến lực còn rất lớn, nhưng dưới sự chỉ huy của Yuji, khối Mười một đã lấy lại tinh thần. Giữa cuộc chiến khốc liệt, Akihisa đang thực hiện nhiệm vụ thì gặp kẻ ngáng đường là chỉ huy khối Mười hai, Takashiro. Biết được nỗi khổ tâm thật sự của Mizuki, Akihisa sẽ…!?“Này Akihisa.”“Gì thế Yuji?”“Trường chúng ta thú vị nhỉ?”Bữa tiệc của lũ ngốc, cuối cùng cũng đến hồi kết!', 20, 'Lũ Ngốc, Bài Thi Và Linh Thú Triệu Hồi - 12'),
	(46,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_7_-_bia1_95a5237ab088440a80c98424da7c291c_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-7-_dacbiet__71f2ebbc0ca040f1a646c7c97c490d7b_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-7-_thuong__222d71f1350a4fffb90911404e7de99d_master.jpg ', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nĐặt chân tới tầng 6 một đi không trở lại, nhóm Riko đã tìm thấy ngôi làng của những kẻ biến dị. Ở đây ai cũng sở hữu những “giá trị” độc nhất và có thể dùng để trao đổi hàng hóa. Đúng lúc ấy, Nanachi lại đưa ra một quyết định vội vàng, đặt Riko vào tình thế vô cùng khó xử…Liệu Riko sẽ giải quyết chuyện này ra sao? Mời các bạn đón đọc tập 7 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa những điều thần bí và bình thường!', 15, 'Made In Abyss - 7'),
	(47,'2021-11-11',0, 'admin001', 1, 'Yoshino Satsuki', 38250, 2022, 'https://product.hstatic.net/200000287623/product/handa-6_6d3a69e40fea42f4ac3da5d839e7ef08_master.jpg https://product.hstatic.net/200000287623/product/handa-6_cc5614bde5514f1b92b7ba222059c7c9_master.jpg https://product.hstatic.net/200000287623/product/handa-6-khong-qua_94cc282fc78249b29ae35e233436d32d_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Chúng ta sẽ đưa Handa lên làm KING của lễ hội văn hóa!” - by Tập thể lớp 11-7 (tên thường gọi: lớp Handa)Một lần nữa bị ra rìa (ấy là chính chủ tưởng thế), song chứng kiến các bạn nỗ lực, suy nghĩ của Handa cũng dần thay đổi…!?Mời các bạn thưởng thức tập 6, cũng là tập cuối của Handa, spin-off của Barakamon! (Nói thì nói thế chứ vẫn còn tập 7 là tuyển tập ngoại truyện nhé các độc giả!)', 15, 'Handa - 6'),
	(48,'2021-11-11',0, 'admin001', 1, 'Keigo Higashino', 96000, 2022, 'https://product.hstatic.net/200000287623/product/sau_gio_hoc-bia_1-sua_635b03be09334b078ec372328be31261_master.jpg https://product.hstatic.net/200000287623/product/sau-gio-hoc_a1cb39c0168c4695b98d48d20ceddb58_master.jpg ', 'Hà Nội', '13.5 x 20.5 cm', 'Nội dung: \nSAU GIỜ HỌC là tác phẩm đánh dấu việc ra mắt với tư cách nhà văn của Keigo Higashino.Câu chuyện viết theo hướng “âm mưu lồng âm mưu”, xoay quanh những án mạng diễn ra ở một trường cấp ba.Trừ vài người bạn thân, Keigo không chia sẻ với ai về việc sáng tác. Cha mẹ và hai chị gái của ông không biết, tất nhiên càng phải giữ kín với công ty đang làm. Mỗi khi cảm thấy không vui ở công ty, Keigo lại tìm khuây khỏa trong bản thảo.', 20, 'Sau Giờ Học'),
	(49,'2021-11-11',0, 'admin001', 1, 'Tsugumi Ohba', 51000, 2022, 'https://product.hstatic.net/200000287623/product/deathnoteshortstories_bia_1_b789836ebfe440af9762a9421bb18ff7_master.jpg https://product.hstatic.net/200000287623/product/deathnote-ss_82dcf2e944064cfeabd56c7eec1ed19b_master.jpg ', 'Hà Nội', '12 x 18 cm', 'Nội dung: \nRyuk… lại đánh rơi sổ à?Không! Lần này là đổi sổ lấy táo!9 năm sau khi thám tử thiên tài L ra đi, 3 năm sau khi Kira Yagami Raito bị tử thần Ryuk viết tên vào sổ, những câu chuyện mới về sổ tử thần lại bắt đầu…Sau 10 năm, nhân giới đã thay đổi chóng mặt, nhưng bản tính loài người liệu có khác xưa chăng?', 15, 'Death Note Short Stories'),
	(50,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya-10---bia1_6361c39761ea484ab6411f9507184ad6_master.jpg https://product.hstatic.net/200000287623/product/horimiya-10-_thuong__w_83c6bb1b6b85432a890efce045053b6c_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Hori và Miyamura lần đầu viếng đền đêm giao thừa. Những dịp đặc biệt như vậy, và cả tháng ngày sôi động thời học sinh đều là kỉ niệm không gì thay thế được… Ước gì những khoảnh khắc ấy sẽ kéo dài mãi mãi…Mời các bạn thưởng thức tập 10 của bộ truyện học đường ngọt sâu răng!', 15, 'Horimiya - 10'),
	(51,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_5_-_bia1_dead3fbf410549a381a441f9f4e2d136_master.jpg https://product.hstatic.net/200000287623/product/xuong-phep-thuat-5-_thuong__w_792505b861404f6fab10623beb4e1f51_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nMột phù thủy “mũ vành” bất ngờ tấn công nhóm Agott ngay giữa thời điểm diễn ra bài kiểm tra thứ hai. Cậu bé Euini không may để kẻ đó bắt được và bị xăm cấm thuật lên người, khiến cơ thể hóa thành loài thú hoang. Cùng lúc đó, nhóm Coco ở bên ngoài hang động Romonon cũng bị mai phục và rơi xuống vực tối. Liệu số phận của những phù thủy tập sự sẽ ra sao?', 15, 'Xưởng Phép Thuật - 5'),
	(52,'2021-11-11',0, 'admin001', 1, ' NISIOISIN', 92000, 2022, 'https://product.hstatic.net/200000287623/product/bakemono-1-cover_1_ban_dac_biet_22cb519d57f9406c89d940ed43697e21_master.jpg https://product.hstatic.net/200000287623/product/bakemono-1-ver-a_23d3560086ce4baabd266a2df28308d4_master.jpg https://product.hstatic.net/200000287623/product/bakemono-1-ver-b_08767ec787924798834550206f3e3c47_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nGiữa thời đại của động cơ tuyến tính và tàu đệm từ trường siêu tốc, cậu nam sinh cấp ba Araragi Koyomi lại bị ma cà rồng tấn công tại một thị trấn vùng quê Nhật Bản, phải để một ông chú vô gia cư lôi thôi lếch thếch tình cờ đi ngang qua ra tay cứu giúp mới có thể thoát nạn và trở thành một thứ nửa người nửa ngợm.', 20, 'Bakemonogatari - 1 (Bản Đặc Biệt)'),
	(53,'2021-11-11',0, 'admin001', 1, ' NISIOISIN', 92000, 2022, 'https://product.hstatic.net/200000287623/product/bakemono-1-cover_1_ban_dac_biet_d1c1f7d82dda46fe81f2b093b3043774_master.jpg https://product.hstatic.net/200000287623/product/bakemono-1-khong-qua_09d9c116ab5a46b789d2761f080b10ad_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nGiữa thời đại của động cơ tuyến tính và tàu đệm từ trường siêu tốc, cậu nam sinh cấp ba Araragi Koyomi lại bị ma cà rồng tấn công tại một thị trấn vùng quê Nhật Bản, phải để một ông chú vô gia cư lôi thôi lếch thếch tình cờ đi ngang qua ra tay cứu giúp mới có thể thoát nạn và trở thành một thứ nửa người nửa ngợm.', 20, 'Bakemonogatari - 1 (Bản Thường)'),
	(54,'2021-11-11',0, 'admin001', 1, 'Mori Kaoru', 40800, 2022, 'https://product.hstatic.net/200000287623/product/emma_8_bia_1_e63248b447c24ea39e6cbe4dc96bfd76_master.jpg https://product.hstatic.net/200000287623/product/emma-8_50abd12957a341689de3e2704d9745c0_master.jpg https://product.hstatic.net/200000287623/product/emma-8-khong-qua_b8c58f734d1440cc9c9f461523b22523_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nCâu chuyện giữa William và Emma về cơ bản đã khép lại. Nhưng phía sau còn rất nhiều mẩu chuyện nhỏ thú vị mà tới giờ mới có cơ hội lên sóng.Tập 8 này chúng ta sẽ biết thêm về thời trẻ của những nhân vật thuộc thế hệ trước; một thời kì diễm lệ của Cung điện Pha lê; chuyện về sau của tiểu thư Eleanor Campbell với sự xuất hiện của một anh chàng lịch lãm; theo chân cô nàng Tasha hậu đậu về thăm gia đình...', 15, 'Emma - 8'),
	(55,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2021, 'https://product.hstatic.net/200000287623/product/horimiya_9_-_bia_1-06_0c114161ab5c4733a34db515d9114e6f_master.jpg https://product.hstatic.net/200000287623/product/horimiya-9-_thuong___1__65a3495dc8944f2dab68c1bdfd73695b_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Phố phường đang dần đổi sắc, hơi thở cũng mang bóng dáng mùa đông. Giờ này năm sau, mình, cậu ấy và mọi người đang làm gì nhỉ? Khi Hori đang bất an, Miyamura sẽ nói gì…!?Mời các bạn thưởng thức tập 9 của bộ truyện học đường ngọt sâu răng!', 15, 'Horimiya - 9'),
	(56,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2021, 'https://product.hstatic.net/200000287623/product/made_in_abyss_6_-_bia_1_d22469025c6d4ce48f6521756d88e3e1_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-6-_dacbiet___1__2561b681f89646189857914c43fa1aa5_master.jpg https://product.hstatic.net/200000287623/product/made-in-abyss-6-_thuong___1__5d06b57faed940aa97c813cd637a9d26_master.jpg ', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nSau cuộc giao tranh vô cùng cam go, nhóm Riko đã đánh bại Bondrewd và đòi lại được Prushka. Tuy còn nhiều nỗi băn khoăn, những đứa trẻ vẫn tiếp tục chuyến phiêu lưu. Đích đến tiếp theo chính là tầng 6 nằm dưới ranh giới tuyệt đối, nơi mà các nhà thám hiểm không còn đường trở về mặt đất.', 15, 'Made In Abyss - 6'),
	(57,'2021-11-11',0, 'admin001', 1, 'Kaiu Shirai - Posuka Demizu', 56000, 2021, 'https://product.hstatic.net/200000287623/product/mien-dat-hua-ln-2_9ad19957f5a945eeae02ab611210d83d_master.jpg https://product.hstatic.net/200000287623/product/mien-dat-hua-ln-2__2__e1a2049b2cd044fa9a54910405b58abd_master.jpg https://product.hstatic.net/200000287623/product/mien-dat-hua-ln-2-khong-qua__1__028b267a9640444fbdc11257cab52ad3_master.jpg ', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTối hôm bọn trẻ đào tẩu, căn nhà cháy rừng rực, những mảnh giấy bay đầy trời. Chứng kiến cảnh đó, Isabella chợt nhớ về cậu bé ngày ấy. Mặt khác, vào giây phút cuối đời, Krone hồi tưởng lại quãng thời gian cô trải qua ở trường đào tạo.Câu chuyện quá khứ của mama Isabella và xơ Krone, những người cản trở nhóm Emma, sẽ được hé lộ!', 20, 'Miền Đất Hứa - Khúc Ca Xưa Của Isabella Và Krone (Light Novel)'),
	(58,'2021-11-11',0, 'admin001', 1, 'Kaiu Shirai', 58500, 2021, 'https://product.hstatic.net/200000287623/product/mien-dat-hua-den_1b8d855691e940bd97926c8bd2af340c_master.jpg https://product.hstatic.net/200000287623/product/mien-dat-hua-20-den_204d0d91136f44fe9e07c24588f142c5_master.jpg https://product.hstatic.net/200000287623/product/mien-dat-hua-20-trang_d0bd1f8ae2cf4cdf88d6a8d82148d18d_master.jpg https://product.hstatic.net/200000287623/product/mien-dat-hua-20-gioi-han_c6da6d2345194898bf43c9acb581cde2_master.jpg ', 'Hà Nội', '12 x 18 cm', 'Nội dung: \nNội dung:Emma lần nữa đối mặt với kẻ thù truyền kiếp Peter Ratri tại Grace Field House. Song mọi chuyện lại diễn ra theo hướng không ngờ tới. Không những thế tại vương đô, tình thế đã xoay chuyển chóng mặt!? Số phận Emma sẽ ra sao!?Hỡi những đứa trẻ không có tương lai, hãy đứng lên đối đầu với tuyệt vọng! Cuộc vượt ngục không tưởng cuối cùng cũng đi tới hồi kết!###Nội dung:Emma lần nữa đối mặt với kẻ thù truyền kiếp Peter Ratri tại Grace Field House. Song mọi chuyện lại diễn ra theo hướng không ngờ tới. Không những thế tại vương đô, tình thế đã xoay chuyển chóng mặt!? Số phận Emma sẽ ra sao!?Hỡi những đứa trẻ không có tương lai, hãy đứng lên đối đầu với tuyệt vọng! Cuộc vượt ngục không tưởng cuối cùng cũng đi tới hồi kết!', 10, 'Miền Đất Hứa - 20'),
	(59,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2021, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_3_-_bia_1_7db79365b18b4235b092013c7db95264_master.jpg https://product.hstatic.net/200000287623/product/xpt-3-_khong-qua__6a55f49f9c19438bb6c630fa2551d700_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nVừa thoát khỏi rắc rối ở Kalhn, Coco lại gặp phải rắc rối mới. Lần này, cô bé và Agott bị đội cảnh vệ phép thuật bắt giữ vì tình nghi sử dụng cấm thuật. Chỉ có duy nhất một hình phạt chờ đón những kẻ phá vỡ luật lệ, đó là xóa toàn bộ kí ức liên quan tới phép thuật. Liệu chuyện gì sẽ xảy ra với Coco? Hãy cùng đón đọc XƯỞNG PHÉP THUẬT tập 3.', 15, 'Xưởng Phép Thuật - 3'),
	(60,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2021, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_2_-_bia1_0dd14ae892d045fb8fafe4a7d2c4d003_master.jpg https://product.hstatic.net/200000287623/product/xpt-2-_khong-qua__2b033ec890f64d61b47a8c1fdeec333a_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau khi tới thành phố phù thủy Kalhn, Coco cùng nhóm bạn đã bị phù thủy đeo mặt nạ kì quái nhốt vào không gian bí ẩn và phải chạm trán với một con rồng. Cuộc sống của Coco trong thế giới phù thủy vừa mới bắt đầu đã gặp phải gian nan trắc trở. Liệu cô bé và các bạn sẽ làm gì để thoát khỏi tình thế hiểm nguy? Hãy cùng đón đọc tập 2 của Xưởng phép thuật.', 15, 'Xưởng Phép Thuật - 2'),
	(61,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2021, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_1_-_bia1_c9e69acee53640b592f8effd072d1668_master.jpg https://product.hstatic.net/200000287623/product/xpt-1-normal-_khong-qua__7e43a662b13440469b164a98f55d781b_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nPhép thuật tràn ngập khắp thế gian, nhưng chỉ những người đặc biệt mới có thể sử dụng. Thế nên cô bé Coco dù rất muốn trở thành phù thủy nhưng đành cam chịu. Một hôm, khi anh chàng phù thủy Qifrey ghé qua làng, cô bé đã vô tình nhìn thấy khoảnh khắc làm phép, điều vốn được coi là cấm kị…', 15, 'Xưởng Phép Thuật - 1'),
	(62,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 34000, 2021, 'https://product.hstatic.net/200000287623/product/horimiya_7_6ebe961db84c476497b011a55cb46261_master.jpg https://product.hstatic.net/200000287623/product/horimiya-7-_khong-qua__6a4889b6f6744cd0846f2e149c07221c_master.jpg ', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Vốn được xếp vào hàng mỹ nam, Miyamura vẫn phải chịu lu mờ trước nhân vật mới: Yanagi Akane “lấp la lấp lánh”!', 15, 'Horimiya - 7');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- Dumping structure for table selling_book.book_category
CREATE TABLE IF NOT EXISTS `book_category` (
  `bookId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  KEY `bookId_categoryId` (`bookId`,`categoryId`),
  KEY `FK_bookcategory_category` (`categoryId`),
  CONSTRAINT `FK_bookcategory_book` FOREIGN KEY (`bookId`) REFERENCES `book` (`ID`),
  CONSTRAINT `FK_bookcategory_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table selling_book.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalPrice` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `FK_cart_guest` FOREIGN KEY (`username`) REFERENCES `guest` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table selling_book.cart_book
CREATE TABLE IF NOT EXISTS `cart_book` (
  `cartId` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `bookId` int(11) NOT NULL,
  KEY `cartId_bookId` (`cartId`,`bookId`),
  KEY `FK_cartbook_book` (`bookId`),
  CONSTRAINT `FK_cartbook_book` FOREIGN KEY (`bookId`) REFERENCES `book` (`ID`),
  CONSTRAINT `FK_cartbook_cart` FOREIGN KEY (`cartId`) REFERENCES `cart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.cart_book: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_book` ENABLE KEYS */;


-- Dumping data for table selling_book.category: ~14 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`ID`, `category_name`) VALUES
	(1, 'Trinh Thám - Kinh Dị'),
	(2, 'Văn Học Hiện Đại'),
	(3, 'Văn Học Kinh Điển'),
	(4, 'Fantasy'),
	(5, 'Light Novel'),
	(6, 'Boys Love'),
	(7, 'Boxset'),
	(8, 'Sách Học Ngữ'),
	(9, 'Manga - Comic'),
	(10, 'Sách Thiếu Nhi'),
	(11, 'Hot Deals'),
	(12, 'Sách Mới'),
	(13, 'Sách Bán Chạy'),
	(14, 'Phụ Kiện');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table selling_book.evaluate
CREATE TABLE IF NOT EXISTS `evaluate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookId` int(11) NOT NULL,
  `comment` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_evaluate_book` (`bookId`),
  KEY `FK_evaluate_guest` (`username`),
  CONSTRAINT `FK_evaluate_book` FOREIGN KEY (`bookId`) REFERENCES `book` (`ID`),
  CONSTRAINT `FK_evaluate_guest` FOREIGN KEY (`username`) REFERENCES `guest` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.evaluate: ~0 rows (approximately)
/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;


-- Dumping data for table selling_book.book_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` (`bookId`, `categoryId`) VALUES
	(1, 9),
	(1, 12),
	(1, 13),
	(2, 5),
	(2, 12),
	(2, 13),
	(3, 9),
	(3, 12),
	(4, 9),
	(4, 12),
	(5, 9),
	(5, 12),
	(6, 9),
	(6, 12),
	(7, 9),
	(7, 12),
	(8, 9),
	(8, 12),
	(9, 1),
	(9, 12),
	(10, 7),
	(10, 9),
	(10, 12),
	(11, 7),
	(11, 9),
	(11, 12),
	(12, 9),
	(12, 12),
	(12, 13),
	(13, 9),
	(13, 12),
	(14, 1),
	(14, 12),
	(15, 5),
	(15, 12),
	(15, 13),
	(16, 9),
	(16, 12),
	(16, 13),
	(17, 9),
	(17, 12),
	(17, 13),
	(18, 5),
	(18, 12),
	(19, 5),
	(19, 12),
	(20, 9),
	(20, 12),
	(21, 9),
	(21, 12),
	(22, 9),
	(22, 12),
	(22, 13),
	(23, 9),
	(23, 12),
	(23, 13),
	(24, 5),
	(24, 12),
	(25, 5),
	(25, 12),
	(26, 7),
	(26, 9),
	(26, 12),
	(27, 9),
	(27, 12),
	(28, 9),
	(28, 12),
	(29, 1),
	(29, 12),
	(30, 9),
	(30, 12),
	(31, 5),
	(31, 12),
	(32, 5),
	(32, 12),
	(33, 9),
	(33, 12),
	(33, 13),
	(34, 9),
	(34, 12),
	(34, 13),
	(35, 9),
	(35, 12),
	(36, 5),
	(36, 12),
	(36, 13),
	(37, 9),
	(37, 12),
	(38, 9),
	(38, 12),
	(39, 9),
	(39, 12),
	(40, 9),
	(40, 12),
	(41, 9),
	(41, 12),
	(42, 5),
	(42, 12),
	(43, 9),
	(43, 12),
	(44, 1),
	(44, 12),
	(45, 5),
	(45, 12),
	(46, 9),
	(46, 12),
	(47, 9),
	(47, 12),
	(48, 1),
	(48, 12),
	(49, 9),
	(49, 12),
	(50, 9),
	(50, 12),
	(51, 9),
	(51, 12),
	(52, 5),
	(52, 12),
	(53, 5),
	(53, 12),
	(54, 9),
	(54, 12),
	(55, 9),
	(55, 12),
	(56, 9),
	(56, 12),
	(57, 5),
	(57, 12),
	(58, 9),
	(58, 12),
	(59, 9),
	(59, 12),
	(60, 4),
	(60, 9),
	(60, 12),
	(60, 13),
	(61, 9),
	(61, 12),
	(62, 9),
	(62, 12),
	(62, 13);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;

CREATE TABLE `news` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(1024) NOT NULL DEFAULT '0',
    `content` varchar(1024) NOT NULL DEFAULT '0',
    `image` varchar(1024) not null DEFAULT '0',
    `adminId` int(11),
    `createdAt` datetime NOT NULL,
    PRIMARY KEY (`ID`),
    KEY `FK_news_admin` (`adminId`),
    CONSTRAINT `FK_news_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`ID`)
)