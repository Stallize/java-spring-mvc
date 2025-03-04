-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: stationeryshop
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbql1m2v2po7hcawonqsgqex88` (`cart_id`),
  KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`),
  CONSTRAINT `FKbql1m2v2po7hcawonqsgqex88` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `FKclb1c0wg3mofxnpgidib1t987` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
INSERT INTO `cart_detail` VALUES (8,236234,1,6,28),(11,251231,2,6,27);
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_64t7ox312pqal3p7fg9o503c2` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_chk_1` CHECK ((`sum` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (6,2,9);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`),
  CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (11,251231,2,2,27),(12,236234,1,2,28),(13,236234,1,3,28),(14,236234,1,4,28),(15,125000,1,4,30);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'K21CNT - 2110900071 - Đỗ Ngọc Quý Dương','K21CNT - 2110900071 - Đỗ Ngọc Quý Dương','0972448096','PENDING',738696,9),(3,'K21CNT - 2110900071 - Đỗ Ngọc Quý Dương','K21CNT - 2110900071 - Đỗ Ngọc Quý Dương','0972448096','PENDING',236234,9),(4,'Hà Nội','Duy Bùi','097312312','PENDING',361234,11);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (27,'- Chất liệu 95% vải cotton và 5% spandex thoáng mát và an toàn cho làn da của bé. Sản phẩm đạt chứng nhận Oeko-Tex 100 an toàn cho da trẻ em.\r\n\r\n- Loại sản phẩm: Đồ bộ bé gái, Đồ bộ ngắn tay bé gái\r\n\r\n- Phù hợp với bé gái cân nặng từ 11 - 35kg\r\n- Đồ bộ mặc nhà pijama ngắn tay có cổ và nút tiện lợi, in hình các hoạt tiết gấu, thỏ sắc nét, đáng yêu và màu sắc hài hòa, phù hợp cho bé diện nhà hay đi ngủ. Sản phẩm đạt chứng nhận Oeko-Tex 100 an toàn cho da trẻ em.','RABITY','1740642151034-pyjamasngantay.jpg','Đồ bộ pijama ngắn tay bé gái Rabity',251231,999,'- Chất liệu 95% vải cotton và 5% spandex thoáng mát và an toàn cho làn da của bé. Sản phẩm đạt chứng nhận Oeko-Tex 100 an toàn cho da trẻ em.',0,'DO-NGU'),(28,'- Chất liệu 95% vải cotton và 5% spandex thoáng mát, co giãn và an toàn cho làn da của bé\r\n\r\n- Loại sản phẩm: Đồ bộ bé trai; Đồ bộ ngắn tay bé trai\r\n\r\n- Phù hợp với bé trai cân nặng từ 19 - 25kg, từ 6- 8 tuổi\r\n- Đồ bộ pijama ngắn tay in hình sắc nét, đáng yêu và màu sắc hài hòa, bao gồm áo sơ mi và quần short mềm mại phù hợp cho bé diện nhà hay đi ngủ. Sản phẩm đạt chứng nhận Oeko-Tex 100 an toàn cho da trẻ em','RABITY','1740642288990-pyjamasnam.png','Đồ bộ Pijama mặc nhà ngắn tay bé trai Rabity',236234,999,'- Chất liệu 95% vải cotton và 5% spandex thoáng mát, co giãn và an toàn cho làn da của bé',0,'DO-NGU'),(30,'Chất liệu 95% vải cotton và 5% spandex thoáng mát, co giãn và an toàn cho làn da của bé\r\nLoại sản phẩm: Thời trang bé gái và  Thời trang bé trai\r\nPhù hợp với bé trai/ bé gái cân nặng từ 14 - 35kg, từ 4 - 12 tuổi \r\nÁo thun ngắn tay in hình Capybara dễ thương, năng động và sắc nét.','RABITY','1740642418688-aothun.jpg','Áo thun ngắn tay bé trai/bé gái Capybara Rabity',125000,999,'Áo thun ngắn tay in hình Capybara dễ thương, năng động và sắc nét.',0,'AO-THUN'),(31,'- Lớp đệm hình cầu, thoáng khí giảm trọng lượng và đảm bảo cơ thể luôn ấm áp.\r\n- Dễ dàng giặt máy tại nhà.\r\n- Thiết kế hai chiều cho phép bạn tháo mũ trùm đầu.\r\n- Nhãn tên được gắn ở mặt trong.\r\n- Bảo vệ cằm tránh khóa kéo cọ xát vào mặt trẻ.','PUFFTECH','1740642529424-aokhoac.jpg','PUFFTECH Áo Khoác Chần Bông',784000,999,'Áo Khoác Chần Bông Có Thể Giặt Máy ',0,'AO-KHOAC'),(32,'Lớp lót mềm mại và ấm áp.\r\nLớp phủ chống thấm nước. Vải được phủ một lớp chống thấm nước để duy trì hiệu quả, nhưng lớp phủ này không phải là vĩnh viễn.\r\nCổ áo và viền bằng vải nhung tạo điểm nhấn phong cách. Thiết kế chần bông hình kim cương tinh tế.\r\nDễ dàng kết hợp với bất kỳ loại quần nào để tạo phong cách đa dạng và thoải mái.\r\nThiết kế unisex phù hợp cho cả nam và nữ.\r\nHoàn hảo để mặc theo lớp. Số lượng cúc áo có thể khác nhau tùy theo kích cỡ.','PUFFTECH','1740642707157-aokhoacnu.jpg','PUFFTECH Áo Khoác Kiểu Sơ M',742434,876,'PUFFTECH Áo Khoác Kiểu Sơ Mi Chần Bông',0,'AO-KHOAC'),(33,'Họa tiết gấu trúc ngộ nghĩnh: Chiếc áo phông được thiết kế với hình ảnh chú gấu trúc siêu đáng yêu đang trượt ván, chắc chắn sẽ làm bé thích mê.\r\nMàu sắc tươi sáng: Sự kết hợp hài hòa giữa màu xanh mint mát mẻ và trắng tinh khôi tạo nên một tổng thể trẻ trung và năng động.\r\nChất liệu cotton cao cấp: Áo được làm từ chất liệu cotton 100%, mềm mại, thoáng mát, thấm hút mồ hôi tốt, đảm bảo sự thoải mái cho bé khi vận động.\r\nCo giãn 4 chiều: Áo có khả năng co giãn 4 chiều, giúp bé thoải mái vận động mà không bị gò bó.','DRY-EX','1740643007266-aothundryex.jpg','DRY-EX Áo Thun',99000,996,'Thiết kế đáng yêu, chất liệu cao cấp:',0,'AO-THUN'),(34,'Họa tiết gấu trúc ngộ nghĩnh: Chiếc áo phông được thiết kế với hình ảnh chú gấu trúc siêu đáng yêu đang trượt ván, chắc chắn sẽ làm bé thích mê.\r\nMàu sắc tươi sáng: Sự kết hợp hài hòa giữa màu xanh mint mát mẻ và trắng tinh khôi tạo nên một tổng thể trẻ trung và năng động.\r\nChất liệu cotton cao cấp: Áo được làm từ chất liệu cotton 100%, mềm mại, thoáng mát, thấm hút mồ hôi tốt, đảm bảo sự thoải mái cho bé khi vận động.\r\nCo giãn 4 chiều: Áo có khả năng co giãn 4 chiều, giúp bé thoải mái vận động mà không bị gò bó.','RABITY','1740643105766-aothundryex-2.jpg','Áo Thun Bông Tuyết Sợi USA',99098,964,'Thiết kế đáng yêu, chất liệu cao cấp:',0,'AO-KHOAC'),(35,'Mũ bucket dệt chéo có vành dốc và dây rút có thể điều chỉnh và tháo rời với nút chặn bên dưới cằm. Khuy bấm ở mỗi bên chóp mũ để cài cố định vành mũ.','HM','1740643411239-mutreemhm.jpg','Mũ bucket vành cài khuy bấm',57000,98,'Mũ bucket vành cài khuy bấm',0,'AO-KHOAC'),(36,'- Chất vải “AIRism” thoáng mát với vẻ ngoài bóng mượt như cotton.\r\n- Màu sắc ấn tượng ở cổ áo và ống tay áo.\r\n- Kiểu dáng thụng, hoàn hảo cho cả nam và nữ.\r\n- Một sản phẩm đa năng trong mọi tủ đồ.','AIRISM','1740643843261-aothunairsm.jpg','AIRism Cotton Áo Thun',138000,99,'AIRism Cotton Áo Thun In Họa Tiết',0,'AO-THUN'),(37,'- Vải “AIRism” mềm mại, trơn mịn.\r\n- Được làm từ vải Siêu co giãn.\r\n- Tích hợp công nghệ chống tia UV.\r\n- Thiết kế có thể bỏ túi tiện lợi.\r\n- Đường may cổ sau được bao viền bằng băng keo tăng độ mềm mạ','AIRISM','1740644031169-hoddleairsm.jpg','AIRism Áo Hoodie',299000,999,'AIRism Áo Hoodie Chống Tia UV Vải Mắt Lưới Kéo Khóa',0,'AO-KHOAC'),(38,'Thiết kế dáng quần rộng rãi, thoải mái giúp bạn có không gian để chân rộng và di chuyển dễ dàng.','UNIQLO','1740644219077-quandaitreem.jpg','Quần Jogger Thể Thao',165343,999,'Thiết kế dáng quần rộng rãi, thoải mái giúp bạn có không gian để chân rộng và di chuyển dễ dàng.',0,'QUAN'),(39,'Kiểu dáng chân thực có thể phối hợp với nhiều loại áo.\r\nVải\r\nThân: 100% Bông/ Vải Túi: 65% Polyeste, 35% Bông\r\nChi tiết về chức năng\r\n- Điều chỉnh thắt lưng bằng nút cài: Có\r\nHướng dẫn giặt\r\nGiặt máy nước lạnh, Không giặt khô, Không sấy khô','UNIQLO','1740644444385-quanshorttreem.jpg','Quần Easy Shorts',78999,99,'Kiểu dáng chân thực có thể phối hợp với nhiều loại áo.',0,'QUAN'),(40,'Mũ lưỡi trai bằng cotton dệt chéo có hoạ tiết phía trước, khoen thêu và đai điều chỉnh có khoá kim loại phía sau. Đai thấm mồ hôi cotton.','HM','1740644649568-muhm.jpg','Mũ lưỡi trai dệt chéo có hoạ tiết',99999,99,'Mũ lưỡi trai bằng cotton dệt chéo có hoạ tiết phía trước, khoen thêu và đai điều chỉnh có khoá kim loại phía sau.',0,'PHU-KIEN'),(41,'Áo thun bằng cotton jersey in hình với cổ tròn, viền gân nổi và vạt ngang.','HM','1740644723664-muhm.jpg','Áo Thun H&M',249000,99,'Áo thun bằng cotton jersey in hình với cổ tròn, viền gân nổi và vạt ngang.',0,'AO-THUN'),(42,'Ba lô nhỏ bằng cotton denim có nơ trang trí cỡ lớn ở phía trước. Quai xách vải dù, khoá kéo bên trên, dây vai có thể điều chỉnh và tấm ốp lưng bằng canvas. Có lớp lót. Cao 22 cm. Rộng 18 cm.','HM','1740644803867-balohm.jpg','Ba lô H&M',99000,99,'Ba lô nhỏ bằng cotton denim có nơ trang trí cỡ lớn ở phía trước',0,'BA-LO');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin thì full quyền','ADMIN'),(2,'User thông thường','USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','0bc6714a-9677-4e5e-a13d-1f437da281e4',1740120895468,1740631920778,2592000,1743223920778,'admin@gmail.com'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','8c6639ad-6ca3-4631-89be-8e3850d8269b',1741098737290,1741099997667,2592000,1743691997667,'admin@gmail.com'),('944f76fb-0ac4-4c54-abe5-eda47f150e0f','e6c9ba3e-357c-4866-85f7-9951bef7a2c2',1741101075390,1741101076920,1800,1741102876920,NULL);
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','avatar',_binary '�\�\0t\0\Z1733726212174-Legion_5.jpg'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','email',_binary '�\�\0t\0admin@gmail.com'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','fullName',_binary '�\�\0t\0\nAdmin Full'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0	'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$b2e43383-bde8-416b-b9ac-22e77b0ee741'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$932d02e9-a5e4-4006-bea0-3333f3f15877psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0SESSIONpt\00OTMyZDAyZTktYTVlNC00MDA2LWJlYTAtMzMzM2YzZjE1ODc3xsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0@image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=OTMyZDAyZTktYTVlNC00MDA2LWJlYTAtMzMzM2YzZjE1ODc3xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0referersq\0~\0\0\0\0w\0\0\0t\05http://localhost:8080/client/css/style.css?version=51xt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0B\"Not(A:Brand\";v=\"99\", \"Microsoft Edge\";v=\"133\", \"Chromium\";v=\"133\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0imagext\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0no-corsxt\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0}Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0<����q\0~\0q\0~\0q\0~\0?q\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0/errort\0http://localhost:8080/errort\0httpt\0	localhostt\0/error'),('1ab8f5d9-c904-4da8-9a4d-b8bb95d44cb7','sum',_binary '�\�\0sr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','avatar',_binary '�\�\0t\01741096897973-avatar.jpg'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','email',_binary '�\�\0t\0admin@gmail.com'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','fullName',_binary '�\�\0t\0\nAdmin Full'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0	'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$e189c18e-09a3-4304-a2ab-a46e545ea16c'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$b3bc283f-2cf1-41f8-baf6-0cccd04dafb2psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('7916bb8f-3aed-44a6-aa90-7eb58c7f099f','sum',_binary '�\�\0sr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0'),('944f76fb-0ac4-4c54-abe5-eda47f150e0f','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$7c209903-c486-4869-8d96-bcd71c54acaf'),('944f76fb-0ac4-4c54-abe5-eda47f150e0f','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0SESSIONpt\00ZTZjOWJhM2UtMzU3Yy00ODY2LTg1ZjctOTk1MWJlZjdhMmMyxsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0�text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=ZTZjOWJhM2UtMzU3Yy00ODY2LTg1ZjctOTk1MWJlZjdhMmMyxt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0B\"Not(A:Brand\";v=\"99\", \"Microsoft Edge\";v=\"133\", \"Chromium\";v=\"133\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0}Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0?����q\0~\0q\0~\0q\0~\0Bq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0t\0expiredur\0[Ljava.lang.String;�\�V\�\�{G\0\0xp\0\0\0q\0~\0xpt\0expiredt\0/logoutt\0http://localhost:8080/logoutt\0httpt\0	localhostt\0/logout');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'','1741096832479-avatar.jpg','stallize@gmail.com','Quy Duong','$2a$10$ruP5dj0rpfMdgggW.pScqOmt190nIW5yGMSED7AsDdvNnOlCsPpxC','',2),(8,'Ha Noi','1733822674013-0acb65017c642bb77e52bb9e771a680b1bb71c63_full.jpg','user@gmail.com','Quy Duong','$2a$10$fyKUnl3XtEbMZJsGPrMnIOogNbkUriZZAKRqBaX77TxbhuPNjC3eK','',2),(9,'Ha Noi','1741096897973-avatar.jpg','admin@gmail.com','Admin Full','$2a$10$GcXk8AwBRFM..wjb.hqSveLneoBJmmTZU6vjzT2fcO6YSVbnJvEkW','0972448096',1),(10,NULL,NULL,'stallize111@gmail.com','Dương Đỗ','$2a$10$spnlXRCGGlwXfZENLWpOdOSvQlbANP7BkAdSjowvrUoDlVlvYq5he',NULL,2),(11,NULL,NULL,'duybui@gmail.com','Duy Bùi','$2a$10$1uW2S0xwkMOhhI3Ib/FYyOBNytSqgoxykR6e06ILYaDtuc2KKdw0C',NULL,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-04 22:17:34
