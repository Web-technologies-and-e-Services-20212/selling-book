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

-- Dumping structure for table selling_book.book
CREATE TABLE IF NOT EXISTS `book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `publishYear` int(10) unsigned NOT NULL DEFAULT '2022',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `discount` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_book_guest` (`username`),
  CONSTRAINT `FK_book_guest` FOREIGN KEY (`username`) REFERENCES `admin` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table selling_book.book: ~0 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`ID`, `username`, `available`, `author`, `price`, `publishYear`, `image`, `publisher`, `size`, `content`, `discount`, `title`) VALUES
	(22, 'admin001', 1, 'Naoya Matsumoto', 49300, 2022, 'https://product.hstatic.net/200000287623/product/monster_8_2_ban_dac_biet_bright_ban_thuong_-_bia1_917a8f9fbff1400f9fb0d5c4b25ac044_master.jpg', 'Hồng Đức', '12 x 18 cm', 'Nội dung: \nPhần thi cuối cùng của kì thi tuyển Lực lượng Phòng vệ đã kết thúc. Song, quái chính (rõ ràng đã bị tiêu diệt) lại được một quái vật bí ẩn dạng người giúp hồi sinh, từ đó tấn công Shinomiya Kikoru và các thí sinh khác. Ngay lúc Kikoru rơi vào đường cùng, Hibino Kafka đột nhiên xuất hiện trong hình dạng quái vật…! Rốt cuộc con quái vật dạng người kia là ai? Mục đích của nó là gì?Mời các bạn thưởng thức tập 2 ngập tràn bí ẩn!', 15, 'Monster #8 - 2'),
	(23, 'admin001', 1, 'Sanbe Kei', 49300, 2022, 'https://product.hstatic.net/200000287623/product/thi-tran-1_de3f287001ac4795aa659a0f7b3f90ed_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nDẫu cuộc sống không như ý, Fujinuma Satoru vẫn phải vật lộn với nó mỗi ngày. Tuy sở hữu năng lực “tua lại” giúp anh quay ngược thời gian, nhưng những gì nó đem đến chỉ toàn tiêu cực…Nhưng rồi một ngày, mọi thứ thay đổi. Một vụ án lớn đã khiến cuộc sống của anh đảo lộn. Liệu năng lực “tua lại” có thể giúp Satoru thoát khỏi tình cảnh hiểm nghèo và sửa chữa sai lầm trong quá khứ không? Hãy đón đọc tập 1 của Thị trấn vắng mình tôi của tác giả Sanbe Kei.', 15, 'Thị Trấn Vắng Mình Tôi - 1'),
	(24, 'admin001', 1, 'Akiko Higashimura', 49300, 2022, 'https://product.hstatic.net/200000287623/product/ve-voi-van-vo-1_af90b88bcae84445b19ae7edad63cb27_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nVẽ vời vẩn vơ là những trang hồi ký về hành trình học tập và trở thành họa sĩ truyện tranh của chính tác giả Higashimura. Tập trung vào quãng thời gian cô ở bên vị ân sư tuy nghiêm khắc nhưng luôn hết lòng vì ước mơ hội họa của các học trò.Trải qua nhiều thăng trầm với con đường hội họa và nghề truyện tranh, Higashimura hiện tại là một trong số những tác giả truyện tranh thiếu nữ ăn khách nhất, với nhiều tác phẩm đoạt giải và được chuyển thể thành phim ảnh.', 15, 'Vẽ Vời Vẩn Vơ - 1'),
	(25, 'admin001', 1, 'Tsurutani Kaori', 49300, 2022, 'https://product.hstatic.net/200000287623/product/ba-gia-doc-boyslove-111_afc7bce47d204534a1d2fc3f5bf69d1a_master.jpg', 'Hà Nội', '14.5 x 20.5 cm', 'Nội dung: \nBà cụ 75 tuổi Ichinoi sống một mình đã lâu, chỉ vì một lần lỡ mua nhầm truyện mà chính thức bước vào “thế giới mới”. Chính bà Ichinoi cũng chẳng thể ngờ, cuốn truyện Boys Love vô tình mua phải hôm ấy lại khiến bà “lọt hố”, thành lính mới tò te trên con đường “fangirl”. Càng kì diệu hơn, sự cố ấy đã gắn kết cụ bà 75 tuổi với cô nữ sinh trung học Urara 17 tuổi theo cách không ai ngờ đến.Chuyến tàu hồi xuân và hành trình lan tỏa yêu thương của bà cụ đã đi gần hết đời người, xin được bắt đầu.', 15, 'Dưới Hiên Nhà Bà Già Đọc Boys Love - 1'),
	(26, 'admin001', 1, 'Chan Ho Kei', 77000, 2022, 'https://product.hstatic.net/200000287623/product/hinh_canh_mat_tri_-_bia1_2262bb99f94a471987133299366fe435_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nKhác với triển khai đồ sộ của 13.67 và Người trong lưới, Hình cảnh mất trí đi theo hướng nhẹ nhàng, nhanh nhẹn và đơn tuyến hơn. Tuy nhiên, cuốn sách cho thấy tác giả vẫn luôn nhất quán về phong cách đan xen trinh thám và thực tại Hồng Kông, cùng thái độ “bi quan nhưng không tuyệt vọng” về tiết tấu xã hội xung quanh.Hình cảnh mất trí là tác phẩm đoạt giải Nhất Trinh thám Soji Shimada năm 2011, và là cú hích để Chan Ho Kei toàn tâm toàn ý đi theo con đường sáng tác chuyên nghiệp, từ đó mới có 13.67 và Người trong lưới về sau.', 23, 'Hình Cảnh Mất Trí'),
	(27, 'admin001', 1, 'ymz', 144500, 2022, 'https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_db_thuong_595597133c774a18893ada9b58749a04_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nQue Sera, Sera - Biết ra sao ngày mai là boxset bao gồm hai tập truyện sau đây của tác giả ymz: Râu, chuông, bong bóng xà phòng và Gà con, màn đêm, công viên giải trí.Hai tập truyện tưởng chừng kể về hai cặp đôi riêng rẽ, nhưng giữa bốn người vẫn có những kết nối: ngoài việc thật sự quen biết nhau, ở họ còn cùng thấp thoáng tinh thần yêu đời, vui sống, nhìn thế giới xung quanh bằng đôi mắt trong veo mà cũng rất đỗi nồng cháy. Để rồi Que Sera, Sera - Biết ra sao ngày mai cũng tựa như hương trà, để lại dư âm phảng phất mà vấn vương lòng người.', 15, 'Que Sera, Sera - Biết Ra Sao Ngày Mai'),
	(28, 'admin001', 1, 'ymz', 280250, 2022, 'https://product.hstatic.net/200000287623/product/que_sera_sera_-_ban_gioi_han_d8cbfa90c8e9429a9ace2fab9d025974_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nQue Sera, Sera - Biết ra sao ngày mai là boxset bao gồm hai tập truyện sau đây của tác giả ymz: Râu, chuông, bong bóng xà phòng và Gà con, màn đêm, công viên giải trí.Hai tập truyện tưởng chừng kể về hai cặp đôi riêng rẽ, nhưng giữa bốn người vẫn có những kết nối: ngoài việc thật sự quen biết nhau, ở họ còn cùng thấp thoáng tinh thần yêu đời, vui sống, nhìn thế giới xung quanh bằng đôi mắt trong veo mà cũng rất đỗi nồng cháy. Để rồi Que Sera, Sera - Biết ra sao ngày mai cũng tựa như hương trà, để lại dư âm phảng phất mà vấn vương lòng người.', 5, 'Que Sera, Sera - Biết Ra Sao Ngày Mai (Bản Giới Hạn)'),
	(29, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_15_-_bia_1_a61b83f49cba4777b6af90f0e16d3665_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Thầy Nakamine bí ẩn dạy Vật lý và Yuki bỗng dưng lại thân nhau!? Có người hết sức bồn chồn dõi theo hai người họ, ấy là Toru và… Yasuda…? (Ha ha)Mời các bạn thưởng thức tập 15 của bộ truyện học đường ngọt sâu răng với hai phần truyện về ngày Valentine do tác giả HERO mới sáng tác!', 15, 'Horimiya - 15'),
	(30, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_12__manga__-_bia_1_8a333ef9313c4302ae4cd8495b1fd5c7_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nCùng lúc cuộc chiến giữa cánh quân của Climb với Sáu Tay đang diễn ra, một trận đối đầu nảy lửa khác cũng bùng nổ giữa nhóm Blue Rose và Entoma tại một cơ sở của Tám Ngón.Những tưởng cuộc chiến sẽ sớm ngã ngũ, nhưng sự đảo chiều liên tục đã dẫn đến một kết quả không thể lường trước, với đỉnh điểm là sự xuất hiện của tên ác quỷ hùng mạnh Jaldabaoth và ngọn lửa luyện ngục bao trùm một phần vương đô.', 15, 'Overlord - 12 (Manga)'),
	(31, 'admin001', 1, 'Yokomizo Seishi', 108000, 2022, 'https://product.hstatic.net/200000287623/product/thon_tam_mo_-_bia_1_2e377c88c426414fa1abc4e29a91df0a_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nKết thúc Thế chiến 2, Tatsuya xuất ngũ về lại thành phố quê hương, không còn người thân, không xu dính túi, công việc bấp bênh. Bất thần anh nghe trên đài phát tin gia đình giàu có thất lạc từ lâu đang tìm mình.Tatsuya bèn đến nơi gửi tin, gặp được người thân đầu tiên chừng vài phút thì người này mất mạng trước mắt anh.Tatsuya về thôn làng mình chào đời, sang hôm sau thì người thân thứ hai mất mạng trước mắt anh.Sau đó, cứ một vài hôm lại thêm một người mất mạng trước mắt Tatsuya. Anh nghiễm nhiên biến thành kẻ tình nghi lớn nhất, thành kẻ gieo rắc tai ương trong thôn. Tatsuya đi từ ngạc nhiên đến kinh hoàng, khi phát hiện ra đây là nhân quả của tội nghiệt do tổ tiên mình để lại.', 20, 'Thôn Tám Mộ'),
	(32, 'admin001', 1, 'Asato Asato', 116000, 2022, 'https://product.hstatic.net/200000287623/product/86_ep.5_-_bia1_b7fe25c78619431c8c2f8b5efef5de2a_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Tới tìm ta đi.”Sau khi Shin “nhìn” thấy lời nhắn được cho là của Zelena - người phát minh ra Legion, Lena cùng Lữ đoàn Biệt kích Cơ động 86 bước sang chiến trường Vương quốc Liên hiệp Roa Gracia - nơi phát hiện con Ameise màu trắng nghi là Zelena. Tuy nhiên…Chẳng rõ là nhạo báng sự sống hay khinh nhờn cái chết, Vương quốc Liên hiệp đang áp dụng một chiến lược đi chệch luân thường để chống Legion, khiến ngay cả các Tám Sáu còn phải rùng mình. Tại đây, kẻ thù lẩn khuất trong rừng sâu lạnh giá và “cái chết” sát sườn không ngừng trêu đùa nhóm thiếu niên.“Lũ quái vật ẩn mình trong núi tuyết mỉm cười hỏi họ…”', 20, '86 - Eightysix - 5'),
	(33, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_1_-_bia1_c949531f15a248508bf8de4efa93f36a_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCoco cùng các bạn bắt đầu chuẩn bị cho lễ hội đêm bạc diễn ra tại đảo Ezrest. Dòng người tấp nập đổ về đây, bao gồm phù thủy, người thường, và cả những vị khách không mời. Cùng lúc đó, cuộc gặp mặt giữa tam hiền giả và các vị vua của bán đảo Zozah cũng chuẩn bị diễn ra. Mời các bạn đón đọc tập 9 của Xưởng phép thuật, phần mở màn của lễ hội đêm bạc đầy bất ngờ và biến động.', 15, 'Xưởng Phép Thuật - 9'),
	(34, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_14_-_bia1_81992d247db14cf996682ef82bdf71f3_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị!Hội Học sinh luôn tình thương mến thương, song ai chẳng có lúc giận dỗi, cáu bẳn…! Có tranh cãi mới là tuổi trẻ!Mời các bạn thưởng thức tập 14 của bộ truyện học đường ngọt sâu răng với một câu chuyện do tác giả HERO mới sáng tác!', 15, 'Horimiya - 14'),
	(35, 'admin001', 1, 'Sugaru Miaki', 96000, 2022, 'https://product.hstatic.net/200000287623/product/dau_oi_bay_di_bia_1_020fa4d8277b4323a277b6e3699f4f45_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \n“Tôi chết rồi. Anh tính sao đây?”Mùa thu năm 22 tuổi, tôi, một thanh niên đơn độc bị tất cả ruồng bỏ, đáng lẽ đã thành kẻ sát nhân…Nhưng cô gái thiệt mạng dưới tay tôi lại có thể “trì hoãn” cái chết trong mười ngày. Cô quyết định dành mười ngày quý giá đó để trả thù những kẻ đã hủy hoại đời cô.“Tất nhiên, anh cũng phải giúp tôi một tay đấy, Sát Nhân ạ.”Quá trình trả thù đã vô tình dẫn chúng tôi đến với sự thật ẩn giấu đằng sau cuộc gặp gỡ giữa tôi và cô gái.Đó là kỉ niệm về những ngày đau thương mà ấm áp, cùng lời tạm biệt ngày ấy.', 20, 'Đau Ơi Bay Đi!'),
	(36, 'admin001', 1, 'Tappei Nagatsuki', 96000, 2022, 'https://product.hstatic.net/200000287623/product/re_zero_12_-_bia_1_9a49f946f4e24eafa0616179c8f52617_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCứ mỗi lần lặp lại, Thánh vực lại phát triển theo một diễn biến khác với kí ức của Subaru. Ở lượt lặp thứ tư, cậu đã giáp mặt một kẻ đáng ra không nên tồn tại: Phù thủy Đố kị.Khi Thánh vực bị bóng ảnh nuốt chửng, Garfiel dù đối địch với Subaru vẫn ra sức tương trợ. Nhờ đó Subaru tìm ra sự thật về nơi chốn vốn là tràng thí nghiệm thất bại này… Nhưng cuối cùng tất cả vẫn cười nhạo vào nỗ lực của cậu, và thế giới bị vùi lấp trong kết cục trắng toát.Hi vọng rồi tuyệt vọng, khám phá sự thật để rồi suy sụp, Subaru vẫn không từ bỏ tương lai, cậu đi tới phần mộ với mong muốn hỏi ý kiến phù thủy. Ở đây, cậu phải đối mặt với “hiện tại không nên tồn tại”…', 20, 'Re: Zero - Bắt Đầu Lại Ở Thế Giới Khác - 12'),
	(37, 'admin001', 1, 'Akihito Tsukushi', 51000, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_10_-_bia1_9921360783a24a3d86c4a6151af00a88_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nReg không thể ngăn được cơn thịnh nộ của Faputa và bị đánh cho bất tỉnh. Tuy nhiên, sau khi tỉnh khỏi giấc mộng dài, Nanachi cùng một nhân vật không ai ngờ tới đã xuất hiện để ngăn cản cuộc chiến. Mỗi người giờ sẽ phải đưa ra lựa chọn của riêng mình. Mời các bạn đón đọc tập 10 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa cơn giận và nỗi buồn!', 15, 'Made In Abyss - 10'),
	(38, 'admin001', 1, 'Maruyama Kugane', 40800, 2022, 'https://product.hstatic.net/200000287623/product/overlord_11__manga__-_bia_1_dd77bf7176ed4216bfc58321f7131188_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTrở về sau cuộc triệt phá bộ phận mua bán nô lệ của Tám Ngón, Sebas phải ra tay với Tuare để chứng minh lòng trung thành của mình dành cho đấng tối cao. May thay, Ainz đã cho ông và cô gái loài người một cơ hội để họ có thể ở bên nhau tại đại lăng mộ Nazarick. Thế nhưng, bè lũ Sáu Tay vẫn chưa buông tha cho Tuare…Mặt khác, công chúa Renner cùng Blue Rose đang tập hợp đồng minh để loại bỏ tận gốc Tám Ngón khỏi Re-Estize. Các anh hùng Vương quốc một lần nữa tụ hội, đập tan âm mưu của Sáu Tay, những kẻ mạnh nhất Tám Ngón, diệt trừ hoàn toàn thế lực đen tối đang gặm nhấm cả Vương quốc.Thế nhưng, đằng sau tất cả, một kế hoạch to lớn của đại lăng mộ Nazarick mang tên Gehenna dần lộ diện.', 15, 'Overlord - 11 (Manga)'),
	(39, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_13_-_bia_1_d261c67a8db54a939bde8bdfc8311011_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nỞ trường, Iura là cậu chàng nhặng xị nhưng vẫn được mọi người yêu mến. Về nhà, Iura lại thành người anh nghiêm khắc mà tốt bụng. Cũng như Hori và Miyamura ngày trước, những gì mọi người thấy bên ngoài không phải là tất cả.', 15, 'Horimiya - 13'),
	(40, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_8_-_bia1_f2f2d6d4477a4064a44284e3db9ecac9_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTrở về xưởng sau bài kiểm tra tại Đại giảng đường, các phù thủy tập sự bất ngờ được cậu bé Tartah mời tham gia mở cửa hàng tại lễ hội đêm bạc. Trong lúc tất bật chuẩn bị, Coco bất ngờ gặp lại một cậu bé mà cô từng cứu ở sông bậc thang…', 15, 'Xưởng Phép Thuật - 8'),
	(41, 'admin001', 1, 'Thời Thần', 69300, 2022, 'https://product.hstatic.net/200000287623/product/guong_soi_toi_loi_-_bia1_00dc3b44b26144209ebe4ea5e28710b0_master.jpg', 'Hồng Đức', '13.5 x 20.5 cm', 'Nội dung: \nTrên đảo nhỏ ngoài khơi, có một bệnh viện đặc biệt chuyên thu nhận tội phạm tâm thần. Những kẻ phạm tội hình sự nhưng không thể thụ án vì trở ngại đầu óc sẽ được đưa ra đây để khỏi tiếp tục gây hại cho xã hội.Bầu không khí hung bạo và loạn óc ở đảo có lẽ gây ảnh hưởng đến cả những người tỉnh táo nhất. Chính giám đốc bệnh viện một ngày nọ cũng cầm dao đâm lung tung, mau chóng được giám định tâm thần và đưa vào diện điều trị.', 23, 'Gương Soi Tội Lỗi'),
	(42, 'admin001', 1, 'Akihito Tsukushi', 42500, 2022, 'https://product.hstatic.net/200000287623/product/made_in_abyss_9_-_bia1_77fe36ef03df4284ae0ebec5e581432d_master.jpg', 'Hồng Đức', '14.5 x 20.5 cm', 'Nội dung: \nSau khi nghe kể về đội cảm tử Ganja, Riko đã biết được sự thật khủng khiếp về Iruburu. Cùng lúc ấy, Reg đang đi với Faputa tới làng để cứu Nanachi. Cậu bé người máy không hề biết rằng hành động của mình sẽ là khởi nguồn cho một cuộc chiến đẫm máu…Mời các bạn đón đọc tập 9 của bộ truyện phiêu lưu đầy kịch tính đan xen giữa lòng nhân từ và sự tôn kính!', 15, 'Made In Abyss - 9'),
	(43, 'admin001', 1, 'Kareno Akira', 72000, 2022, 'https://product.hstatic.net/200000287623/product/tan_the_neu_khong_ban_ex_-_bia_1_541e642388c846b3ab10f264fdc40ffc_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nTrong nắng xuân ấm áp, chiến binh yêu tinh nhí Lakhesh ôm thanh Seniorious và chìm vào ảo mộng…Cô bé mơ về chuyện của 500 năm trước, xoay quanh Legal Brave Lillia 14 tuổi cùng Quasi Brave Willem 15 tuổi và cuộc sống thường ngày của hai sư huynh muội - những người bảo vệ nhân loại khỏi sự đe dọa của Visitor. Toàn chuyện vặt vãnh không đâu, nhưng cũng thật rực rỡ. Và những chuyện cách đây không lâu. Về Chtholly - chiến binh yêu tinh tồn tại với vận mệnh hi sinh, cùng Kĩ sư Vũ khí ếm Hạng nhì Willem Kmetsch. Từng phút, từng giây thương nhớ hóa thành giấc mộng chẳng thể nào quên của hai người.', 20, 'Tận Thế Nếu Không Bận, Anh Cứu Chúng Em Nhé? #EX'),
	(44, 'admin001', 1, 'Kenji Inoue', 68000, 2022, 'https://product.hstatic.net/200000287623/product/lu_ngoc_12.5_bia_1_96dfca9cc70046b3bec54a2d73d21710_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nNhóm Akihisa cùng khối Mười một giành chiến thắng kịch tính trong trận đấu linh thú với khối Mười hai. Nhờ thế, lớp F giành được phòng học xịn với trang thiết bị tử tế, tha hồ tận hưởng cuộc sống học đường thoải mái.Hiện giờ điều đang chiếm trọn sự quan tâm của cả lớp chính là Giáng Sinh! Nhưng cả đám không hề biết rằng hiệu trưởng lại bắt đầu để mắt đến chúng, dẫn đến chuỗi sự kiện “Tôi, đêm Giáng sinh và vòng xoáy âm mưu” gồm hai phần. Tiếp đó, vì không cam lòng chịu đựng cách đối xử của hội con gái, lũ ngốc đã quyết tâm báo thù trong “Tôi, đồng bọn và phi vụ tốc váy”.Tất cả có trong tuyển tập truyện ngắn thứ sáu về thời thanh xuân đầy bùng nổ!', 20, 'Lũ Ngốc, Bài Thi Và Linh Thú Triệu Hồi - 12.5'),
	(45, 'admin001', 1, 'Kamome Shirahama', 42500, 2022, 'https://product.hstatic.net/200000287623/product/xuong_phep_thuat_7_ban_thuong_-_bia1_012e444f87c340709fffbbe599f83781_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau khi hoàn thành xuất sắc bài kiểm tra, Coco được hiền giả Beldaruit triệu tập lúc đêm khuya. Ông ngỏ ý mời cô bé làm đệ tử của mình, đồng thời tiết lộ mối duyên nợ giữa Qifrey và phe phù thủy “mũ vành”. Trong lúc bối rối vì không biết nên tiếp tục làm đệ tử của Qifrey hay không, Coco quyết định tới tháp sách để tìm kiếm câu trả lời!', 15, 'Xưởng Phép Thuật - 7'),
	(46, 'admin001', 1, 'HERO X Hagiwara Daisuke', 42500, 2022, 'https://product.hstatic.net/200000287623/product/horimiya_12_-_bia1_b5214d5f4c644781a1d429b8ce16f8e0_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nCâu chuyện thanh xuân nhẹ nhàng, giản đơn mà thú vị! Sakura luôn điềm đạm cũng có lúc bồn chồn không yên… vì một bộ truyện tranh thiếu niên! Trùng hợp thay, Yanagi cũng thích đọc truyện tranh thiếu niên…? Mời các bạn thưởng thức tập 12 của bộ truyện học đường ngọt sâu răng với nhiều điều bí mật chưa được bật mí!', 15, 'Horimiya - 12'),
	(47, 'admin001', 1, 'Mori Kaoru', 46750, 2022, 'https://product.hstatic.net/200000287623/product/emma-10_82ec462bdc424a80aa2b63cbfa421ca8_master.jpg', 'Hà Nội', '13 x 18 cm', 'Nội dung: \nTại sao Adele luôn nghiêm túc trong công việc và không quan tâm tới chuyện kết hôn?Maria và Alma thời mới tới dinh thự ra sao?Arthur có thời học sinh thế nào ở trường nội trú?Eleanor liệu đã tìm được hạnh phúc của riêng cô chưa?Ngoài ra, Emma và William thì sao? Cuối cùng họ có được bên nhau lâu dài?Tập 10 này là tập ngoại truyện thứ ba, cũng là tập cuối của Emma. Bộ truyện kết thúc nhưng sẽ đem tớihình ảnh một nước Anh đã bước sang thời kì mới, thế kỉ mới, cùng những con người đáng yêu, luôn tràntrề hi vọng vào tương lai phía trước.', 15, 'Emma - 10'),
	(48, 'admin001', 1, 'Asato Asato', 96000, 2022, 'https://product.hstatic.net/200000287623/product/86_ep.4_bia_1_66f1c9ee51614364bb95b654cab2e619_master.jpg', 'Hồng Đức', '13 x 18 cm', 'Nội dung: \nSau cuộc hội ngộ định mệnh, Shin và Lena nhanh chóng xích lại gần nhau, làm Frederica và Crena ngay ngáy lo sợ, còn Raiden và những người khác phải giữ ý đến phát mệt. Tuy nhiên, quãng thời gian nghỉ ngơi ngắn ngủi nhanh chóng kết thúc. Đơn vị mới do Lena chỉ huy tác chiến nhận được nhiệm vụ đầu tiên. Dưới ga tàu điện ngầm tại thành phố phía Bắc Cộng hòa, căn cứ khổng lồ của Legion đang đón đợi họ. Thứ ẩn sâu dưới đó là “mặt tối”. Của Legion. Của Cộng hòa. Và của cả những con người từng bị tổ quốc bức hại. “Tiếng gọi vọng lên từ lòng đất, báo hiệu thử thách mới cho nhóm thiếu niên.”', 20, '86 - Eightysix - 4');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- Dumping structure for table selling_book.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalPrice` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `FK_cart_admin` FOREIGN KEY (`username`) REFERENCES `admin` (`username`)
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
