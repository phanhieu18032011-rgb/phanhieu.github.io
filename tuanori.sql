-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th8 29, 2022 lúc 02:53 AM
-- Phiên bản máy phục vụ: 10.3.35-MariaDB-log-cll-lve
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btshxuct_abc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activeip`
--

CREATE TABLE `activeip` (
  `id` int(11) NOT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `createtime` varchar(250) DEFAULT NULL,
  `vitri` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `biendongsodu`
--

CREATE TABLE `biendongsodu` (
  `id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `tongtien` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dsmien`
--

CREATE TABLE `dsmien` (
  `id` int(11) NOT NULL,
  `duoimien` varchar(250) DEFAULT NULL,
  `sotien` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `dsmien`
--

INSERT INTO `dsmien` (`id`, `duoimien`, `sotien`, `status`) VALUES
(4, 'com', '250000', 'SHOW'),
(5, 'net', '250000', 'SHOW'),
(6, 'site', '50000', 'SHOW'),
(7, 'xyz', '80000', 'SHOW'),
(8, 'online', '50000', 'SHOW'),
(9, 'space', '50000', 'SHOW'),
(10, 'pw', '50000', 'SHOW'),
(11, 'biz', '100000', 'SHOW'),
(12, 'website', '60000', 'SHOW'),
(13, 'shop', '120000', 'SHOW'),
(14, 'info', '150000', 'SHOW');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `goihost`
--

CREATE TABLE `goihost` (
  `id` int(11) NOT NULL,
  `serverhost` varchar(250) DEFAULT NULL,
  `nameGoi` varchar(250) DEFAULT NULL,
  `money` varchar(250) DEFAULT NULL,
  `dungluong` varchar(250) DEFAULT NULL,
  `bangthong` varchar(250) DEFAULT NULL,
  `miencon` varchar(250) DEFAULT NULL,
  `mienkhac` varchar(250) DEFAULT NULL,
  `mienbidanh` varchar(250) DEFAULT NULL,
  `backup` varchar(250) DEFAULT 'NO',
  `loairsl` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `loai` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT 'SHOW'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `goivps`
--

CREATE TABLE `goivps` (
  `id` int(11) NOT NULL,
  `servervps` varchar(250) DEFAULT NULL,
  `nameGoi` varchar(250) DEFAULT NULL,
  `money` varchar(250) DEFAULT NULL,
  `hedieuhanh` varchar(250) DEFAULT NULL,
  `ram` varchar(250) DEFAULT NULL,
  `cpu` varchar(250) DEFAULT NULL,
  `dungluong` varchar(250) DEFAULT NULL,
  `bangthong` varchar(250) DEFAULT NULL,
  `ocung` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT 'SHOW'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `goivps`
--

INSERT INTO `goivps` (`id`, `servervps`, `nameGoi`, `money`, `hedieuhanh`, `ram`, `cpu`, `dungluong`, `bangthong`, `ocung`, `status`) VALUES
(1, 'vietnam', 'VPS1', '200000', 'Windows', '20', '20', '20', 'unlimited', '200', 'SHOW');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `historyhost`
--

CREATE TABLE `historyhost` (
  `id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `domain` varchar(250) DEFAULT NULL,
  `server` varchar(250) DEFAULT NULL,
  `goi` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `tongtien` varchar(250) DEFAULT NULL,
  `tienlandau` varchar(250) DEFAULT NULL,
  `linklogin` varchar(250) DEFAULT NULL,
  `taikhoan` varchar(250) DEFAULT NULL,
  `matkhau` varchar(250) DEFAULT NULL,
  `ngaymua` varchar(250) DEFAULT NULL,
  `ngayhet` varchar(250) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `loairsl` varchar(250) DEFAULT NULL,
  `coupon` varchar(250) DEFAULT NULL,
  `autogiahan` varchar(250) DEFAULT 'NO',
  `nsNameServer` longtext DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `loai` varchar(250) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `gioithieu` varchar(250) DEFAULT NULL,
  `hoantien` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `historymien`
--

CREATE TABLE `historymien` (
  `id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `domain` varchar(250) DEFAULT NULL,
  `nam` varchar(250) DEFAULT NULL,
  `tongtien` varchar(250) DEFAULT NULL,
  `nameserver` longtext DEFAULT NULL,
  `timemua` varchar(250) DEFAULT NULL,
  `timedie` varchar(250) DEFAULT NULL,
  `gioithieu` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `historyref`
--

CREATE TABLE `historyref` (
  `id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `nguoimua` varchar(250) DEFAULT NULL,
  `sotien` varchar(250) DEFAULT NULL,
  `tongnhan` varchar(250) DEFAULT NULL,
  `phantram` varchar(250) DEFAULT NULL,
  `dichvu` varchar(250) DEFAULT NULL,
  `goi` varchar(250) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `listbank`
--

CREATE TABLE `listbank` (
  `id` int(11) NOT NULL,
  `nganhang` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `stk` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT 'SHOW'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `listbank`
--

INSERT INTO `listbank` (`id`, `nganhang`, `name`, `stk`, `status`) VALUES
(1, 'MBBANK', 'PHẠM HOÀNG TUẤN', '259876543210', 'SHOW'),
(2, 'MOMO', 'PHẠM HOÀNG TUẤN', '0812665001', 'SHOW'),
(4, 'THESIEURE', 'PHẠM HOÀNG TUẤN', 'hacknro', 'SHOW');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `listvps`
--

CREATE TABLE `listvps` (
  `id` int(11) NOT NULL,
  `servervps` varchar(250) DEFAULT NULL,
  `nameGoi` varchar(250) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `money` varchar(250) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `taikhoan` varchar(250) DEFAULT NULL,
  `matkhau` varchar(250) DEFAULT NULL,
  `ngaymua` varchar(250) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `ngayhet` varchar(250) DEFAULT NULL,
  `gioithieu` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT 'chuaban'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `listvps`
--

INSERT INTO `listvps` (`id`, `servervps`, `nameGoi`, `username`, `money`, `ip`, `taikhoan`, `matkhau`, `ngaymua`, `thoigian`, `ngayhet`, `gioithieu`, `status`) VALUES
(1, 'vietnam', 'VPS1', 'tuanori', '200000', '1.00.000', 'tuanori', 'tuanori', '1658631944', '2022-07-24 10:05:44', '1661223944', '', 'hoatdong');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `magiamgia`
--

CREATE TABLE `magiamgia` (
  `id` int(11) NOT NULL,
  `goiapdung` varchar(250) DEFAULT NULL,
  `magiamgia` varchar(250) DEFAULT NULL,
  `luotdung` varchar(250) DEFAULT NULL,
  `giam` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `napatm`
--

CREATE TABLE `napatm` (
  `id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `hinhthuc` varchar(250) DEFAULT NULL,
  `magd` varchar(250) DEFAULT NULL,
  `sotien` varchar(250) DEFAULT NULL,
  `ndnaptien` varchar(250) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `napcard`
--

CREATE TABLE `napcard` (
  `id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `loaithe` varchar(250) DEFAULT NULL,
  `menhgia` varchar(250) DEFAULT NULL,
  `pin` varchar(250) DEFAULT NULL,
  `seri` varchar(250) DEFAULT NULL,
  `thucnhan` varchar(250) NOT NULL,
  `requestid` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'tenweb', 'HỆ THỐNG MUA BÁN HOSTING, VPS CHẤT LƯỢNG NHẤT THỊ TRƯỜNG'),
(2, 'mota', 'Website bán hosting giá rẻ, chất lượng, uy tín nhất thị trường 2022'),
(3, 'tukhoa', 'bán hosting, bán reseller, mua hosting, mua reseller, mua tên miền'),
(4, 'logo', 'https://i.imgur.com/djvxQX6.png'),
(5, 'email', ''),
(6, 'pass_email', ''),
(11, 'nd_bank', 'NAP'),
(12, 'thongbao', 'Thông Báo Website<br>'),
(13, 'anhbia', 'https://i.imgur.com/bD1GO4U.png'),
(14, 'favicon', 'https://i.imgur.com/IASsmY0.png'),
(27, 'tk_tsr', ''),
(28, 'mk_tsr', ''),
(29, 'status_tsr', 'ON'),
(31, 'hotline', '0812665001'),
(32, 'facebook', 'https://www.facebook.com/phamhoangtuan.ytb/'),
(48, 'ck_bank', '20'),
(51, 'token_momo', ''),
(55, 'partner_id', ''),
(56, 'partner_key', ''),
(57, 'ckcard', '15'),
(58, 'token_bank', ''),
(59, 'stk_bank', ''),
(61, 'mk_bank', ''),
(63, 'id_tele', NULL),
(64, 'token_tele', NULL),
(65, 'status_hosting', 'SHOW'),
(66, 'status_reseller', 'SHOW'),
(67, 'status_vps', 'SHOW'),
(68, 'status_mien', 'SHOW'),
(69, 'ck_ref', '22'),
(70, 'tientoithieu', '200000'),
(71, 'Cron', '1658597223'),
(72, 'HuyHost', '1658597224'),
(73, 'KhoaHost', '1658597224'),
(74, 'Listsuspended', '1658597223'),
(75, 'NapAtm', '1658597224'),
(76, 'NapMomo', '1658597224'),
(77, 'RegHost', '1658597223'),
(78, 'ReminderDate', '1658595604'),
(79, 'ResetHost', '1658597224'),
(80, 'Thesieure', '1658597224'),
(81, 'UpdateRsl', '1658597224'),
(82, 'app_id', NULL),
(83, 'app_key', NULL),
(84, 'client_id', NULL),
(85, 'client_key', NULL),
(86, 'Checklai', '1658597224'),
(87, 'Refund', '1658597104'),
(88, 'ten_facebook', 'PHẠM HOÀNG TUẤN'),
(89, 'ten_zalo', 'PHẠM HOÀNG TUẤN'),
(90, 'fanpage_admin', 'https://www.facebook.com/Hotro.Tuanori'),
(91, 'ten_fanpage', 'TUANORI.VN'),
(92, 'youtube_admin', 'https://www.youtube.com/channel/UCL0pg_RaDdm9l7DyLypwuVQ'),
(93, 'ten_youtube', 'TUANORIIT'),
(94, 'baotri', 'OFF'),
(95, 'activeip', 'OFF'),
(96, 'mabaomat', '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ruttien`
--

CREATE TABLE `ruttien` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `sotien` int(11) DEFAULT NULL,
  `nganhang` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `sotaikhoan` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `chutaikhoan` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `trangthai` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `capnhat` datetime DEFAULT NULL,
  `ghichu` text COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `serverhost`
--

CREATE TABLE `serverhost` (
  `id` int(11) NOT NULL,
  `nameServer` varchar(250) DEFAULT NULL,
  `nameGetServer` varchar(240) DEFAULT NULL COMMENT 'không thay đổi',
  `taikhoanrsl` varchar(250) DEFAULT NULL,
  `matkhaursl` varchar(250) DEFAULT NULL,
  `linkrsl` varchar(250) DEFAULT NULL,
  `loairsl` varchar(250) DEFAULT 'WHM',
  `nsNameServer` longtext DEFAULT NULL,
  `number_account` int(11) DEFAULT NULL,
  `backup` varchar(250) DEFAULT 'NO',
  `nangcap` varchar(250) DEFAULT NULL COMMENT 'không được thay đổi',
  `ownership` varchar(250) DEFAULT 'reseller',
  `theloai` varchar(250) DEFAULT NULL,
  `loai` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT 'SHOW'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `serverhost`
--

INSERT INTO `serverhost` (`id`, `nameServer`, `nameGetServer`, `taikhoanrsl`, `matkhaursl`, `linkrsl`, `loairsl`, `nsNameServer`, `number_account`, `backup`, `nangcap`, `ownership`, `theloai`, `loai`, `status`) VALUES
(1, 'Việt Nam', 'vietnam', 'root', 'TuanNeBinh123', 'https://hosting.tuanori.vn', 'WHM', 'ns1.tuanori.vn\r\nns2.tuanori.vn', 23, 'NO', 'OFF', 'owner', 'ADMINWHM', 'hosting', 'SHOW');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `servervps`
--

CREATE TABLE `servervps` (
  `id` int(11) NOT NULL,
  `nameServer` varchar(250) DEFAULT NULL,
  `nameGetServer` varchar(250) DEFAULT NULL COMMENT 'không thay đổi',
  `status` varchar(250) DEFAULT 'SHOW'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `servervps`
--

INSERT INTO `servervps` (`id`, `nameServer`, `nameGetServer`, `status`) VALUES
(1, 'Việt Nam', 'vietnam', 'SHOW');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `tokenlog` varchar(250) DEFAULT NULL,
  `money` bigint(20) DEFAULT 0,
  `money_ref` bigint(20) DEFAULT 0,
  `level` varchar(250) DEFAULT NULL,
  `total_money` bigint(20) DEFAULT 0,
  `email` varchar(250) DEFAULT NULL,
  `tokenapi` varchar(250) DEFAULT NULL,
  `ref_click` int(11) DEFAULT 0,
  `createtime` datetime DEFAULT NULL,
  `operatingtime` datetime DEFAULT NULL,
  `trangthai` varchar(250) NOT NULL DEFAULT 'OFF',
  `banned` varchar(250) DEFAULT 'OFF',
  `online` varchar(8) DEFAULT 'OFFLINE',
  `ip` longtext DEFAULT NULL,
  `device` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `tokenlog`, `money`, `money_ref`, `level`, `total_money`, `email`, `tokenapi`, `ref_click`, `createtime`, `operatingtime`, `trangthai`, `banned`, `online`, `ip`, `device`) VALUES
(1, 'tuanori', '8be9afa4ac293015623c5711cccbf30f', '01bcea0ef025f1cb87696c4932ea0961a6df51f9e222218148', 0, 2000000, 'admin', 200000, 'tuanori@gmail.com', 'A692EB94F69DAB620B763BB077CE61', 2, '2022-07-24 08:49:56', '2022-08-29 02:53:06', 'OFF', 'OFF', 'ONLINE', '171.234.13.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activeip`
--
ALTER TABLE `activeip`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `biendongsodu`
--
ALTER TABLE `biendongsodu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dsmien`
--
ALTER TABLE `dsmien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `goihost`
--
ALTER TABLE `goihost`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `goivps`
--
ALTER TABLE `goivps`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `historyhost`
--
ALTER TABLE `historyhost`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `historymien`
--
ALTER TABLE `historymien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `historyref`
--
ALTER TABLE `historyref`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `listbank`
--
ALTER TABLE `listbank`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `listvps`
--
ALTER TABLE `listvps`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `magiamgia`
--
ALTER TABLE `magiamgia`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `napatm`
--
ALTER TABLE `napatm`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `napcard`
--
ALTER TABLE `napcard`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `ruttien`
--
ALTER TABLE `ruttien`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `serverhost`
--
ALTER TABLE `serverhost`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `servervps`
--
ALTER TABLE `servervps`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activeip`
--
ALTER TABLE `activeip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `biendongsodu`
--
ALTER TABLE `biendongsodu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dsmien`
--
ALTER TABLE `dsmien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `goihost`
--
ALTER TABLE `goihost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `goivps`
--
ALTER TABLE `goivps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `historyhost`
--
ALTER TABLE `historyhost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `historymien`
--
ALTER TABLE `historymien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `historyref`
--
ALTER TABLE `historyref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `listbank`
--
ALTER TABLE `listbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `listvps`
--
ALTER TABLE `listvps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `magiamgia`
--
ALTER TABLE `magiamgia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `napatm`
--
ALTER TABLE `napatm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `napcard`
--
ALTER TABLE `napcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT cho bảng `ruttien`
--
ALTER TABLE `ruttien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `serverhost`
--
ALTER TABLE `serverhost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `servervps`
--
ALTER TABLE `servervps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
