/*
 Navicat Premium Data Transfer

 Date: 04/04/2024 23:10:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for iptv_category
-- ----------------------------
DROP TABLE IF EXISTS `iptv_category`;
CREATE TABLE `iptv_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default',
  `enable` tinyint(1) NULL DEFAULT 1,
  `psw` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 801601 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iptv_category
-- ----------------------------
INSERT INTO `iptv_category` VALUES (100100, 'CCTV1', '央视频道', 1, 'CCTV1,CCTV-1,CCTV综合,CCTV-综合,中央1', NULL);
INSERT INTO `iptv_category` VALUES (100200, 'CCTV2', '央视频道', 1, 'CCTV2,CCTV-2,CCTV财经,CCTV-财经,中央2', NULL);
INSERT INTO `iptv_category` VALUES (100300, 'CCTV3', '央视频道', 1, 'CCTV3,CCTV-3,CCTV综艺,CCTV-综艺,中央3', NULL);
INSERT INTO `iptv_category` VALUES (100400, 'CCTV4', '央视频道', 1, 'CCTV4,CCTV-4,CCTV中文国际,CCTV-中文国际,中央4', NULL);
INSERT INTO `iptv_category` VALUES (100500, 'CCTV4K', '央视频道', 1, 'CCTV4K,CCTV-4K,CCTV4K50p,中央1,中央4k', NULL);
INSERT INTO `iptv_category` VALUES (100600, 'CCTV4欧洲', '央视频道', 1, 'CCTV4欧洲,CCTV-4欧洲,中央4欧洲,中文国际欧洲', NULL);
INSERT INTO `iptv_category` VALUES (100700, 'CCTV4美洲', '央视频道', 1, 'CCTV4美洲,CCTV-4美洲,中央4美洲,中文国际美洲', NULL);
INSERT INTO `iptv_category` VALUES (100800, 'CCTV5', '央视频道', 1, 'CCTV5,CCTV-5,CCTV体育,CCTV-体育,中央5', NULL);
INSERT INTO `iptv_category` VALUES (100900, 'CCTV5+', '央视频道', 1, 'CCTV5+,CCTV-5+,CCTV5P,中央5+', NULL);
INSERT INTO `iptv_category` VALUES (101000, 'CCTV6', '央视频道', 1, 'CCTV6,CCTV-6,CCTV电影,CCTV-电影,中央6', NULL);
INSERT INTO `iptv_category` VALUES (101100, 'CCTV7', '央视频道', 1, 'CCTV7,CCTV-7,CCTV国防军事,CCTV7-国防军事,中央7', NULL);
INSERT INTO `iptv_category` VALUES (101200, 'CCTV8', '央视频道', 1, 'CCTV8,CCTV-8,CCTV电视剧,CCTV-电视剧,中央8', NULL);
INSERT INTO `iptv_category` VALUES (101300, 'CCTV8K', '央视频道', 1, 'CCTV8K,CCTV-8K,中央8K', NULL);
INSERT INTO `iptv_category` VALUES (101400, 'CCTV9', '央视频道', 1, 'CCTV9,CCTV-9,CCTV纪录,CCTV-纪录,中央9', NULL);
INSERT INTO `iptv_category` VALUES (101500, 'CCTV10', '央视频道', 1, 'CCTV10,CCTV-10,CCTV科教,CCTV-科教,中央10', NULL);
INSERT INTO `iptv_category` VALUES (101600, 'CCTV11', '央视频道', 1, 'CCTV11,CCTV-11,CCTV戏曲,CCTV-戏曲,中央11', NULL);
INSERT INTO `iptv_category` VALUES (101700, 'CCTV12', '央视频道', 1, 'CCTV12,CCTV-12,CCTV社会与法,CCTV-社会与法,中央12', NULL);
INSERT INTO `iptv_category` VALUES (101800, 'CCTV13', '央视频道', 1, 'CCTV13,CCTV-13,CCTV新闻,CCTV-新闻,中央13', NULL);
INSERT INTO `iptv_category` VALUES (101900, 'CCTV14', '央视频道', 1, 'CCTV14,CCTV-14,CCTV少儿,CCTV-少儿,中央14', NULL);
INSERT INTO `iptv_category` VALUES (102000, 'CCTV15', '央视频道', 1, 'CCTV15,CCTV-15,CCTV音乐,CCTV-音乐,中央15', NULL);
INSERT INTO `iptv_category` VALUES (102100, 'CCTV16', '央视频道', 1, 'CCTV16,CCTV-16,CCTV奥林匹克,CCTV-奥林匹克,中央16', NULL);
INSERT INTO `iptv_category` VALUES (102200, 'CCTV17', '央视频道', 1, 'CCTV17,CCTV-17,CCTV农业农村,CCTV-农业农村,中央17', NULL);
INSERT INTO `iptv_category` VALUES (102300, 'CCTV风云音乐', '央视频道', 1, '风云音乐', NULL);
INSERT INTO `iptv_category` VALUES (102400, 'CCTV世界地理', '央视频道', 1, '世界地理,地理世界', NULL);
INSERT INTO `iptv_category` VALUES (102500, 'CCTV第一剧场', '央视频道', 1, '第一剧场', NULL);
INSERT INTO `iptv_category` VALUES (102600, 'CCTV风云剧场', '央视频道', 1, '风云剧场', NULL);
INSERT INTO `iptv_category` VALUES (102700, 'CCTV央视精品', '央视频道', 1, '央视精品,文化精品', NULL);
INSERT INTO `iptv_category` VALUES (102800, 'CCTV兵器科技', '央视频道', 1, '兵器科技', NULL);
INSERT INTO `iptv_category` VALUES (102900, 'CCTV风云足球', '央视频道', 1, '风云足球', NULL);
INSERT INTO `iptv_category` VALUES (103000, 'CCTV高网频道', '央视频道', 1, '高网,高尔夫', NULL);
INSERT INTO `iptv_category` VALUES (103100, 'CCTV怀旧剧场', '央视频道', 1, '怀旧剧场', NULL);
INSERT INTO `iptv_category` VALUES (103200, 'CCTV女性时尚', '央视频道', 1, '女性时尚', NULL);
INSERT INTO `iptv_category` VALUES (103300, 'CCTV央视台球', '央视频道', 1, '央视台球', NULL);
INSERT INTO `iptv_category` VALUES (103310, 'CCTV风云足球', '央视频道', 1, '风云足球', NULL);
INSERT INTO `iptv_category` VALUES (103320, 'CCTV电视指南', '央视频道', 1, '电视指南', NULL);
INSERT INTO `iptv_category` VALUES (200100, '湖南卫视', '卫视频道', 1, '湖南卫视', NULL);
INSERT INTO `iptv_category` VALUES (200200, '浙江卫视', '卫视频道', 1, '浙江卫视', NULL);
INSERT INTO `iptv_category` VALUES (200300, '江苏卫视', '卫视频道', 1, '江苏卫视', NULL);
INSERT INTO `iptv_category` VALUES (200400, '北京卫视', '卫视频道', 1, '北京卫视', NULL);
INSERT INTO `iptv_category` VALUES (200500, '东方卫视', '卫视频道', 1, '东方卫视,上海卫视', NULL);
INSERT INTO `iptv_category` VALUES (200600, '安徽卫视', '卫视频道', 1, '安徽卫视', NULL);
INSERT INTO `iptv_category` VALUES (200700, '广东卫视', '卫视频道', 1, '广东卫视', NULL);
INSERT INTO `iptv_category` VALUES (200800, '深圳卫视', '卫视频道', 1, '深圳卫视', NULL);
INSERT INTO `iptv_category` VALUES (200900, '辽宁卫视', '卫视频道', 1, '辽宁卫视', NULL);
INSERT INTO `iptv_category` VALUES (201000, '海南卫视', '卫视频道', 1, '海南卫视', NULL);
INSERT INTO `iptv_category` VALUES (201100, '山东卫视', '卫视频道', 1, '山东卫视', NULL);
INSERT INTO `iptv_category` VALUES (201200, '天津卫视', '卫视频道', 1, '天津卫视', NULL);
INSERT INTO `iptv_category` VALUES (201300, '重庆卫视', '卫视频道', 1, '重庆卫视', NULL);
INSERT INTO `iptv_category` VALUES (201400, '东南卫视', '卫视频道', 1, '东南卫视', NULL);
INSERT INTO `iptv_category` VALUES (201500, '甘肃卫视', '卫视频道', 1, '甘肃卫视', NULL);
INSERT INTO `iptv_category` VALUES (201600, '广西卫视', '卫视频道', 1, '广西卫视', NULL);
INSERT INTO `iptv_category` VALUES (201700, '贵州卫视', '卫视频道', 1, '贵州卫视', NULL);
INSERT INTO `iptv_category` VALUES (201800, '河北卫视', '卫视频道', 1, '河北卫视', NULL);
INSERT INTO `iptv_category` VALUES (201900, '黑龙江卫视', '卫视频道', 1, '黑龙卫视,黑龙江卫视', NULL);
INSERT INTO `iptv_category` VALUES (202000, '河南卫视', '卫视频道', 1, '河南卫视', NULL);
INSERT INTO `iptv_category` VALUES (202100, '湖北卫视', '卫视频道', 1, '湖北卫视', NULL);
INSERT INTO `iptv_category` VALUES (202200, '江西卫视', '卫视频道', 1, '江西卫视', NULL);
INSERT INTO `iptv_category` VALUES (202300, '吉林卫视', '卫视频道', 1, '吉林卫视', NULL);
INSERT INTO `iptv_category` VALUES (202400, '内蒙古卫视', '卫视频道', 1, '内蒙卫视,内蒙古卫视', NULL);
INSERT INTO `iptv_category` VALUES (202500, '宁夏卫视', '卫视频道', 1, '宁夏卫视', NULL);
INSERT INTO `iptv_category` VALUES (202600, '山西卫视', '卫视频道', 1, '山西卫视', NULL);
INSERT INTO `iptv_category` VALUES (202700, '陕西卫视', '卫视频道', 1, '陕西卫视', NULL);
INSERT INTO `iptv_category` VALUES (202800, '四川卫视', '卫视频道', 1, '四川卫视', NULL);
INSERT INTO `iptv_category` VALUES (202900, '新疆卫视', '卫视频道', 1, '新疆卫视', NULL);
INSERT INTO `iptv_category` VALUES (203000, '云南卫视', '卫视频道', 1, '云南卫视', NULL);
INSERT INTO `iptv_category` VALUES (203100, '厦门卫视', '卫视频道', 1, '厦门卫视', NULL);
INSERT INTO `iptv_category` VALUES (203200, '青海卫视', '卫视频道', 1, '青海卫视', NULL);
INSERT INTO `iptv_category` VALUES (203300, '西藏卫视', '卫视频道', 1, '西藏卫视', NULL);
INSERT INTO `iptv_category` VALUES (203400, '兵团卫视', '卫视频道', 1, '兵团卫视', NULL);
INSERT INTO `iptv_category` VALUES (203500, '延边卫视', '卫视频道', 1, '延边卫视', NULL);
INSERT INTO `iptv_category` VALUES (203600, '黄河卫视', '卫视频道', 1, '黄河卫视', NULL);
INSERT INTO `iptv_category` VALUES (203700, '康巴卫视', '卫视频道', 1, '康巴卫视', NULL);
INSERT INTO `iptv_category` VALUES (203710, '三沙卫视', '卫视频道', 1, '三沙卫视', NULL);
INSERT INTO `iptv_category` VALUES (203720, '大湾区卫视', '卫视频道', 1, '大湾区卫视', NULL);
INSERT INTO `iptv_category` VALUES (203800, '卡酷动画', '卫视频道', 1, '卡酷', NULL);
INSERT INTO `iptv_category` VALUES (203810, '哈哈炫动', '卫视频道', 1, '炫动', NULL);
INSERT INTO `iptv_category` VALUES (203820, '金鹰卡通', '卫视频道', 1, '金鹰卡通', NULL);
INSERT INTO `iptv_category` VALUES (203830, '嘉佳卡通', '卫视频道', 1, '嘉佳卡通', NULL);
INSERT INTO `iptv_category` VALUES (203840, '优漫卡通', '卫视频道', 1, '优漫卡通', NULL);
INSERT INTO `iptv_category` VALUES (300100, '湖南影视', '影视频道', 1, '湖南影视', NULL);
INSERT INTO `iptv_category` VALUES (300200, '浙江影视', '影视频道', 1, '浙江影视', NULL);
INSERT INTO `iptv_category` VALUES (300300, '江苏影视', '影视频道', 1, '江苏影视', NULL);
INSERT INTO `iptv_category` VALUES (300400, '北京影视', '影视频道', 1, '北京影视', NULL);
INSERT INTO `iptv_category` VALUES (300500, '东方影视', '影视频道', 1, '东方影视', NULL);
INSERT INTO `iptv_category` VALUES (300600, '安徽影视', '影视频道', 1, '安徽影视', NULL);
INSERT INTO `iptv_category` VALUES (300700, '广东影视', '影视频道', 1, '广东影视', NULL);
INSERT INTO `iptv_category` VALUES (300800, '深圳影视', '影视频道', 1, '深圳影视', NULL);
INSERT INTO `iptv_category` VALUES (300900, '辽宁影视', '影视频道', 1, '辽宁影视', NULL);
INSERT INTO `iptv_category` VALUES (301000, '海南影视', '影视频道', 1, '海南影视', NULL);
INSERT INTO `iptv_category` VALUES (301100, '山东影视', '影视频道', 1, '山东影视', NULL);
INSERT INTO `iptv_category` VALUES (301200, '天津影视', '影视频道', 1, '天津影视', NULL);
INSERT INTO `iptv_category` VALUES (301300, '重庆影视', '影视频道', 1, '重庆影视', NULL);
INSERT INTO `iptv_category` VALUES (301400, '东南影视', '影视频道', 1, '东南影视', NULL);
INSERT INTO `iptv_category` VALUES (301500, '甘肃影视', '影视频道', 1, '甘肃影视', NULL);
INSERT INTO `iptv_category` VALUES (301600, '广西影视', '影视频道', 1, '广西影视', NULL);
INSERT INTO `iptv_category` VALUES (301700, '贵州影视', '影视频道', 1, '贵州影视', NULL);
INSERT INTO `iptv_category` VALUES (301800, '河北影视', '影视频道', 1, '河北影视', NULL);
INSERT INTO `iptv_category` VALUES (301900, '黑龙江影视', '影视频道', 1, '黑龙江影视', NULL);
INSERT INTO `iptv_category` VALUES (302000, '河南影视', '影视频道', 1, '河南影视', NULL);
INSERT INTO `iptv_category` VALUES (302100, '湖北影视', '影视频道', 1, '湖北影视', NULL);
INSERT INTO `iptv_category` VALUES (302200, '江西影视', '影视频道', 1, '江西影视', NULL);
INSERT INTO `iptv_category` VALUES (302300, '吉林影视', '影视频道', 1, '吉林影视', NULL);
INSERT INTO `iptv_category` VALUES (302400, '内蒙古影视', '影视频道', 1, '内蒙古影视', NULL);
INSERT INTO `iptv_category` VALUES (302500, '宁夏影视', '影视频道', 1, '宁夏影视', NULL);
INSERT INTO `iptv_category` VALUES (302600, '山西影视', '影视频道', 1, '山西影视', NULL);
INSERT INTO `iptv_category` VALUES (302700, '陕西影视', '影视频道', 1, '陕西影视', NULL);
INSERT INTO `iptv_category` VALUES (302800, '四川影视', '影视频道', 1, '四川影视', NULL);
INSERT INTO `iptv_category` VALUES (302900, '厦门影视', '影视频道', 1, '厦门影视', NULL);
INSERT INTO `iptv_category` VALUES (303000, '新疆影视', '影视频道', 1, '新疆影视', NULL);
INSERT INTO `iptv_category` VALUES (303100, '云南影视', '影视频道', 1, '云南影视', NULL);
INSERT INTO `iptv_category` VALUES (303200, '青海影视', '影视频道', 1, '青海影视', NULL);
INSERT INTO `iptv_category` VALUES (303300, '西藏影视', '影视频道', 1, '西藏影视', NULL);
INSERT INTO `iptv_category` VALUES (400100, '中国教育1', '国教频道', 1, 'CETV1,中国教育1,CETV-1,中国教育-1', NULL);
INSERT INTO `iptv_category` VALUES (400110, '中国教育2', '国教频道', 1, 'CETV2,中国教育2,CETV-2,中国教育-2', NULL);
INSERT INTO `iptv_category` VALUES (400120, '中国教育3', '国教频道', 1, 'CETV3,中国教育3,CETV-3,中国教育-3', NULL);
INSERT INTO `iptv_category` VALUES (400130, '中国教育4', '国教频道', 1, 'CETV4,中国教育4,CETV-4,中国教育-4', NULL);
INSERT INTO `iptv_category` VALUES (400200, 'CGTN', '国教频道', 1, 'CGTN', NULL);
INSERT INTO `iptv_category` VALUES (400210, 'CGTN法语', '国教频道', 1, 'CGTN Français,CGTN法语', NULL);
INSERT INTO `iptv_category` VALUES (400220, 'CGTN俄语', '国教频道', 1, 'CGTN Русский,CGTN俄语', NULL);
INSERT INTO `iptv_category` VALUES (400230, 'CGTN阿语', '国教频道', 1, 'CGTN Arabic,CGTN阿语,CGTN阿拉伯语', NULL);
INSERT INTO `iptv_category` VALUES (400240, 'CGTN西语', '国教频道', 1, 'CGTN Español,CGTN西语,CGTN西班牙语', NULL);
INSERT INTO `iptv_category` VALUES (400250, 'CGTN纪录', '国教频道', 1, 'CGTN Documentary,CGTN记录,CGTN外语记录,CGTN纪录,CGTN外语纪录', NULL);
INSERT INTO `iptv_category` VALUES (400800, '第一财经', '数字频道', 1, '第一财经,第1财经', NULL);
INSERT INTO `iptv_category` VALUES (400900, '梨园频道', '数字频道', 1, '梨园', NULL);
INSERT INTO `iptv_category` VALUES (401000, '电竞天堂', '数字频道', 1, '电竞天堂', NULL);
INSERT INTO `iptv_category` VALUES (401100, '生活时尚', '数字频道', 1, '生活时尚', NULL);
INSERT INTO `iptv_category` VALUES (401200, '国学频道', '数字频道', 1, '国学频道', NULL);
INSERT INTO `iptv_category` VALUES (401300, '中国天气', '数字频道', 1, '中国天气', NULL);
INSERT INTO `iptv_category` VALUES (401400, '中华特产', '数字频道', 1, '中华特产', NULL);
INSERT INTO `iptv_category` VALUES (401500, '欢笑剧场', '数字频道', 1, '欢笑剧场', NULL);
INSERT INTO `iptv_category` VALUES (401600, '备用备用备用', '数字频道', 0, '备用备用备用', NULL);
INSERT INTO `iptv_category` VALUES (401700, '求索科学', '数字频道', 1, '求索科学', NULL);
INSERT INTO `iptv_category` VALUES (401800, '求索动物', '数字频道', 1, '求索动物', NULL);
INSERT INTO `iptv_category` VALUES (401900, '求索记录', '数字频道', 1, '求索记录', NULL);
INSERT INTO `iptv_category` VALUES (402000, '备用备用备用', '数字频道', 0, '备用备用备用', NULL);
INSERT INTO `iptv_category` VALUES (402100, '备用备用备用', '数字频道', 0, '备用备用备用', NULL);
INSERT INTO `iptv_category` VALUES (402200, '备用备用备用', '数字频道', 0, '备用备用备用', NULL);
INSERT INTO `iptv_category` VALUES (402300, '备用备用备用', '数字频道', 0, '备用备用备用', NULL);
INSERT INTO `iptv_category` VALUES (402400, '彩民在线', '数字频道', 1, '彩民在线', NULL);
INSERT INTO `iptv_category` VALUES (402500, '法律服务', '数字频道', 1, '法律服务', NULL);
INSERT INTO `iptv_category` VALUES (402600, '留学世界', '数字频道', 1, '留学世界', NULL);
INSERT INTO `iptv_category` VALUES (402700, '青年学苑', '数字频道', 1, '青年学苑', NULL);
INSERT INTO `iptv_category` VALUES (402800, '摄影频道', '数字频道', 1, '摄影频道', NULL);
INSERT INTO `iptv_category` VALUES (402900, '天元围棋', '数字频道', 1, '天元围棋', NULL);
INSERT INTO `iptv_category` VALUES (403000, '现代女性', '数字频道', 1, '现代女性', NULL);
INSERT INTO `iptv_category` VALUES (403100, '早期教育', '数字频道', 1, '早期教育', NULL);
INSERT INTO `iptv_category` VALUES (403200, '证券资讯', '数字频道', 1, '证券资讯', NULL);
INSERT INTO `iptv_category` VALUES (403300, '备用备用备用', '数字频道', 0, '备用备用备用', NULL);
INSERT INTO `iptv_category` VALUES (403400, '茶频道', '数字频道', 1, '茶频', NULL);
INSERT INTO `iptv_category` VALUES (403500, '武术世界', '数字频道', 1, '武术世界', NULL);
INSERT INTO `iptv_category` VALUES (403600, '发现之旅', '数字频道', 1, '发现之旅', NULL);
INSERT INTO `iptv_category` VALUES (403700, '环球奇观', '数字频道', 1, '环球奇观', NULL);
INSERT INTO `iptv_category` VALUES (403800, '文物宝库', '数字频道', 1, '文物宝库', NULL);
INSERT INTO `iptv_category` VALUES (403900, '新科动漫', '数字频道', 1, '新科动漫', NULL);
INSERT INTO `iptv_category` VALUES (404000, '幼儿教育', '数字频道', 1, '幼儿教育', NULL);
INSERT INTO `iptv_category` VALUES (404100, '老故事', '数字频道', 1, '老故事', NULL);
INSERT INTO `iptv_category` VALUES (404200, '快乐垂钓', '数字频道', 1, '快乐垂钓', NULL);
INSERT INTO `iptv_category` VALUES (404300, '书画频道', '数字频道', 1, '书画频道', NULL);
INSERT INTO `iptv_category` VALUES (404400, '先锋乒羽', '数字频道', 1, '先锋乒羽', NULL);
INSERT INTO `iptv_category` VALUES (404500, '车迷频道', '数字频道', 1, '车迷频道', NULL);
INSERT INTO `iptv_category` VALUES (404600, '优优宝贝', '数字频道', 1, '优优宝贝', NULL);
INSERT INTO `iptv_category` VALUES (404700, '四海钓鱼', '数字频道', 1, '四海钓鱼', NULL);
INSERT INTO `iptv_category` VALUES (404800, '动感音乐', '数字频道', 1, '动感音乐', NULL);
INSERT INTO `iptv_category` VALUES (404900, '环球旅游', '数字频道', 1, '环球旅游', NULL);
INSERT INTO `iptv_category` VALUES (405000, '新娱乐', '数字频道', 1, '新娱乐', NULL);
INSERT INTO `iptv_category` VALUES (405100, '京视剧场', '数字频道', 1, '京视剧场', NULL);
INSERT INTO `iptv_category` VALUES (405200, '弈坛春秋', '数字频道', 1, '弈坛春秋', NULL);
INSERT INTO `iptv_category` VALUES (405300, '央广健康', '数字频道', 1, '央广健康', NULL);
INSERT INTO `iptv_category` VALUES (405400, '时代家居', '数字频道', 1, '时代家居', NULL);
INSERT INTO `iptv_category` VALUES (405500, '时代出行', '数字频道', 1, '时代出行', NULL);
INSERT INTO `iptv_category` VALUES (405600, '时代风尚', '数字频道', 1, '时代风尚', NULL);
INSERT INTO `iptv_category` VALUES (405700, '财富天下', '数字频道', 1, '财富天下', NULL);
INSERT INTO `iptv_category` VALUES (405800, '百姓健康', '数字频道', 1, '百姓健康', NULL);
INSERT INTO `iptv_category` VALUES (405900, '精品剧场', '数字频道', 1, '精品剧场', NULL);
INSERT INTO `iptv_category` VALUES (406000, '少儿动漫', '数字频道', 1, '少儿动漫', NULL);
INSERT INTO `iptv_category` VALUES (406100, '游戏风云', '数字频道', 1, '游戏风云', NULL);
INSERT INTO `iptv_category` VALUES (500100, '凤凰中文', '港澳频道', 1, '凤凰中文,凤凰卫视', NULL);
INSERT INTO `iptv_category` VALUES (500200, '凤凰资讯', '港澳频道', 1, '凤凰资讯,凤凰-资讯,凤凰卫视资讯', NULL);
INSERT INTO `iptv_category` VALUES (500300, '凤凰香港', '港澳频道', 1, '凤凰香港', NULL);
INSERT INTO `iptv_category` VALUES (500400, '翡翠台', '港澳频道', 1, '翡翠台', NULL);
INSERT INTO `iptv_category` VALUES (500500, '明珠台', '港澳频道', 1, '明珠台', NULL);
INSERT INTO `iptv_category` VALUES (500600, '天映经典', '港澳频道', 1, '天映经典,天映頻道', NULL);
INSERT INTO `iptv_category` VALUES (500700, 'TVBS亚洲台', '港澳频道', 1, 'TVBS亚洲台', NULL);
INSERT INTO `iptv_category` VALUES (500800, 'HBO FAMILY', '港澳频道', 1, 'HBO FAMILY HD', NULL);
INSERT INTO `iptv_category` VALUES (500900, 'SHOWTIME FAMILY ZONE', '港澳频道', 1, 'SHOWTIME FAMILY ZONE HD', NULL);
INSERT INTO `iptv_category` VALUES (600100, 'CHC家庭影院', '电影频道', 1, 'CHC家庭影院,CHC-家庭影院', NULL);
INSERT INTO `iptv_category` VALUES (600200, 'CHC动作电影', '电影频道', 1, 'CHC动作电影,CHC-动作电影', NULL);
INSERT INTO `iptv_category` VALUES (600300, 'CHC高清电影', '电影频道', 1, 'CHC高清电影,CHC-高清电影', NULL);
INSERT INTO `iptv_category` VALUES (600400, '东森电影', '电影频道', 1, '东森电影,東森電影', NULL);
INSERT INTO `iptv_category` VALUES (600500, '美亚电影', '电影频道', 1, '美亚电影,美亞電影', NULL);
INSERT INTO `iptv_category` VALUES (600600, '科幻电影', '电影频道', 1, '科幻电影,爱科幻', NULL);
INSERT INTO `iptv_category` VALUES (600700, '星空卫视', '电影频道', 1, '星空卫视', NULL);
INSERT INTO `iptv_category` VALUES (600800, '华语影院', '电影频道', 1, '华语影院', NULL);
INSERT INTO `iptv_category` VALUES (600900, '邵氏影院', '电影频道', 1, '邵氏影院', NULL);
INSERT INTO `iptv_category` VALUES (601000, '欧美影院', '电影频道', 1, '欧美影院', NULL);
INSERT INTO `iptv_category` VALUES (700100, '刘德华', '明星频道', 1, '刘德华,华子系列', NULL);
INSERT INTO `iptv_category` VALUES (700200, '成龙', '明星频道', 1, '成龙,成龙系列,【成龙经典】动作', NULL);
INSERT INTO `iptv_category` VALUES (700300, '周星驰', '明星频道', 1, '周星驰,星爷经典-百看不厌', NULL);
INSERT INTO `iptv_category` VALUES (700400, '李连杰', '明星频道', 0, '李连杰', NULL);
INSERT INTO `iptv_category` VALUES (700500, '林正英', '明星频道', 1, '林正英,英叔僵尸 3000部,林正英 僵尸 鬼片,林正英经典,国内玄幻电影-林正英', NULL);
INSERT INTO `iptv_category` VALUES (700600, '洪金宝', '明星频道', 1, '洪金宝,洪金宝福星系列', NULL);
INSERT INTO `iptv_category` VALUES (700700, '周润发', '明星频道', 1, '周润发,发哥系列', NULL);
INSERT INTO `iptv_category` VALUES (700800, '甄子丹', '明星频道', 0, '甄子丹', NULL);
INSERT INTO `iptv_category` VALUES (700900, '胡军', '明星频道', 0, '胡军', NULL);
INSERT INTO `iptv_category` VALUES (701000, '任达华', '明星频道', 0, '任达华', NULL);
INSERT INTO `iptv_category` VALUES (701100, '沈腾', '明星频道', 0, '沈腾', NULL);
INSERT INTO `iptv_category` VALUES (701200, '刘家辉', '明星频道', 0, '刘家辉', NULL);
INSERT INTO `iptv_category` VALUES (701300, '黄渤', '明星频道', 0, '黄渤', NULL);
INSERT INTO `iptv_category` VALUES (800100, '恐怖港片', '主题频道', 1, '恐怖港片,绝版电影 港片女鬼,恐怖电影', NULL);
INSERT INTO `iptv_category` VALUES (800200, '经典港片', '主题频道', 1, '经典港片,港片电影,经典港片 3000部,【港台】鬼片 惊悚 喜剧,经典港片电影', NULL);
INSERT INTO `iptv_category` VALUES (800300, '看电视剧', '主题频道', 1, '经典电影 电视剧,24小时循环播电视剧', NULL);
INSERT INTO `iptv_category` VALUES (800400, '玄幻系列', '主题频道', 1, '玄幻系列,玄幻电影', NULL);
INSERT INTO `iptv_category` VALUES (800500, '警匪系列', '主题频道', 1, '警匪系列,大家都在看的警匪片,机场超燃警匪片', NULL);
INSERT INTO `iptv_category` VALUES (800600, '搞笑喜剧', '主题频道', 1, '搞笑喜剧,热门喜剧,经典搞笑影片,喜剧闹翻天,最新喜剧电影', NULL);
INSERT INTO `iptv_category` VALUES (800700, '动作大片', '主题频道', 1, '动作大片,国产动作电影,国产大片电影,热血动作片合集,高分动作大片-热血出击,精彩动作电影,国外最强动作大片', NULL);
INSERT INTO `iptv_category` VALUES (800800, '惊悚恐怖', '主题频道', 1, '惊悚恐怖,深夜惊悚大片,欧美惊悚', NULL);
INSERT INTO `iptv_category` VALUES (800900, '科幻大片', '主题频道', 1, '科幻大片,国外科幻,科幻电影', NULL);
INSERT INTO `iptv_category` VALUES (801000, '末日系列', '主题频道', 1, '末日系列', NULL);
INSERT INTO `iptv_category` VALUES (801100, '战警系列', '主题频道', 1, '战警系列', NULL);
INSERT INTO `iptv_category` VALUES (801200, '美国队长', '主题频道', 1, '美国队长', NULL);
INSERT INTO `iptv_category` VALUES (801300, '变形金刚', '主题频道', 1, '变形金刚', NULL);
INSERT INTO `iptv_category` VALUES (801400, '看侏罗纪', '主题频道', 1, '侏罗纪公园', NULL);
INSERT INTO `iptv_category` VALUES (801500, '速度激情', '主题频道', 1, '速度与激情', NULL);
INSERT INTO `iptv_category` VALUES (801600, '漫威英雄', '主题频道', 1, '漫威,美国超级英雄', NULL);

-- ----------------------------
-- Table structure for iptv_channels
-- ----------------------------
DROP TABLE IF EXISTS `iptv_channels`;
CREATE TABLE `iptv_channels`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `width` int(5) NULL DEFAULT NULL,
  `height` int(5) NULL DEFAULT NULL,
  `frame` decimal(5, 2) NULL DEFAULT NULL,
  `speed` decimal(5, 2) NULL DEFAULT NULL,
  `sign` int(1) NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iptv_hotels
-- ----------------------------
DROP TABLE IF EXISTS `iptv_hotels`;
CREATE TABLE `iptv_hotels`  (
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店IP',
  `port` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP和端口',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `count` int(3) NULL DEFAULT NULL COMMENT '频道数量',
  `status` int(2) NULL DEFAULT NULL COMMENT '有效状态',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iptv_hotels
-- ----------------------------
INSERT INTO `iptv_hotels` VALUES ('1.197.248.241', '9901', '中国河南省漯河市召陵区【电信】', 37, 1, '2024-04-03 23:55:12');
INSERT INTO `iptv_hotels` VALUES ('101.224.32.23', '9901', '扫描检查更新酒店源', 1, 1, '2024-04-04 23:01:31');
INSERT INTO `iptv_hotels` VALUES ('101.66.194.26', '9901', '扫描检查更新酒店源', 1, 1, '2024-04-04 23:03:55');
INSERT INTO `iptv_hotels` VALUES ('110.53.191.212', '9901', '中国湖南省长沙市望城区【联通】', 35, 1, '2024-04-03 23:45:59');
INSERT INTO `iptv_hotels` VALUES ('110.80.17.38', '9901', '中国福建省厦门市思明区【电信】', 43, 1, '2024-04-03 23:42:41');
INSERT INTO `iptv_hotels` VALUES ('112.101.78.50', '9901', '中国黑龙江省佳木斯市富锦市【电信】', 42, 1, '2024-04-03 23:38:40');
INSERT INTO `iptv_hotels` VALUES ('112.123.155.153', '9901', '中国安徽省宣城市泾县【联通】', 11, 1, '2024-04-03 23:53:34');
INSERT INTO `iptv_hotels` VALUES ('112.243.227.131', '9901', '中国山东省潍坊市寿光市【联通】', 36, 1, '2024-04-03 23:45:40');
INSERT INTO `iptv_hotels` VALUES ('112.244.70.118', '9901', '中国山东省潍坊市寿光市【联通】', 35, 1, '2024-04-03 23:57:58');
INSERT INTO `iptv_hotels` VALUES ('112.6.117.141', '9901', '中国山东省青岛市【移动】', 39, 1, '2024-04-03 23:42:59');
INSERT INTO `iptv_hotels` VALUES ('112.99.195.122', '9901', '中国黑龙江省双鸭山市宝清县【电信】', 41, 1, '2024-04-03 23:40:10');
INSERT INTO `iptv_hotels` VALUES ('113.15.185.39', '8181', '中国广西壮族自治区北海市合浦县【电信】', 61, 1, '2024-04-03 23:35:54');
INSERT INTO `iptv_hotels` VALUES ('113.25.252.226', '9901', '中国山西省晋中市寿阳县【电信】', 37, 1, '2024-04-03 23:43:37');
INSERT INTO `iptv_hotels` VALUES ('113.59.31.111', '9901', '中国海南省三亚市吉阳区【联通】', 44, 1, '2024-04-03 23:40:58');
INSERT INTO `iptv_hotels` VALUES ('115.231.206.106', '10800', '中国浙江省绍兴市【电信】【华视美达】-', 50, 2, '2024-01-15 18:00:00');
INSERT INTO `iptv_hotels` VALUES ('117.81.149.227', '9901', '中国江苏省苏州市昆山市【电信】', 46, 1, '2024-04-03 23:38:20');
INSERT INTO `iptv_hotels` VALUES ('119.51.57.223', '9901', '中国吉林省长春市绿园区【联通】', 33, 1, '2024-04-03 23:49:17');
INSERT INTO `iptv_hotels` VALUES ('119.62.29.21', '9901', '中国云南省昆明市五华区【联通】', 45, 1, '2024-04-03 23:54:00');
INSERT INTO `iptv_hotels` VALUES ('121.19.134.48', '808', '中国河北省保定市涿州市【联通】', 67, 1, '2024-04-03 23:57:16');
INSERT INTO `iptv_hotels` VALUES ('123.118.54.74', '9901', '扫描检查更新酒店源', 1, 1, '2024-04-04 23:10:08');
INSERT INTO `iptv_hotels` VALUES ('124.116.183.146', '9901', '中国陕西省咸阳市泾阳县【电信】', 25, 1, '2024-04-03 23:52:14');
INSERT INTO `iptv_hotels` VALUES ('180.136.237.233', '9901', '中国广西壮族自治区南宁市【电信】', 0, 1, '2024-04-03 23:50:14');
INSERT INTO `iptv_hotels` VALUES ('219.128.121.202', '59901', '无效IP和端口', 0, 0, '2024-04-03 23:51:14');
INSERT INTO `iptv_hotels` VALUES ('219.144.185.82', '9901', '无效IP和端口', 0, 0, '2024-04-03 23:44:39');
INSERT INTO `iptv_hotels` VALUES ('219.159.194.21', '8181', '中国广西壮族自治区北海市合浦县【电信】', 67, 1, '2024-04-03 23:36:38');
INSERT INTO `iptv_hotels` VALUES ('220.182.45.198', '20088', '无效IP和端口', 0, 0, '2024-04-03 23:39:19');
INSERT INTO `iptv_hotels` VALUES ('221.1.210.106', '8053', '无效IP和端口', 0, 0, '2024-04-03 23:57:41');
INSERT INTO `iptv_hotels` VALUES ('221.213.70.18', '9901', '中国云南省昆明市官渡区【联通】', 48, 1, '2024-04-03 23:37:41');
INSERT INTO `iptv_hotels` VALUES ('221.226.4.10', '9901', '中国江苏省南京市【电信】', 30, 1, '2024-04-03 23:47:39');
INSERT INTO `iptv_hotels` VALUES ('222.173.134.150', '8888', '无效IP和端口', 0, 0, '2024-04-03 23:58:20');
INSERT INTO `iptv_hotels` VALUES ('222.218.158.59', '8181', '无效IP和端口', 0, 0, '2024-04-03 23:34:54');
INSERT INTO `iptv_hotels` VALUES ('222.218.159.49', '8181', '中国广西壮族自治区北海市合浦县【电信】', 0, 1, '2024-04-03 23:35:13');
INSERT INTO `iptv_hotels` VALUES ('222.240.187.134', '10999', '中国湖南省长沙市芙蓉区【电信】', 38, 1, '2024-04-03 23:47:20');
INSERT INTO `iptv_hotels` VALUES ('222.92.7.170', '3333', '无效IP和端口', 0, 0, '2024-04-03 23:54:21');
INSERT INTO `iptv_hotels` VALUES ('36.136.38.32', '9901', '中国广西壮族自治区南宁市【移动】', 33, 1, '2024-04-03 23:48:16');
INSERT INTO `iptv_hotels` VALUES ('36.136.77.71', '9901', '中国广西壮族自治区南宁市江南区【移动】', 37, 1, '2024-04-03 23:48:40');
INSERT INTO `iptv_hotels` VALUES ('36.248.137.69', '60033', '中国福建省宁德市周宁县【联通】', 48, 1, '2024-04-03 23:37:18');
INSERT INTO `iptv_hotels` VALUES ('36.249.165.157', '9901', '无效IP和端口', 0, 0, '2024-04-03 23:46:19');
INSERT INTO `iptv_hotels` VALUES ('36.96.38.246', '8888', '中国江西省鹰潭市【电信】【华视美达】-', 57, 2, '2024-01-15 18:00:00');
INSERT INTO `iptv_hotels` VALUES ('42.49.189.17', '9008', '无效IP和端口', 0, 0, '2024-04-03 23:52:38');
INSERT INTO `iptv_hotels` VALUES ('58.210.23.42', '9901', '中国江苏省苏州市昆山市【电信】', 0, 1, '2024-04-03 23:44:15');
INSERT INTO `iptv_hotels` VALUES ('58.220.219.14', '9901', '无效IP和端口', 0, 0, '2024-04-03 23:41:21');
INSERT INTO `iptv_hotels` VALUES ('59.62.8.250', '9901', '中国江西省萍乡市芦溪县【电信】', 0, 1, '2024-04-03 23:44:00');
INSERT INTO `iptv_hotels` VALUES ('60.174.40.117', '9901', '中国安徽省池州市东至县【电信】', 45, 1, '2024-04-03 23:42:22');
INSERT INTO `iptv_hotels` VALUES ('61.163.181.78', '9901', '无效IP和端口', 0, 0, '2024-04-03 23:49:41');
INSERT INTO `iptv_hotels` VALUES ('61.170.164.195', '9901', '中国上海市长宁区【电信】', 32, 1, '2024-04-03 23:50:29');

-- ----------------------------
-- Table structure for iptv_multicast
-- ----------------------------
DROP TABLE IF EXISTS `iptv_multicast`;
CREATE TABLE `iptv_multicast`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '组播ID',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `isp` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营商',
  `udpxy` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'udpxy',
  `lines` int(3) NULL DEFAULT NULL COMMENT '线路数',
  `path` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `status` int(3) NULL DEFAULT NULL COMMENT '有效状态：0-无效，1-有效',
  `time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3501 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iptv_multicast
-- ----------------------------
INSERT INTO `iptv_multicast` VALUES (1010, '中国', '广西', '南宁市,南宁市', '电信', 'http://222.217.124.67:8899,http://116.252.28.126:9099', 2, 'source/multicast/广西-电信-239.81.0.m3u', 1, '2024-04-04 01:20:03');
INSERT INTO `iptv_multicast` VALUES (1020, '中国', '江苏', '南京市,苏州市,苏州市', '电信', 'http://58.212.111.248:8888,http://117.83.105.208:7777,http://117.83.105.234:7777', 3, 'source/multicast/江苏-电信-239.49.8.m3u', 1, '2024-04-04 01:31:17');
INSERT INTO `iptv_multicast` VALUES (1030, '中国', '上海', '', '电信', '', 0, 'source/multicast/上海-电信-239.45.1.m3u', 0, '2024-04-04 01:35:19');
INSERT INTO `iptv_multicast` VALUES (1040, '中国', '云南', '', '电信', '', 0, 'source/multicast/云南-电信-239.200.201.m3u', 0, '2024-04-04 01:36:22');
INSERT INTO `iptv_multicast` VALUES (1050, '中国', '北京', '北京市,北京市,北京市', '联通', 'http://222.129.37.111:9001,http://125.34.18.213:7777,http://111.193.226.9:8888', 3, 'source/multicast/北京-联通-239.3.1.txt', 1, '2024-04-04 01:36:22');
INSERT INTO `iptv_multicast` VALUES (1053, '中国', '北京', '北京市,北京市,北京市', '移动', 'http://117.133.95.38:8887,http://120.244.86.251:7777,http://223.72.33.118:2222', 3, 'source/multicast/北京-移动-228.1.1.txt', 1, '2024-04-04 01:36:22');
INSERT INTO `iptv_multicast` VALUES (1061, '中国', '四川', '', '电信', '', 0, 'source/multicast/四川-电信-239.93.0.txt', 0, '2024-04-04 01:39:02');
INSERT INTO `iptv_multicast` VALUES (1070, '中国', '天津', '', '联通', '', 0, 'source/multicast/天津-联通-225.1.1.txt', 0, '2024-04-04 01:43:03');
INSERT INTO `iptv_multicast` VALUES (1080, '中国', '安徽', '马鞍山市', '电信', 'http://61.190.129.195:8686', 1, 'source/multicast/安徽-电信-238.1.78.m3u', 1, '2024-04-04 01:49:42');
INSERT INTO `iptv_multicast` VALUES (1090, '中国', '山东', '青岛市', '联通', 'http://112.226.231.152:11111', 1, 'source/multicast/山东-联通-239.253.254.m3u', 1, '2024-04-04 01:54:24');
INSERT INTO `iptv_multicast` VALUES (1092, '中国', '山东', '', '联通', '', 0, 'source/multicast/山东-联通-239.253.248.txt', 0, '2024-04-04 01:57:23');
INSERT INTO `iptv_multicast` VALUES (1095, '中国', '山东', '济宁市,潍坊市,青岛市', '电信', 'http://144.52.199.223:18888,http://182.46.8.252:8686,http://123.168.95.193:4000', 3, 'source/multicast/山东-电信-239.21.1.txt', 1, '2024-04-04 02:12:40');
INSERT INTO `iptv_multicast` VALUES (1100, '中国', '山西', '', '电信', '', 0, 'source/multicast/山西-电信-239.1.1.m3u', 0, '2024-04-04 02:19:10');
INSERT INTO `iptv_multicast` VALUES (1105, '中国', '山西', '太原市,太原市,太原市', '联通', 'http://118.81.46.45:40000,http://171.120.109.234:8085,http://61.240.39.46:8085', 3, 'source/multicast/山西-联通-226.0.2.m3u', 1, '2024-04-04 02:28:17');
INSERT INTO `iptv_multicast` VALUES (1201, '中国', '广东', '茂名市,中山市,广州市', '电信', 'http://183.44.113.194:4999,http://113.104.4.54:4500,http://116.21.121.232:8000', 3, 'source/multicast/广东-电信-239.77.1.txt', 1, '2024-04-04 02:28:17');
INSERT INTO `iptv_multicast` VALUES (1205, '中国', '广东', '', '移动', '', 0, 'source/multicast/广东-移动-239.20.0.m3u', 0, '2024-04-04 02:30:58');
INSERT INTO `iptv_multicast` VALUES (1300, '中国', '江西', '', '电信', '', 0, 'source/multicast/江西-电信-239.252.220.m3u', 0, '2024-04-04 02:30:58');
INSERT INTO `iptv_multicast` VALUES (1400, '中国', '河北', '', '电信', '', 0, 'source/multicast/河北-电信-239.254.200.txt', 0, '2024-04-04 02:30:58');
INSERT INTO `iptv_multicast` VALUES (1405, '中国', '河北', '保定市,廊坊市', '联通', 'http://60.4.3.23:8888,http://119.251.120.37:4000', 2, 'source/multicast/河北-联通-239.253.92.m3u', 1, '2024-04-04 02:41:27');
INSERT INTO `iptv_multicast` VALUES (1500, '中国', '河南', '信阳市,郑州市', '联通', 'http://221.15.7.122:8888,http://42.236.163.2:8888', 2, 'source/multicast/河南-联通-225.1.4.m3u', 1, '2024-04-04 02:51:56');
INSERT INTO `iptv_multicast` VALUES (1600, '中国', '浙江', '杭州市,杭州市,杭州市', '电信', 'http://60.177.38.25:82,http://115.193.163.28:8888,http://122.224.232.218:8888', 3, 'source/multicast/浙江-电信-233.50.200.txt', 1, '2024-04-04 03:05:20');
INSERT INTO `iptv_multicast` VALUES (1700, '中国', '湖北', '孝感市,武汉市,天门市', '电信', 'http://27.23.90.37:8889,http://219.140.109.168:8888,http://119.101.65.72:8888', 3, 'source/multicast/湖北-电信-239.69.1.m3u', 1, '2024-04-04 03:18:17');
INSERT INTO `iptv_multicast` VALUES (1800, '中国', '湖南', '', '电信', '', 0, 'source/multicast/湖南-电信-239.1.0.m3u', 0, '2024-04-04 03:20:25');
INSERT INTO `iptv_multicast` VALUES (1900, '中国', '福建', '厦门市,厦门市', '电信', 'http://120.41.125.130:8888,http://120.41.124.126:8888', 2, 'source/multicast/福建-电信-239.61.3.m3u', 1, '2024-04-04 03:25:58');
INSERT INTO `iptv_multicast` VALUES (2000, '中国', '辽宁', '', '联通', '', 0, 'source/multicast/辽宁-联通-232.0.0.txt', 0, '2024-04-04 03:30:08');
INSERT INTO `iptv_multicast` VALUES (2005, '中国', '辽宁', '', '电信', '', 0, 'source/multicast/辽宁-电信-239.33.5.txt', 0, '2024-04-04 03:30:44');
INSERT INTO `iptv_multicast` VALUES (2008, '中国', '辽宁', '', '移动', '', 0, 'source/multicast/辽宁-移动-232.11.0.m3u', 0, '2024-04-04 03:30:44');
INSERT INTO `iptv_multicast` VALUES (2100, '中国', '重庆', '', '联通', '', 0, 'source/multicast/重庆-联通-225.0.4.m3u', 0, '2024-04-04 03:37:58');
INSERT INTO `iptv_multicast` VALUES (2200, '中国', '陕西', '', '电信', '', 0, 'source/multicast/陕西-电信-239.112.205.m3u', 0, '2024-04-04 03:43:28');
INSERT INTO `iptv_multicast` VALUES (2300, '中国', '吉林', '', '电信', '', 0, 'source/multicast/吉林-电信-239.37.0.txt', 0, '2024-04-04 03:43:28');
INSERT INTO `iptv_multicast` VALUES (2400, '中国', '甘肃', '', '电信', '', 0, 'source/multicast/甘肃-电信-239.255.30.txt', 0, '2024-04-04 03:45:48');
INSERT INTO `iptv_multicast` VALUES (2500, '中国', '新疆', '', '电信', '', 0, 'source/multicast/新疆-电信-238.125.1.txt', 0, '2024-04-04 03:45:48');
INSERT INTO `iptv_multicast` VALUES (2600, '中国', '内蒙古', '包头市,通辽市', '电信', 'http://111.127.88.91:8888,http://1.183.176.61:8282', 2, 'source/multicast/内蒙古-电信-239.29.0.txt', 1, '2024-04-04 03:50:21');
INSERT INTO `iptv_multicast` VALUES (2605, '中国', '内蒙古', '', '联通', '', 0, 'source/multicast/内蒙古-联通-239.125.1.txt', 0, '2024-04-04 03:50:37');
INSERT INTO `iptv_multicast` VALUES (2700, '中国', '黑龙江', '', '联通', '', 0, 'source/multicast/黑龙江-联通-229.58.190.txt', 0, '2024-04-04 03:51:36');
INSERT INTO `iptv_multicast` VALUES (2800, '中国', '海南', '海口市', '电信', 'http://36.101.6.96:554', 1, 'source/multicast/海南-电信-239.253.64.txt', 1, '2024-04-04 03:53:31');
INSERT INTO `iptv_multicast` VALUES (2900, '中国', '贵州', '', '电信', '', 0, 'source/multicast/贵州-电信-238.255.2.txt', 0, '2024-04-04 03:53:34');
INSERT INTO `iptv_multicast` VALUES (3000, '中国', '青海', '', '电信', '', 0, 'source/multicast/青海-电信-239.120.1.txt', 0, '2024-04-04 03:53:34');
INSERT INTO `iptv_multicast` VALUES (3100, '中国', '宁夏', '', '电信', '', 0, 'source/multicast/宁夏-电信-239.121.4.txt', 0, '2024-04-04 03:53:34');
INSERT INTO `iptv_multicast` VALUES (3200, '中国', '西藏', '', '', '', 0, '', 0, '2024-03-10 17:21:55');
INSERT INTO `iptv_multicast` VALUES (3300, '中国', '香港', '', '', '', 0, '', 0, '2024-03-10 17:22:30');
INSERT INTO `iptv_multicast` VALUES (3400, '中国', '澳门', '', '', '', 0, '', 0, '2024-03-10 17:53:59');
INSERT INTO `iptv_multicast` VALUES (3500, '中国', '台湾', '', '电信', '', 0, 'source/multicast/台湾-电信-224.1.4.txt', 0, '2024-04-04 03:53:34');

-- ----------------------------
-- Table structure for iptv_province
-- ----------------------------
DROP TABLE IF EXISTS `iptv_province`;
CREATE TABLE `iptv_province`  (
  `prov_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prov_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prov_alias` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`prov_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iptv_province
-- ----------------------------
INSERT INTO `iptv_province` VALUES ('110000', '北京市', '北京');
INSERT INTO `iptv_province` VALUES ('120000', '天津市', '天津');
INSERT INTO `iptv_province` VALUES ('130000', '河北省', '河北');
INSERT INTO `iptv_province` VALUES ('140000', '山西省', '山西');
INSERT INTO `iptv_province` VALUES ('150000', '内蒙古自治区', '内蒙古');
INSERT INTO `iptv_province` VALUES ('210000', '辽宁省', '辽宁');
INSERT INTO `iptv_province` VALUES ('220000', '吉林省', '吉林');
INSERT INTO `iptv_province` VALUES ('230000', '黑龙江省', '黑龙江');
INSERT INTO `iptv_province` VALUES ('310000', '上海市', '上海');
INSERT INTO `iptv_province` VALUES ('320000', '江苏省', '江苏');
INSERT INTO `iptv_province` VALUES ('330000', '浙江省', '浙江');
INSERT INTO `iptv_province` VALUES ('340000', '安徽省', '安徽');
INSERT INTO `iptv_province` VALUES ('350000', '福建省', '福建');
INSERT INTO `iptv_province` VALUES ('360000', '江西省', '江西');
INSERT INTO `iptv_province` VALUES ('370000', '山东省', '山东');
INSERT INTO `iptv_province` VALUES ('410000', '河南省', '河南');
INSERT INTO `iptv_province` VALUES ('420000', '湖北省', '湖北');
INSERT INTO `iptv_province` VALUES ('430000', '湖南省', '湖南');
INSERT INTO `iptv_province` VALUES ('440000', '广东省', '广东');
INSERT INTO `iptv_province` VALUES ('450000', '广西壮族自治区', '广西');
INSERT INTO `iptv_province` VALUES ('460000', '海南省', '海南');
INSERT INTO `iptv_province` VALUES ('500000', '重庆市', '重庆');
INSERT INTO `iptv_province` VALUES ('510000', '四川省', '四川');
INSERT INTO `iptv_province` VALUES ('520000', '贵州省', '贵州');
INSERT INTO `iptv_province` VALUES ('530000', '云南省', '云南');
INSERT INTO `iptv_province` VALUES ('540000', '西藏自治区', '西藏');
INSERT INTO `iptv_province` VALUES ('610000', '陕西省', '陕西');
INSERT INTO `iptv_province` VALUES ('620000', '甘肃省', '甘肃');
INSERT INTO `iptv_province` VALUES ('630000', '青海省', '青海');
INSERT INTO `iptv_province` VALUES ('640000', '宁夏回族自治区', '宁夏');
INSERT INTO `iptv_province` VALUES ('650000', '新疆维吾尔自治区', '新疆');
INSERT INTO `iptv_province` VALUES ('700000', '台湾省', '台湾');
INSERT INTO `iptv_province` VALUES ('710000', '香港特别行政区', '香港');
INSERT INTO `iptv_province` VALUES ('720000', '澳门特别行政区', '澳门');

-- ----------------------------
-- Table structure for iptv_udpxy
-- ----------------------------
DROP TABLE IF EXISTS `iptv_udpxy`;
CREATE TABLE `iptv_udpxy`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理id',
  `mid` int(11) NULL DEFAULT NULL COMMENT '组播id',
  `mcast` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组播归属',
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理城市',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'udpxy IP',
  `port` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'udpxy 端口',
  `actv` int(3) NULL DEFAULT NULL COMMENT '客户端数',
  `status` int(3) NULL DEFAULT NULL COMMENT '有效状态：0-无效，1-有效',
  `time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iptv_udpxy
-- ----------------------------
INSERT INTO `iptv_udpxy` VALUES ('1.171.0.232_8888_tcp', 3500, '台湾-电信', '新竹市', '1.171.0.232', '8888', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('1.171.11.72_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.11.72', '8888', 0, 0, '2024-04-04 01:08:17');
INSERT INTO `iptv_udpxy` VALUES ('1.171.12.145_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.12.145', '8888', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('1.171.12.171_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.12.171', '8888', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('1.171.13.101_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.13.101', '8888', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('1.171.13.46_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.13.46', '8888', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('1.171.13.99_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.13.99', '8888', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('1.171.8.81_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.8.81', '8888', 0, 0, '2024-04-04 01:09:58');
INSERT INTO `iptv_udpxy` VALUES ('1.171.9.69_8888_tcp', 3500, '台湾-电信', '新竹县', '1.171.9.69', '8888', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('1.183.176.61_8282_tcp', 2600, '内蒙古-电信', '通辽市', '1.183.176.61', '8282', 1, 1, '2024-04-04 00:42:36');
INSERT INTO `iptv_udpxy` VALUES ('1.183.178.186_8282_tcp', 2600, '内蒙古-电信', '通辽市', '1.183.178.186', '8282', 0, 0, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('1.189.162.203_8903_tcp', 2700, '黑龙江-联通', '哈尔滨市', '1.189.162.203', '8903', 0, 0, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('1.189.169.12_8888_tcp', 2700, '黑龙江-联通', '哈尔滨市', '1.189.169.12', '8888', 0, 0, '2024-04-04 00:52:59');
INSERT INTO `iptv_udpxy` VALUES ('1.25.139.201_8888_tcp', 2605, '内蒙古-联通', '呼和浩特市', '1.25.139.201', '8888', 0, 0, '2024-04-04 00:47:44');
INSERT INTO `iptv_udpxy` VALUES ('1.26.24.221_9999_tcp', 2605, '内蒙古-联通', '呼伦贝尔市', '1.26.24.221', '9999', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('1.62.142.107_8886_tcp', 2700, '黑龙江-联通', '哈尔滨市', '1.62.142.107', '8886', 0, 0, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('1.70.32.95_8085_tcp', 1100, '山西-电信', '长治市', '1.70.32.95', '8085', 3, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('1.70.33.100_8085_tcp', 1100, '山西-电信', '长治市', '1.70.33.100', '8085', 3, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('1.70.34.52_8085_tcp', 1100, '山西-电信', '长治市', '1.70.34.52', '8085', 3, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('1.83.163.40_8888_tcp', 2200, '陕西-电信', '西安市', '1.83.163.40', '8888', 0, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('1.83.163.43_8888_tcp', 2200, '陕西-电信', '西安市', '1.83.163.43', '8888', 0, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('1.83.163.75_8888_tcp', 2200, '陕西-电信', '西安市', '1.83.163.75', '8888', 0, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('106.119.251.124_8888_tcp', 1400, '河北-电信', '唐山市', '106.119.251.124', '8888', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('106.123.5.66_888_tcp', 2500, '新疆-电信', '乌鲁木齐市', '106.123.5.66', '888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('106.124.90.166_8888_tcp', 2500, '新疆-电信', '伊犁哈萨克自治州', '106.124.90.166', '8888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('106.124.90.233_8888_tcp', 2500, '新疆-电信', '伊犁哈萨克自治州', '106.124.90.233', '8888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('106.124.90.254_8888_tcp', 2500, '新疆-电信', '伊犁哈萨克自治州', '106.124.90.254', '8888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('106.124.90.47_8888_tcp', 2500, '新疆-电信', '伊犁哈萨克自治州', '106.124.90.47', '8888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('106.124.90.54_8888_tcp', 2500, '新疆-电信', '伊犁哈萨克自治州', '106.124.90.54', '8888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('106.124.90.74_8888_tcp', 2500, '新疆-电信', '伊犁哈萨克自治州', '106.124.90.74', '8888', 0, 0, '2024-04-04 00:39:49');
INSERT INTO `iptv_udpxy` VALUES ('106.124.90.96_8888_tcp', 2500, '新疆-电信', '伊犁哈萨克自治州', '106.124.90.96', '8888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('106.226.176.248_8888_tcp', 1300, '江西-电信', '吉安市', '106.226.176.248', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('106.226.179.190_8888_tcp', 1300, '江西-电信', '吉安市', '106.226.179.190', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('106.226.179.69_8888_tcp', 1300, '江西-电信', '吉安市', '106.226.179.69', '8888', 0, 0, '2024-04-04 00:13:47');
INSERT INTO `iptv_udpxy` VALUES ('106.35.161.212_8888_tcp', 2600, '内蒙古-电信', '包头市', '106.35.161.212', '8888', 0, 0, '2024-04-04 00:43:37');
INSERT INTO `iptv_udpxy` VALUES ('106.40.100.31_8888_tcp', 2600, '内蒙古-电信', '包头市', '106.40.100.31', '8888', 0, 0, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('106.40.102.27_8888_tcp', 2600, '内蒙古-电信', '包头市', '106.40.102.27', '8888', 0, 0, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('106.41.162.156_8899_tcp', 2300, '吉林-电信', '吉林市', '106.41.162.156', '8899', 0, 0, '2024-04-04 00:32:01');
INSERT INTO `iptv_udpxy` VALUES ('106.45.2.105_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.2.105', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('106.45.2.216_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.2.216', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('106.45.2.255_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.2.255', '8888', 0, 0, '2024-04-04 01:05:29');
INSERT INTO `iptv_udpxy` VALUES ('106.45.2.73_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.2.73', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('106.45.2.83_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.2.83', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('106.45.2.95_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.2.95', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('106.45.3.121_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.3.121', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('106.45.3.5_8888_tcp', 3100, '宁夏-电信', '银川市', '106.45.3.5', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('106.57.0.179_55555_tcp', 1040, '云南-电信', '曲靖市', '106.57.0.179', '55555', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('106.57.1.95_55555_tcp', 1040, '云南-电信', '曲靖市', '106.57.1.95', '55555', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('110.179.80.5_8889_tcp', 1100, '山西-电信', '太原市', '110.179.80.5', '8889', 0, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('110.184.224.224_6666_tcp', 1061, '四川-电信', '成都市', '110.184.224.224', '6666', 0, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('110.184.224.88_6666_tcp', 1061, '四川-电信', '成都市', '110.184.224.88', '6666', 0, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('110.19.173.8_9000_tcp', 2605, '内蒙古-联通', '呼和浩特市', '110.19.173.8', '9000', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('110.248.147.40_8888_tcp', 1405, '河北-联通', '邯郸市', '110.248.147.40', '8888', 1, 1, '2024-04-04 00:19:50');
INSERT INTO `iptv_udpxy` VALUES ('110.253.152.47_8888_tcp', 1405, '河北-联通', '张家口市', '110.253.152.47', '8888', 5, 1, '2024-04-04 00:19:57');
INSERT INTO `iptv_udpxy` VALUES ('111.113.197.39_8888_tcp', 3100, '宁夏-电信', '银川市', '111.113.197.39', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('111.127.88.91_8888_tcp', 2600, '内蒙古-电信', '包头市', '111.127.88.91', '8888', 0, 1, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('111.164.80.230_8888_tcp', 1070, '天津-联通', '天津市', '111.164.80.230', '8888', 1, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('111.175.29.156_8888_tcp', 1700, '湖北-电信', '武汉市', '111.175.29.156', '8888', 0, 0, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('111.193.226.9_8888_tcp', 1050, '北京-联通', '北京市', '111.193.226.9', '8888', 0, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('111.193.228.120_8800_tcp', 1050, '北京-联通', '北京市', '111.193.228.120', '8800', 0, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('111.224.95.128_1024_tcp', 1400, '河北-电信', '石家庄市', '111.224.95.128', '1024', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('111.227.160.96_880_tcp', 1400, '河北-电信', '秦皇岛市', '111.227.160.96', '880', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('111.227.161.9_880_tcp', 1400, '河北-电信', '秦皇岛市', '111.227.161.9', '880', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('111.227.233.70_8787_tcp', 1400, '河北-电信', '秦皇岛市', '111.227.233.70', '8787', 0, 0, '2024-04-04 00:16:38');
INSERT INTO `iptv_udpxy` VALUES ('112.226.231.152_11111_tcp', 1090, '山东-联通', '青岛市', '112.226.231.152', '11111', 1, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('112.227.200.140_40000_tcp', 1090, '山东-联通', '淄博市', '112.227.200.140', '40000', 1, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('112.227.231.167_12314_tcp', 1092, '山东-联通', '淄博市', '112.227.231.167', '12314', 0, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('112.66.141.231_8888_tcp', 2800, '海南-电信', '澄迈县', '112.66.141.231', '8888', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('112.66.227.147_8886_tcp', 2800, '海南-电信', '海口市', '112.66.227.147', '8886', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('113.0.111.39_8888_tcp', 2700, '黑龙江-联通', '哈尔滨市', '113.0.111.39', '8888', 0, 1, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('113.103.52.99_10000_tcp', 101, '广东-电信', '汕头市', '113.103.52.99', '10000', 5, 1, '2024-01-28 00:42:42');
INSERT INTO `iptv_udpxy` VALUES ('113.104.4.54_4500_tcp', 1201, '广东-电信', '中山市', '113.104.4.54', '4500', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('113.117.6.158_10000_tcp', 101, '广东-电信', '揭阳市', '113.117.6.158', '10000', 0, 1, '2024-01-28 00:42:42');
INSERT INTO `iptv_udpxy` VALUES ('113.122.224.160_4000_tcp', 1095, '山东-电信', '临沂市', '113.122.224.160', '4000', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('113.13.177.20_5678_tcp', 1010, '广西-电信', '柳州市', '113.13.177.20', '5678', 0, 1, '2024-04-03 23:59:21');
INSERT INTO `iptv_udpxy` VALUES ('113.17.116.129_8000_tcp', 1010, '广西-电信', '河池市', '113.17.116.129', '8000', 0, 1, '2024-04-03 23:59:21');
INSERT INTO `iptv_udpxy` VALUES ('113.232.62.22_8899_tcp', 2000, '辽宁-联通', '沈阳市', '113.232.62.22', '8899', 0, 1, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('113.24.136.208_8085_tcp', 1100, '山西-电信', '吕梁市', '113.24.136.208', '8085', 1, 1, '2024-04-04 00:09:29');
INSERT INTO `iptv_udpxy` VALUES ('113.24.136.227_8085_tcp', 1100, '山西-电信', '吕梁市', '113.24.136.227', '8085', 1, 1, '2024-04-04 00:09:36');
INSERT INTO `iptv_udpxy` VALUES ('113.24.136.227_8086_tcp', 1100, '山西-电信', '吕梁市', '113.24.136.227', '8086', 0, 1, '2024-04-04 00:09:36');
INSERT INTO `iptv_udpxy` VALUES ('113.24.136.240_8085_tcp', 1100, '山西-电信', '吕梁市', '113.24.136.240', '8085', 1, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('113.24.136.66_8085_tcp', 1100, '山西-电信', '吕梁市', '113.24.136.66', '8085', 1, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('113.4.102.182_8901_tcp', 2700, '黑龙江-联通', '哈尔滨市', '113.4.102.182', '8901', 0, 0, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('113.4.102.182_8902_tcp', 2700, '黑龙江-联通', '哈尔滨市', '113.4.102.182', '8902', 0, 0, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('113.4.102.182_8903_tcp', 2700, '黑龙江-联通', '哈尔滨市', '113.4.102.182', '8903', 0, 0, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('113.78.253.125_8888_tcp', 1201, '广东-电信', '东莞市', '113.78.253.125', '8888', 8, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('114.221.218.13_7777_tcp', 1020, '江苏-电信', '南京市', '114.221.218.13', '7777', 2, 1, '2024-04-04 00:00:59');
INSERT INTO `iptv_udpxy` VALUES ('114.252.234.124_8888_tcp', 1050, '北京-联通', '北京市', '114.252.234.124', '8888', 2, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('114.253.179.0_8888_tcp', 1050, '北京-联通', '北京市', '114.253.179.0', '8888', 2, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('114.254.36.154_8888_tcp', 1050, '北京-联通', '北京市', '114.254.36.154', '8888', 0, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('115.193.163.28_8888_tcp', 1600, '浙江-电信', '杭州市', '115.193.163.28', '8888', 2, 1, '2024-04-04 00:19:59');
INSERT INTO `iptv_udpxy` VALUES ('115.200.224.99_8888_tcp', 1601, '浙江-电信', '杭州市', '115.200.224.99', '8888', 0, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('115.205.94.194_8888_tcp', 1601, '浙江-电信', '杭州市', '115.205.94.194', '8888', 1, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('115.207.212.118_8888_tcp', 1600, '浙江-电信', '湖州市', '115.207.212.118', '8888', 3, 1, '2024-04-04 00:19:59');
INSERT INTO `iptv_udpxy` VALUES ('116.112.91.149_7000_tcp', 2605, '内蒙古-联通', '乌兰察布市', '116.112.91.149', '7000', 6, 1, '2024-04-04 00:46:31');
INSERT INTO `iptv_udpxy` VALUES ('116.115.101.215_9999_tcp', 2605, '内蒙古-联通', '鄂尔多斯市', '116.115.101.215', '9999', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('116.115.103.40_9999_tcp', 2605, '内蒙古-联通', '鄂尔多斯市', '116.115.103.40', '9999', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('116.116.118.76_9999_tcp', 2605, '内蒙古-联通', '呼伦贝尔市', '116.116.118.76', '9999', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('116.116.206.186_5555_tcp', 2605, '内蒙古-联通', '通辽市', '116.116.206.186', '5555', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('116.116.207.97_5555_tcp', 2605, '内蒙古-联通', '通辽市', '116.116.207.97', '5555', 0, 0, '2024-04-04 00:48:55');
INSERT INTO `iptv_udpxy` VALUES ('116.21.121.232_8000_tcp', 1201, '广东-电信', '广州市', '116.21.121.232', '8000', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('116.232.35.114_8888_tcp', 1030, '上海-电信', '上海市', '116.232.35.114', '8888', 0, 1, '2024-04-04 00:01:36');
INSERT INTO `iptv_udpxy` VALUES ('116.234.100.50_5555_tcp', 1030, '上海-电信', '上海市', '116.234.100.50', '5555', 0, 1, '2024-04-04 00:01:36');
INSERT INTO `iptv_udpxy` VALUES ('116.248.130.205_8888_tcp', 1040, '云南-电信', '玉溪市', '116.248.130.205', '8888', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('116.248.130.7_8888_tcp', 1040, '云南-电信', '玉溪市', '116.248.130.7', '8888', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('116.248.131.153_8888_tcp', 1040, '云南-电信', '玉溪市', '116.248.131.153', '8888', 0, 1, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('116.248.131.185_8888_tcp', 1040, '云南-电信', '玉溪市', '116.248.131.185', '8888', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('116.248.131.212_8888_tcp', 1040, '云南-电信', '玉溪市', '116.248.131.212', '8888', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('116.252.28.126_9099_tcp', 1010, '广西-电信', '南宁市', '116.252.28.126', '9099', 0, 1, '2024-04-03 23:59:32');
INSERT INTO `iptv_udpxy` VALUES ('116.3.191.196_60000_tcp', 2000, '辽宁-联通', '大连市', '116.3.191.196', '60000', 0, 0, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('116.3.191.4_60000_tcp', 2000, '辽宁-联通', '大连市', '116.3.191.4', '60000', 0, 0, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('116.3.191.94_60000_tcp', 2000, '辽宁-联通', '大连市', '116.3.191.94', '60000', 0, 0, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('116.30.249.216_8888_tcp', 101, '广东-电信', '深圳市', '116.30.249.216', '8888', 2, 1, '2024-01-28 00:42:43');
INSERT INTO `iptv_udpxy` VALUES ('116.55.173.154_4000_tcp', 1040, '云南-电信', '西双版纳傣族自治州', '116.55.173.154', '4000', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('116.55.176.74_4000_tcp', 1040, '云南-电信', '西双版纳傣族自治州', '116.55.176.74', '4000', 0, 0, '2024-04-04 00:01:59');
INSERT INTO `iptv_udpxy` VALUES ('116.55.179.94_4000_tcp', 1040, '云南-电信', '西双版纳傣族自治州', '116.55.179.94', '4000', 0, 1, '2024-04-04 00:01:57');
INSERT INTO `iptv_udpxy` VALUES ('116.55.181.67_4000_tcp', 1040, '云南-电信', '西双版纳傣族自治州', '116.55.181.67', '4000', 0, 0, '2024-04-04 00:04:19');
INSERT INTO `iptv_udpxy` VALUES ('116.55.183.91_4000_tcp', 1040, '云南-电信', '西双版纳傣族自治州', '116.55.183.91', '4000', 0, 0, '2024-04-04 00:02:59');
INSERT INTO `iptv_udpxy` VALUES ('116.63.128.247_1610_tcp', 2900, '贵州-电信', '贵阳市', '116.63.128.247', '1610', 0, 0, '2024-04-04 00:59:40');
INSERT INTO `iptv_udpxy` VALUES ('116.63.128.247_9106_tcp', 2900, '贵州-电信', '贵阳市', '116.63.128.247', '9106', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('116.63.130.30_4567_tcp', 2900, '贵州-电信', '贵阳市', '116.63.130.30', '4567', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('116.63.130.30_9106_tcp', 2900, '贵州-电信', '贵阳市', '116.63.130.30', '9106', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('116.95.218.32_9999_tcp', 2605, '内蒙古-联通', '呼伦贝尔市', '116.95.218.32', '9999', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('116.95.218.37_9999_tcp', 2605, '内蒙古-联通', '呼伦贝尔市', '116.95.218.37', '9999', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('117.12.149.13_12345_tcp', 1070, '天津-联通', '天津市', '117.12.149.13', '12345', 2, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('117.133.95.38_8887_tcp', 1053, '北京-移动', '北京市', '117.133.95.38', '8887', 0, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('117.64.156.177_8888_tcp', 1080, '安徽-电信', '合肥市', '117.64.156.177', '8888', 5, 1, '2024-04-04 00:06:09');
INSERT INTO `iptv_udpxy` VALUES ('117.70.198.96_8888_tcp', 1080, '安徽-电信', '亳州市', '117.70.198.96', '8888', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('117.83.105.208_7777_tcp', 1020, '江苏-电信', '苏州市', '117.83.105.208', '7777', 1, 1, '2024-04-04 00:00:59');
INSERT INTO `iptv_udpxy` VALUES ('117.83.105.234_7777_tcp', 1020, '江苏-电信', '苏州市', '117.83.105.234', '7777', 1, 1, '2024-04-04 00:00:59');
INSERT INTO `iptv_udpxy` VALUES ('117.83.105.239_7777_tcp', 1020, '江苏-电信', '苏州市', '117.83.105.239', '7777', 1, 1, '2024-04-04 00:00:59');
INSERT INTO `iptv_udpxy` VALUES ('117.9.39.49_5002_tcp', 1070, '天津-联通', '天津市', '117.9.39.49', '5002', 1, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('118.116.81.216_8000_tcp', 1060, '四川-电信', '成都市', '118.116.81.216', '8000', 1, 1, '2024-03-05 00:37:33');
INSERT INTO `iptv_udpxy` VALUES ('118.122.34.134_8888_tcp', 1061, '四川-电信', '南充市', '118.122.34.134', '8888', 2, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('118.122.34.143_8888_tcp', 1061, '四川-电信', '南充市', '118.122.34.143', '8888', 0, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('118.170.33.133_6868_tcp', 3500, '台湾-电信', '台中市', '118.170.33.133', '6868', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('118.170.49.236_6868_tcp', 3500, '台湾-电信', '台中市', '118.170.49.236', '6868', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('118.183.212.4_6868_tcp', 2400, '甘肃-电信', '酒泉市', '118.183.212.4', '6868', 0, 0, '2024-04-04 00:33:40');
INSERT INTO `iptv_udpxy` VALUES ('118.183.212.5_6868_tcp', 2400, '甘肃-电信', '酒泉市', '118.183.212.5', '6868', 0, 0, '2024-04-04 00:33:40');
INSERT INTO `iptv_udpxy` VALUES ('118.251.20.220_10010_tcp', 1800, '湖南-电信', '株洲市', '118.251.20.220', '10010', 0, 1, '2024-04-04 00:21:37');
INSERT INTO `iptv_udpxy` VALUES ('118.254.156.131_8888_tcp', 1800, '湖南-电信', '衡阳市', '118.254.156.131', '8888', 1, 1, '2024-04-04 00:21:38');
INSERT INTO `iptv_udpxy` VALUES ('118.254.203.170_8888_tcp', 1800, '湖南-电信', '衡阳市', '118.254.203.170', '8888', 1, 1, '2024-04-04 00:21:38');
INSERT INTO `iptv_udpxy` VALUES ('118.254.203.236_8888_tcp', 1800, '湖南-电信', '衡阳市', '118.254.203.236', '8888', 1, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('118.81.46.45_40000_tcp', 1105, '山西-联通', '太原市', '118.81.46.45', '40000', 0, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('119.101.65.72_8888_tcp', 1700, '湖北-电信', '天门市', '119.101.65.72', '8888', 1, 1, '2024-04-04 00:20:16');
INSERT INTO `iptv_udpxy` VALUES ('119.113.224.110_60000_tcp', 2000, '辽宁-联通', '大连市', '119.113.224.110', '60000', 0, 0, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('119.113.227.136_60000_tcp', 2000, '辽宁-联通', '大连市', '119.113.227.136', '60000', 0, 0, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('119.117.207.157_8081_tcp', 2000, '辽宁-联通', '锦州市', '119.117.207.157', '8081', 0, 1, '2024-04-04 00:23:49');
INSERT INTO `iptv_udpxy` VALUES ('119.134.3.125_8888_tcp', 101, '广东-电信', '茂名市', '119.134.3.125', '8888', 0, 1, '2024-01-28 00:42:43');
INSERT INTO `iptv_udpxy` VALUES ('119.134.3.133_8888_tcp', 101, '广东-电信', '茂名市', '119.134.3.133', '8888', 0, 1, '2024-01-28 00:42:43');
INSERT INTO `iptv_udpxy` VALUES ('119.140.179.114_10001_tcp', 101, '广东-电信', '揭阳市', '119.140.179.114', '10001', 0, 1, '2024-01-28 00:42:43');
INSERT INTO `iptv_udpxy` VALUES ('119.187.162.183_8999_tcp', 1092, '山东-联通', '东营市', '119.187.162.183', '8999', 0, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('119.191.132.63_40000_tcp', 1090, '山东-联通', '威海市', '119.191.132.63', '40000', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('119.191.235.237_8888_tcp', 1090, '山东-联通', '威海市', '119.191.235.237', '8888', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('119.251.120.37_4000_tcp', 1405, '河北-联通', '廊坊市', '119.251.120.37', '4000', 0, 1, '2024-04-04 00:19:57');
INSERT INTO `iptv_udpxy` VALUES ('119.41.15.32_8888_tcp', 2800, '海南-电信', '陵水黎族自治县', '119.41.15.32', '8888', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('119.41.160.105_4000_tcp', 2800, '海南-电信', '三亚市', '119.41.160.105', '4000', 0, 0, '2024-04-04 00:55:04');
INSERT INTO `iptv_udpxy` VALUES ('119.41.19.15_8888_tcp', 2800, '海南-电信', '陵水黎族自治县', '119.41.19.15', '8888', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('119.41.35.114_4000_tcp', 2800, '海南-电信', '三亚市', '119.41.35.114', '4000', 0, 0, '2024-04-04 00:56:41');
INSERT INTO `iptv_udpxy` VALUES ('119.98.99.14_8888_tcp', 1700, '湖北-电信', '武汉市', '119.98.99.14', '8888', 0, 1, '2024-04-04 00:20:16');
INSERT INTO `iptv_udpxy` VALUES ('120.234.49.37_7000_tcp', 1205, '广东-移动', '深圳市', '120.234.49.37', '7000', 1, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('120.234.49.38_7000_tcp', 1205, '广东-移动', '深圳市', '120.234.49.38', '7000', 1, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('120.234.5.28_6000_tcp', 102, '广东-移动', '深圳市', '120.234.5.28', '6000', 30, 1, '2024-01-28 00:43:32');
INSERT INTO `iptv_udpxy` VALUES ('120.234.5.29_6000_tcp', 102, '广东-移动', '深圳市', '120.234.5.29', '6000', 30, 1, '2024-01-28 00:43:32');
INSERT INTO `iptv_udpxy` VALUES ('120.237.116.125_8888_tcp', 1205, '广东-移动', '深圳市', '120.237.116.125', '8888', 0, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('120.237.204.54_7000_tcp', 1205, '广东-移动', '惠州市', '120.237.204.54', '7000', 0, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('120.238.99.51_8888_tcp', 102, '广东-移动', '梅州市', '120.238.99.51', '8888', 1, 1, '2024-01-28 00:43:48');
INSERT INTO `iptv_udpxy` VALUES ('120.244.86.251_7777_tcp', 1053, '北京-移动', '北京市', '120.244.86.251', '7777', 0, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('120.245.63.72_8888_tcp', 1053, '北京-移动', '北京市', '120.245.63.72', '8888', 4, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('120.4.34.234_4000_tcp', 1405, '河北-联通', '唐山市', '120.4.34.234', '4000', 4, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('120.41.124.126_8888_tcp', 1900, '福建-电信', '厦门市', '120.41.124.126', '8888', 5, 1, '2024-04-04 00:22:02');
INSERT INTO `iptv_udpxy` VALUES ('120.41.125.130_8888_tcp', 1900, '福建-电信', '厦门市', '120.41.125.130', '8888', 3, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('121.204.92.239_8000_tcp', 1900, '福建-电信', '福州市', '121.204.92.239', '8000', 0, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('121.205.73.215_8888_tcp', 1900, '福建-电信', '泉州市', '121.205.73.215', '8888', 0, 0, '2024-04-04 00:22:02');
INSERT INTO `iptv_udpxy` VALUES ('121.226.125.113_7777_tcp', 1020, '江苏-电信', '南通市', '121.226.125.113', '7777', 2, 1, '2024-04-04 00:00:59');
INSERT INTO `iptv_udpxy` VALUES ('121.226.38.44_8888_tcp', 1020, '江苏-电信', '南通市', '121.226.38.44', '8888', 3, 1, '2024-04-04 00:00:59');
INSERT INTO `iptv_udpxy` VALUES ('121.228.18.182_8888_tcp', 1020, '江苏-电信', '苏州市', '121.228.18.182', '8888', 0, 1, '2024-04-04 00:00:59');
INSERT INTO `iptv_udpxy` VALUES ('121.57.43.10_8888_tcp', 2600, '内蒙古-电信', '包头市', '121.57.43.10', '8888', 0, 0, '2024-04-04 00:45:20');
INSERT INTO `iptv_udpxy` VALUES ('122.224.232.218_8888_tcp', 1600, '浙江-电信', '杭州市', '122.224.232.218', '8888', 2, 1, '2024-04-04 00:19:59');
INSERT INTO `iptv_udpxy` VALUES ('122.9.131.161_5705_tcp', 2900, '贵州-电信', '贵阳市', '122.9.131.161', '5705', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('122.9.131.161_9106_tcp', 2900, '贵州-电信', '贵阳市', '122.9.131.161', '9106', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('122.9.151.210_1234_tcp', 2900, '贵州-电信', '贵阳市', '122.9.151.210', '1234', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('122.9.151.210_1610_tcp', 2900, '贵州-电信', '贵阳市', '122.9.151.210', '1610', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('122.9.151.210_9105_tcp', 2900, '贵州-电信', '贵阳市', '122.9.151.210', '9105', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('122.9.151.210_9106_tcp', 2900, '贵州-电信', '贵阳市', '122.9.151.210', '9106', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('123.112.50.33_8888_tcp', 1050, '北京-联通', '北京市', '123.112.50.33', '8888', 0, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('123.113.248.110_8888_tcp', 1050, '北京-联通', '北京市', '123.113.248.110', '8888', 2, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('123.115.116.252_9000_tcp', 1050, '北京-联通', '北京市', '123.115.116.252', '9000', 3, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('123.117.167.88_8888_tcp', 1050, '北京-联通', '北京市', '123.117.167.88', '8888', 0, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('123.122.160.148_49153_tcp', 1050, '北京-联通', '北京市', '123.122.160.148', '49153', 0, 1, '2024-04-04 00:05:37');
INSERT INTO `iptv_udpxy` VALUES ('123.168.95.193_4000_tcp', 1095, '山东-电信', '青岛市', '123.168.95.193', '4000', 5, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('123.171.241.184_4000_tcp', 1095, '山东-电信', '济南市', '123.171.241.184', '4000', 0, 0, '2024-04-04 00:08:22');
INSERT INTO `iptv_udpxy` VALUES ('123.179.177.134_10000_tcp', 2600, '内蒙古-电信', '通辽市', '123.179.177.134', '10000', 0, 0, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('123.179.179.117_10000_tcp', 2600, '内蒙古-电信', '通辽市', '123.179.179.117', '10000', 0, 0, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('123.179.47.158_8888_tcp', 2600, '内蒙古-电信', '包头市', '123.179.47.158', '8888', 0, 0, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('123.179.47.185_8888_tcp', 2600, '内蒙古-电信', '包头市', '123.179.47.185', '8888', 0, 0, '2024-04-04 00:42:39');
INSERT INTO `iptv_udpxy` VALUES ('123.180.208.110_8888_tcp', 1400, '河北-电信', '衡水市', '123.180.208.110', '8888', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('123.180.208.151_8888_tcp', 1400, '河北-电信', '衡水市', '123.180.208.151', '8888', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('123.180.211.206_8888_tcp', 1400, '河北-电信', '衡水市', '123.180.211.206', '8888', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('123.182.42.33_4321_tcp', 1400, '河北-电信', '张家口市', '123.182.42.33', '4321', 0, 0, '2024-04-04 00:18:23');
INSERT INTO `iptv_udpxy` VALUES ('123.244.152.145_8899_tcp', 2005, '辽宁-电信', '盘锦市', '123.244.152.145', '8899', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('123.244.152.174_8899_tcp', 2005, '辽宁-电信', '盘锦市', '123.244.152.174', '8899', 0, 1, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('123.244.154.7_8899_tcp', 2005, '辽宁-电信', '盘锦市', '123.244.154.7', '8899', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('123.245.17.159_8181_tcp', 2005, '辽宁-电信', '沈阳市', '123.245.17.159', '8181', 0, 0, '2024-04-04 00:27:22');
INSERT INTO `iptv_udpxy` VALUES ('123.245.17.185_8181_tcp', 2005, '辽宁-电信', '沈阳市', '123.245.17.185', '8181', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('123.245.17.65_8181_tcp', 2005, '辽宁-电信', '沈阳市', '123.245.17.65', '8181', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('123.245.17.78_8181_tcp', 2005, '辽宁-电信', '沈阳市', '123.245.17.78', '8181', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('124.115.207.92_8081_tcp', 2200, '陕西-电信', '咸阳市', '124.115.207.92', '8081', 3, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('124.227.203.3_8888_tcp', 1010, '广西-电信', '贵港市', '124.227.203.3', '8888', 0, 0, '2024-04-03 23:59:58');
INSERT INTO `iptv_udpxy` VALUES ('124.237.128.193_8888_tcp', 1400, '河北-电信', '保定市', '124.237.128.193', '8888', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('124.237.129.245_8888_tcp', 1400, '河北-电信', '保定市', '124.237.129.245', '8888', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('124.237.129.34_8888_tcp', 1400, '河北-电信', '保定市', '124.237.129.34', '8888', 0, 0, '2024-04-04 00:15:10');
INSERT INTO `iptv_udpxy` VALUES ('124.67.14.4_8888_tcp', 2605, '内蒙古-联通', '呼和浩特市', '124.67.14.4', '8888', 0, 0, '2024-04-04 00:46:32');
INSERT INTO `iptv_udpxy` VALUES ('125.121.201.131_8888_tcp', 1600, '浙江-电信', '杭州市', '125.121.201.131', '8888', 0, 1, '2024-04-04 00:19:59');
INSERT INTO `iptv_udpxy` VALUES ('125.125.143.199_8881_tcp', 1601, '浙江-电信', '湖州市', '125.125.143.199', '8881', 0, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('125.125.143.201_8881_tcp', 1601, '浙江-电信', '湖州市', '125.125.143.201', '8881', 0, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('125.125.199.56_8881_tcp', 1601, '浙江-电信', '湖州市', '125.125.199.56', '8881', 0, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('125.125.199.56_8888_tcp', 1600, '浙江-电信', '湖州市', '125.125.199.56', '8888', 3, 1, '2024-04-04 00:19:59');
INSERT INTO `iptv_udpxy` VALUES ('125.125.56.55_8881_tcp', 1601, '浙江-电信', '湖州市', '125.125.56.55', '8881', 0, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('125.125.58.97_8881_tcp', 1601, '浙江-电信', '湖州市', '125.125.58.97', '8881', 0, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('125.34.18.213_7777_tcp', 1050, '北京-联通', '北京市', '125.34.18.213', '7777', 0, 1, '2024-04-04 00:05:38');
INSERT INTO `iptv_udpxy` VALUES ('125.38.229.44_8888_tcp', 1070, '天津-联通', '天津市', '125.38.229.44', '8888', 1, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('125.46.89.234_18888_tcp', 1500, '河南-联通', '郑州市', '125.46.89.234', '18888', 0, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('125.89.163.44_8888_tcp', 1201, '广东-电信', '梅州市', '125.89.163.44', '8888', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('14.112.75.20_8000_tcp', 1201, '广东-电信', '惠州市', '14.112.75.20', '8000', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('14.112.75.30_8000_tcp', 1201, '广东-电信', '惠州市', '14.112.75.30', '8000', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('14.112.75.41_8000_tcp', 1201, '广东-电信', '惠州市', '14.112.75.41', '8000', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('14.117.198.16_10000_tcp', 101, '广东-电信', '江门市', '14.117.198.16', '10000', 0, 1, '2024-01-28 00:43:17');
INSERT INTO `iptv_udpxy` VALUES ('14.126.126.211_10001_tcp', 101, '广东-电信', '中山市', '14.126.126.211', '10001', 0, 1, '2024-01-28 00:42:44');
INSERT INTO `iptv_udpxy` VALUES ('14.126.29.227_7777_tcp', 1201, '广东-电信', '中山市', '14.126.29.227', '7777', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('14.135.72.206_8888_tcp', 3100, '宁夏-电信', '银川市', '14.135.72.206', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('14.135.72.98_8888_tcp', 3100, '宁夏-电信', '银川市', '14.135.72.98', '8888', 0, 0, '2024-04-04 01:04:20');
INSERT INTO `iptv_udpxy` VALUES ('14.19.132.91_8000_tcp', 101, '广东-电信', '广州市', '14.19.132.91', '8000', 0, 1, '2024-01-28 00:42:45');
INSERT INTO `iptv_udpxy` VALUES ('140.210.196.193_1610_tcp', 2900, '贵州-电信', '贵阳市', '140.210.196.193', '1610', 0, 0, '2024-04-04 00:58:01');
INSERT INTO `iptv_udpxy` VALUES ('140.210.196.193_22222_tcp', 2900, '贵州-电信', '贵阳市', '140.210.196.193', '22222', 0, 0, '2024-04-04 00:58:42');
INSERT INTO `iptv_udpxy` VALUES ('140.75.179.148_18888_tcp', 1095, '山东-电信', '烟台市', '140.75.179.148', '18888', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('140.75.179.173_18888_tcp', 1095, '山东-电信', '烟台市', '140.75.179.173', '18888', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('140.75.179.214_18888_tcp', 1095, '山东-电信', '烟台市', '140.75.179.214', '18888', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('144.52.146.124_5002_tcp', 1095, '山东-电信', '临沂市', '144.52.146.124', '5002', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('144.52.199.223_18888_tcp', 1095, '山东-电信', '济宁市', '144.52.199.223', '18888', 1, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('144.52.199.54_8888_tcp', 1095, '山东-电信', '济宁市', '144.52.199.54', '8888', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('171.109.211.24_8888_tcp', 1010, '广西-电信', '贵港市', '171.109.211.24', '8888', 0, 0, '2024-04-03 23:59:58');
INSERT INTO `iptv_udpxy` VALUES ('171.117.120.54_8085_tcp', 1105, '山西-联通', '太原市', '171.117.120.54', '8085', 1, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('171.117.180.171_8085_tcp', 1105, '山西-联通', '太原市', '171.117.180.171', '8085', 1, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('171.118.108.99_8085_tcp', 1105, '山西-联通', '太原市', '171.118.108.99', '8085', 1, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('171.120.109.234_8085_tcp', 1105, '山西-联通', '太原市', '171.120.109.234', '8085', 0, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('171.125.217.68_90_tcp', 1105, '山西-联通', '忻州市', '171.125.217.68', '90', 1, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('171.212.212.47_8000_tcp', 1060, '四川-电信', '成都市', '171.212.212.47', '8000', 0, 1, '2024-03-05 00:37:34');
INSERT INTO `iptv_udpxy` VALUES ('171.217.166.183_8000_tcp', 1060, '四川-电信', '成都市', '171.217.166.183', '8000', 0, 1, '2024-03-05 00:37:34');
INSERT INTO `iptv_udpxy` VALUES ('171.80.126.136_8888_tcp', 1700, '湖北-电信', '襄阳市', '171.80.126.136', '8888', 0, 1, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('171.80.248.118_8888_tcp', 1700, '湖北-电信', '荆州市', '171.80.248.118', '8888', 0, 0, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('171.88.144.30_8888_tcp', 1060, '四川-电信', '成都市', '171.88.144.30', '8888', 0, 1, '2024-03-05 00:37:34');
INSERT INTO `iptv_udpxy` VALUES ('175.147.76.205_8888_tcp', 2000, '辽宁-联通', '鞍山市', '175.147.76.205', '8888', 0, 1, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('175.168.63.244_8888_tcp', 2000, '辽宁-联通', '沈阳市', '175.168.63.244', '8888', 0, 1, '2024-04-04 00:23:57');
INSERT INTO `iptv_udpxy` VALUES ('175.172.213.219_8888_tcp', 2000, '辽宁-联通', '沈阳市', '175.172.213.219', '8888', 0, 1, '2024-04-04 00:23:57');
INSERT INTO `iptv_udpxy` VALUES ('175.31.201.79_5521_tcp', 2300, '吉林-电信', '长春市', '175.31.201.79', '5521', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('175.44.46.65_4000_tcp', 1900, '福建-联通', '莆田市', '175.44.46.65', '4000', 0, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('180.111.29.199_8888_tcp', 1020, '江苏-电信', '南京市', '180.111.29.199', '8888', 1, 1, '2024-04-04 00:01:29');
INSERT INTO `iptv_udpxy` VALUES ('180.126.100.243_8800_tcp', 1020, '江苏-电信', '盐城市', '180.126.100.243', '8800', 0, 1, '2024-04-04 00:01:36');
INSERT INTO `iptv_udpxy` VALUES ('180.136.138.51_8088_tcp', 1010, '广西-电信', '南宁市', '180.136.138.51', '8088', 0, 0, '2024-04-03 23:59:58');
INSERT INTO `iptv_udpxy` VALUES ('180.139.220.76_18888_tcp', 1010, '广西-电信', '钦州市', '180.139.220.76', '18888', 2, 1, '2024-04-03 23:59:50');
INSERT INTO `iptv_udpxy` VALUES ('180.141.51.55_5678_tcp', 1010, '广西-电信', '南宁市', '180.141.51.55', '5678', 1, 1, '2024-04-03 23:59:57');
INSERT INTO `iptv_udpxy` VALUES ('180.158.58.254_85_tcp', 1030, '上海-电信', '上海市', '180.158.58.254', '85', 0, 1, '2024-04-04 00:01:36');
INSERT INTO `iptv_udpxy` VALUES ('182.103.24.251_8888_tcp', 1300, '江西-电信', '南昌市', '182.103.24.251', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('182.103.26.83_8888_tcp', 1300, '江西-电信', '南昌市', '182.103.26.83', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('182.136.168.230_8888_tcp', 1060, '四川-电信', '成都市', '182.136.168.230', '8888', 1, 1, '2024-03-05 00:37:34');
INSERT INTO `iptv_udpxy` VALUES ('182.204.158.122_8899_tcp', 2005, '辽宁-电信', '盘锦市', '182.204.158.122', '8899', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('182.204.158.132_8899_tcp', 2005, '辽宁-电信', '盘锦市', '182.204.158.132', '8899', 0, 0, '2024-04-04 00:26:27');
INSERT INTO `iptv_udpxy` VALUES ('182.204.158.47_8899_tcp', 2005, '辽宁-电信', '盘锦市', '182.204.158.47', '8899', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('182.35.230.98_8888_tcp', 1095, '山东-电信', '日照市', '182.35.230.98', '8888', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('182.46.8.252_8686_tcp', 1095, '山东-电信', '潍坊市', '182.46.8.252', '8686', 1, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('182.96.239.229_8888_tcp', 1300, '江西-电信', '南昌市', '182.96.239.229', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('183.0.214.92_4999_tcp', 1201, '广东-电信', '茂名市', '183.0.214.92', '4999', 0, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('183.142.56.142_8881_tcp', 1601, '浙江-电信', '湖州市', '183.142.56.142', '8881', 0, 1, '2024-03-08 21:58:34');
INSERT INTO `iptv_udpxy` VALUES ('183.164.58.130_8888_tcp', 1080, '安徽-电信', '合肥市', '183.164.58.130', '8888', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('183.166.125.43_8888_tcp', 1080, '安徽-电信', '淮南市', '183.166.125.43', '8888', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('183.17.226.65_10000_tcp', 101, '广东-电信', '深圳市', '183.17.226.65', '10000', 0, 1, '2024-01-28 00:42:45');
INSERT INTO `iptv_udpxy` VALUES ('183.184.138.144_8085_tcp', 1105, '山西-联通', '太原市', '183.184.138.144', '8085', 2, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('183.184.61.177_8085_tcp', 1105, '山西-联通', '太原市', '183.184.61.177', '8085', 1, 1, '2024-04-04 00:10:19');
INSERT INTO `iptv_udpxy` VALUES ('183.234.174.60_4000_tcp', 1205, '广东-移动', '潮州市', '183.234.174.60', '4000', 0, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('183.234.174.61_4000_tcp', 102, '广东-移动', '潮州市', '183.234.174.61', '4000', 0, 1, '2024-01-28 00:43:48');
INSERT INTO `iptv_udpxy` VALUES ('183.234.194.165_8888_tcp', 102, '广东-移动', '深圳市', '183.234.194.165', '8888', 0, 1, '2024-01-28 00:43:48');
INSERT INTO `iptv_udpxy` VALUES ('183.238.0.162_9000_tcp', 1205, '广东-移动', '深圳市', '183.238.0.162', '9000', 0, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('183.44.113.194_4999_tcp', 1201, '广东-电信', '茂名市', '183.44.113.194', '4999', 0, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('210.76.37.192_9000_tcp', 2700, '黑龙江-联通', '哈尔滨市', '210.76.37.192', '9000', 0, 0, '2024-04-04 00:51:29');
INSERT INTO `iptv_udpxy` VALUES ('218.19.110.216_9999_tcp', 101, '广东-电信', '广州市', '218.19.110.216', '9999', 1, 1, '2024-01-28 00:42:45');
INSERT INTO `iptv_udpxy` VALUES ('218.19.110.25_9999_tcp', 101, '广东-电信', '广州市', '218.19.110.25', '9999', 1, 1, '2024-01-28 00:42:45');
INSERT INTO `iptv_udpxy` VALUES ('218.21.120.241_8888_tcp', 1010, '广西-电信', '玉林市', '218.21.120.241', '8888', 0, 0, '2024-04-03 23:59:58');
INSERT INTO `iptv_udpxy` VALUES ('218.89.49.166_8888_tcp', 1061, '四川-电信', '南充市', '218.89.49.166', '8888', 0, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('219.140.109.168_8888_tcp', 1700, '湖北-电信', '武汉市', '219.140.109.168', '8888', 0, 1, '2024-04-04 00:20:16');
INSERT INTO `iptv_udpxy` VALUES ('219.140.240.43_8686_tcp', 1700, '湖北-电信', '武汉市', '219.140.240.43', '8686', 2, 1, '2024-04-04 00:20:16');
INSERT INTO `iptv_udpxy` VALUES ('219.145.19.145_4000_tcp', 2200, '陕西-电信', '西安市', '219.145.19.145', '4000', 2, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('220.167.116.7_8888_tcp', 1061, '四川-电信', '南充市', '220.167.116.7', '8888', 0, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.124_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.124', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.125_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.125', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.140_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.140', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.148_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.148', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.151_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.151', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.186_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.186', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.218_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.218', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.229_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.229', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.232_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.232', '4000', 0, 0, '2024-04-04 01:02:39');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.252_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.252', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.167.170.253_4000_tcp', 3000, '青海-电信', '西宁市', '220.167.170.253', '4000', 0, 0, '2024-04-04 01:00:58');
INSERT INTO `iptv_udpxy` VALUES ('220.174.33.5_8888_tcp', 2800, '海南-电信', '澄迈县', '220.174.33.5', '8888', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('220.174.37.2_8888_tcp', 2800, '海南-电信', '澄迈县', '220.174.37.2', '8888', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('220.174.40.178_8888_tcp', 2800, '海南-电信', '澄迈县', '220.174.40.178', '8888', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('220.174.42.133_8888_tcp', 2800, '海南-电信', '澄迈县', '220.174.42.133', '8888', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('220.176.156.138_8888_tcp', 1300, '江西-电信', '吉安市', '220.176.156.138', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('220.178.184.16_4000_tcp', 1080, '安徽-电信', '芜湖市', '220.178.184.16', '4000', 1, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('220.201.200.145_9000_tcp', 2700, '黑龙江-联通', '哈尔滨市', '220.201.200.145', '9000', 35, 1, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('220.201.200.36_9000_tcp', 2700, '黑龙江-联通', '哈尔滨市', '220.201.200.36', '9000', 35, 1, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('221.15.7.122_8888_tcp', 1500, '河南-联通', '信阳市', '221.15.7.122', '8888', 1, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('221.198.174.113_8888_tcp', 1070, '天津-联通', '天津市', '221.198.174.113', '8888', 0, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('221.200.208.48_8888_tcp', 2000, '辽宁-联通', '沈阳市', '221.200.208.48', '8888', 0, 1, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('221.205.201.195_8085_tcp', 1105, '山西-联通', '太原市', '221.205.201.195', '8085', 2, 1, '2024-04-04 00:10:29');
INSERT INTO `iptv_udpxy` VALUES ('221.205.201.55_8085_tcp', 1105, '山西-联通', '太原市', '221.205.201.55', '8085', 2, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('221.212.214.12_8901_tcp', 2700, '黑龙江-联通', '哈尔滨市', '221.212.214.12', '8901', 0, 0, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('221.212.214.12_8902_tcp', 2700, '黑龙江-联通', '哈尔滨市', '221.212.214.12', '8902', 0, 0, '2024-04-04 00:50:16');
INSERT INTO `iptv_udpxy` VALUES ('221.233.6.252_8888_tcp', 1700, '湖北-电信', '荆州市', '221.233.6.252', '8888', 0, 0, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('221.234.140.70_8880_tcp', 1700, '湖北-电信', '武汉市', '221.234.140.70', '8880', 0, 1, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('222.129.37.111_9001_tcp', 1050, '北京-联通', '北京市', '222.129.37.111', '9001', 0, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('222.169.99.114_7777_tcp', 2300, '吉林-电信', '辽源市', '222.169.99.114', '7777', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('222.217.124.147_8088_tcp', 1010, '广西-电信', '南宁市', '222.217.124.147', '8088', 0, 0, '2024-04-03 23:59:58');
INSERT INTO `iptv_udpxy` VALUES ('222.217.124.67_8899_tcp', 1010, '广西-电信', '南宁市', '222.217.124.67', '8899', 0, 1, '2024-04-03 23:59:58');
INSERT INTO `iptv_udpxy` VALUES ('222.241.145.143_8888_tcp', 1800, '湖南-电信', '衡阳市', '222.241.145.143', '8888', 4, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('222.241.145.204_8888_tcp', 1800, '湖南-电信', '衡阳市', '222.241.145.204', '8888', 4, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('222.67.133.71_8888_tcp', 1030, '上海-电信', '上海市', '222.67.133.71', '8888', 0, 1, '2024-04-04 00:01:37');
INSERT INTO `iptv_udpxy` VALUES ('222.67.181.186_8888_tcp', 1030, '上海-电信', '上海市', '222.67.181.186', '8888', 0, 1, '2024-04-04 00:01:37');
INSERT INTO `iptv_udpxy` VALUES ('222.76.104.120_50001_tcp', 1900, '福建-电信', '福州市', '222.76.104.120', '50001', 0, 1, '2024-04-04 00:22:02');
INSERT INTO `iptv_udpxy` VALUES ('222.76.104.13_50001_tcp', 1900, '福建-电信', '福州市', '222.76.104.13', '50001', 0, 0, '2024-04-04 00:22:02');
INSERT INTO `iptv_udpxy` VALUES ('222.76.104.223_50001_tcp', 1900, '福建-电信', '福州市', '222.76.104.223', '50001', 0, 0, '2024-04-04 00:22:02');
INSERT INTO `iptv_udpxy` VALUES ('222.76.104.223_50003_tcp', 1900, '福建-电信', '福州市', '222.76.104.223', '50003', 0, 0, '2024-04-04 00:22:02');
INSERT INTO `iptv_udpxy` VALUES ('222.76.104.82_50001_tcp', 1900, '福建-电信', '福州市', '222.76.104.82', '50001', 0, 0, '2024-04-04 00:22:02');
INSERT INTO `iptv_udpxy` VALUES ('222.82.200.153_4000_tcp', 2500, '新疆-电信', '乌鲁木齐市', '222.82.200.153', '4000', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('222.82.204.248_4000_tcp', 2500, '新疆-电信', '乌鲁木齐市', '222.82.204.248', '4000', 0, 0, '2024-04-04 00:41:15');
INSERT INTO `iptv_udpxy` VALUES ('223.10.29.61_8085_tcp', 1100, '山西-电信', '吕梁市', '223.10.29.61', '8085', 0, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('223.11.157.197_7777_tcp', 1100, '山西-电信', '太原市', '223.11.157.197', '7777', 0, 1, '2024-04-04 00:10:11');
INSERT INTO `iptv_udpxy` VALUES ('223.198.20.248_1025_tcp', 2800, '海南-电信', '海口市', '223.198.20.248', '1025', 0, 0, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('223.247.87.191_8888_tcp', 1080, '安徽-电信', '亳州市', '223.247.87.191', '8888', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('223.72.33.118_2222_tcp', 1053, '北京-移动', '北京市', '223.72.33.118', '2222', 1, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('27.10.78.116_8002_tcp', 2100, '重庆-联通', '重庆市', '27.10.78.116', '8002', 0, 1, '2024-04-04 00:28:31');
INSERT INTO `iptv_udpxy` VALUES ('27.11.49.156_8009_tcp', 2100, '重庆-联通', '重庆市', '27.11.49.156', '8009', 2, 1, '2024-04-04 00:28:31');
INSERT INTO `iptv_udpxy` VALUES ('27.11.49.156_8010_tcp', 2100, '重庆-联通', '重庆市', '27.11.49.156', '8010', 1, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('27.11.62.175_8008_tcp', 2100, '重庆-联通', '重庆市', '27.11.62.175', '8008', 3, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('27.11.62.175_8009_tcp', 2100, '重庆-联通', '重庆市', '27.11.62.175', '8009', 2, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('27.11.62.175_8010_tcp', 2100, '重庆-联通', '重庆市', '27.11.62.175', '8010', 1, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('27.154.214.56_8888_tcp', 1900, '福建-电信', '厦门市', '27.154.214.56', '8888', 3, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('27.16.196.204_8088_tcp', 1700, '湖北-电信', '武汉市', '27.16.196.204', '8088', 0, 0, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('27.16.224.16_8888_tcp', 1700, '湖北-电信', '武汉市', '27.16.224.16', '8888', 0, 0, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('27.205.211.176_8888_tcp', 1092, '山东-联通', '潍坊市', '27.205.211.176', '8888', 0, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('27.205.255.89_8888_tcp', 1092, '山东-联通', '潍坊市', '27.205.255.89', '8888', 0, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('27.214.251.234_11111_tcp', 1090, '山东-联通', '潍坊市', '27.214.251.234', '11111', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('27.217.213.217_18888_tcp', 1090, '山东-联通', '烟台市', '27.217.213.217', '18888', 1, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('27.22.15.56_8880_tcp', 1700, '湖北-电信', '襄阳市', '27.22.15.56', '8880', 1, 1, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('27.227.183.38_666_tcp', 2400, '甘肃-电信', '兰州市', '27.227.183.38', '666', 0, 0, '2024-04-04 00:33:40');
INSERT INTO `iptv_udpxy` VALUES ('27.227.183.44_666_tcp', 2400, '甘肃-电信', '兰州市', '27.227.183.44', '666', 0, 0, '2024-04-04 00:33:40');
INSERT INTO `iptv_udpxy` VALUES ('27.23.90.37_8889_tcp', 1700, '湖北-电信', '孝感市', '27.23.90.37', '8889', 0, 1, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('27.28.70.228_8888_tcp', 1700, '湖北-电信', '宜昌市', '27.28.70.228', '8888', 0, 1, '2024-04-04 00:20:36');
INSERT INTO `iptv_udpxy` VALUES ('36.101.6.96_554_tcp', 2800, '海南-电信', '海口市', '36.101.6.96', '554', 0, 1, '2024-04-04 00:54:12');
INSERT INTO `iptv_udpxy` VALUES ('36.49.50.223_30007_tcp', 2300, '吉林-电信', '长春市', '36.49.50.223', '30007', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('36.49.52.171_30007_tcp', 2300, '吉林-电信', '长春市', '36.49.52.171', '30007', 0, 0, '2024-04-04 00:30:04');
INSERT INTO `iptv_udpxy` VALUES ('36.49.53.197_8800_tcp', 2300, '吉林-电信', '长春市', '36.49.53.197', '8800', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('36.49.53.3_8800_tcp', 2300, '吉林-电信', '长春市', '36.49.53.3', '8800', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('36.49.54.144_8800_tcp', 2300, '吉林-电信', '长春市', '36.49.54.144', '8800', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('36.49.56.132_8800_tcp', 2300, '吉林-电信', '长春市', '36.49.56.132', '8800', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('36.49.57.139_8800_tcp', 2300, '吉林-电信', '长春市', '36.49.57.139', '8800', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('36.49.57.171_8800_tcp', 2300, '吉林-电信', '长春市', '36.49.57.171', '8800', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('39.82.45.222_60001_tcp', 1092, '山东-联通', '济南市', '39.82.45.222', '60001', 0, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('39.83.184.76_8888_tcp', 1092, '山东-联通', '济宁市', '39.83.184.76', '8888', 0, 1, '2024-04-04 00:06:18');
INSERT INTO `iptv_udpxy` VALUES ('39.90.219.99_4000_tcp', 1090, '山东-联通', '潍坊市', '39.90.219.99', '4000', 0, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('42.179.229.147_8888_tcp', 2000, '辽宁-联通', '葫芦岛市', '42.179.229.147', '8888', 1, 1, '2024-04-04 00:24:19');
INSERT INTO `iptv_udpxy` VALUES ('42.236.163.2_8888_tcp', 1500, '河南-联通', '郑州市', '42.236.163.2', '8888', 1, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('42.91.63.105_10000_tcp', 2400, '甘肃-电信', '兰州市', '42.91.63.105', '10000', 0, 0, '2024-04-04 00:33:40');
INSERT INTO `iptv_udpxy` VALUES ('42.91.63.126_10000_tcp', 2400, '甘肃-电信', '兰州市', '42.91.63.126', '10000', 0, 0, '2024-04-04 00:35:03');
INSERT INTO `iptv_udpxy` VALUES ('42.92.117.138_8888_tcp', 2400, '甘肃-电信', '兰州市', '42.92.117.138', '8888', 0, 1, '2024-04-04 00:33:38');
INSERT INTO `iptv_udpxy` VALUES ('42.92.117.142_8888_tcp', 2400, '甘肃-电信', '兰州市', '42.92.117.142', '8888', 0, 0, '2024-04-04 00:33:40');
INSERT INTO `iptv_udpxy` VALUES ('42.92.117.155_8888_tcp', 2400, '甘肃-电信', '兰州市', '42.92.117.155', '8888', 0, 0, '2024-04-04 00:33:40');
INSERT INTO `iptv_udpxy` VALUES ('42.94.211.47_9000_tcp', 2400, '甘肃-电信', '兰州市', '42.94.211.47', '9000', 0, 0, '2024-04-04 00:36:44');
INSERT INTO `iptv_udpxy` VALUES ('49.113.10.134_888_tcp', 2500, '新疆-电信', '乌鲁木齐市', '49.113.10.134', '888', 0, 0, '2024-04-04 00:38:19');
INSERT INTO `iptv_udpxy` VALUES ('49.67.190.193_6665_tcp', 1020, '江苏-电信', '南通市', '49.67.190.193', '6665', 0, 1, '2024-04-04 00:01:36');
INSERT INTO `iptv_udpxy` VALUES ('58.212.111.248_8888_tcp', 1020, '江苏-电信', '南京市', '58.212.111.248', '8888', 0, 1, '2024-04-04 00:01:36');
INSERT INTO `iptv_udpxy` VALUES ('58.32.19.21_85_tcp', 1030, '上海-电信', '上海市', '58.32.19.21', '85', 2, 1, '2024-04-04 00:01:57');
INSERT INTO `iptv_udpxy` VALUES ('58.48.199.143_8888_tcp', 1700, '湖北-电信', '武汉市', '58.48.199.143', '8888', 0, 1, '2024-04-04 00:20:39');
INSERT INTO `iptv_udpxy` VALUES ('59.47.112.116_8000_tcp', 2005, '辽宁-电信', '本溪市', '59.47.112.116', '8000', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('59.52.178.87_9008_tcp', 1300, '江西-电信', '南昌市', '59.52.178.87', '9008', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('59.55.189.0_8888_tcp', 1300, '江西-电信', '吉安市', '59.55.189.0', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('59.55.223.142_8888_tcp', 1300, '江西-电信', '吉安市', '59.55.223.142', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('59.55.66.71_6001_tcp', 1300, '江西-电信', '赣州市', '59.55.66.71', '6001', 0, 0, '2024-04-04 00:12:25');
INSERT INTO `iptv_udpxy` VALUES ('59.63.149.11_8888_tcp', 1300, '江西-电信', '南昌市', '59.63.149.11', '8888', 0, 0, '2024-04-04 00:10:40');
INSERT INTO `iptv_udpxy` VALUES ('60.177.38.25_82_tcp', 1600, '浙江-电信', '杭州市', '60.177.38.25', '82', 1, 1, '2024-04-04 00:20:09');
INSERT INTO `iptv_udpxy` VALUES ('60.2.190.206_4000_tcp', 1405, '河北-联通', '唐山市', '60.2.190.206', '4000', 4, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('60.26.62.161_8000_tcp', 1070, '天津-联通', '天津市', '60.26.62.161', '8000', 0, 1, '2024-04-04 00:05:59');
INSERT INTO `iptv_udpxy` VALUES ('60.4.3.23_8888_tcp', 1405, '河北-联通', '保定市', '60.4.3.23', '8888', 0, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('61.140.124.156_8888_tcp', 1201, '广东-电信', '广州市', '61.140.124.156', '8888', 5, 1, '2024-04-04 00:10:38');
INSERT INTO `iptv_udpxy` VALUES ('61.140.234.241_10001_tcp', 101, '广东-电信', '广州市', '61.140.234.241', '10001', 0, 1, '2024-01-28 00:43:00');
INSERT INTO `iptv_udpxy` VALUES ('61.157.206.96_8888_tcp', 1060, '四川-电信', '南充市', '61.157.206.96', '8888', 0, 1, '2024-03-05 00:37:34');
INSERT INTO `iptv_udpxy` VALUES ('61.158.175.136_20000_tcp', 1500, '河南-联通', '商丘市', '61.158.175.136', '20000', 0, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('61.158.175.136_8888_tcp', 1500, '河南-联通', '商丘市', '61.158.175.136', '8888', 0, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('61.185.200.191_8000_tcp', 2200, '陕西-电信', '西安市', '61.185.200.191', '8000', 0, 1, '2024-04-04 00:28:39');
INSERT INTO `iptv_udpxy` VALUES ('61.190.129.195_8686_tcp', 1080, '安徽-电信', '马鞍山市', '61.190.129.195', '8686', 3, 1, '2024-04-04 00:06:17');
INSERT INTO `iptv_udpxy` VALUES ('61.224.112.72_9088_tcp', 3500, '台湾-电信', '苗栗县', '61.224.112.72', '9088', 0, 0, '2024-04-04 01:06:33');
INSERT INTO `iptv_udpxy` VALUES ('61.240.39.46_8085_tcp', 1105, '山西-联通', '太原市', '61.240.39.46', '8085', 1, 1, '2024-04-04 00:10:37');
INSERT INTO `iptv_udpxy` VALUES ('61.51.141.145_8888_tcp', 1050, '北京-联通', '北京市', '61.51.141.145', '8888', 2, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('61.52.26.70_2000_tcp', 1500, '河南-联通', '郑州市', '61.52.26.70', '2000', 12, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('ghostygy001.cn_7000_tcp', 2605, '内蒙古-联通', '乌兰察布市', '116.112.91.149', '7000', 6, 1, '2024-04-04 00:46:31');
INSERT INTO `iptv_udpxy` VALUES ('j4125.hanzy888.top_8899_tcp', 2005, '辽宁-电信', '盘锦市', '123.244.154.7', '8899', 0, 0, '2024-04-04 00:25:40');
INSERT INTO `iptv_udpxy` VALUES ('ljl.sy012.com_4000_tcp', 1900, '福建-联通', '莆田市', '175.44.46.65', '4000', 0, 1, '2024-04-04 00:21:40');
INSERT INTO `iptv_udpxy` VALUES ('nas.tuyuannet.cn_8800_tcp', 2300, '吉林-电信', '长春市', '36.49.53.197', '8800', 0, 0, '2024-04-04 00:28:41');
INSERT INTO `iptv_udpxy` VALUES ('weec.top_2222_tcp', 1053, '北京-移动', '北京市', '223.72.33.118', '2222', 1, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('www.2ww.cn_8029_tcp', 2400, '甘肃-电信', '武威市', '61.178.184.39', '8029', 0, 1, '2024-04-04 00:33:39');
INSERT INTO `iptv_udpxy` VALUES ('www.hn-valve.com_8888_tcp', 1800, '湖南-电信', '衡阳市', '118.254.203.236', '8888', 1, 1, '2024-04-04 00:21:39');
INSERT INTO `iptv_udpxy` VALUES ('www.hyun.tech_443_tcp', 1095, '山东-电信', '济南市', '182.40.78.252', '443', 0, 0, '2024-04-04 00:06:19');
INSERT INTO `iptv_udpxy` VALUES ('www.lizz-iot.top_4000_tcp', 1405, '河北-联通', '廊坊市', '119.251.120.37', '4000', 0, 1, '2024-04-04 00:19:58');
INSERT INTO `iptv_udpxy` VALUES ('www.unraidd.top_8282_tcp', 2600, '内蒙古-电信', '通辽市', '1.183.176.61', '8282', 1, 1, '2024-04-04 00:42:36');
INSERT INTO `iptv_udpxy` VALUES ('www.weec.top_2222_tcp', 1053, '北京-移动', '北京市', '223.72.33.118', '2222', 1, 1, '2024-04-04 00:05:58');
INSERT INTO `iptv_udpxy` VALUES ('www.wuwei8.com_8029_tcp', 2400, '甘肃-电信', '武威市', '61.178.184.39', '8029', 0, 1, '2024-04-04 00:33:39');
INSERT INTO `iptv_udpxy` VALUES ('www.zonekeyxj.cloud_4000_tcp', 2500, '新疆-电信', '乌鲁木齐市', '222.82.200.153', '4000', 0, 0, '2024-04-04 00:38:19');

SET FOREIGN_KEY_CHECKS = 1;
