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
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_book_guest` (`username`),
  CONSTRAINT `FK_book_guest` FOREIGN KEY (`username`) REFERENCES `admin` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `book` (`ID`, `createAt`, `soldNumber`, `username`, `available`, `author`, `price`, `publishYear`, `image`, `publisher`, `size`, `content`, `discount`, `title`, `type`) VALUES
	(63,'2021-11-11',0, 'admin001', 1, 'Ken Wakui', 97750, 2022, 'https://product.hstatic.net/200000287623/product/tokyo_revengers_2_c4f45afa33eb4fd68ee01e63d8b5fb60_large.jpg https://product.hstatic.net/200000287623/product/tokyo_revengers_2_c4f45afa33eb4fd68ee01e63d8b5fb60_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nMời các bạn thưởng thức Tokyo 卍 Revengers tập 2, phiên bản 2 trong 1 của Việt Nam (tương đương tập 3 và 4 bản Nhật), in trên giấy Bãi Bằng 80 gms! Không chỉ vậy, phiên bản này còn có OBI và PHỤ BẢN MÀU GẬP 3 chỉ có tại thị trường Việt Nam!', 15, 'Tokyo 卍 Revengers - 2', 'Bìa mềm'),
	(64,'2021-11-11',0, 'admin001', 1, 'KINUGASA SYOUGO', 96000, 2022, 'https://product.hstatic.net/200000287623/product/chao_mung_den_lop_hoc_2_-_bia_1_6b2e803d335141579aaebe29117a73a8_large.jpg https://product.hstatic.net/200000287623/product/chao_mung_den_lop_hoc_2_-_bia_1_6b2e803d335141579aaebe29117a73a8_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nĐược cô bạn xinh xắn tốt bụng Kushida Kikyo khẩn cầu, nam sinh lớp D Ayanokoji Kiyotaka quyết định giúp đỡ Sudo - cậu bạn ngỗ nghịch vừa mắc mưu lớp C và có nguy cơ bị đình chỉ học. Kiyotaka đã nhờ cô bạn bàn bên Horikita Suzune giúp đỡ, nhưng cô lại tỏ ra thờ ơ. Gợi ý duy nhất mà cô nàng Suzune thông minh tiết lộ chính là Sakura Airi - một thành viên kém nổi bật của lớp D. Trong quá trình dõi theo người nắm giữ chìa khóa của vụ việc, nhóm Kiyokata đã phát hiện những bí mật mà Airi luôn chôn giấu…', 20, 'Chào Mừng Đến Lớp Học Đề Cao Thực Lực - 2', 'Bìa mềm'),
	(65,'2021-11-11',0, 'admin001', 1, 'Reki Kawahara', 100000, 2022, 'https://product.hstatic.net/200000287623/product/sao_pro_7_-_bia_1_e49150101aa84ca29bca14db8ea58fcb_large.jpg https://product.hstatic.net/200000287623/product/sao_pro_7_-_bia_1_e49150101aa84ca29bca14db8ea58fcb_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nDễ thấy Sword Art Online có không gian kể chuyện rất rộng, lại tỉ mỉ đi theo từng tầng, tạo cảm giác tận hưởng rõ rệt cho người chơi và cả người đọc.Câu chuyện hiện đã đến tầng 7, vẫn là tầng từng trải nghiệm trong giai đoạn chạy thử của SAO, nói cách khác, cho đến đây, Kirito vẫn biết nhiều hiểu rộng hơn Asuna. Thành ra theo thói quen, vừa tới nơi Asuna đã lập tức hỏi cậu xem chỗ ăn chỗ chơi nào ngon. So với các lần trước, lần này Kirito tỏ ra ngần ngừ rõ rệt.', 20, 'Sword Art Online Progressive - 7', 'Bìa mềm'),
	(66,'2021-11-11',0, 'admin001', 1, 'Wangyuan', 65450, 2022, 'https://product.hstatic.net/200000287623/product/chieng_nguyen_hon_ai-bia1_059ab2be3c2f4f91bce0db4f26f88be9_large.jpg https://product.hstatic.net/200000287623/product/chieng_nguyen_hon_ai-bia1_059ab2be3c2f4f91bce0db4f26f88be9_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nCHIÊNG NGUYỆN HỒN AI là một tác phẩm trinh thám Malaysia, xoay quanh các án mạng phòng kín tưởng chừng không thể xảy ra giữa thời đại công nghệ số.Nhờ ý tưởng táo bạo và thủ pháp truyện lồng truyện, CHIÊNG NGUYỆN HỒN AI đã đoạt giải nhất Trinh thám Soji Shimada kì gần nhất (2021).', 23, 'Chiêng Nguyện Hồn Ai', 'Bìa mềm'),
	(67,'2021-11-11',0, 'admin001', 1, 'Lâm Tư Ngạn', 77000, 2022, 'https://product.hstatic.net/200000287623/product/khuc_mai_tang_dem_mua_-_bia_1_c91df7154e4347f885fb946068e48ea4_large.jpg https://product.hstatic.net/200000287623/product/khuc_mai_tang_dem_mua_-_bia_1_c91df7154e4347f885fb946068e48ea4_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nẨn mình trong núi sâu, tách biệt với thế giới bên ngoài, biệt thự Đêm Mưa không chỉ mang hình dáng độc đáo, chứa đựng tâm tư sâu xa của chủ nhân, mà còn là nơi chứng kiến những vụ án đẫm máu và nhuốm màu kì bí.Cả nhà gia chủ bị sát hại dã man cùng một đêm. Tròn một năm sau, bốn cô gái trẻ lần lượt bỏ mạng trong phòng kín một cách đầy bí ẩn.Từng người ngã xuống, không kịp trăng trối, để lại câu đố nan giải, thách thức những người còn sống. Lý trí dần méo mó trong đêm mưa buốt giá, thảm kịch tới khi nào mới chấm dứt?', 23, 'Khúc Mai Táng Đêm Mưa', 'Bìa mềm'),
	(68,'2021-11-11',0, 'admin001', 1, 'Naoya Matsumoto', 49300, 2022, 'https://product.hstatic.net/200000287623/product/monster_8-3_bright_-_bia1_e236011b21f145de95664fa7e788e3d2_large.jpg https://product.hstatic.net/200000287623/product/monster_8-3_bright_-_bia1_e236011b21f145de95664fa7e788e3d2_master.jpg', 'Hồng Đức', '12 x 18 cm', 'Nội dung: \nKafka biến thành quái vật tới cứu Ichikawa và Furuhashi, hai thành viên của Lực lượng Phòng vệ. Với sức mạnh áp đảo, Kafka đánh cho con quái vật dạng người thừa sống thiếu chết. Song ngay khi anh sắp ra đòn kết liễu thì các vệ binh khác tìm đến, con quái vật bèn nhân cơ hội chạy trốn. Dù vậy, Kafka đã đạt được mục đích chính nên định rời khỏi hiện trường, đúng lúc đó đội phó Hoshina xuất hiện…!?Mời các bạn đón đọc tập 3 đầy hỗn loạn của Monster #8!', 15, 'Monster #8 - 3', 'Bìa mềm'),
	(69,'2021-11-11',0, 'admin001', 1, 'Naoya Matsumoto', 49300, 2022, 'https://product.hstatic.net/200000287623/product/monster_8_2_ban_dac_biet_bright_ban_thuong_-_bia1_917a8f9fbff1400f9fb0d5c4b25ac044_large.jpg https://product.hstatic.net/200000287623/product/monster_8_2_ban_dac_biet_bright_ban_thuong_-_bia1_917a8f9fbff1400f9fb0d5c4b25ac044_master.jpg', 'Hồng Đức', '12 x 18 cm', 'Nội dung: \nPhần thi cuối cùng của kì thi tuyển Lực lượng Phòng vệ đã kết thúc. Song, quái chính (rõ ràng đã bị tiêu diệt) lại được một quái vật bí ẩn dạng người giúp hồi sinh, từ đó tấn công Shinomiya Kikoru và các thí sinh khác. Ngay lúc Kikoru rơi vào đường cùng, Hibino Kafka đột nhiên xuất hiện trong hình dạng quái vật…! Rốt cuộc con quái vật dạng người kia là ai? Mục đích của nó là gì?Mời các bạn thưởng thức tập 2 ngập tràn bí ẩn!', 15, 'Monster #8 - 2', 'Bìa mềm'),
	(70,'2021-11-11',0, 'admin001', 1, 'Sanbe Kei', 49300, 2022, 'https://product.hstatic.net/200000287623/product/thi-tran-1_de3f287001ac4795aa659a0f7b3f90ed_large.jpg https://product.hstatic.net/200000287623/product/thi-tran-1_de3f287001ac4795aa659a0f7b3f90ed_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nDẫu cuộc sống không như ý, Fujinuma Satoru vẫn phải vật lộn với nó mỗi ngày. Tuy sở hữu năng lực “tua lại” giúp anh quay ngược thời gian, nhưng những gì nó đem đến chỉ toàn tiêu cực…Nhưng rồi một ngày, mọi thứ thay đổi. Một vụ án lớn đã khiến cuộc sống của anh đảo lộn. Liệu năng lực “tua lại” có thể giúp Satoru thoát khỏi tình cảnh hiểm nghèo và sửa chữa sai lầm trong quá khứ không? Hãy đón đọc tập 1 của Thị trấn vắng mình tôi của tác giả Sanbe Kei.', 15, 'Thị Trấn Vắng Mình Tôi - 1', 'Bìa mềm'),
	(71,'2021-11-11',0, 'admin001', 1, 'Akiko Higashimura', 49300, 2022, 'https://product.hstatic.net/200000287623/product/ve-voi-van-vo-1_af90b88bcae84445b19ae7edad63cb27_large.jpg https://product.hstatic.net/200000287623/product/ve-voi-van-vo-1_af90b88bcae84445b19ae7edad63cb27_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nVẽ vời vẩn vơ là những trang hồi ký về hành trình học tập và trở thành họa sĩ truyện tranh của chính tác giả Higashimura. Tập trung vào quãng thời gian cô ở bên vị ân sư tuy nghiêm khắc nhưng luôn hết lòng vì ước mơ hội họa của các học trò.Trải qua nhiều thăng trầm với con đường hội họa và nghề truyện tranh, Higashimura hiện tại là một trong số những tác giả truyện tranh thiếu nữ ăn khách nhất, với nhiều tác phẩm đoạt giải và được chuyển thể thành phim ảnh.', 15, 'Vẽ Vời Vẩn Vơ - 1', 'Bìa mềm'),
	(72,'2021-11-11',0, 'admin001', 1, 'Tsurutani Kaori', 49300, 2022, 'https://product.hstatic.net/200000287623/product/ba-gia-doc-boyslove-111_afc7bce47d204534a1d2fc3f5bf69d1a_large.jpg https://product.hstatic.net/200000287623/product/ba-gia-doc-boyslove-111_afc7bce47d204534a1d2fc3f5bf69d1a_master.jpg', 'Hà Nội', '14.5 x 20.5 cm', 'Nội dung: \nBà cụ 75 tuổi Ichinoi sống một mình đã lâu, chỉ vì một lần lỡ mua nhầm truyện mà chính thức bước vào “thế giới mới”. Chính bà Ichinoi cũng chẳng thể ngờ, cuốn truyện Boys Love vô tình mua phải hôm ấy lại khiến bà “lọt hố”, thành lính mới tò te trên con đường “fangirl”. Càng kì diệu hơn, sự cố ấy đã gắn kết cụ bà 75 tuổi với cô nữ sinh trung học Urara 17 tuổi theo cách không ai ngờ đến.Chuyến tàu hồi xuân và hành trình lan tỏa yêu thương của bà cụ đã đi gần hết đời người, xin được bắt đầu.', 15, 'Dưới Hiên Nhà Bà Già Đọc Boys Love - 1', 'Bìa mềm'),
	(73,'2021-11-11',0, 'admin001', 1, 'Chan Ho Kei', 77000, 2022, 'https://product.hstatic.net/200000287623/product/hinh_canh_mat_tri_-_bia1_2262bb99f94a471987133299366fe435_large.jpg https://product.hstatic.net/200000287623/product/hinh_canh_mat_tri_-_bia1_2262bb99f94a471987133299366fe435_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nKhác với triển khai đồ sộ của 13.67 và Người trong lưới, Hình cảnh mất trí đi theo hướng nhẹ nhàng, nhanh nhẹn và đơn tuyến hơn. Tuy nhiên, cuốn sách cho thấy tác giả vẫn luôn nhất quán về phong cách đan xen trinh thám và thực tại Hồng Kông, cùng thái độ “bi quan nhưng không tuyệt vọng” về tiết tấu xã hội xung quanh.Hình cảnh mất trí là tác phẩm đoạt giải Nhất Trinh thám Soji Shimada năm 2011, và là cú hích để Chan Ho Kei toàn tâm toàn ý đi theo con đường sáng tác chuyên nghiệp, từ đó mới có 13.67 và Người trong lưới về sau.', 23, 'Hình Cảnh Mất Trí', 'Bìa mềm'),
	(74,'2021-11-11',0, 'admin001', 1, 'ymz', 144500, 2022, 'https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_db_thuong_595597133c774a18893ada9b58749a04_large.jpg https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_db_thuong_595597133c774a18893ada9b58749a04_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nQue Sera, Sera - Biết ra sao ngày mai là boxset bao gồm hai tập truyện sau đây của tác giả ymz: Râu, chuông, bong bóng xà phòng và Gà con, màn đêm, công viên giải trí.Hai tập truyện tưởng chừng kể về hai cặp đôi riêng rẽ, nhưng giữa bốn người vẫn có những kết nối: ngoài việc thật sự quen biết nhau, ở họ còn cùng thấp thoáng tinh thần yêu đời, vui sống, nhìn thế giới xung quanh bằng đôi mắt trong veo mà cũng rất đỗi nồng cháy. Để rồi Que Sera, Sera - Biết ra sao ngày mai cũng tựa như hương trà, để lại dư âm phảng phất mà vấn vương lòng người.', 15, 'Que Sera, Sera - Biết Ra Sao Ngày Mai', 'Boxset'),
	(75,'2021-11-11',0, 'admin001', 1, 'ymz', 280250, 2022, 'https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_gioi_han_d8cbfa90c8e9429a9ace2fab9d025974_large.jpg https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_gioi_han_d8cbfa90c8e9429a9ace2fab9d025974_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nQue Sera, Sera - Biết ra sao ngày mai là boxset bao gồm hai tập truyện sau đây của tác giả ymz: Râu, chuông, bong bóng xà phòng và Gà con, màn đêm, công viên giải trí.Hai tập truyện tưởng chừng kể về hai cặp đôi riêng rẽ, nhưng giữa bốn người vẫn có những kết nối: ngoài việc thật sự quen biết nhau, ở họ còn cùng thấp thoáng tinh thần yêu đời, vui sống, nhìn thế giới xung quanh bằng đôi mắt trong veo mà cũng rất đỗi nồng cháy. Để rồi Que Sera, Sera - Biết ra sao ngày mai cũng tựa như hương trà, để lại dư âm phảng phất mà vấn vương lòng người.', 5, 'Que Sera, Sera - Biết Ra Sao Ngày Mai (Bản Giới Hạn)', 'Boxset'),
	(76,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_15_-_bia_1_a61b83f49cba4777b6af90f0e16d3665_large.jpg https://product.hstatic.net/200000287623/product/horimiya_15_-_bia_1_a61b83f49cba4777b6af90f0e16d3665_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Thầy Nakamine bí ẩn dạy Vật lý và Yuki bỗng dưng lại thân nhau!? Có người hết sức bồn chồn dõi theo hai người họ, ấy là Toru và… Yasuda…? (Ha ha)Mời các bạn thưởng thức tập 15 của bộ truyện học đường ngọt sâu răng với hai phần truyện về ngày Valentine do tác giả HERO mới sáng tác!', 15, 'Horimiya - 15', 'Bìa mềm'),
	(77,'2021-11-11',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_12__manga__-_bia_1_8a333ef9313c4302ae4cd8495b1fd5c7_large.jpg https://product.hstatic.net/200000287623/product/overlord_12__manga__-_bia_1_8a333ef9313c4302ae4cd8495b1fd5c7_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nCùng lúc cuộc chiến giữa cánh quân của Climb với Sáu Tay đang diễn ra, một trận đối đầu nảy lửa khác cũng bùng nổ giữa nhóm Blue Rose và Entoma tại một cơ sở của Tám Ngón.Những tưởng cuộc chiến sẽ sớm ngã ngũ, nhưng sự đảo chiều liên tục đã dẫn đến một kết quả không thể lường trước, với đỉnh điểm là sự xuất hiện của tên ác quỷ hùng mạnh Jaldabaoth và ngọn lửa luyện ngục bao trùm một phần vương đô.', 15, 'Overlord - 12 (Manga)', 'Bìa mềm'),
	(78,'2021-11-11',0, 'admin001', 1, 'Naoya Matsumoto', 49300, 2022, 'https://product.hstatic.net/200000287623/product/monster_8-1_bright---bia-1_60323204000446cd8a39293c0626cac3_large.jpg https://product.hstatic.net/200000287623/product/monster_8-1_bright---bia-1_60323204000446cd8a39293c0626cac3_master.jpg', 'Hồng Đức', '12 x 18 cm', 'Nội dung: \nNhật Bản là một trong những quốc gia có tần suất xuất hiện quái vật cao nhất thế giới. Lũ quái vật man rợ luôn đe dọa cuộc sống hằng ngày của người dân nơi đây.Mong muốn gia nhập Lực lượng Phòng vệ nhưng không thành, Hibino Kafka đành làm việc tại công ty chuyên cung cấp dịch vụ dọn xác quái vật. Một ngày nọ, do nuốt phải sinh vật bí ẩn, anh đột nhiên biến thành quái vật và được Lực lượng Phòng vệ Nhật Bản (có nhiệm vụ tiêu diệt quái vật) đặt cho mã hiệu “Quái vật #8”.', 15, 'Monster #8 - 1', 'Bìa mềm'),
	(79,'2021-11-11',0, 'admin001', 1, 'Ken Wakui', 97750, 2022, 'https://product.hstatic.net/200000287623/product/tr_1_bia1_95610bd3bcdc483b9076af94fe11538c_large.jpg https://product.hstatic.net/200000287623/product/tr_1_bia1_95610bd3bcdc483b9076af94fe11538c_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTokyo Manji là băng nhóm tội phạm khét tiếng, đến cảnh sát cũng phải bó tay. Băng này đã cướp đi mạng sống của Hinata, người bạn gái thời cấp hai, cũng là người yêu duy nhất trong cuộc đời Takemichi.Takemichi sống trong căn phòng trọ tường mỏng rớt, bị quản lý ít tuổi hơn sai phái đủ đường, đã thế còn chưa thoát kiếp trai tân… Và cái chết của người bạn gái cũ đã đưa cậu du hành thời gian về 12 năm trước!Để cứu Hinata, đồng thời thay đổi cuộc đời phải trốn chạy liên miên, Takemichi thề sẽ trả thù “băng nhóm hiểm ác nhất vùng Kanto”, Tokyo Manji!', 15, 'Tokyo 卍 Revengers - 1', 'Bìa mềm'),
	(80,'2021-11-11',0, 'admin001', 1, 'Yokomizo Seishi', 108000, 2022, 'https://product.hstatic.net/200000287623/product/thon_tam_mo_-_bia_1_2e377c88c426414fa1abc4e29a91df0a_large.jpg https://product.hstatic.net/200000287623/product/thon_tam_mo_-_bia_1_2e377c88c426414fa1abc4e29a91df0a_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nKết thúc Thế chiến 2, Tatsuya xuất ngũ về lại thành phố quê hương, không còn người thân, không xu dính túi, công việc bấp bênh. Bất thần anh nghe trên đài phát tin gia đình giàu có thất lạc từ lâu đang tìm mình.Tatsuya bèn đến nơi gửi tin, gặp được người thân đầu tiên chừng vài phút thì người này mất mạng trước mắt anh.Tatsuya về thôn làng mình chào đời, sang hôm sau thì người thân thứ hai mất mạng trước mắt anh.Sau đó, cứ một vài hôm lại thêm một người mất mạng trước mắt Tatsuya. Anh nghiễm nhiên biến thành kẻ tình nghi lớn nhất, thành kẻ gieo rắc tai ương trong thôn. Tatsuya đi từ ngạc nhiên đến kinh hoàng, khi phát hiện ra đây là nhân quả của tội nghiệt do tổ tiên mình để lại.', 20, 'Thôn Tám Mộ', 'Bìa mềm'),
	(81,'2021-11-11',0, 'admin001', 1, 'Asato Asato', 116000, 2022, 'https://product.hstatic.net/200000287623/product/86_ep.5_-_bia1_b7fe25c78619431c8c2f8b5efef5de2a_large.jpg https://product.hstatic.net/200000287623/product/86_ep.5_-_bia1_b7fe25c78619431c8c2f8b5efef5de2a_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Tới tìm ta đi.”Sau khi Shin “nhìn” thấy lời nhắn được cho là của Zelena - người phát minh ra Legion, Lena cùng Lữ đoàn Biệt kích Cơ động 86 bước sang chiến trường Vương quốc Liên hiệp Roa Gracia - nơi phát hiện con Ameise màu trắng nghi là Zelena. Tuy nhiên…Chẳng rõ là nhạo báng sự sống hay khinh nhờn cái chết, Vương quốc Liên hiệp đang áp dụng một chiến lược đi chệch luân thường để chống Legion, khiến ngay cả các Tám Sáu còn phải rùng mình. Tại đây, kẻ thù lẩn khuất trong rừng sâu lạnh giá và “cái chết” sát sườn không ngừng trêu đùa nhóm thiếu niên.“Lũ quái vật ẩn mình trong núi tuyết mỉm cười hỏi họ…”', 20, '86 - Eightysix - 5', 'Bìa mềm'),
	(82,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_1_-_bia1_c949531f15a248508bf8de4efa93f36a_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_1_-_bia1_c949531f15a248508bf8de4efa93f36a_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCoco cùng các bạn bắt đầu chuẩn bị cho lễ hội đêm bạc diễn ra tại đảo Ezrest. Dòng người tấp nập đổ về đây, bao gồm phù thủy, người thường, và cả những vị khách không mời. Cùng lúc đó, cuộc gặp mặt giữa tam hiền giả và các vị vua của bán đảo Zozah cũng chuẩn bị diễn ra. Mời các bạn đón đọc tập 9 của Xưởng phép thuật, phần mở màn của lễ hội đêm bạc đầy bất ngờ và biến động.', 15, 'Xưởng Phép Thuật - 9', 'Bìa mềm'),
	(83,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_14_-_bia1_81992d247db14cf996682ef82bdf71f3_large.jpg https://product.hstatic.net/200000287623/product/horimiya_14_-_bia1_81992d247db14cf996682ef82bdf71f3_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Hội Học sinh luôn tình thương mến thương, song ai chẳng có lúc giận dỗi, cáu bẳn…! Có tranh cãi mới là tuổi trẻ!Mời các bạn thưởng thức tập 14 của bộ truyện học đường ngọt sâu răng với một câu chuyện do tác giả HERO mới sáng tác!', 15, 'Horimiya - 14', 'Bìa mềm'),
	(84,'2021-11-11',0, 'admin001', 1, 'Sugaru Miaki', 96000, 2022, 'https://product.hstatic.net/200000287623/product/dau_oi_bay_di_bia_1_020fa4d8277b4323a277b6e3699f4f45_large.jpg https://product.hstatic.net/200000287623/product/dau_oi_bay_di_bia_1_020fa4d8277b4323a277b6e3699f4f45_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Tôi chết rồi. Anh tính sao đây?”Mùa thu năm 22 tuổi, tôi, một thanh niên đơn độc bị tất cả ruồng bỏ, đáng lẽ đã thành kẻ sát nhân…Nhưng cô gái thiệt mạng dưới tay tôi lại có thể “trì hoãn” cái chết trong mười ngày. Cô quyết định dành mười ngày quý giá đó để trả thù những kẻ đã hủy hoại đời cô.“Tất nhiên, anh cũng phải giúp tôi một tay đấy, Sát Nhân ạ.”Quá trình trả thù đã vô tình dẫn chúng tôi đến với sự thật ẩn giấu đằng sau cuộc gặp gỡ giữa tôi và cô gái.Đó là kỉ niệm về những ngày đau thương mà ấm áp, cùng lời tạm biệt ngày ấy.', 20, 'Đau Ơi Bay Đi!', 'Bìa mềm'),
	(85,'2021-11-11',0, 'admin001', 1, 'Tappei Nagatsuki', 96000, 2022, 'https://product.hstatic.net/200000287623/product/re_zero_12_-_bia_1_9a49f946f4e24eafa0616179c8f52617_large.jpg https://product.hstatic.net/200000287623/product/re_zero_12_-_bia_1_9a49f946f4e24eafa0616179c8f52617_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCứ mỗi lần lặp lại, Thánh vực lại phát triển theo một diễn biến khác với kí ức của Subaru. Ở lượt lặp thứ tư, cậu đã giáp mặt một kẻ đáng ra không nên tồn tại: Phù thủy Đố kị.Khi Thánh vực bị bóng ảnh nuốt chửng, Garfiel dù đối địch với Subaru vẫn ra sức tương trợ. Nhờ đó Subaru tìm ra sự thật về nơi chốn vốn là tràng thí nghiệm thất bại này… Nhưng cuối cùng tất cả vẫn cười nhạo vào nỗ lực của cậu, và thế giới bị vùi lấp trong kết cục trắng toát.Hi vọng rồi tuyệt vọng, khám phá sự thật để rồi suy sụp, Subaru vẫn không từ bỏ tương lai, cậu đi tới phần mộ với mong muốn hỏi ý kiến phù thủy. Ở đây, cậu phải đối mặt với “hiện tại không nên tồn tại”…', 20, 'Re: Zero - Bắt Đầu Lại Ở Thế Giới Khác - 12', 'Bìa mềm'),
	(86,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 51000, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_10_-_bia1_9921360783a24a3d86c4a6151af00a88_large.jpg https://product.hstatic.net/200000287623/product/made_in_abyss_10_-_bia1_9921360783a24a3d86c4a6151af00a88_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nReg không thể ngăn được cơn thịnh nộ của Faputa và bị đánh cho bất tỉnh. Tuy nhiên, sau khi tỉnh khỏi giấc mộng dài, Nanachi cùng một nhân vật không ai ngờ tới đã xuất hiện để ngăn cản cuộc chiến. Mỗi người giờ sẽ phải đưa ra lựa chọn của riêng mình. Mời các bạn đón đọc tập 10 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa cơn giận và nỗi buồn!', 15, 'Made In Abyss - 10', 'Bìa mềm'),
	(87,'2021-11-11',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_11__manga__-_bia_1_dd77bf7176ed4216bfc58321f7131188_large.jpg https://product.hstatic.net/200000287623/product/overlord_11__manga__-_bia_1_dd77bf7176ed4216bfc58321f7131188_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTrở về sau cuộc triệt phá bộ phận mua bán nô lệ của Tám Ngón, Sebas phải ra tay với Tuare để chứng minh lòng trung thành của mình dành cho đấng tối cao. May thay, Ainz đã cho ông và cô gái loài người một cơ hội để họ có thể ở bên nhau tại đại lăng mộ Nazarick. Thế nhưng, bè lũ Sáu Tay vẫn chưa buông tha cho Tuare…Mặt khác, công chúa Renner cùng Blue Rose đang tập hợp đồng minh để loại bỏ tận gốc Tám Ngón khỏi Re-Estize. Các anh hùng Vương quốc một lần nữa tụ hội, đập tan âm mưu của Sáu Tay, những kẻ mạnh nhất Tám Ngón, diệt trừ hoàn toàn thế lực đen tối đang gặm nhấm cả Vương quốc.Thế nhưng, đằng sau tất cả, một kế hoạch to lớn của đại lăng mộ Nazarick mang tên Gehenna dần lộ diện.', 15, 'Overlord - 11 (Manga)', 'Bìa mềm'),
	(88,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_13_-_bia_1_d261c67a8db54a939bde8bdfc8311011_large.jpg https://product.hstatic.net/200000287623/product/horimiya_13_-_bia_1_d261c67a8db54a939bde8bdfc8311011_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nỞ trường, Iura là cậu chàng nhặng xị nhưng vẫn được mọi người yêu mến. Về nhà, Iura lại thành người anh nghiêm khắc mà tốt bụng. Cũng như Hori và Miyamura ngày trước, những gì mọi người thấy bên ngoài không phải là tất cả.', 15, 'Horimiya - 13', 'Bìa mềm'),
	(89,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_8_-_bia1_f2f2d6d4477a4064a44284e3db9ecac9_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_8_-_bia1_f2f2d6d4477a4064a44284e3db9ecac9_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTrở về xưởng sau bài kiểm tra tại Đại giảng đường, các phù thủy tập sự bất ngờ được cậu bé Tartah mời tham gia mở cửa hàng tại lễ hội đêm bạc. Trong lúc tất bật chuẩn bị, Coco bất ngờ gặp lại một cậu bé mà cô từng cứu ở sông bậc thang…', 15, 'Xưởng Phép Thuật - 8', 'Bìa mềm'),
	(90,'2021-11-11',0, 'admin001', 1, 'Mikage Eiji', 301840, 2022, 'https://product.hstatic.net/200000287623/product/chiechoprongvamaria_1_0549726d971546918c2cb0109336defc_large.jpg https://product.hstatic.net/200000287623/product/chiechoprongvamaria_1_0549726d971546918c2cb0109336defc_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTháng Ba. Lớp học đón chào Otonashi Aya, học sinh mới chuyển tới vào một thời điểm hết sức nửa vời. Trong khi cả lớp còn đang sửng sốt không thốt nên lời trước dung nhan xinh đẹp của bạn học mới, cô bước lên bục giảng và chỉ lạnh lùng nói tên mình. Ai cũng đợi cô tiếp tục… “Hoshino Kazuki.” Không hiểu sao cô ấy lại gọi tên tôi. “Tôi tới để hủy hoại cậu.” Một lời tuyên chiến đường đột. Thâm ý đằng sau những lời lẽ đanh thép nhưng cũng vô cùng thản nhiên của cô gái đang khẽ mỉm cười ấy là gì…!? Tác phẩm đầy li kì, hồi hộp với những điểm nhấn thú vị bất ngờ của tác giả Mikage Eiji sẽ không làm các bạn thất vọng!\n\n\n\n\n\nDefault Title - 301,840₫\n\n\n\n\n\nSố lượng\n\n\n\n\n \n\n \n									Thêm vào giỏ\n								\n\n									Mua ngay\n								\n\n \n\n\n\n						SKU: \n\n\n						Danh mục: \n						\nSách Mới  , \n							\n							Light Novel\n\n\n\n\n\n\n							Tags:\n\n							\nHọc Đường\n								 , \n								\n								\n								\n								\n								\n								\n								\n								\n								\n								Mikage Eiji\n								 ,', 23, 'Combo Chiếc Hộp Rỗng Và Maria Lần 0 - 1 Đến 4', 'Bìa mềm'),
	(91,'2021-11-11',0, 'admin001', 1, 'Mikage Eiji', 78400, 2022, 'https://product.hstatic.net/200000287623/product/chiechoprongvamarialan0_4_bia_1_21af76bbe85544fb87bc9027d34b7619_large.jpg https://product.hstatic.net/200000287623/product/chiechoprongvamarialan0_4_bia_1_21af76bbe85544fb87bc9027d34b7619_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“À… Thôi được rồi. Tôi, chính tôi đây, sẽ trở thành ‘vua’ của các người.”Trong không gian biệt lập đậm chất trung cổ của trò chơi nhập vai điên rồ mang tên Vương quốc Hạ bệ, người chơi phải thông qua những cuộc họp mặt và mật đàm để trừ khử nhau, nhờ đó sống sót và giành chiến thắng.Hoshino Kazuki vẫn chưa thoát khỏi trò chơi lừa gạt kể trên. Để phá vỡ tình trạng bế tắc hiện tại, cậu quyết định trở thành “vua”. Kẻ nắm giữ chìa khóa của mọi vấn đề chính là Omine Daiya, một ẩn số hai mặt. Rốt cuộc Kazuki cũng lần ra sự thật về chủ sở hữu, nhưng…Cuối cùng Vương quốc Hạ bệ cũng hạ màn!', 20, 'Chiếc Hộp Rỗng Và Maria Lần 0 - Tập 4', 'Bìa mềm'),
	(92,'2021-11-11',0, 'admin001', 1, 'Tanabe Seiko', 136000, 2022, 'https://product.hstatic.net/200000287623/product/josee__ho_va_ca_boxset_mat_truoc_50c380a87fe941e5b74febb0086a2a6a_large.jpg https://product.hstatic.net/200000287623/product/josee__ho_va_ca_boxset_mat_truoc_50c380a87fe941e5b74febb0086a2a6a_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nCậu sinh viên Tsuneo ôm ước mơ du học Mexico vì muốn ngắm nhìn loài cá kì diệu nọ.Cô gái khuyết tật bẩm sinh Josee bị “trói buộc” vào xe lăn, luôn sống khép kín trong thế giới riêng.Ngày nọ, hai con người tưởng như ở hai thế giới khác biệt ấy tình cờ gặp gỡ. Từ thái độ căm ghét, ngượng ngùng ban đầu, cả hai dần dần nảy sinh tình cảm với nhau.Đây là câu chuyện tình yêu đầy sắc màu giữa chàng hoàng tử biển khơi và nàng tiên cá mặt đất.', 15, 'Josee, Hổ Và Cá', 'Boxset'),
	(93,'2021-11-11',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord-10-_manga__0319e32ebbe04e939d31bbb7f9b5e658_large.jpg https://product.hstatic.net/200000287623/product/overlord-10-_manga__0319e32ebbe04e939d31bbb7f9b5e658_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTrong tình cảnh éo le, đối diện với thế lực đen tối đang nhăm nhe nuốt chửng cả Vương quốc, những người đàn ông của chính nghĩa không hẹn mà tụ hội.Mỗi người một câu chuyện: cậu thiếu niên Climb khát khao sức mạnh để xứng đáng đứng cạnh người mình yêu, gã lính đánh thuê Brain tuyệt vọng khi nhận ra mình quá bé nhỏ trước những quái vật hùng mạnh, và quản gia Sebas Tian của đại lăng mộ Nazarick đang đau đầu giữa lựa chọn cứu giúp cô gái loài người đáng thương hay làm tròn bổn phận của mình.Họ tập hợp lại và cùng chung chiến tuyến vì ngưỡng mộ tinh thần chính nghĩa, sự gan dạ và sức mạnh của nhau, mở ra câu chuyện về những anh hùng của Vương quốc.', 15, 'Overlord - 10 (Manga)', 'Bìa mềm'),
	(94,'2021-11-11',0, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_manga__9_-_bia_1_30c72df692e541c996ffe8977c91bf64_large.jpg https://product.hstatic.net/200000287623/product/overlord_manga__9_-_bia_1_30c72df692e541c996ffe8977c91bf64_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nNhững cơn sóng ngầm trong Vương quốc Re-Estize đang cuộn trào mạnh mẽ. Các thế lực đen tối không ngừng vươn xúc tu nghiền nát những mảnh đời yếu thế.Sebas Tian phải đứng trước sự giằng co giữa lý tưởng chính nghĩa của bản thân và sứ mệnh của quản gia đại lăng mộ Nazarick.Ẩn sâu dưới Vương quốc trầm lặng, tuy cũ kĩ mà không kém phần lộng lẫy, một bức tranh đầy bi thảm và đau khổ đã được khắc họa qua số phận cô gái loài người đáng thương lỡ sa vào địa ngục. Để rồi từ địa ngục, cô được bầy tôi của sứ giả cái chết cứu vớt và sưởi ấm trái tim đã vỡ vụn.', 15, 'Overlord - 9 (Manga)', 'Bìa mềm'),
	(95,'2021-11-11',0, 'admin001', 1, 'Thời Thần', 69300, 2022, 'https://product.hstatic.net/200000287623/product/guong_soi_toi_loi_-_bia1_00dc3b44b26144209ebe4ea5e28710b0_large.jpg https://product.hstatic.net/200000287623/product/guong_soi_toi_loi_-_bia1_00dc3b44b26144209ebe4ea5e28710b0_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nTrên đảo nhỏ ngoài khơi, có một bệnh viện đặc biệt chuyên thu nhận tội phạm tâm thần. Những kẻ phạm tội hình sự nhưng không thể thụ án vì trở ngại đầu óc sẽ được đưa ra đây để khỏi tiếp tục gây hại cho xã hội.Bầu không khí hung bạo và loạn óc ở đảo có lẽ gây ảnh hưởng đến cả những người tỉnh táo nhất. Chính giám đốc bệnh viện một ngày nọ cũng cầm dao đâm lung tung, mau chóng được giám định tâm thần và đưa vào diện điều trị.', 23, 'Gương Soi Tội Lỗi', 'Bìa mềm'),
	(96,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_9_-_bia1_77fe36ef03df4284ae0ebec5e581432d_large.jpg https://product.hstatic.net/200000287623/product/made_in_abyss_9_-_bia1_77fe36ef03df4284ae0ebec5e581432d_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nSau khi nghe kể về đội cảm tử Ganja, Riko đã biết được sự thật khủng khiếp về Iruburu. Cùng lúc ấy, Reg đang đi với Faputa tới làng để cứu Nanachi. Cậu bé người máy không hề biết rằng hành động của mình sẽ là khởi nguồn cho một cuộc chiến đẫm máu…Mời các bạn đón đọc tập 9 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa lòng nhân từ và sự tôn kính!', 15, 'Made In Abyss - 9', 'Bìa mềm'),
	(97,'2021-11-11',0, 'admin001', 1, 'Kareno Akira', 72000, 2022, 'https://product.hstatic.net/200000287623/product/tan_the_neu_khong_ban_ex_-_bia_1_541e642388c846b3ab10f264fdc40ffc_large.jpg https://product.hstatic.net/200000287623/product/tan_the_neu_khong_ban_ex_-_bia_1_541e642388c846b3ab10f264fdc40ffc_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTrong nắng xuân ấm áp, chiến binh yêu tinh nhí Lakhesh ôm thanh Seniorious và chìm vào ảo mộng…Cô bé mơ về chuyện của 500 năm trước, xoay quanh Legal Brave Lillia 14 tuổi cùng Quasi Brave Willem 15 tuổi và cuộc sống thường ngày của hai sư huynh muội - những người bảo vệ nhân loại khỏi sự đe dọa của Visitor. Toàn chuyện vặt vãnh không đâu, nhưng cũng thật rực rỡ. Và những chuyện cách đây không lâu. Về Chtholly - chiến binh yêu tinh tồn tại với vận mệnh hi sinh, cùng Kĩ sư Vũ khí ếm Hạng nhì Willem Kmetsch. Từng phút, từng giây thương nhớ hóa thành giấc mộng chẳng thể nào quên của hai người.', 20, 'Tận Thế Nếu Không Bận, Anh Cứu Chúng Em Nhé? #EX', 'Bìa mềm'),
	(98,'2021-11-11',0, 'admin001', 1, 'Kenji Inoue', 68000, 2022, 'https://product.hstatic.net/200000287623/product/lu_ngoc_12.5_bia_1_96dfca9cc70046b3bec54a2d73d21710_large.jpg https://product.hstatic.net/200000287623/product/lu_ngoc_12.5_bia_1_96dfca9cc70046b3bec54a2d73d21710_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nNhóm Akihisa cùng khối Mười một giành chiến thắng kịch tính trong trận đấu linh thú với khối Mười hai. Nhờ thế, lớp F giành được phòng học xịn với trang thiết bị tử tế, tha hồ tận hưởng cuộc sống học đường thoải mái.Hiện giờ điều đang chiếm trọn sự quan tâm của cả lớp chính là Giáng Sinh! Nhưng cả đám không hề biết rằng hiệu trưởng lại bắt đầu để mắt đến chúng, dẫn đến chuỗi sự kiện “Tôi, đêm Giáng sinh và vòng xoáy âm mưu” gồm hai phần. Tiếp đó, vì không cam lòng chịu đựng cách đối xử của hội con gái, lũ ngốc đã quyết tâm báo thù trong “Tôi, đồng bọn và phi vụ tốc váy”.Tất cả có trong tuyển tập truyện ngắn thứ sáu về thời thanh xuân đầy bùng nổ!', 20, 'Lũ Ngốc, Bài Thi Và Linh Thú Triệu Hồi - 12.5', 'Bìa mềm'),
	(99,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_7_ban_thuong_-_bia1_012e444f87c340709fffbbe599f83781_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_7_ban_thuong_-_bia1_012e444f87c340709fffbbe599f83781_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau khi hoàn thành xuất sắc bài kiểm tra, Coco được hiền giả Beldaruit triệu tập lúc đêm khuya. Ông ngỏ ý mời cô bé làm đệ tử của mình, đồng thời tiết lộ mối duyên nợ giữa Qifrey và phe phù thủy “mũ vành”. Trong lúc bối rối vì không biết nên tiếp tục làm đệ tử của Qifrey hay không, Coco quyết định tới tháp sách để tìm kiếm câu trả lời!', 15, 'Xưởng Phép Thuật - 7', 'Bìa mềm'),
	(100,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_12_-_bia1_b5214d5f4c644781a1d429b8ce16f8e0_large.jpg https://product.hstatic.net/200000287623/product/horimiya_12_-_bia1_b5214d5f4c644781a1d429b8ce16f8e0_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị! Sakura luôn điềm đạm cũng có lúc bồn chồn không yên… vì một bộ truyện tranh thiếu niên! Trùng hợp thay, Yanagi cũng thích đọc truyện tranh thiếu niên…? Mời các bạn thưởng thức tập 12 của bộ truyện học đường ngọt sâu răng với nhiều điều bí mật chưa được bật mí!', 15, 'Horimiya - 12', 'Bìa mềm'),
	(101,'2021-11-11',0, 'admin001', 1, 'Mori Kaoru', 46750, 2022, 'https://product.hstatic.net/200000287623/product/emma-10_82ec462bdc424a80aa2b63cbfa421ca8_large.jpg https://product.hstatic.net/200000287623/product/emma-10_82ec462bdc424a80aa2b63cbfa421ca8_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTại sao Adele luôn nghiêm túc trong công việc và không quan tâm tới chuyện kết hôn?Maria và Alma thời mới tới dinh thự ra sao?Arthur có thời học sinh thế nào ở trường nội trú?Eleanor liệu đã tìm được hạnh phúc của riêng cô chưa?Ngoài ra, Emma và William thì sao? Cuối cùng họ có được bên nhau lâu dài?Tập 10 này là tập ngoại truyện thứ ba, cũng là tập cuối của Emma. Bộ truyện kết thúc nhưng sẽ đem tớihình ảnh một nước Anh đã bước sang thời kì mới, thế kỉ mới, cùng những con người đáng yêu, luôn tràntrề hi vọng vào tương lai phía trước.', 15, 'Emma - 10', 'Bìa mềm'),
	(102,'2021-11-11',0, 'admin001', 1, 'Asato Asato', 96000, 2022, 'https://product.hstatic.net/200000287623/product/86_ep.4_bia_1_66f1c9ee51614364bb95b654cab2e619_large.jpg https://product.hstatic.net/200000287623/product/86_ep.4_bia_1_66f1c9ee51614364bb95b654cab2e619_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau cuộc hội ngộ định mệnh, Shin và Lena nhanh chóng xích lại gần nhau, làm Frederica và Crena ngay ngáy lo sợ, còn Raiden và những người khác phải giữ ý đến phát mệt. Tuy nhiên, quãng thời gian nghỉ ngơi ngắn ngủi nhanh chóng kết thúc. Đơn vị mới do Lena chỉ huy tác chiến nhận được nhiệm vụ đầu tiên. Dưới ga tàu điện ngầm tại thành phố phía Bắc Cộng hòa, căn cứ khổng lồ của Legion đang đón đợi họ. Thứ ẩn sâu dưới đó là “mặt tối”. Của Legion. Của Cộng hòa. Và của cả những con người từng bị tổ quốc bức hại. “Tiếng gọi vọng lên từ lòng đất, báo hiệu thử thách mới cho nhóm thiếu niên.”', 20, '86 - Eightysix - 4', 'Bìa mềm'),
	(103,'2021-11-11',0, 'admin001', 1, 'Yoshino Satsuki', 264600, 2014, 'https://product.hstatic.net/200000287623/product/handa-1_091ac6631b5c4670b6e5997266ccae9a_large.jpg https://product.hstatic.net/200000287623/product/handa-1_091ac6631b5c4670b6e5997266ccae9a_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCombo Trọn Bộ Handa - 1 Đến 7HANDA là bộ truyện kể về thời đi học của nhà thư pháp Handa Seishu, nhân vật chính của BARAKAMON. Mời các bạn thưởng thức bộ truyện hài hước mà cũng bế tắc bởi những hiểu lầm tuổi thanh xuân!', 16, 'Combo Trọn Bộ Handa - 1 Đến 7', 'Bìa mềm'),
	(104,'2021-11-11',0, 'admin001', 1, 'Yoshino Satsuki', 38250, 2022, 'https://product.hstatic.net/200000287623/product/handa-7_62d69a9b50c042bdb81579c085273d97_large.jpg https://product.hstatic.net/200000287623/product/handa-7_62d69a9b50c042bdb81579c085273d97_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTập 7 là tuyển tập gồm ba ngoại truyện được vẽ sau khi phần truyện chính của Handa kết thúc, truyện màu bốn khung chỉ xuất hiện trên tạp chí Nguyệt san Thiếu niên Gan Gan và những phụ trương do chính tác giả Yoshino Satsuki vẽ thêm mỗi khi ra tập mới. Ngoài ra còn có đôi lời giải thích, tâm sự của tác giả.Đây thật sự là tập cuối của Handa!', 15, 'Handa - 7', 'Bìa mềm'),
	(105,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_8_-_bia1_d593dda377084ba987932aa808d05827_large.jpg https://product.hstatic.net/200000287623/product/made_in_abyss_8_-_bia1_d593dda377084ba987932aa808d05827_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nSau khi bị chia cắt với Reg và Nanachi, Riko đã tìm thấy một nơi ở rìa ngôi làng gọi là “Hốc mắt” và gặp cô gái mang tên Vueko. Để cứu bạn mình, Riko quyết tâm tìm hiểu về Faputa. Quá khứ đen tối của ngôi làng đang dần hé lộ…Mời các bạn đón đọc tập 8 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa mong muốn và từ bỏ!', 15, 'Made In Abyss - 8', 'Bìa mềm'),
	(106,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_11_-_bia_1_39e1f716b31a4a8fbb384c14e9c6c3c8_large.jpg https://product.hstatic.net/200000287623/product/horimiya_11_-_bia_1_39e1f716b31a4a8fbb384c14e9c6c3c8_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nYuki vẫn chưa xác định được tình cảm mình dành cho Toru là tình yêu hay tình bạn. Mặc dù mối quan hệ với Yuki còn mập mờ, Toru vẫn rất quý trọng khoảng thời gian “khó hiểu” mà bình yên bên cạnh cô ấy…Những tháng ngày êm đềm của học kì 3 lớp 12 dần trôi qua. Mời các bạn thưởng thức tập 11 của bộ truyện học đường ngọt sâu răng!', 15, 'Horimiya - 11', 'Bìa mềm'),
	(107,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_6_-_bia_1_ab0ab409c8824613baf55caa8153f494_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_6_-_bia_1_ab0ab409c8824613baf55caa8153f494_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau khi đụng độ phe “mũ vành”, Qifrey và được đưa về Đại giảng đường, nơi các phù thủy sinh sống. Ở đây, Coco và những người bạn đã gặp Beldaruit, một trong tam hiền giả đứng đầu thế giới phù thủy, và được ông cho phép kiểm tra lại vòng hai. Liệu nhóm Coco có thể đưa ra đáp án mà vị hiền giả tinh thông mọi phép thuật này yêu cầu không?', 15, 'Xưởng Phép Thuật - 6', 'Bìa mềm'),
	(108,'2021-11-11',0, 'admin001', 1, 'Reki Kawahara', 140000, 2022, 'https://product.hstatic.net/200000287623/product/sao_22_-_bia_1_d8c52d3fb2094fba973e06e4936ca5d7_large.jpg https://product.hstatic.net/200000287623/product/sao_22_-_bia_1_d8c52d3fb2094fba973e06e4936ca5d7_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nMột MMO hay thường sẽ có vô vàn quest phụ để bổ sung cho cốt truyện chính. Ý tưởng này đã tạo nên Sword Art Online 022 “Kiss and Fly”, vén mở một góc nhìn chi tiết hơn vào thế giới trò chơi của Kirito và bạn bè, thông qua bốn truyện ngắn.', 20, 'Sword Art Online - 22', 'Bìa mềm'),
	(109,'2021-11-11',0, 'admin001', 1, 'Mori Kaoru', 40800, 2022, 'https://product.hstatic.net/200000287623/product/emma_9_bia_1_fb52656341ee44db9d291c130cbebe9e_large.jpg https://product.hstatic.net/200000287623/product/emma_9_bia_1_fb52656341ee44db9d291c130cbebe9e_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nBước sang tập 9 cũng là tập ngoại truyện thứ hai, tác giả Mori Kaoru tiếp tục tiết lộ những câu chuyện nhỏ thú vị về gia đình Mölders cùng các cô hầu gái, thời nhỏ của William và Hakim, thậm chí cả câu chuyện về các ca sĩ opera từng xuất hiện trong các tập trước.', 15, 'Emma - 9', 'Bìa mềm'),
	(110,'2021-11-11',0, 'admin001', 1, 'Lôi Mễ', 129360, 2022, 'https://product.hstatic.net/200000287623/product/nang_tien_ca_-_bia_1_a07f6767f571461cae17ab5c91db61c5_large.jpg https://product.hstatic.net/200000287623/product/nang_tien_ca_-_bia_1_a07f6767f571461cae17ab5c91db61c5_master.jpg', 'Hồng Đức', '15.5 x 24 cm', 'Nội dung: \nSau khi gieo mình xuống biển, nàng tiên cá phải chịu đựng ba trăm năm thử thách mới được ban cho linh hồn bất diệt. Nếu nàng gặp được trẻ ngoan, thời gian thử thách rút đi một năm. Chẳng may gặp phải trẻ ác, thử thách lại tăng thêm một ngày.', 23, 'Nàng Tiên Cá (Trinh Thám)', 'Bìa mềm'),
	(111,'2021-11-11',0, 'admin001', 1, 'Kenji Inoue', 68000, 2022, 'https://product.hstatic.net/200000287623/product/lu_ngoc_12_bia_1_c2c6a39a1bdf4135b07ea23f1b4278d2_large.jpg https://product.hstatic.net/200000287623/product/lu_ngoc_12_bia_1_c2c6a39a1bdf4135b07ea23f1b4278d2_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nThua đến nơi rồi sao!? Cuối cùng, bên bại trận phải cống nạp… Không! Nhờ kế sách của Yuji, ngày đầu tiên của cuộc chiến triệu hồi đã kết thúc với tình thế còn một tia hi vọng cho khối Mười một. Bước sang ngày thứ hai, chênh lệch chiến lực còn rất lớn, nhưng dưới sự chỉ huy của Yuji, khối Mười một đã lấy lại tinh thần. Giữa cuộc chiến khốc liệt, Akihisa đang thực hiện nhiệm vụ thì gặp kẻ ngáng đường là chỉ huy khối Mười hai, Takashiro. Biết được nỗi khổ tâm thật sự của Mizuki, Akihisa sẽ…!?“Này Akihisa.”“Gì thế Yuji?”“Trường chúng ta thú vị nhỉ?”Bữa tiệc của lũ ngốc, cuối cùng cũng đến hồi kết!', 20, 'Lũ Ngốc, Bài Thi Và Linh Thú Triệu Hồi - 12', 'Bìa mềm'),
	(112,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_7_-_bia1_95a5237ab088440a80c98424da7c291c_large.jpg https://product.hstatic.net/200000287623/product/made_in_abyss_7_-_bia1_95a5237ab088440a80c98424da7c291c_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nĐặt chân tới tầng 6 một đi không trở lại, nhóm Riko đã tìm thấy ngôi làng của những kẻ biến dị. Ở đây ai cũng sở hữu những “giá trị” độc nhất và có thể dùng để trao đổi hàng hóa. Đúng lúc ấy, Nanachi lại đưa ra một quyết định vội vàng, đặt Riko vào tình thế vô cùng khó xử…Liệu Riko sẽ giải quyết chuyện này ra sao? Mời các bạn đón đọc tập 7 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa những điều thần bí và bình thường!', 15, 'Made In Abyss - 7', 'Bìa mềm'),
	(113,'2021-11-11',0, 'admin001', 1, 'Yoshino Satsuki', 38250, 2022, 'https://product.hstatic.net/200000287623/product/handa-6_6d3a69e40fea42f4ac3da5d839e7ef08_large.jpg https://product.hstatic.net/200000287623/product/handa-6_6d3a69e40fea42f4ac3da5d839e7ef08_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Chúng ta sẽ đưa Handa lên làm KING của lễ hội văn hóa!” - by Tập thể lớp 11-7 (tên thường gọi: lớp Handa)Một lần nữa bị ra rìa (ấy là chính chủ tưởng thế), song chứng kiến các bạn nỗ lực, suy nghĩ của Handa cũng dần thay đổi…!?Mời các bạn thưởng thức tập 6, cũng là tập cuối của Handa, spin-off của Barakamon! (Nói thì nói thế chứ vẫn còn tập 7 là tuyển tập ngoại truyện nhé các độc giả!)', 15, 'Handa - 6', 'Bìa mềm'),
	(114,'2021-11-11',0, 'admin001', 1, 'Keigo Higashino', 96000, 2022, 'https://product.hstatic.net/200000287623/product/sau_gio_hoc-bia_1-sua_635b03be09334b078ec372328be31261_large.jpg https://product.hstatic.net/200000287623/product/sau_gio_hoc-bia_1-sua_635b03be09334b078ec372328be31261_master.jpg', 'Hà Nội', '13.5 x 20.5 cm', 'Nội dung: \nSAU GIỜ HỌC là tác phẩm đánh dấu việc ra mắt với tư cách nhà văn của Keigo Higashino.Câu chuyện viết theo hướng “âm mưu lồng âm mưu”, xoay quanh những án mạng diễn ra ở một trường cấp ba.Trừ vài người bạn thân, Keigo không chia sẻ với ai về việc sáng tác. Cha mẹ và hai chị gái của ông không biết, tất nhiên càng phải giữ kín với công ty đang làm. Mỗi khi cảm thấy không vui ở công ty, Keigo lại tìm khuây khỏa trong bản thảo.', 20, 'Sau Giờ Học', 'Bìa mềm'),
	(115,'2021-11-11',0, 'admin001', 1, 'Tsugumi Ohba', 51000, 2022, 'https://product.hstatic.net/200000287623/product/deathnoteshortstories_bia_1_b789836ebfe440af9762a9421bb18ff7_large.jpg https://product.hstatic.net/200000287623/product/deathnoteshortstories_bia_1_b789836ebfe440af9762a9421bb18ff7_master.jpg', 'Hà Nội', '12 x 18 cm', 'Nội dung: \nRyuk… lại đánh rơi sổ à?Không! Lần này là đổi sổ lấy táo!9 năm sau khi thám tử thiên tài L ra đi, 3 năm sau khi Kira Yagami Raito bị tử thần Ryuk viết tên vào sổ, những câu chuyện mới về sổ tử thần lại bắt đầu…Sau 10 năm, nhân giới đã thay đổi chóng mặt, nhưng bản tính loài người liệu có khác xưa chăng?', 15, 'Death Note Short Stories', 'Bìa mềm'),
	(116,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya-10---bia1_6361c39761ea484ab6411f9507184ad6_large.jpg https://product.hstatic.net/200000287623/product/horimiya-10---bia1_6361c39761ea484ab6411f9507184ad6_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Hori và Miyamura lần đầu viếng đền đêm giao thừa. Những dịp đặc biệt như vậy, và cả tháng ngày sôi động thời học sinh đều là kỉ niệm không gì thay thế được… Ước gì những khoảnh khắc ấy sẽ kéo dài mãi mãi…Mời các bạn thưởng thức tập 10 của bộ truyện học đường ngọt sâu răng!', 15, 'Horimiya - 10', 'Bìa mềm'),
	(117,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_5_-_bia1_dead3fbf410549a381a441f9f4e2d136_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_5_-_bia1_dead3fbf410549a381a441f9f4e2d136_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nMột phù thủy “mũ vành” bất ngờ tấn công nhóm Agott ngay giữa thời điểm diễn ra bài kiểm tra thứ hai. Cậu bé Euini không may để kẻ đó bắt được và bị xăm cấm thuật lên người, khiến cơ thể hóa thành loài thú hoang. Cùng lúc đó, nhóm Coco ở bên ngoài hang động Romonon cũng bị mai phục và rơi xuống vực tối. Liệu số phận của những phù thủy tập sự sẽ ra sao?', 15, 'Xưởng Phép Thuật - 5', 'Bìa mềm'),
	(118,'2021-11-11',0, 'admin001', 1, ' NISIOISIN', 92000, 2022, 'https://product.hstatic.net/200000287623/product/bakemono-1-cover_1_ban_dac_biet_22cb519d57f9406c89d940ed43697e21_large.jpg https://product.hstatic.net/200000287623/product/bakemono-1-cover_1_ban_dac_biet_22cb519d57f9406c89d940ed43697e21_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nGiữa thời đại của động cơ tuyến tính và tàu đệm từ trường siêu tốc, cậu nam sinh cấp ba Araragi Koyomi lại bị ma cà rồng tấn công tại một thị trấn vùng quê Nhật Bản, phải để một ông chú vô gia cư lôi thôi lếch thếch tình cờ đi ngang qua ra tay cứu giúp mới có thể thoát nạn và trở thành một thứ nửa người nửa ngợm.', 20, 'Bakemonogatari - 1 (Bản Đặc Biệt)', 'Bìa mềm'),
	(119,'2021-11-11',0, 'admin001', 1, ' NISIOISIN', 92000, 2022, 'https://product.hstatic.net/200000287623/product/bakemono-1-cover_1_ban_dac_biet_d1c1f7d82dda46fe81f2b093b3043774_large.jpg https://product.hstatic.net/200000287623/product/bakemono-1-cover_1_ban_dac_biet_d1c1f7d82dda46fe81f2b093b3043774_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nGiữa thời đại của động cơ tuyến tính và tàu đệm từ trường siêu tốc, cậu nam sinh cấp ba Araragi Koyomi lại bị ma cà rồng tấn công tại một thị trấn vùng quê Nhật Bản, phải để một ông chú vô gia cư lôi thôi lếch thếch tình cờ đi ngang qua ra tay cứu giúp mới có thể thoát nạn và trở thành một thứ nửa người nửa ngợm.', 20, 'Bakemonogatari - 1 (Bản Thường)', 'Bìa mềm'),
	(120,'2021-11-11',0, 'admin001', 1, 'Mori Kaoru', 40800, 2022, 'https://product.hstatic.net/200000287623/product/emma_8_bia_1_e63248b447c24ea39e6cbe4dc96bfd76_large.jpg https://product.hstatic.net/200000287623/product/emma_8_bia_1_e63248b447c24ea39e6cbe4dc96bfd76_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nCâu chuyện giữa William và Emma về cơ bản đã khép lại. Nhưng phía sau còn rất nhiều mẩu chuyện nhỏ thú vị mà tới giờ mới có cơ hội lên sóng.Tập 8 này chúng ta sẽ biết thêm về thời trẻ của những nhân vật thuộc thế hệ trước; một thời kì diễm lệ của Cung điện Pha lê; chuyện về sau của tiểu thư Eleanor Campbell với sự xuất hiện của một anh chàng lịch lãm; theo chân cô nàng Tasha hậu đậu về thăm gia đình...', 15, 'Emma - 8', 'Bìa mềm'),
	(121,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2021, 'https://product.hstatic.net/200000287623/product/horimiya_9_-_bia_1-06_0c114161ab5c4733a34db515d9114e6f_large.jpg https://product.hstatic.net/200000287623/product/horimiya_9_-_bia_1-06_0c114161ab5c4733a34db515d9114e6f_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Phố phường đang dần đổi sắc, hơi thở cũng mang bóng dáng mùa đông. Giờ này năm sau, mình, cậu ấy và mọi người đang làm gì nhỉ? Khi Hori đang bất an, Miyamura sẽ nói gì…!?Mời các bạn thưởng thức tập 9 của bộ truyện học đường ngọt sâu răng!', 15, 'Horimiya - 9', 'Bìa mềm'),
	(122,'2021-11-11',0, 'admin001', 1, 'Akihito Tsukushi', 42500, 2021, 'https://product.hstatic.net/200000287623/product/made_in_abyss_6_-_bia_1_d22469025c6d4ce48f6521756d88e3e1_large.jpg https://product.hstatic.net/200000287623/product/made_in_abyss_6_-_bia_1_d22469025c6d4ce48f6521756d88e3e1_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nSau cuộc giao tranh vô cùng cam go, nhóm Riko đã đánh bại Bondrewd và đòi lại được Prushka. Tuy còn nhiều nỗi băn khoăn, những đứa trẻ vẫn tiếp tục chuyến phiêu lưu. Đích đến tiếp theo chính là tầng 6 nằm dưới ranh giới tuyệt đối, nơi mà các nhà thám hiểm không còn đường trở về mặt đất.', 15, 'Made In Abyss - 6', 'Bìa mềm'),
	(123,'2021-11-11',0, 'admin001', 1, 'Kaiu Shirai - Posuka Demizu', 56000, 2021, 'https://product.hstatic.net/200000287623/product/mien-dat-hua-ln-2_9ad19957f5a945eeae02ab611210d83d_large.jpg https://product.hstatic.net/200000287623/product/mien-dat-hua-ln-2_9ad19957f5a945eeae02ab611210d83d_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTối hôm bọn trẻ đào tẩu, căn nhà cháy rừng rực, những mảnh giấy bay đầy trời. Chứng kiến cảnh đó, Isabella chợt nhớ về cậu bé ngày ấy. Mặt khác, vào giây phút cuối đời, Krone hồi tưởng lại quãng thời gian cô trải qua ở trường đào tạo.Câu chuyện quá khứ của mama Isabella và xơ Krone, những người cản trở nhóm Emma, sẽ được hé lộ!', 20, 'Miền Đất Hứa - Khúc Ca Xưa Của Isabella Và Krone (Light Novel)', 'Bìa mềm'),
	(124,'2021-11-11',0, 'admin001', 1, 'Kaiu Shirai', 58500, 2021, 'https://product.hstatic.net/200000287623/product/mien-dat-hua-den_1b8d855691e940bd97926c8bd2af340c_large.jpg https://product.hstatic.net/200000287623/product/mien-dat-hua-den_1b8d855691e940bd97926c8bd2af340c_master.jpg', 'Hà Nội', '12 x 18 cm', 'Nội dung: \nNội dung:Emma lần nữa đối mặt với kẻ thù truyền kiếp Peter Ratri tại Grace Field House. Song mọi chuyện lại diễn ra theo hướng không ngờ tới. Không những thế tại vương đô, tình thế đã xoay chuyển chóng mặt!? Số phận Emma sẽ ra sao!?Hỡi những đứa trẻ không có tương lai, hãy đứng lên đối đầu với tuyệt vọng! Cuộc vượt ngục không tưởng cuối cùng cũng đi tới hồi kết!###Nội dung:Emma lần nữa đối mặt với kẻ thù truyền kiếp Peter Ratri tại Grace Field House. Song mọi chuyện lại diễn ra theo hướng không ngờ tới. Không những thế tại vương đô, tình thế đã xoay chuyển chóng mặt!? Số phận Emma sẽ ra sao!?Hỡi những đứa trẻ không có tương lai, hãy đứng lên đối đầu với tuyệt vọng! Cuộc vượt ngục không tưởng cuối cùng cũng đi tới hồi kết!', 10, 'Miền Đất Hứa - 20', 'Bìa mềm'),
	(125,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2021, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_3_-_bia_1_7db79365b18b4235b092013c7db95264_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_3_-_bia_1_7db79365b18b4235b092013c7db95264_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nVừa thoát khỏi rắc rối ở Kalhn, Coco lại gặp phải rắc rối mới. Lần này, cô bé và Agott bị đội cảnh vệ phép thuật bắt giữ vì tình nghi sử dụng cấm thuật. Chỉ có duy nhất một hình phạt chờ đón những kẻ phá vỡ luật lệ, đó là xóa toàn bộ kí ức liên quan tới phép thuật. Liệu chuyện gì sẽ xảy ra với Coco? Hãy cùng đón đọc XƯỞNG PHÉP THUẬT tập 3.', 15, 'Xưởng Phép Thuật - 3', 'Bìa mềm'),
	(126,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2021, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_2_-_bia1_0dd14ae892d045fb8fafe4a7d2c4d003_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_2_-_bia1_0dd14ae892d045fb8fafe4a7d2c4d003_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau khi tới thành phố phù thủy Kalhn, Coco cùng nhóm bạn đã bị phù thủy đeo mặt nạ kì quái nhốt vào không gian bí ẩn và phải chạm trán với một con rồng. Cuộc sống của Coco trong thế giới phù thủy vừa mới bắt đầu đã gặp phải gian nan trắc trở. Liệu cô bé và các bạn sẽ làm gì để thoát khỏi tình thế hiểm nguy? Hãy cùng đón đọc tập 2 của Xưởng phép thuật.', 15, 'Xưởng Phép Thuật - 2', 'Bìa mềm'),
	(127,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2021, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_1_-_bia1_c9e69acee53640b592f8effd072d1668_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_1_-_bia1_c9e69acee53640b592f8effd072d1668_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nPhép thuật tràn ngập khắp thế gian, nhưng chỉ những người đặc biệt mới có thể sử dụng. Thế nên cô bé Coco dù rất muốn trở thành phù thủy nhưng đành cam chịu. Một hôm, khi anh chàng phù thủy Qifrey ghé qua làng, cô bé đã vô tình nhìn thấy khoảnh khắc làm phép, điều vốn được coi là cấm kị…', 15, 'Xưởng Phép Thuật - 1', 'Bìa mềm'),
	(128,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 34000, 2021, 'https://product.hstatic.net/200000287623/product/horimiya_7_6ebe961db84c476497b011a55cb46261_large.jpg https://product.hstatic.net/200000287623/product/horimiya_7_6ebe961db84c476497b011a55cb46261_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Vốn được xếp vào hàng mỹ nam, Miyamura vẫn phải chịu lu mờ trước nhân vật mới: Yanagi Akane “lấp la lấp lánh”!', 15, 'Horimiya - 7', 'Bìa mềm'),
	(129,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 34000, 2021, 'https://product.hstatic.net/200000287623/product/horimiya_6_-_bia_1_a325a68aba1e48b998ebe6eec6e17509_large.jpg https://product.hstatic.net/200000287623/product/horimiya_6_-_bia_1_a325a68aba1e48b998ebe6eec6e17509_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!\nHori và Miyamura đã quen với việc dính lấy nhau cả khi ở trường. Ngày ngày chuyện trò, vui đùa với bạn bè, thế giới của hai người càng thêm muôn màu.', 15, 'Horimiya - 6', 'Bìa mềm'),
	(130,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 34000, 2021, 'https://product.hstatic.net/200000287623/product/horimiya_5_-_bia1-09_ac8331abe2d54708819df931fbe9ace8_large.jpg https://product.hstatic.net/200000287623/product/horimiya_5_-_bia1-09_ac8331abe2d54708819df931fbe9ace8_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!\nHori và Miyamura chính thức hẹn hò. Để tâm tới những lời bàn tán ác ý dành cho Hori, Miyamura đã thay đổi hình tượng. Cái nhìn của mọi người về cậu quay ngoắt 180 độ…', 15, 'Horimiya - 5', 'Bìa mềm'),
	(131,'2021-11-11',0, 'admin001', 1, 'Yoshino Satsuki', 38250, 2021, 'https://product.hstatic.net/200000287623/product/handa-5_2f16f67884d64097893c133be9fda243_large.jpg https://product.hstatic.net/200000287623/product/handa-5_2f16f67884d64097893c133be9fda243_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nHọc sinh cấp ba kiêm nhà thư pháp lánh đời Handa Sei gặp phải thách thức lớn nhất đời học sinh: du lịch ngoại khóa! Ăn chung ngủ chung với kẻ địch (hiểu lầm) đã đủ xì trét, lại còn chạm mặt “đội quân Handa trắng” của trường đối thủ phố bên. Tình thế căng như dây đàn!', 15, 'Handa - 5', 'Bìa mềm'),
	(132,'2021-11-11',0, 'admin001', 1, 'Kamome Shirahama', 42500, 2021, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_4_-_bia_1_c7276e4d5ac145bbbb7c0a8dadfff666_large.jpg https://product.hstatic.net/200000287623/product/xuong_phep_thuat_4_-_bia_1_c7276e4d5ac145bbbb7c0a8dadfff666_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCô bé Agott sắp tham gia bài kiểm tra thứ hai để được phép sử dụng phép thuật trước mặt “người thường". Coco cùng những bạn học khác cũng đi theo để cổ vũ và học hỏi. Nhưng tất cả đều không ngờ rằng nhóm phù thủy “mũ vành” đang nung nấu một âm mưu đen tối khác…Hãy cùng đón đọc XƯỞNG PHÉP THUẬT tập 4 đầy căng thẳng và xung đột giữa những con người đang theo đuổi ước mơ!', 15, 'Xưởng Phép Thuật - 4', 'Bìa mềm'),
	(133,'2021-11-11',0, 'admin001', 1, 'Mori Kaoru', 51000, 2021, 'https://product.hstatic.net/200000287623/product/emma_7_bia_1_e2a813049b0543df8229c3e544a5115b_large.jpg https://product.hstatic.net/200000287623/product/emma_7_bia_1_e2a813049b0543df8229c3e544a5115b_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nDựa trên những manh mối ít ỏi, William bắt đầu tìm kiếm Emma.Hành trình có khó khăn nhưng cậu chủ nhỏ đã xác định rõ ràng tư tưởng: Nếu không sử dụng cho những lúc thế này, địa vị và tài sản còn để làm gì?William quyết định đối mặt. Bàn tay Emma cũng đặt trọn trong lòng bàn tay người thương.Dù phía trước còn nhiều gian khó, họ đã quyết tâm cùng dấn bước…', 15, 'Emma - 7', 'Bìa mềm'),
	(134,'2021-11-11',0, 'admin001', 1, 'Maruyama Kugane', 128000, 2021, 'https://product.hstatic.net/200000287623/product/overlord_5__ln__-_bia1_a3473e6167824ae4b0203ed64cbe52e1_large.jpg https://product.hstatic.net/200000287623/product/overlord_5__ln__-_bia1_a3473e6167824ae4b0203ed64cbe52e1_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSuzuki Satoru, hay Ainz, một nhân viên văn phòng say mê YGGDRASIL vẫn đăng nhập để nhâm nhi những giây phút sau cuối trước khi game dừng hoạt động. Nhưng khi đã sẵn sàng tinh thần chia tay các NPC dù vô tri vô giác nhưng là những đứa con tinh thần của mình, anh lại không chủ động đăng xuất được nữa mà nhảy vọt sang dị thế giới.', 20, 'Overlord - 5 (Light Novel)', 'Bìa mềm'),
	(135,'2021-11-11',0, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2013, 'https://product.hstatic.net/200000287623/product/horimiya_8_-_bia_1_e54c576610104aa5a520a5a82fcc988c_large.jpg https://product.hstatic.net/200000287623/product/horimiya_8_-_bia_1_e54c576610104aa5a520a5a82fcc988c_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Chương truyện “Hội thao” do tác giả HERO mới sáng tác chính thức lên sóng! Sengoku không có tí tinh thần chiến đấu nào, Sakura chẳng biết nhảy cổ động, Hori thì nhảy trông vẫn rất “đàn ông”! Đối với học sinh khối 12, đây là những kỉ niệm cuối cùng của thời cấp ba. Còn riêng với Miyamura, đây lại là kỉ niệm đầu tiên của cậu.', 15, 'Horimiya - 8', 'Bìa mềm'),
	(136,'2021-11-11',0, 'admin001', 1, 'Kaiu Shirai - Posuka Demizu', 68000, 2021, 'https://product.hstatic.net/200000287623/product/neverland-0-mystic-code---bia-1_96bd404bd664420ca1c6023816b9c56b_large.jpg https://product.hstatic.net/200000287623/product/neverland-0-mystic-code---bia-1_96bd404bd664420ca1c6023816b9c56b_master.jpg', 'Hà Nội', '12 x 18 cm', 'Nội dung: \nChào mừng đến “lối vào”.Cuốn fanbook này là cánh cửa cấm kị, chưa biết chừng sẽ phá vỡ những mộng tưởng của bạn. Nó phơi bày suy tư thầm kín của Kaiu Shirai, đào sâu hết mức có thể vào chuyện hậu trường, thông tin nhân vật và tình tiết truyện. Mong bạn sẽ tận hưởng cuốn sách với vô số điều chưa từng được tiết lộ. Nào, chào mừng tới tận cùng của Miền Đất Hứa.', 15, 'Miền Đất Hứa - 0 Mystic Code', 'Bìa mềm');
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
	(63, 9),
	(63, 1),
	(63, 8),
	(63, 12),
	(63, 13),
	(63, 3),
	(64, 5),
	(64, 12),
	(64, 13),
	(65, 5),
	(65, 12),
	(66, 1),
	(66, 12),
	(67, 1),
	(67, 12),
	(68, 9),
	(68, 12),
	(68, 13),
	(68, 11),
	(69, 9),
	(69, 12),
	(70, 9),
	(70, 12),
	(70, 11),
	(71, 9),
	(71, 3),
	(71, 12),
	(72, 9),
	(72, 8),
	(72, 12),
	(72, 11),
	(73, 1),
	(73, 12),
	(74, 7),
	(74, 9),
	(74, 12),
	(75, 7),
	(75, 3),
	(75, 9),
	(75, 12),
	(76, 9),
	(76, 12),
	(76, 13),
	(77, 9),
	(77, 12),
	(78, 9),
	(78, 12),
	(79, 9),
	(79, 3),
	(79, 12),
	(79, 13),
	(80, 1),
	(80, 12),
	(80, 8),
	(81, 5),
	(81, 3),
	(81, 12),
	(81, 13),
	(82, 9),
	(82, 12),
	(82, 13),
	(82, 11),
	(83, 9),
	(83, 12),
	(83, 13),
	(84, 5),
	(84, 11),
	(84, 12),
	(85, 5),
	(85, 3),
	(85, 12),
	(86, 9),
	(86, 12),
	(87, 9),
	(87, 3),
	(87, 12),
	(87, 8),
	(88, 9),
	(88, 12),
	(88, 13),
	(89, 9),
	(89, 12),
	(89, 13),
	(90, 5),
	(90, 12),
	(91, 5),
	(91, 12),
	(92, 7),
	(92, 11),
	(92, 9),
	(92, 12),
	(93, 9),
	(93, 2),
	(93, 12),
	(94, 9),
	(94, 12),
	(95, 1),
	(95, 3),
	(95, 12),
	(96, 9),
	(96, 12),
	(96, 10),
	(96, 4),
	(97, 5),
	(97, 12),
	(98, 5),
	(98, 12),
	(98, 11),
	(99, 9),
	(99, 12),
	(99, 6),
	(99, 13),
	(100, 9),
	(100, 12),
	(100, 13),
	(101, 9),
	(101, 4),
	(101, 12),
	(101, 14),
	(102, 5),
	(102, 12),
	(102, 10),
	(102, 11),
	(102, 13),
	(103, 9),
	(103, 12),
	(104, 9),
	(104, 12),
	(104, 3),
	(105, 9),
	(105, 12),
	(106, 9),
	(106, 2),
	(106, 6),
	(106, 11),
	(106, 12),
	(107, 9),
	(107, 12),
	(108, 5),
	(108, 12),
	(108, 10),
	(109, 9),
	(109, 12),
	(110, 1),
	(110, 12),
	(110, 3),
	(110, 2),
	(111, 5),
	(111, 12),
	(112, 9),
	(112, 12),
	(113, 9),
	(113, 12),
	(114, 1),
	(114, 4),
	(114, 12),
	(114, 11),
	(114, 10),
	(115, 9),
	(115, 12),
	(116, 9),
	(116, 6),
	(116, 12),
	(117, 9),
	(117, 12),
	(118, 5),
	(118, 3),
	(118, 14),
	(118, 12),
	(119, 5),
	(119, 12),
	(120, 9),
	(120, 12),
	(121, 9),
	(121, 11),
	(121, 12),
	(122, 9),
	(122, 14),
	(122, 12),
	(123, 5),
	(123, 2),
	(123, 12),
	(124, 9),
	(124, 12),
	(124, 14),
	(125, 9),
	(125, 12),
	(126, 4),
	(126, 9),
	(126, 12),
	(126, 11),
	(126, 13),
	(127, 9),
	(127, 12),
	(127, 4),
	(128, 9),
	(128, 3),
	(128, 12),
	(128, 6),
	(128, 13),
	(129, 9),
	(129, 12),
	(130, 9),
	(130, 12),
	(131, 9),
	(131, 10),
	(131, 12),
	(132, 9),
	(132, 14),
	(132, 11),
	(132, 12),
	(133, 9),
	(133, 12),
	(134, 5),
	(134, 3),
	(134, 2),
	(134, 12),
	(135, 9),
	(135, 2),
	(135, 12),
	(135, 6),
	(135, 13),
	(136, 9),
	(136, 10),
	(136, 11),
	(136, 2),
	(136, 12);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;

CREATE TABLE `news` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
    `content` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    `image` varchar(1024) not null DEFAULT '0',
    `adminId` int(11),
    `createdAt` datetime NOT NULL,
    PRIMARY KEY (`ID`),
    KEY `FK_news_admin` (`adminId`),
    CONSTRAINT `FK_news_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`ID`)
);

INSERT INTO `news` (`ID`, `title`, `content`, `image`, `adminId`, `createdAt`) VALUES
	(1, '[ĐIỂM SÁCH] KHI TẾ BÀO LÀM VIỆC - CUỘC CHIẾN KHÔNG HỒI KẾT TRONG CƠ THỂ CON NGƯỜI', '<div class="col-md-12 article-content">

									<div class="body-content">
										<p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Bất cứ khi nào bạn cảm thấy cô đơn hay buồn bã, hãy nhớ rằng, trong cơ thể bạn có đến hàng chục nghìn tỉ tế bào đang âm thầm đồng hành và hiến dâng trọn đời vì bạn, từng giây từng phút! <b><i>Khi Tế Bào Làm Việc</i></b> – series manga 6 tập đến từ tác giả <b>Akane Shimizu </b>chính là câu chuyện về những tế bào đáng yêu đang nỗ lực vì sức khỏe của chúng ta&nbsp;đó! </span></span></span></span></span></p><p style="text-align: center"><img alt="khi tế bào làm việc - truyện tranh manga" style="width: 647px; height: 431px;" src="//file.hstatic.net/200000287623/file/khi_te_bao_lam_viec_-_truyen_tranh_manga_c1385433c11442c6ad8c03e5900dea37_grande.jpg"></p><p style="margin-bottom: 13px; text-align: center;"><em><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Trọn bộ 6 tập <strong>Khi Tế Bào Làm Việc</strong> đã được IPM phát hành vào năm 2021, kèm theo những món quà rất đáng yêu như sticker và hộp tế bào đa năng, dành riêng cho thị trường Việt Nam.</span></span></span></span></span></em></p><h2 style="margin-top:3px"><span style="font-size:13pt"><span style="line-height:115%"><span style="font-family:Cambria,serif"><span style="color:#365f91"><span style="font-weight:normal"><b><i><span style="font-family:&quot;Times New Roman&quot;,serif">Khi Tế Bào Làm Việc </span></i></b><span style="font-family:&quot;Times New Roman&quot;,serif">– “cẩm nang” tế bào cực kỳ MỚI LẠ!</span></span></span></span></span></span></h2><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Để xem nào, đầu tiên cần kể đến hồng cầu, tiểu cầu, bạch cầu. Bạch cầu lại gồm bạch cầu trung tính, bạch cầu ái toan, bạch cầu ái kiềm, bạch cầu đơn nhân, tế bào lympho T, tế bào lympho B… Khoan! Đây có phải giáo trình sinh học hay bài viết phổ cập kiến thức trên Wikipedia đâu! Đây là truyện tranh <b><i>Khi Tế Bào Làm Việc </i></b>mà! Chẳng cần mở những cuốn sách dày cộp, bạn vẫn có thể thuộc làu những tế bào quan trọng trong cơ thể nhờ đọc bộ truyện tranh ngắn nhưng chất hơn nước cất này đấy nhé!</span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Không khô khan, không rập khuôn, <b><i>Khi Tế Bào Làm Việc </i></b>lồng ghép cực kì khéo léo những kiến thức căn bản về sức khỏe và cơ thể con người. Từ những hiện tượng và bệnh vặt thường gặp như hắt hơi, cảm cúm, dị ứng, đến những tình trạng nghiêm trọng hơn như say nắng, ngộ độc thực phẩm, và cả những căn bệnh nguy hiểm như ung thư, Covid… tất tần tật đều được miêu tả ngộ nghĩnh thông qua những mẩu truyện ngắn thú vị, thậm chí đôi khi còn kịch tính ngang truyện shounen. </span></span></span></span></span></p><p style="text-align: center;"><img alt="khi tế bào làm việc - truyện tranh manga" style="width: 685px; height: 513px;" src="//file.hstatic.net/200000287623/file/khi_te_bao_lam_viec_-_truyen_tranh_manga_2_88514a0b5ba044729377726a687c7472_1024x1024.jpg"></p><p style="margin-bottom: 13px; text-align: center;"><em><font face="Times New Roman, serif"><span style="font-size: 14.6667px;">Tế bào ung thư được nhân hóa rất thành công, vừa thể hiện được bản chất nguồn gốc của ung thư, vừa... đẹp trai nữa chứ!</span></font></em></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Không những thế, độc giả còn được làm quen với những từ ngữ lạ lẫm, chưa bao giờ nghĩ mình sẽ nghe đến, kiểu như phế cầu khuẩn, tụ cầu vàng (đây cũng là hai trong số các “nhân vật phản diện” xuất hiện trong truyện, cá nhân người viết thấy dị nguyên phấn hoa tuyết tùng là phản diện dễ cưng nhất, trông như củ lạc gắn thêm mặt của người trong bức tranh <i>Tiếng thét</i> của Edvard Munch, miệng lúc nào cũng thều thào “tuyết tùùùùùng”). </span></span></span></span></span></p><h2 style="margin-top:3px"><span style="font-size:13pt"><span style="line-height:115%"><span style="font-family:Cambria,serif"><span style="color:#365f91"><span style="font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,serif">Góp phần vào thành công của <b><i>Khi Tế Bào Làm Việc </i></b>đương nhiên phải kể đến dàn nhân vật được nhân hóa với tính cách và cảm xúc rất “người”.</span></span></span></span></span></span></h2><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Đó là cô Hồng cầu thật thà, tốt tính nhưng là chuyên gia lạc đường và số hơi nhọ, hầu như bộ phận nào của cơ thể có biến là lại thấy bóng dáng run rẩy của cô (à thì, mạch máu trải khắp cơ thể con người, mà trong mạch máu đương nhiên phải có hồng cầu rồi!); </span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">là anh Bạch cầu cool ngầu, diện đồ trắng toát từ đầu đến chân (đúng với cái tên của anh), cần mẫn và đầy trách nhiệm với công việc diệt virus vi khuẩn, luôn có mặt kịp thời để cứu nguy cho Hồng cầu và các tế bào khác; </span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">là bé Tiểu cầu nhỏ mà có võ, vóc dáng con con nhưng lại gánh trên vai trọng trách bịt kín miệng vết thương, giúp các anh chị đồng nghiệp không “rơi” ra ngoài cũng như ngăn chặn kẻ thù xâm nhập; </span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">là Tế bào T sát thủ cơ bắp cuồn cuộn, hung hăng máu chiến, giết người, à nhầm, giết vật thể lạ như ngóe; </span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">rồi còn có Đại thực bào thùy mị trong bộ váy nền nã tinh khôi, trông thật ra dáng tiểu thư đài các nếu cô không khư khư con dao chém virus trong tay.</span></span></span></span></span></p><p style="text-align: center"><img alt="khi tế bào làm việc - truyện tranh manga" style="width: 609px; height: 458px;" src="//file.hstatic.net/200000287623/file/khi_te_bao_lam_viec_-_truyen_tranh_manga_3_17f6494598244d9fbf8cb8771565a4fc_1024x1024.jpg"></p><p style="text-align:justify; margin-bottom:13px"><em><font face="Times New Roman, serif"><span style="font-size: 14.6667px;">Theo chân Hồng cầu, Bạch cầu và Tiểu cầu, bạn sẽ được khám phá kha khá ngóc ngách của cơ thể đấy!</span></font></em></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Và rất nhiều, rất nhiều tế bào khác trong cơ thể đang hăng say làm việc bất kể ngày đêm, cùng hướng đến một sứ mệnh chung: vận hành và bảo vệ cơ thể chúng ta khỏi các tác nhân gây bệnh, hay nói cách khác, duy trì sự sống của chúng ta.</span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><font face="Times New Roman, serif"><span style="font-size: 14.6667px;">Đặt mua <em><strong>Combo Trọn bộ Khi Tế Bào Làm Việc </strong></em>tại <em><strong><a href="https://ipm.vn/products/combo-tron-bo-khi-te-bao-lam-viec-tap-1-den-6"><span style="color:#27ae60;">đây</span></a></strong></em>.</span></font></p><h2 style="margin-top:3px"><span style="font-size:13pt"><span style="line-height:115%"><span style="font-family:Cambria,serif"><span style="color:#365f91"><span style="font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,serif">Đặc biệt, tác giả Akane Shimizu còn dành một chương truyện để đề cập đến virus corona chủng mới. </span></span></span></span></span></span></h2><div><p style="text-align: center"><img alt="khi tế bào làm việc - truyện tranh manga" style="width: 446px; height: 669px;" src="//file.hstatic.net/200000287623/file/khi_te_bao_lam_viec_-_truyen_tranh_manga_5_46b31678458048da95790324a55e324a_1024x1024.jpg"></p><p style="text-align: center"><em><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Virus Corona xuất hiện trong <strong>Khi Tế Bào Làm Việc</strong> 6,
 tập cuối của series.&nbsp;</span></span></span></span></span></em></p><p style="text-align: justify;"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Trong bối cảnh đại dịch covid hoành hành khắp nơi trên thế giới, cướp đi biết bao sinh mệnh và để lại hậu quả thảm khốc trên mọi phương diện cuộc sống suốt hơn hai năm nay, cách tiếp cận và nhìn nhận vấn đề theo hướng nhẹ nhàng, tích cực của tác giả phần nào giúp ta thoải mái hơn, lạc quan hơn khi tiếp thu thông tin về căn bệnh quái ác này.</span></span></span></span></span></p></div><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Với nét vẽ sinh động cùng cách kể chuyện hài hước, gần gũi mà không kém phần gay cấn, <b><i>Khi Tế Bào Làm Việc </i></b>cung cấp cho người đọc nhiều kiến thức về vai trò, chức năng và cách hoạt động của các tế bào trong hệ miễn dịch nói riêng, cũng như trong cơ thể con người nói chung. Bên cạnh đó, truyện còn hô biến những tế bào vô tri thành những cô cậu thanh niên giàu cảm xúc, nhiệt huyết với công việc. Đọc truyện vừa thu nạp thêm nhiều điều bổ ích lại vừa được giải trí, đúng là còn gì bằng!</span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Times New Roman&quot;,serif">Đảm bảo sau khi đọc xong sáu tập truyện <b><i>Khi Tế Bào Làm Việc</i></b>, bạn sẽ không chỉ thu lượm được túi kiến thức rủng rỉnh để tha hồ khoe với bạn bè và người thân, mà còn biết yêu thương hơn, trân trọng hơn sức khỏe của mình, biết cách chăm sóc, nâng niu cơ thể mình, luôn tràn đầy năng lượng đón nhận ngày mới, để các tế bào có cơ hội được nói câu:</span></span></span></span></span></p><p style="text-align:justify; margin-bottom:13px"><span style="font-size:11pt"><span style="text-justify:inter-ideograph"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><i><span style="font-family:&quot;Times New Roman&quot;,serif">Hôm nay, tế bào chúng tôi cũng hăng say làm việc!</span></i></span></span></span></span></p><hr><p><i>Tìm hiểu thêm về các <u><a href="https://ipm.vn/collections/manga-comic">Manga - Comic</a></u> của IPM tại đây</i></p><p><i>Tham khảo các bài viết khác thuộc chuyên mục ĐIỂM SÁCH tại <u><a href="https://ipm.vn/blogs/tintuc">đây</a></u>.</i></p><p><i>Follow <u><a target="_blank" href="http://www.facebook.com/ipmvn">fanpage IPM</a> </u>để cập nhật các tin tức mới nhất.&nbsp;</i></p><p style="text-align:justify; margin-bottom:13px">&nbsp;</p>
									</div>

								</div>',
	'https://file.hstatic.net/200000287623/article/khi_te_bao_lam_viec_-_truyen_tranh_manga_7a8148b658b34591952bb5ceb0408c66_large.jpg', 
	1, 
	'2022-12-12 00:00:00'),
	(2, '[ĐIỂM SÁCH] BAKEMONOGATARI - THANH XUÂN "THÚ VỊ" BÊN MUÔN VÀN ĐIỀU "QUÁI GỞ"','<div class="col-md-12 article-content">

									<div class="body-content">
										<p style="margin-bottom: 13px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-size: 11.5pt;"><span style="line-height: 115%;"><span style="color: rgb(5, 5, 5);"><font face="Times New Roman, Times, serif">Giữa thời hiện đại, trong bối cảnh đô thị hết sức bình thường, vậy mà cậu nam sinh&nbsp;</font><font face="Times New Roman, serif">Araragi Koyomi lại bắt gặp&nbsp;1001 câu chuyện "quái dị" - ma - thần - quỷ - quái - hay là những thực thể cứ ngỡ là không có thực! Đó chính là khởi đầu của Bakemonogatari - series light novel đình đám đến từ cây bút tài hoa NISIO ISIN. Hãy cùng IPM tìm hiểu thêm về tác phẩm này nhé! </font></span></span></span></span></span></p><p style="text-align: center"><img src="//file.hstatic.net/200000287623/file/et_lay_cam_hung_tu_ban_goc_nhat__su_dung_art_ban_quyen_mua_them_111111_c57c00c038614347a559a12efcdd69b4.jpg" alt="Bakemonogatari - Bản giới hạn tại Việt Nam, với boxset lấy cảm hứng từ bản gốc Nhật, sử dụng art bản quyền mua thêm."></p><h2 style="margin-bottom: 13px; text-align: center;"><em><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Bakemonogatari với hai phiên bản&nbsp;Bản giới hạn và Bản đặc biệt, sử dụng&nbsp;art bản quyền mua thêm để tạo nên thiết kế mới mẻ cho độc giả Việt Nam.</span></span></span></span></span></span></span></em></h2><h2 style="margin-bottom: 13px;"><span style="font-size:18px;"><em><strong><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Bakemonogatari - Những câu chuyện "quái dị" giữa thời hiện đại.</span></span></span></span></span></strong></em></span></h2><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Giữa thời đại của động cơ tuyến tính và tàu đệm từ trường siêu tốc, cậu nam sinh cấp ba Araragi Koyomi lại bị ma cà rồng tấn công tại một thị trấn vùng quê Nhật Bản, phải để một ông chú vô gia cư lôi thôi lếch thếch tình cờ đi ngang qua ra tay cứu giúp mới có thể thoát nạn và trở thành một thứ nửa người nửa ngợm. Và kể từ sau sự kiện mang tính “nỗi hổ thẹn đối với nhân loại hiện đại” ấy, cậu chàng với cái tên dễ líu lưỡi này liên tiếp gặp vấn đề với “quái dị” - những sự tồn tại bí ẩn sở hữu mối liên hệ vô cùng mật thiết với thế giới mà khoa học không tài nào giải thích nổi.&nbsp;</span></span></span></span></span></span></span></p><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Từ Cua tới Ốc Sên, hết Khỉ lại Rắn, chưa kể đến Ong, Phượng Hoàng hay Mèo... Tuy nhiên, trong họa cũng có phúc. Trải qua hàng loạt rắc rối ấy, Araragi Koyomi dần thoát khỏi kiếp tự kỉ lánh đời để kết thân với nhiều nhân vật đầy cá tính, mở ra một câu chuyện thanh xuân quái lạ, ngập tràn hài hước </span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">nhưng</span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505"> cũng không kém phần nhân văn, để lại trong lòng người đọc nhiều điều cần suy nghĩ.</span></span></span></span></span></span></span></p><p style="text-align: center"><img src="//file.hstatic.net/200000287623/file/img_95501111111_878a01539ab843c6823294492c516f9c.jpg" alt="Bakemonogatari - Bản giới hạn tại Việt Nam, với boxset lấy cảm hứng từ bản gốc Nhật, sử dụng art bản quyền mua thêm."></p><p style="margin-bottom: 13px; text-align: center;"><em><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Standee bập bênh, thiết kế độc quyền cho thị trường Việt Nam,&nbsp;tặng kèm Bakemonogatari&nbsp;bản giới hạn.</span></span></span></span></span></span></span></em></p><h2 style="margin-bottom: 13px;"><span style="font-size:18px;"><em><strong><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Thiên truyện giả tưởng khiến người đọc không thể ngừng mắt đến từ cây bút gạo cội NISIO ISIN.</span></span></span></span></span></strong></em></span></h2><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Được phân loại</span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505"> là light-novel, song series Monogatari lại sở hữu một đặc điểm khá nổi bật là sử dụng rất ít tranh minh họa. Chi tiết này vốn xuất phát từ một thử nghiệm đầy tính hiếu kì - Liệu có thể làm nên một tác phẩm light-novel gần như chỉ có chữ? - của cây bút gạo cội <a href="https://ipm.vn/collections/all/nisioisin">NISIO ISIN</a>. Thử nghiệm ấy đã thành công rực rỡ.&nbsp;</span></span></span></span></span></span></span></p><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Chẳng cần tới quá nhiều hình minh họa, ông vẫn dựng được nên những hình tượng nhân vật kinh điển</span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">- một cô nàng độc miệng toàn thân vũ trang bằng văn phòng phẩm, một lớp trưởng tưởng chừng hoàn hảo không tì vết, một cô nhóc tiểu học lanh lợi láu lỉnh, một đàn em </span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">xinh xắn giỏi giang nhưng lại có phần </span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">biến thái, vân vân và vân vân.</span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505"> Tất cả</span></span></span></span><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505"> đã được ngòi bút với sở trường vẽ nên cá tính cho nhân vật qua lời thoại của NISIO ISIN khắc họa vô cùng rõ nét.&nbsp;</span></span></span></span></span></span></span></p><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Và khi có thêm những tấm hình minh họa tuy ít về số lượng nhưng tuyệt đỉnh về chất lượng của “Phù thủy ánh sáng” VOFAN tiếp sức, những nhân vật ấy lại như hổ mọc cánh, cùng cốt truyện đầy thú vị và hấp dẫn tạo nên một tượng đài không thể lay chuyển trong làng light-novel Nhật Bản.&nbsp;</span></span></span></span></span></span></span></p><p style="text-align: center"><img alt="Bakemonogatari - Bản giới hạn tại Việt Nam, với boxset lấy cảm hứng từ bản gốc Nhật, sử dụng art bản quyền mua thêm." src="//file.hstatic.net/200000287623/file/bakemonogatari_-_ban_gioi_han_va_dac_biet_tai_viet_nam_111111111111_c075fbe96b7b48f0b473d9a73a19dc24.jpg"></p><p style="margin-bottom: 13px; text-align: center;"><em><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Postcard nhân vật tặng kèm Bakemonogatari&nbsp;bản giới hạn và bản đặc biệt phát hành&nbsp;tại thị trường Việt Nam.&nbsp;</span></span></span></span></span></span></span></em></p><p style="margin-bottom: 13px; text-align: center;"><em><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Với nội dung hấp dẫn, thiết kế độc đáo, quà tặng đa dạng,&nbsp;Bakemonogatari xứng đáng là một ấn phẩm để&nbsp;sưu tầm.</span></span></span></span></span></span></span></em></p><h2
 style="margin-bottom: 13px;"><span style="font-size:18px;"><em><strong><font face="Times New Roman, serif" color="#050505">Nếu đã lỡ phải lòng phong cách độc đáo của tác giả NISIO ISIN, đừng bỏ lỡ Bakemonogatari!</font></strong></em></span></h2><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Bakemonogatari nói riêng và Monogatari Series nói chung có lẽ vốn chẳng hề xa lạ với người hâm mộ Việt Nam qua các phiên bản chuyển thể giàu tính trực quan như anime hay manga. Tuy nhiên, khác với lối vận dụng hình ảnh để truyền tải và tăng thêm tính hấp dẫn cho câu chuyện của các phiên bản chuyển thể, light-novel gốc lại không quá chú trọng vào việc miêu tả các cảnh hành động/chiến đấu với “quái dị” hay quá trình khám phá/giải mã bí ẩn, mà chủ yếu tập trung vào những màn “đối đáp” đầy hài hước và xoắn não giữa các nhân vật hòng khai thác triệt để sở trường của NISIO ISIN.&nbsp;</span></span></span></span></span></span></span></p><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Bản thân tác giả cũng từng phát biểu rằng đây là đặc điểm khiến tác phẩm “rất khó chuyển thể”, và thực tế thì “hội thoại” chính là điểm nhấn mà các phiên bản anime hay manga, tuy đều rất nỗ lực và đạt được thành công mỹ mãn với cách thể hiện của mình, song vẫn chưa thể truyền tải trọn vẹn tới người đọc/người xem. </span></span></span></span></span></span></span></p><p style="margin-bottom:13px"><font face="Times New Roman, serif" color="#050505"><span style="font-size: 15.3333px;"><i>Xem thêm về Bakemonogatari - bản giới hạn tại </i></span></font><font face="Times New Roman, serif"><span style="font-size: 15.3333px;"><i><strong><a href="https://youtu.be/1urZP45DFO8"><span style="color:#27ae60;">đây</span></a></strong></i></span></font><font face="Times New Roman, serif" color="#050505"><span style="font-size: 15.3333px;"><i>.</i></span></font></p><div class="youtube-embed-wrapper" style="position: relative; padding-bottom: 56.25%; height: 0px;"><iframe class="iframe-youtube-embed" src="https://www.youtube.com/embed/1urZP45DFO8" style="aspect-ratio: 16 / 9; width: 100%; height: 100%; position: absolute;" width="640" height="360" frameborder="0"></iframe></div><p style="margin-bottom:13px"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Từ những yếu tố kể trên, có thể nói phiên bản light-novel của Bakemonogatari và những tập truyện tiếp theo là những ấn phẩm không thể bỏ qua đối với các fan trung thành của series Monogatari nói riêng và độc giả yêu sách nói chung. Hãy cùng đón đọc và thưởng thức những câu chuyện đầy bi hài về “quái dị” trong thế giới hiện đại nhé!&nbsp;&nbsp; &nbsp;</span></span></span></span></span></span></span></p><p style="text-align: center"><img alt="Bakemonogatari - Bản giới hạn tại Việt Nam, với boxset lấy cảm hứng từ bản gốc Nhật, sử dụng art bản quyền mua thêm." src="//file.hstatic.net/200000287623/file/i_boxset_lay_cam_hung_tu_ban_goc_nhat__su_dung_art_ban_quyen_mua_them._dc2c7ed2514d41b789f7f4cde736675e.jpg"></p><p style="margin-bottom: 13px; text-align: center;"><em><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Bakemonogatari - Bản giới hạn phát hành tại Việt Nam.&nbsp;</span></span></span></span></span></span></span><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#050505">Boxset cán bạc và vân sọc nổi, lấy cảm hứng từ bản gốc Nhật, sử dụng art bản quyền mua thêm.</span></span></span></span></span></span></span></em></p><p style="margin-bottom:13px"><em><strong><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,&quot;sans-serif&quot;"><span style="font-size:11.5pt"><span style="line-height:115%"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Bakemonogatari - Tuổi thanh xuân thú vị luôn đi kèm những điều quái gở - Tuổi thanh xuân chỉ thú vị khi đi kèm những điều quái gở! </span></span></span></span></span></span></strong></em></p><hr><p style="margin-bottom:13px"><i>Tìm hiểu thêm về các </i><em>Light Nove</em><i><em>l</em>&nbsp;khác của IPM tại <a href="https://ipm.vn/collections/light-novel">đây</a>.</i></p><p><i>Follow <u><a target="_blank" href="http://www.facebook.com/ipmvn">fanpage IPM</a> </u>để cập nhật các tin tức mới nhất.&nbsp;</i></p><p>&nbsp;</p><p style="margin-bottom:13px">&nbsp;</p>
									</div>

								</div>',
	'https://file.hstatic.net/200000287623/article/bakemonogatari_-_ban_gioi_han_va_dac_biet_tai_viet_nam_11111111_7781146bbf6d44b4bbfc73c808f3ddfe_large.jpg',
	2, 
	'2022-12-12 00:00:00');

/**
- Create Procedure Paging by Category
*/
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_getBookByCategoryPagingSortByTimeAsc`(IN `m_categoryId` INT, IN `m_pageIndex` INT UNSIGNED, IN `m_pageSize` INT UNSIGNED)
    COMMENT 'Phân trang cho danh sách sách lọc theo danh mục'
BEGIN
	SET @recordStart = ((m_pageIndex - 1) * m_pageSize) + 1,@recordEnd = m_pageIndex * m_pageSize;
    IF m_categoryId = 0 THEN
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.createAt ASC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b;
    ELSE 
    CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.createAt ASC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b, book_category bc
    WHERE b.ID = bc.bookId AND bc.categoryId = m_categoryId;
    END IF;
	SELECT DISTINCT * FROM tb_book_category tb WHERE stt BETWEEN @recordStart AND @recordEnd;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_getBookByCategoryPagingSortByTimeDesc`(IN `m_categoryId` INT, IN `m_pageIndex` INT UNSIGNED, IN `m_pageSize` INT UNSIGNED)
    COMMENT 'Phân trang cho danh sách sách lọc theo danh mục'
BEGIN
	SET @recordStart = ((m_pageIndex - 1) * m_pageSize) + 1,@recordEnd = m_pageIndex * m_pageSize;
    IF m_categoryId = 0 THEN
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.createAt DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b;
    ELSE 
    CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.createAt DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b, book_category bc
    WHERE b.ID = bc.bookId AND bc.categoryId = m_categoryId;
    END IF;
	SELECT DISTINCT * FROM tb_book_category tb WHERE stt BETWEEN @recordStart AND @recordEnd;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_getBookByCategoryPagingSortBySoldNumberDesc`(IN `m_categoryId` INT, IN `m_pageIndex` INT UNSIGNED, IN `m_pageSize` INT UNSIGNED)
    COMMENT 'Phân trang cho danh sách sách lọc theo danh mục'
BEGIN
	SET @recordStart = ((m_pageIndex - 1) * m_pageSize) + 1,@recordEnd = m_pageIndex * m_pageSize;
    IF m_categoryId = 0 THEN
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.soldNumber DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b;
    ELSE 
    CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.soldNumber DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b, book_category bc
    WHERE b.ID = bc.bookId AND bc.categoryId = m_categoryId;
    END IF;
	SELECT DISTINCT * FROM tb_book_category tb WHERE stt BETWEEN @recordStart AND @recordEnd;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_getBookByCategoryPagingSortByPriceAsc`(IN `m_categoryId` INT, IN `m_pageIndex` INT UNSIGNED, IN `m_pageSize` INT UNSIGNED)
    COMMENT 'Phân trang cho danh sách sách lọc theo danh mục'
BEGIN
	SET @recordStart = ((m_pageIndex - 1) * m_pageSize) + 1,@recordEnd = m_pageIndex * m_pageSize;
    IF m_categoryId = 0 THEN
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.price ASC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b;
    ELSE 
    CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.price ASC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b, book_category bc
    WHERE b.ID = bc.bookId AND bc.categoryId = m_categoryId;
    END IF;
	SELECT DISTINCT * FROM tb_book_category tb WHERE stt BETWEEN @recordStart AND @recordEnd;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_getBookByCategoryPagingSortByPriceDesc`(IN `m_categoryId` INT, IN `m_pageIndex` INT UNSIGNED, IN `m_pageSize` INT UNSIGNED)
    COMMENT 'Phân trang cho danh sách sách lọc theo danh mục'
BEGIN
	SET @recordStart = ((m_pageIndex - 1) * m_pageSize) + 1,@recordEnd = m_pageIndex * m_pageSize;
    IF m_categoryId = 0 THEN
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.price DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b;
    ELSE 
    CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.price DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b, book_category bc
    WHERE b.ID = bc.bookId AND bc.categoryId = m_categoryId;
    END IF;
	SELECT DISTINCT * FROM tb_book_category tb WHERE stt BETWEEN @recordStart AND @recordEnd;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;

CREATE TABLE `banner` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
    `image` varchar(1024) not null DEFAULT '0',
	`categoryId` int(11),
    PRIMARY KEY (`ID`),
	KEY `FK_banner_category` (`categoryId`),
	CONSTRAINT `FK_banner_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`ID`)
);

INSERT INTO `banner`(`ID`, `image`, `categoryId`) VALUES ('1','https://user-images.githubusercontent.com/60845268/179411148-01a32e1a-28c5-42cf-bf9d-ac2ac64099ab.png','12'), 
('2','https://user-images.githubusercontent.com/60845268/179411155-cb31b25a-89f3-4e90-8f7b-317dc476e4da.png','10'),
('3','https://user-images.githubusercontent.com/60845268/179411183-9cfb17c9-888a-49e7-a9e8-a16da75ab0ea.png','12'),
('4','https://user-images.githubusercontent.com/60845268/179411186-3a148d8f-a4a7-4bf4-8eb6-4964968a8fb5.png','9');

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_DeleteCartBooks`(IN `m_cartId` INT UNSIGNED, IN `m_bookId` INT UNSIGNED)
    COMMENT 'Xóa sản phẩm trong giỏ hàng'
DELETE FROM cart_book WHERE cart_book.cartId = m_cartId AND cart_book.bookId = m_bookId$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_getAllRecordByCategory`(IN `m_categoryId` INT)
    COMMENT 'Lấy tổng số bản ghi theo danh mục'
BEGIN
    IF m_categoryId = 0 THEN
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.price ASC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b;
    ELSE 
    CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.price ASC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b, book_category bc
    WHERE b.ID = bc.bookId AND bc.categoryId = m_categoryId;
    END IF;
	SELECT COUNT(ID) as totalRecord FROM tb_book_category tb ;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Search`(IN `m_pageIndex` INT, IN `m_pageSize` INT, IN `m_filter` VARCHAR(255) CHARSET utf8)
    COMMENT 'Tìm kiếm'
BEGIN
	SET @recordStart = ((m_pageIndex - 1) * m_pageSize) + 1,@recordEnd = m_pageIndex * m_pageSize;
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.createAt DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b
    WHERE (m_filter IS NULL ) OR ( b.title LIKE CONCAT("%", m_filter, "%"));
    
	SELECT DISTINCT * FROM tb_book_category tb WHERE stt BETWEEN @recordStart AND @recordEnd;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;

INSERT INTO `bill`(`ID`, `username`, `totalPrice`, `dateBill`, `status`) VALUES (1, 'user001', '0', '2022-02-02', 'PENDING'),
(2, 'user002', '0', '2022-05-02', 'PENDING'),(3, 'user001', '0', '2022-12-12', 'PAID'),(4, 'user001', '0', '2021-02-02', 'CANCELLED');

-- enum('PENDING','PAID','CANCELLED')

INSERT INTO `bill_book`(`billId`, `quantity`, `totalPrice`, `bookId`) VALUES (1,1,0,80), (1,2,0,81), (1,3,0,82),
(2,2,0,81), (2,2,0,82), (3,5,0,83), (4,2,0,81),(4,3,0,84),(4,1,0,85)

-- DELIMITER $$
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Search`(IN `m_pageIndex` INT, IN `m_pageSize` INT, IN `m_filter` VARCHAR(255) CHARSET utf8)
--     COMMENT 'Tìm kiếm'
-- BEGIN
-- 	SET @recordStart = ((m_pageIndex - 1) * m_pageSize) + 1,@recordEnd = m_pageIndex * m_pageSize;
-- 	CREATE TEMPORARY TABLE tb_book_category
--     SELECT ROW_NUMBER() OVER (ORDER BY b.createAt DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
--     FROM book b
--     WHERE (m_filter IS NULL ) OR ( b.title LIKE CONCAT("%", m_filter, "%"));
    
-- 	SELECT DISTINCT * FROM tb_book_category tb WHERE stt BETWEEN @recordStart AND @recordEnd;
--     DROP TABLE tb_book_category;
-- END$$
-- DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetBookWithCategory`(IN `m_bookId` INT)
BEGIN

CREATE TEMPORARY TABLE tb_book0
SELECT bc.categoryId as category FROM book b, book_category bc where b.ID = bc.bookId and b.ID = m_bookId;

CREATE TEMPORARY TABLE tb_book
SELECT ROW_NUMBER() OVER (ORDER BY b.createAt DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
FROM book b, book_category bc
WHERE (b.ID = bc.bookId) AND ( bc.categoryId IN (SELECT * FROM tb_book0));
SELECT DISTINCT * FROM tb_book tb WHERE stt BETWEEN 1 AND 5;
DROP TABLE tb_book;
DROP TABLE tb_book0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GetBookWithSameAuthor`(IN `m_author` VARCHAR(255) CHARSET utf8)
BEGIN
	CREATE TEMPORARY TABLE tb_book
    SELECT ROW_NUMBER() OVER (ORDER BY b.createAt DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b
    WHERE b.author LIKE CONCAT("", m_author, "");
    
	SELECT DISTINCT * FROM tb_book tb WHERE stt BETWEEN 1 AND 5;
    DROP TABLE tb_book;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_UpdateCartBook`(IN `cartId` INT UNSIGNED, IN `quantity` INT UNSIGNED, IN `bookId` INT)
    COMMENT 'Cập nhật sách trong giỏ'
update cart_book set cart_book.quantity = quantity where cart_book.cartId = cartId and cart_book.bookId = bookId$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_getAllRecordBySeach`(IN `m_filter` VARCHAR(255) CHARSET utf8)
BEGIN
	CREATE TEMPORARY TABLE tb_book_category
    SELECT ROW_NUMBER() OVER (ORDER BY b.createAt DESC) AS stt, b.ID,b.soldNumber,b.price,b.image,b.discount,b.title, b.available, b.createAt
    FROM book b
    WHERE (m_filter IS NULL ) OR ( b.title LIKE CONCAT("%", m_filter, "%"));
    
	SELECT COUNT(ID) as totalRecord FROM tb_book_category tb ;
    DROP TABLE tb_book_category;
END$$
DELIMITER ;
