/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : laravel_base

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-06-27 22:59:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chitiethoadons
-- ----------------------------
DROP TABLE IF EXISTS `chitiethoadons`;
CREATE TABLE `chitiethoadons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_hoadon` int(10) unsigned NOT NULL,
  `id_sanpham` int(10) unsigned NOT NULL,
  `soluong` int(11) NOT NULL,
  `giasp` int(11) NOT NULL,
  `tong_giasp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `chitiethoadons_id_hoadon_foreign` (`id_hoadon`),
  KEY `chitiethoadons_id_sanpham_foreign` (`id_sanpham`),
  CONSTRAINT `chitiethoadons_id_hoadon_foreign` FOREIGN KEY (`id_hoadon`) REFERENCES `hoadons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chitiethoadons_id_sanpham_foreign` FOREIGN KEY (`id_sanpham`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chitiethoadons
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('2', '2016-05-29 12:34:49', '2016-05-29 12:34:49', '<p>\nLorem ipsum maecenas sagittis platea, cursus pellentesque leo dui lectus, curabitur euismod ad. \nErat curae non elit ultrices placerat netus metus feugiat non conubia fusce, porttitor sociosqu diam commodo metus in himenaeos vitae aptent consequat luctus, purus eleifend enim sollicitudin eleifend porta malesuada ac class conubia. \nCondimentum mauris facilisis conubia quis scelerisque lacinia tempus, nullam felis fusce ac potenti netus ornare, semper molestie iaculis fermentum ornare curabitur. \nTincidunt imperdiet scelerisque imperdiet euismod scelerisque torquent curae rhoncus sollicitudin, tortor placerat aptent hac nec posuere suscipit sed tortor neque, urna hendrerit vehicula duis litora tristique congue nec. \n</p>\n<p>\nAuctor felis libero ornare habitasse nec elit felis inceptos tellus inceptos cubilia, quis mattis faucibus sem non odio fringilla class aliquam metus, ipsum lorem luctus pharetra dictum vehicula tempus in venenatis gravida. \nUt gravida proin orci quis sed platea mi quisque hendrerit, semper hendrerit facilisis ante sapien faucibus ligula. \nCommodo vestibulum rutrum pretium varius sem aliquet himenaeos dolor cursus nunc, habitasse aliquam ut curabitur ipsum luctus ut rutrum odio, condimentum donec suscipit molestie est etiam sit rutrum dui. \nNostra sem aliquet conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus, netus risus tortor non mauris turpis eget integer nibh, dolor commodo venenatis ut molestie semper adipiscing amet. \n</p>', '0', '2', '2');
INSERT INTO `comments` VALUES ('4', '2016-05-29 12:42:32', '2016-05-30 08:25:40', '<p>hahah</p>\r\n', '1', '1', '4');
INSERT INTO `comments` VALUES ('5', '2016-05-30 06:28:10', '2016-05-30 08:25:39', '<p>Bao giờ c&oacute; khoảng 50% d&acirc;n số Việt Nam c&oacute; d&acirc;n tr&iacute; trung b&igrave;nh, c&oacute; hiểu biết cơ bản về một số vấn đề quan trọng của đất nước như thể chế ch&iacute;nh trị, ng&acirc;n s&aacute;ch từ đ&acirc;u m&agrave; c&oacute;, d&acirc;n chủ l&agrave; g&igrave;, l&agrave;m thế n&agrave;o để c&oacute; d&acirc;n chủ... Đến khi đ&oacute; Việt Nam mới c&oacute; thể thay đổi, c&ograve;n với t&igrave;nh trạng d&acirc;n tr&iacute; của người d&acirc;n hiện nay thấp thế n&agrave;y th&igrave; kh&ocirc;ng biết điều g&igrave; sẽ xảy ra nữa.</p>\r\n', '1', '5', '5');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for danhgias
-- ----------------------------
DROP TABLE IF EXISTS `danhgias`;
CREATE TABLE `danhgias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `numberstar` int(11) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `danhgias_product_id_foreign` (`product_id`),
  CONSTRAINT `danhgias_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of danhgias
-- ----------------------------

-- ----------------------------
-- Table structure for hoadons
-- ----------------------------
DROP TABLE IF EXISTS `hoadons`;
CREATE TABLE `hoadons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `addreass` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hoadons
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_21_105844_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_21_110325_create_foreign_keys', '1');
INSERT INTO `migrations` VALUES ('2014_10_24_205441_create_contact_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_26_172107_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_26_172631_create_tags_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_26_172904_create_post_tag_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_26_222018_create_comments_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_23_150625_create_product_category', '2');
INSERT INTO `migrations` VALUES ('2016_03_10_145030_create_products_table', '3');
INSERT INTO `migrations` VALUES ('2016_06_21_041741_alter_products_table', '4');
INSERT INTO `migrations` VALUES ('2016_06_21_082858_create_product_tag_table', '4');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('2', '2016-05-29 12:34:48', '2016-05-29 12:34:48', 'Post 2', 'post-2', '<img alt=\"\" src=\"/filemanager/userfiles/user2/goomba.png\" style=\"float:left; height:128px; width:128px\" /><p>\nLorem ipsum nibh aliquet himenaeos dolor cursus nunc habitasse aliquam ut curabitur ipsum, luctus ut rutrum odio condimentum donec suscipit molestie est etiam. \nSit rutrum dui nostra sem aliquet conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus risus, tortor non mauris turpis eget integer nibh dolor commodo venenatis ut molestie. \n</p>', '<p>Lorem ipsum convallis ac curae non elit ultrices placerat netus metus feugiat, non conubia fusce porttitor sociosqu diam commodo metus in himenaeos, vitae aptent consequat luctus purus eleifend enim sollicitudin eleifend porta. Malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque lacinia, tempus nullam felis fusce ac potenti netus ornare semper. Molestie iaculis fermentum ornare curabitur tincidunt imperdiet scelerisque, imperdiet euismod scelerisque torquent curae rhoncus, sollicitudin tortor placerat aptent hac nec. Posuere suscipit sed tortor neque urna hendrerit vehicula duis litora tristique congue nec auctor felis libero, ornare habitasse nec elit felis inceptos tellus inceptos cubilia quis mattis faucibus sem non.</p>\r\n\r\n<p>Odio fringilla class aliquam metus ipsum lorem luctus pharetra dictum, vehicula tempus in venenatis gravida ut gravida proin orci, quis sed platea mi quisque hendrerit semper hendrerit. Facilisis ante sapien faucibus ligula commodo vestibulum rutrum pretium, varius sem aliquet himenaeos dolor cursus nunc habitasse, aliquam ut curabitur ipsum luctus ut rutrum. Odio condimentum donec suscipit molestie est etiam sit rutrum dui nostra, sem aliquet conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus, risus tortor non mauris turpis eget integer nibh dolor. Commodo venenatis ut molestie semper adipiscing amet cras, class donec sapien malesuada auctor sapien arcu inceptos, aenean consequat metus litora mattis vivamus.</p>\r\n\r\n<pre>\r\n<code class=\"language-php\">protected function getUserByRecaller($recaller)\r\n{\r\n	if ($this-&gt;validRecaller($recaller) &amp;&amp; ! $this-&gt;tokenRetrievalAttempted)\r\n	{\r\n		$this-&gt;tokenRetrievalAttempted = true;\r\n\r\n		list($id, $token) = explode(\"|\", $recaller, 2);\r\n\r\n		$this-&gt;viaRemember = ! is_null($user = $this-&gt;provider-&gt;retrieveByToken($id, $token));\r\n\r\n		return $user;\r\n	}\r\n}</code></pre>\r\n\r\n<p>Feugiat arcu adipiscing mauris primis ante ullamcorper ad nisi, lobortis arcu per orci malesuada blandit metus tortor, urna turpis consectetur porttitor egestas sed eleifend. Eget tincidunt pharetra varius tincidunt morbi malesuada elementum mi torquent mollis, eu lobortis curae purus amet vivamus amet nulla torquent, nibh eu diam aliquam pretium donec aliquam tempus lacus. Tempus feugiat lectus cras non velit mollis sit et integer, egestas habitant auctor integer sem at nam massa himenaeos, netus vel dapibus nibh malesuada leo fusce tortor. Sociosqu semper facilisis semper class tempus faucibus tristique duis eros, cubilia quisque habitasse aliquam fringilla orci non vel, laoreet dolor enim justo facilisis neque accumsan in.</p>\r\n\r\n<p>Ad venenatis hac per dictumst nulla ligula donec, mollis massa porttitor ullamcorper risus eu platea, fringilla habitasse suscipit pellentesque donec est. Habitant vehicula tempor ultrices placerat sociosqu ultrices consectetur ullamcorper tincidunt quisque tellus, ante nostra euismod nec suspendisse sem curabitur elit malesuada lacus. Viverra sagittis sit ornare orci augue nullam adipiscing pulvinar libero aliquam vestibulum platea cursus pellentesque leo dui lectus, curabitur euismod ad erat curae non elit ultrices placerat netus metus feugiat non conubia fusce porttitor. Sociosqu diam commodo metus in himenaeos vitae aptent consequat luctus purus eleifend enim sollicitudin eleifend, porta malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque lacinia.</p>\r\n\r\n<p>Tempus nullam felis fusce ac potenti netus ornare semper molestie iaculis, fermentum ornare curabitur tincidunt imperdiet scelerisque imperdiet euismod. Scelerisque torquent curae rhoncus sollicitudin tortor placerat aptent hac, nec posuere suscipit sed tortor neque urna hendrerit, vehicula duis litora tristique congue nec auctor. Felis libero ornare habitasse nec elit felis, inceptos tellus inceptos cubilia quis mattis, faucibus sem non odio fringilla. Class aliquam metus ipsum lorem luctus pharetra dictum vehicula, tempus in venenatis gravida ut gravida proin orci, quis sed platea mi quisque hendrerit semper.</p>\r\n', '0', '1', '2');
INSERT INTO `posts` VALUES ('3', '2016-05-29 12:34:48', '2016-05-29 12:34:48', 'Post 3', 'post-3', '<img alt=\"\" src=\"/filemanager/userfiles/user2/rouge-shell.png\" style=\"float:left; height:128px; width:128px\" /><p>\nLorem ipsum platea adipiscing amet cras class donec sapien, malesuada auctor sapien arcu inceptos aenean consequat metus litora, mattis vivamus feugiat arcu adipiscing mauris primis. \nAnte ullamcorper ad nisi lobortis arcu per orci malesuada, blandit metus tortor urna turpis consectetur porttitor egestas sed, eleifend eget tincidunt pharetra varius tincidunt morbi. \n</p>', '<p>\nLorem ipsum eget elementum mi torquent mollis eu, lobortis curae purus amet vivamus amet nulla torquent, nibh eu diam aliquam pretium donec. \nAliquam tempus lacus tempus feugiat lectus cras non velit mollis, sit et integer egestas habitant auctor integer sem at, nam massa himenaeos netus vel dapibus nibh malesuada. \nLeo fusce tortor sociosqu semper facilisis semper class tempus, faucibus tristique duis eros cubilia quisque habitasse aliquam, fringilla orci non vel laoreet dolor enim. \nJusto facilisis neque accumsan in ad venenatis hac, per dictumst nulla ligula donec mollis massa porttitor, ullamcorper risus eu platea fringilla habitasse. \n</p>\n<p>\nSuscipit pellentesque donec est habitant vehicula tempor ultrices placerat sociosqu, ultrices consectetur ullamcorper tincidunt quisque tellus ante nostra euismod nec, suspendisse sem curabitur elit malesuada lacus viverra sagittis. \nSit ornare orci augue nullam adipiscing pulvinar libero, aliquam vestibulum platea cursus pellentesque leo dui, lectus curabitur euismod ad erat curae. \nNon elit ultrices placerat netus metus feugiat non, conubia fusce porttitor sociosqu diam commodo metus, in himenaeos vitae aptent consequat luctus. \nPurus eleifend enim sollicitudin eleifend porta malesuada ac class conubia condimentum mauris facilisis conubia quis scelerisque, lacinia tempus nullam felis fusce ac potenti netus ornare semper molestie iaculis fermentum. \n</p>\n<p>\nOrnare curabitur tincidunt imperdiet scelerisque imperdiet euismod scelerisque, torquent curae rhoncus sollicitudin tortor placerat aptent hac, nec posuere suscipit sed tortor neque. \nUrna hendrerit vehicula duis litora tristique congue nec auctor felis, libero ornare habitasse nec elit felis inceptos tellus inceptos, cubilia quis mattis faucibus sem non odio fringilla. \nClass aliquam metus ipsum lorem luctus pharetra dictum vehicula tempus in, venenatis gravida ut gravida proin orci quis sed platea mi, quisque hendrerit semper hendrerit facilisis ante sapien faucibus ligula. \nCommodo vestibulum rutrum pretium varius sem aliquet, himenaeos dolor cursus nunc habitasse aliquam ut, curabitur ipsum luctus ut rutrum. \n</p>\n<p>\nOdio condimentum donec suscipit molestie est etiam sit rutrum dui nostra sem aliquet, conubia nullam sollicitudin rhoncus venenatis vivamus rhoncus netus risus tortor non mauris, turpis eget integer nibh dolor commodo venenatis ut molestie semper adipiscing. \nAmet cras class donec sapien malesuada, auctor sapien arcu inceptos aenean, consequat metus litora mattis. \nVivamus feugiat arcu adipiscing mauris primis ante ullamcorper ad nisi lobortis, arcu per orci malesuada blandit metus tortor urna turpis consectetur, porttitor egestas sed eleifend eget tincidunt pharetra varius tincidunt. \nMorbi malesuada elementum mi torquent mollis eu, lobortis curae purus amet vivamus amet, nulla torquent nibh eu diam. \n</p>\n<p>\nAliquam pretium donec aliquam tempus lacus tempus feugiat, lectus cras non velit mollis sit et integer, egestas habitant auctor integer sem at. \nNam massa himenaeos netus vel dapibus nibh, malesuada leo fusce tortor sociosqu semper facilisis, semper class tempus faucibus tristique. \nDuis eros cubilia quisque habitasse aliquam fringilla orci non vel, laoreet dolor enim justo facilisis neque accumsan in, ad venenatis hac per dictumst nulla ligula donec. \nMollis massa porttitor ullamcorper risus eu platea fringilla habitasse suscipit, pellentesque donec est habitant vehicula tempor ultrices placerat sociosqu ultrices, consectetur ullamcorper tincidunt quisque tellus ante nostra euismod. \n</p>\n<p>\nNec suspendisse sem curabitur elit malesuada lacus viverra, sagittis sit ornare orci augue nullam. \n</p>', '0', '1', '2');
INSERT INTO `posts` VALUES ('4', '2016-05-29 12:34:48', '2016-05-29 12:40:39', 'Post 4', 'post-4', '<p><img alt=\"\" src=\"/filemanager/userfiles/user2/rouge-shyguy.png\" style=\"float:left; height:128px; width:128px\" /></p>\r\n\r\n<p>Lorem ipsum in aliquam vestibulum platea cursus pellentesque leo dui lectus curabitur, euismod ad erat curae non elit ultrices placerat netus. Metus feugiat non conubia fusce porttitor sociosqu diam, commodo metus in himenaeos vitae aptent consequat, luctus purus eleifend enim sollicitudin eleifend. Porta malesuada ac class conubia, condimentum mauris facilisis.</p>\r\n', '<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>ha</td>\r\n			<td>ha</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ha</td>\r\n			<td>ha</td>\r\n		</tr>\r\n		<tr>\r\n			<td>haah</td>\r\n			<td>hahha</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><img alt=\"\" src=\"/Success_Kid_Then_and_Now_10.jpg\" style=\"height:404px; width:570px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/hapt/download.jpg\" style=\"height:187px; width:269px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/hapt/12718370_207174142983375_1183616433729346004_n.jpg\" style=\"height:83px; width:110px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '0', '1', '2');
INSERT INTO `posts` VALUES ('5', '2016-05-30 06:27:11', '2016-06-26 02:09:00', 'Không cải cách thể chế, Việt Nam sẽ tụt hậu rất xa', 'khoag-cach-vietnam-tut-hau-rat-xa', '<h3>Thế kỷ 19, kinh tế Việt Nam từng ph&aacute;t triển hơn nhiều nước trong khu vực, nhưng cho đến nay, Việt Nam đ&atilde; bị tụt hậu rất xa. Nếu quyết t&acirc;m đổi mới thể chế, phải mất 20 năm nữa, Việt Nam mới đuổi kịp kinh tế H&agrave;n Quốc năm 2000, c&ograve;n nếu kh&ocirc;ng, Việt Nam sẽ rơi v&agrave;o bẫy thu nhập trung b&igrave;nh.<img alt=\"\" src=\"/filemanager/userfiles/user5/hapt/201479d6e00f-6fd6-42ae-bdd8-303626a603cf.jpeg\" style=\"height:78px; width:110px\" /></h3>\r\n', '<p><strong>&ldquo;Thể chế n&agrave;o doanh nh&acirc;n đ&oacute;&rdquo;</strong></p>\r\n\r\n<p>Sau 3 th&aacute;ng c&ocirc;ng bố, b&aacute;o c&aacute;o &ldquo;Việt Nam 2035: Hướng tới thịnh vượng, s&aacute;ng tạo, c&ocirc;ng bằng v&agrave; d&acirc;n chủ&rdquo; tiếp tục được &ldquo;h&acirc;m n&oacute;ng&rdquo; trong phi&ecirc;n hội thảo quốc tế s&aacute;ng nay (30/5/2016), trong đ&oacute; nhấn mạnh vai tr&ograve; của doanh nghiệp (DN) v&agrave; y&ecirc;u cầu hiện đại h&oacute;a thể chế để đạt được kh&aacute;t vọng 20 năm tới.</p>\r\n\r\n<p>Ph&aacute;t biểu tại phi&ecirc;n khai mạc hội thảo, &ocirc;ng Vũ Tiến Lộc &ndash; Chủ tịch Ph&ograve;ng Thương mại v&agrave; C&ocirc;ng nghiệp Việt Nam (VCCI) đ&aacute;nh gi&aacute;, đ&acirc;y l&agrave; lần đầu ti&ecirc;n, Việt Nam c&oacute; một b&aacute;o c&aacute;o triển vọng kinh tế mang t&iacute;nh d&agrave;i hạn, định hướng tầm nh&igrave;n 20 năm.</p>\r\n\r\n<p>&ldquo;B&aacute;o c&aacute;o đặc biệt quan trọng với niềm tin của cộng đồng DN, doanh nh&acirc;n. C&aacute;c DN Việt Nam cần một tầm nh&igrave;n d&agrave;i hạn, c&oacute; t&iacute;nh chiến lược, l&acirc;u d&agrave;i chứ kh&ocirc;ng chỉ l&agrave; một tầm nh&igrave;n ngắn trong v&agrave;i ba năm tới&rdquo; &ndash; Chủ tịch VCCI nhận x&eacute;t.</p>\r\n\r\n<p>B&aacute;o c&aacute;o n&agrave;y n&ecirc;u rất r&otilde; vai tr&ograve; của doanh nh&acirc;n, DN trong chiến lược ph&aacute;t triển kinh tế của Việt Nam, tuy nhi&ecirc;n, muốn ph&aacute;t triển DN tư nh&acirc;n th&igrave; đ&ograve;i hỏi phải đổi mới thể chế.</p>\r\n\r\n<p>&ldquo;Thể chế n&agrave;o DN đ&oacute;. Ở bầu th&igrave; tr&ograve;n, ở ống th&igrave; d&agrave;i. DN v&agrave; doanh nh&acirc;n kh&ocirc;ng chỉ l&agrave; kết quả của thể chế m&agrave; c&ograve;n l&agrave; động lực cải thiện, thay đổi thể chế, đ&acirc;y l&agrave; một mối t&aacute;c động hai chiều&rdquo;, &ocirc;ng Vũ Tiến Lộc nhấn mạnh.</p>\r\n\r\n<p>Vấn đề n&agrave;y cũng được b&agrave; Victoria Kwakwa &ndash; Ph&oacute; Chủ tịch phụ tr&aacute;ch khu vực Đ&ocirc;ng &Aacute; của Ng&acirc;n h&agrave;ng Thế giới (WB) nhấn mạnh. Theo đ&oacute;, DN tư nh&acirc;n phải l&agrave; một phần quan trọng trong qu&aacute; tr&igrave;nh chuyển đổi của Việt Nam, l&agrave; ch&igrave;a kh&oacute;a then chốt để đạt được mục ti&ecirc;u ph&aacute;t triển trong tương lai.</p>\r\n\r\n<p>Thế nhưng, tr&ecirc;n thực tế, DN tư nh&acirc;n của Việt Nam vẫn chủ yếu l&agrave; c&aacute;c DN nhỏ, si&ecirc;u nhỏ, c&oacute; nhiều DN c&ograve;n mong manh trong bối cảnh hội nhập. Do đ&oacute;, nhiệm vụ của Nh&agrave; nước l&agrave; phải hỗ trợ khối DN tư nh&acirc;n ph&aacute;t triển, để từ đ&oacute;, đến lượt m&igrave;nh c&aacute;c DN tư nh&acirc;n sẽ th&uacute;c đẩy cả nền kinh tế đi l&ecirc;n mạnh mẽ.</p>\r\n\r\n<p>Thực tiễn n&agrave;y đ&ograve;i hỏi Ch&iacute;nh phủ phải x&aacute;c định được vai tr&ograve;, tr&aacute;ch nhiệm của m&igrave;nh, phải tự chuyển đổi m&igrave;nh tạo ra một m&ocirc; h&igrave;nh Nh&agrave; nước kiến tạo, phục vụ, minh bạch v&agrave; mang t&iacute;nh giải tr&igrave;nh.</p>\r\n\r\n<p><strong>Việt Nam đang đứng trước bước ngoặt của cải c&aacute;ch v&agrave; ph&aacute;t triển</strong></p>\r\n\r\n<p>B&aacute;o c&aacute;o Việt Nam 2035 chỉ ra rằng, c&aacute;c thiết chế v&agrave; thể chế hiện tại của Việt Nam đang gặp hai vấn đề lớn: tạo ra r&agrave;o cản cho hoạt động tự chủ của khu vực tư nh&acirc;n; năng lực yếu v&agrave; tr&aacute;ch nhiệm giải tr&igrave;nh thấp.</p>\r\n\r\n<p>Do vậy, việc thiết lập ranh giới r&otilde; r&agrave;ng giữa DN thuộc khu vực tư nh&acirc;n với c&aacute;c quan chức nh&agrave; nước l&agrave; yếu tố thiết yếu tạo lập m&ocirc;i trường thuận lợi cho đầu tư l&acirc;u d&agrave;i về vốn v&agrave; sự ph&aacute;t triển của c&aacute;c ng&agrave;nh th&acirc;m dụng c&ocirc;ng nghệ.</p>\r\n\r\n<p><img alt=\"Thể chế kinh tế của Việt Nam hiện đang bộc lộ nhiều bất cập, tồn tại sự bất bình đẳng trong tiếp cận nguồn lực giữa các thành phần kinh tế\" src=\"https://dantri4.vcmedia.vn/k:534992cb49/2015/09/24/dnnn-1443059748518/khong-cai-cach-the-che-viet-nam-se-tut-hau-rat-xa.jpg\" /></p>\r\n\r\n<p><br />\r\n<iframe frameborder=\"0\" scrolling=\"no\" src=\"https://www.youtube.com/watch?v=LikNqeWZVUM\"></iframe>Thể chế kinh tế của Việt Nam hiện đang bộc lộ nhiều bất cập, tồn tại sự bất b&igrave;nh đẳng trong tiếp cận nguồn lực giữa c&aacute;c th&agrave;nh phần kinh tế</p>\r\n\r\n<p>&ldquo;T&igrave;nh trạng thương mại h&oacute;a thiết chế c&ocirc;ng tạo dư địa để một số quan chức lạm dụng thẩm quyền điều tiết thị tường, thực thi ph&aacute;p luật v&agrave; ph&acirc;n bổ quyền t&agrave;i sản nhằm thu lợi cho m&igrave;nh v&agrave; th&acirc;n hữu&rdquo;, bản b&aacute;o c&aacute;o cho biết.</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, b&aacute;o c&aacute;o cũng chỉ ra sự bất cập của thể chế Việt Nam hiện tại, đ&oacute; l&agrave; Nh&agrave; nước bị ph&acirc;n mảnh, c&aacute;t cứ theo chiều dọc v&agrave; chiều ngang, tr&aacute;ch nhiệm hoạch định v&agrave; thực hiện ch&iacute;nh s&aacute;ch được trao cho nhiều cơ quan kh&aacute;c nhau ở Trung ương v&agrave; địa phương.</p>\r\n\r\n<p>Điều n&agrave;y &ldquo;g&acirc;y nhiều &aacute;ch tắc v&agrave; tạo cơ hội cho những mặc cả ch&iacute;nh s&aacute;ch mang t&iacute;nh cục bộ, l&agrave;m cho những quyết s&aacute;ch được ban h&agrave;nh kh&ocirc;ng mang t&iacute;nh tối ưu cho to&agrave;n x&atilde; hội. Hiệu quả của Nh&agrave; nước cũng bị x&oacute;i m&ograve;n bởi t&igrave;nh trạng thi&ecirc;n vị v&agrave; tham nhũng trong hệ thống quản l&yacute; nguồn nh&acirc;n lực vẫn chưa thật sự coi trọng người t&agrave;i&rdquo;.</p>\r\n\r\n<p>B&aacute;o c&aacute;o đề cập đến một trong những nguồn thu quan trọng của ch&iacute;nh quyền địa phương l&agrave; c&aacute;c khoản thu từ việc chuyển quyền sử dụng đất. Do đ&oacute;, ở nhiều nơi, ch&iacute;nh quyền địa phương đ&atilde; lạm dụng quyền lực của m&igrave;nh trong thu hồi v&agrave; kiểm so&aacute;t gi&aacute; đất. Tranh chấp đất đai l&agrave; l&yacute; do ch&iacute;nh của rất nhiều khiếu kiện với ch&iacute;nh quyền v&agrave; phần lớn trong số đ&oacute; l&agrave; do bất đồng về mức bồi thường trong thu hồi đất.</p>\r\n\r\n<p>&ldquo;Việc thi&ecirc;n vị c&aacute;c DNNN, hoặc DN kh&aacute;c l&agrave; do c&oacute; quan hệ th&acirc;n hữu với nh&agrave; nước. Ch&iacute;nh thực tế đ&oacute; đ&atilde; l&agrave;m giảm khả năng của cơ quan Nh&agrave; nước trong việc ban h&agrave;nh c&aacute;c quy định ph&ugrave; hợp với nguy&ecirc;n tắc quản l&yacute; kinh tế l&agrave;nh mạnh&rdquo;, theo b&aacute;o c&aacute;o.</p>\r\n\r\n<p>N&oacute;i về bản b&aacute;o c&aacute;o, &ocirc;ng Nguyễn Văn Vịnh, Ph&oacute; Viện trưởng Viện Chiến lược ph&aacute;t triển (Bộ Kế hoạch v&agrave; Đầu tư) cho biết, nếu như v&agrave;o Thế kỷ 19, kinh tế Việt Nam ngang bằng, thậm ch&iacute; vượt nhiều quốc gia trong khu vực, thế nhưng ở thời điểm hiện tại, Việt Nam đ&atilde; tụt hậu, bị bỏ lại rất xa. Nguy&ecirc;n nh&acirc;n nằm ở đ&acirc;u? Ch&iacute;nh l&agrave; những bất cập về thể chế. Do vậy, nếu kh&ocirc;ng cải c&aacute;ch thể chế th&igrave; Việt Nam c&ograve;n bị bỏ xa hơn nữa.</p>\r\n\r\n<p>&ldquo;Th&ocirc;ng điệp quan trọng nhất của b&aacute;o c&aacute;o n&agrave;y l&agrave; đổi mới, đổi mới mạnh mẽ, li&ecirc;n tục đổi mới l&agrave; y&ecirc;u cầu quan trọng nhất để ph&aacute;t triển&rdquo;, &ocirc;ng Vịnh nhất mạnh.</p>\r\n\r\n<p>B&agrave; Phạm Thị Thu Hằng, Tổng thư k&yacute; VCCI lưu &yacute;, trước thời cơ chuyển đổi hiện nay, nếu quyết t&acirc;m nỗ lực th&igrave; trong 20 năm nữa, Việt Nam c&oacute; thể đuổi kịp được mức ph&aacute;t triển của H&agrave;n Quốc năm 2000, c&ograve;n nếu kh&ocirc;ng quyết t&acirc;m th&igrave; Việt Nam sẽ rơi v&agrave;o bẫy thu nhập trung b&igrave;nh.</p>\r\n\r\n<p>Tuy vậy, theo c&aacute;c t&aacute;c giả của bản b&aacute;o c&aacute;o, &ldquo;Việt Nam đang đứng trước bước ngoặt của cải c&aacute;ch v&agrave; ph&aacute;t triển. Thời cơ v&agrave; thuận lợi rất lớn, nhưng th&aacute;ch thức v&agrave; kh&oacute; khăn cũng kh&ocirc;ng hề nhỏ. Để đạt được kh&aacute;t vọng hướng tới một Việt Nam thịnh vượng, s&aacute;ng tạo, c&ocirc;ng bằng v&agrave; d&acirc;n chủ, lựa chọn duy nhất của ch&uacute;ng ta l&agrave; thực hiện cải c&aacute;ch dựa tr&ecirc;n c&aacute;c vấn đề n&ecirc;u tr&ecirc;n&rdquo;.</p>\r\n\r\n<p>&ldquo;Ch&uacute;ng t&ocirc;i tin rằng, những thế hệ người Việt Nam hiện nay v&agrave; tương lai chắc chắn c&oacute; đủ &yacute; ch&iacute;, bản lĩnh v&agrave; năng lực để thực hiện th&agrave;nh c&ocirc;ng c&ocirc;ng cuộc đổi mới n&agrave;y&rdquo; &ndash; bản b&aacute;o c&aacute;o kh&eacute;p lại với nhận định đầy lạc quan.</p>\r\n', '0', '1', '5');

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_post_id_foreign` (`post_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO `post_tag` VALUES ('3', '2', '1');
INSERT INTO `post_tag` VALUES ('4', '2', '2');
INSERT INTO `post_tag` VALUES ('5', '2', '3');
INSERT INTO `post_tag` VALUES ('6', '3', '1');
INSERT INTO `post_tag` VALUES ('7', '3', '2');
INSERT INTO `post_tag` VALUES ('8', '3', '4');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_id_edited` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_many` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '1', null, '4', 'new product', '', '0', '0', null, null, null, null, '2016-06-27 14:52:44', '2016-06-27 14:52:44', null, 'new-product', '<p>hihi</p>\r\n', '<p>hihi</p>\r\n', '0', '1');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('2', null, 'a', '0', '2147483647', null, '2016-05-30 10:23:47', null);
INSERT INTO `product_category` VALUES ('4', null, 'NỘI THẤT PHÒNG KHÁCH', '0', '2147483647', null, '2016-05-30 14:46:28', null);

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_tag_product_id_foreign` (`product_id`),
  KEY `product_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_tag
-- ----------------------------
INSERT INTO `product_tag` VALUES ('1', '1', '5');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Administrator', 'admin', '2016-05-29 12:34:45', '2016-05-29 12:34:45');
INSERT INTO `roles` VALUES ('2', 'Redactor', 'redac', '2016-05-29 12:34:46', '2016-05-29 12:34:46');
INSERT INTO `roles` VALUES ('3', 'User', 'user', '2016-05-29 12:34:46', '2016-05-29 12:34:46');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_unique` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '2016-05-29 12:34:47', '2016-05-29 12:34:47', 'Tag1');
INSERT INTO `tags` VALUES ('2', '2016-05-29 12:34:47', '2016-05-29 12:34:47', 'Tag2');
INSERT INTO `tags` VALUES ('3', '2016-05-29 12:34:47', '2016-05-29 12:34:47', 'Tag3');
INSERT INTO `tags` VALUES ('4', '2016-05-29 12:34:47', '2016-05-29 12:34:47', 'Tag4');
INSERT INTO `tags` VALUES ('5', '2016-06-27 14:52:44', '2016-06-27 14:52:44', 'hihi');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'GreatAdmin', 'admin@la.fr', '$2y$10$BIK.JVjMlGzUo8D968me0OBy4XXQA2Ah7QQIsXrdTsyi7uPdYraH2', '1', '1', '1', '1', null, '2016-05-29 12:34:46', '2016-06-25 09:37:45', 'AkK1y24TmgvJB3Ei2x4OCMbLZLZ2hINqJiUyOKUTES6abJm58W00mYuXQ85A');
INSERT INTO `users` VALUES ('2', 'GreatRedactor', 'redac@la.fr', '$2y$10$S9gI3sGxLzN/NS0.4aRUCeqbx5U2OJkZWo3DkiV6Prafjrl/hy/Gu', '2', '1', '1', '1', null, '2016-05-29 12:34:46', '2016-05-29 12:34:46', null);
INSERT INTO `users` VALUES ('3', 'Walker', 'walker@la.fr', '$2y$10$rUlGCB/V4LID1r5CHVAKce2Lv2vjuNEFI2ZE6ZNil3fUIxl1NvYXS', '3', '1', '0', '0', null, '2016-05-29 12:34:46', '2016-05-29 12:41:47', null);
INSERT INTO `users` VALUES ('4', 'Slacker', 'slacker@la.fr', '$2y$10$K.Q5apfWAfwMyoVQBxlx9.tPt4qA2ims.GMF0U7tFf5IoRmIUAEnm', '3', '0', '0', '1', null, '2016-05-29 12:34:47', '2016-05-29 12:34:47', null);
INSERT INTO `users` VALUES ('5', 'phanha', 'phanha@gmail.com', '$2y$10$BIK.JVjMlGzUo8D968me0OBy4XXQA2Ah7QQIsXrdTsyi7uPdYraH2', '2', '0', '1', '1', null, '2016-05-30 06:24:38', '2016-05-30 08:25:31', 'zaXMDUwEEwmMjS5l2tsa2JYQbysEdQpqSasyyvPqBpoq4LtJCT4PbGiOyCTr');
INSERT INTO `users` VALUES ('6', 'phanhahuhi', 'ha@sdf.vn', '$2y$10$i2unW5LNoo4vdkigLyw/gutmtIdLIwrPgV9IbDCLp6HDN.Sc1y0La', '3', '0', '0', '1', '1AudedTEl20gdrwpR1WAQLb9kSUtNP', '2016-06-25 09:36:35', '2016-06-25 09:38:04', 'GYG6ka36hjxtONZYDNj9hHuNQ40XjNvnfom9D15UYPOw6CXIrwxxL32Q11Gi');
