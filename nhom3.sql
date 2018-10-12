-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 09, 2018 lúc 04:07 AM
-- Phiên bản máy phục vụ: 5.7.21
-- Phiên bản PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhom3`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
CREATE TABLE IF NOT EXISTS `manufactures` (
  `manu_ID` int(11) NOT NULL,
  `manu_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `manu_img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`manu_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufactures`
--

INSERT INTO `manufactures` (`manu_ID`, `manu_name`, `manu_img`) VALUES
(1, 'Alple', 'táo-11_30_21_167.jpg'),
(2, 'SamSung', 'logo-square-letter.png'),
(3, 'Oppo', 'oppo-logo-BECA4F3EAB-seeklogo.com.png'),
(4, 'Huawei', 'tải xuống (1).png'),
(5, 'Xiaomi', '1024px-Xiaomi_logo.svg.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `manu_ID` int(11) NOT NULL,
  `type_ID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ID`, `name`, `image`, `description`, `manu_ID`, `type_ID`, `price`) VALUES
(1, 'samsung-galaxy-s9', '1.jpg', ' siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn.', 2, 2, 1500000),
(3, 'Samsung Galaxy Note 8', '2.jpg', 'Galaxy Note 8 là niềm hy vọng vực lại dòng Note danh tiếng của điện thoại Samsung với diện mạo nam tính, sang trọng. Máy trang bị camera kép xóa phông thời thượng, màn hình vô cực như trên S8 Plus, bút S Pen cùng nhiều tính năng mới và nhiều công nghệ được ưu ái.', 2, 2, 10000000),
(4, ' Samsung Galaxy S8 Plus', '3.jpg', 'Galaxy S8 và Galaxy S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai. Sau nhiều ngày được sử dụng, mình xin chia sẻ những cảm nhận chi tiết nhất về chiếc Galaxy S8 Plus - chiếc điện thoại Samsung đang có doanh số đặt hàng khủng nhất hiện tại.', 2, 2, 8000000),
(5, 'Samsung Galaxy A8 (2018)', '4.jpg', 'Galaxy A8 (2018) là tên gọi mới của chiếc điện thoại Samsung Galaxy A5 mà người dùng vẫn quen thuộc từ trước đến nay, sở dĩ có cái tên gọi mới là vì Samsung muốn đồng nhất giữa dòng Galaxy A và Galaxy S.', 2, 2, 7000000),
(6, ' iPhone X 256GB Gray', '5.jpg', 'iPhone X được đã được Apple cho ra mắt ngày 12/9 vừa rồi đánh dấu chặng đường 10 năm lần đầu tiên iPhone ra đời. iPhone X mang trên mình thiết kế hoàn toàn mới với màn hình Super Retina viền cực mỏng và trang bị nhiều công nghệ hiện đại như nhận diện khuôn mặt Face ID, sạc pin nhanh và sạc không dây cùng khả năng chống nước bụi cao cấp.', 1, 1, 1500000),
(8, 'iPhone 7 Plus 32GB', '7.jpg', 'Mặc dù giữ nguyên vẻ bề ngoài so với dòng điện thoại iPhone đời trước, bù lại iPhone 7 Plus 32GB lại được trang bị nhiều nâng cấp đáng giá như camera kép đầu tiên cũng như cấu hình mạnh mẽ.', 1, 1, 14000000),
(9, 'iPhone 6 32GB', '8.png', 'iPhone 6 là một trong những smartphone được yêu thích nhất của Apple. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất \"Hot\".', 1, 1, 10000000),
(11, 'OPPO Find X', '9.jpg', 'OPPO Find X tạo nên một cú hích lớn trong làng smartphone hiện nay khi mang trong mình nhiều tính năng đột phá mà nổi bật nhất đến từ thiết kế sáng tạo và một hiệu năng đỉnh cao.', 3, 3, 14000000),
(12, 'OPPO F7 128GB', '10.jpg', 'smart', 3, 3, 6000000),
(13, ' OPPO F9 6GB', '11.jpg', 'Là chiếc điện thoại OPPO được nâng cấp cấu hình, cụ thể là RAM lên tới 6 GB, OPPO F9 6GB còn trang bị nhiều tính năng đột phá như sở hữu công nghệ sạc VOOC mới nhất, mặt lưng chuyển màu độc đáo, màn hình tràn viền giọt nước và camera chụp chân dung tích hợp trí tuệ nhân tạo A.I hoàn hảo.', 3, 3, 1500000),
(14, 'OPPO F9 Tím Tinh Tú\r\n', '12.jpg', 'Là chiếc điện thoại OPPO sở hữu một sắc tím đẹp đến mê người và không còn đi theo phong cách đơn thuần một màu sắc, OPPO F9 Tím Tinh Tú điểm trên mặt lưng những ánh kim tuyến độc đáo và màn hình giọt nước siêu tràn viền.', 3, 3, 17000000),
(16, 'Huawei P20 Pro', '13.jpg', 'Thiết kế tai thỏ thời thượng, cấu hình khủng và đặc biệt nhất là bộ 3 camera là những gì mà người ta ấn tượng kể từ khi chiếc điện thoại Huawei P20 Pro ra mắt.', 4, 4, 800000),
(17, ' Huawei Nova 3', '14.jpg', 'Nếu như bạn là một người yêu thích thiết kế của siêu phẩm Huawei P20 Pro nhưng cần một mức giá dễ chịu hơn thì Huawei Nova 3 sẽ là một sự lựa chọn phải chăng dành cho bạn.', 4, 4, 1500000),
(18, 'Huawei Nova 3i', '15.jpg', 'Với những smartphone như Nova 2i hay Nova 3e thì Huawei đã và đang tạo nên những cơn sốt rất lớn trong phân khúc tầm trung và cái tên mới Huawei Nova 3i được cải tiến và nâng cấp nhiều điểm mới, hứa hẹn sẽ mang lại làn gió mới cho thị trường.', 4, 4, 2000000),
(19, 'Huawei Nova 3i Trắng\r\n', '16.jpg', 'Là chiếc điện thoại sở hữu gam màu nhẹ nhàng, Huawei Nova 3i Trắng đem lại sự thanh lịch, quý phải so với phiên bản xanh tím độc đáo hay sắc đen sang trọng', 4, 4, 14000000),
(20, 'Huawei Y7 Pro (2018)', '17.jpg', 'Huawei Y7 Pro (2018) là sản phẩm tầm trung với đầy đủ những trang bị của một chiếc smartphone theo xu thế của năm 2018.', 4, 4, 4000000),
(21, 'Xiaomi Mi A2', '18.jpg', 'Tiếp nối sự thành công của Xiaomi Mi A1 thì Xiaomi tiếp tục giới thiệu tới người dùng phiên bản kế nhiệm là chiếc Xiaomi Mi A2 với nâng cấp mạnh mẽ về cấu hình cũng như camera.', 5, 5, 1500000),
(22, ' Xiaomi Redmi Note 5', '19.jpg', 'Xiaomi Redmi Note 5 là smartphone thứ ba trong phân khúc tầm trung - giá rẻ của Xiaomi sở hữu màn hình tỉ lệ mới 18:9.', 5, 5, 10000000),
(23, ' Xiaomi Mi A1 64GB', 'xiaomi-mi-a1-mau-vang-hong-400x460.png', 'Mi A1 được Xiaomi chính thức ra mắt tại Ấn Độ với vai trò là một dự án hợp tác Android One của Google. Hãy cùng mình trên tay nhanh chiếc máy chạy Android thuần cùng camera xóa phông ảo diệu mà giá chỉ hơn 5 triệu này nhé.', 234234232, 567, 14000000),
(24, ' Xiaomi Mi A2 Lite', 'xiaomi-mi-a2-lite-2-400x460.png', 'Kế thừa sự thành công từ người đàn anh Xiaomi Mi A1 thì Xiaomi tiếp tục giới thiệu tới người dùng phiên bản kế nhiệm là Xiaomi Mi A2 Lite và Xiaomi Mi A2 với nhiều cải tiến đáng giá.', 23423423, 567, 13000000),
(25, 'Xiaomi Redmi 5 Plus 4GB', 'xiaomi-redmi-5-plus-2-1-400x460.png', 'Xiaomi Redmi 5 Plus phiên bản cao cấp nhất với RAM 4GB và bộ nhớ 64GB, màn hình tràn viền 18:9 thời thượng cho trải nghiệm tuyệt vời với giá bán tốt.', 234234232, 567, 9000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `protypes`
--

DROP TABLE IF EXISTS `protypes`;
CREATE TABLE IF NOT EXISTS `protypes` (
  `type_ID` int(11) NOT NULL,
  `type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type_img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `protypes`
--

INSERT INTO `protypes` (`type_ID`, `type_name`, `type_img`) VALUES
(1, 'Apple', '636735671961190017_galaxy-j6-plus-10.jpg'),
(2, 'SamSung', '636449223227094234_iphone-x-64gb-1.jpg'),
(3, 'Oppo', 'huawei-nova-3i-mo-ta.jpg'),
(4, 'Huawei', '636682249944938777_xiaomi-mi-a2-lite-2.jpg'),
(5, 'Xiaomi', '636711517472294944_oppo-f9-2.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
