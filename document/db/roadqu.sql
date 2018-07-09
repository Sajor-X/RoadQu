/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : roadqu

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 09/07/2018 09:20:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentid` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) DEFAULT NULL,
  `commentcontent` varchar(255) DEFAULT NULL,
  `commentdate` date DEFAULT NULL,
  `memoryid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`commentid`),
  KEY `userid` (`userid`),
  KEY `memoryid` (`memoryid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`memoryid`) REFERENCES `travelmemory` (`tmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('6966835882b511e89fcf7297a05be97f', '1d38e60ecaff1036a13650d12a5c507c', 'nihao', '2018-07-08', 'asdaffdafadfadf');
INSERT INTO `comment` VALUES ('asfasgadfg', 'b2238d65ca571036a13650d12a5c507c', '这个地方景色优美，很适合度假', '2018-07-04', 'asdaffdafadfadf');
COMMIT;

-- ----------------------------
-- Table structure for memorytype
-- ----------------------------
DROP TABLE IF EXISTS `memorytype`;
CREATE TABLE `memorytype` (
  `memorytypeid` int(11) NOT NULL DEFAULT '0',
  `memorytype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`memorytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of memorytype
-- ----------------------------
BEGIN;
INSERT INTO `memorytype` VALUES (1001, '面朝大海');
INSERT INTO `memorytype` VALUES (1002, '古镇时光');
INSERT INTO `memorytype` VALUES (1003, '吃货血拼');
INSERT INTO `memorytype` VALUES (1004, '户外撒野');
COMMIT;

-- ----------------------------
-- Table structure for strategytype
-- ----------------------------
DROP TABLE IF EXISTS `strategytype`;
CREATE TABLE `strategytype` (
  `stypesid` int(11) NOT NULL,
  `stypesname` varchar(255) NOT NULL,
  PRIMARY KEY (`stypesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strategytype
-- ----------------------------
BEGIN;
INSERT INTO `strategytype` VALUES (1001, '主题游');
INSERT INTO `strategytype` VALUES (2001, '时令游');
COMMIT;

-- ----------------------------
-- Table structure for systemnotice
-- ----------------------------
DROP TABLE IF EXISTS `systemnotice`;
CREATE TABLE `systemnotice` (
  `snid` varchar(255) NOT NULL DEFAULT '',
  `sntitle` varchar(255) DEFAULT NULL,
  `sncontent` varchar(255) DEFAULT NULL,
  `sntime` date DEFAULT NULL,
  `snauthor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`snid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for travelkeep
-- ----------------------------
DROP TABLE IF EXISTS `travelkeep`;
CREATE TABLE `travelkeep` (
  `tkid` varchar(255) NOT NULL DEFAULT '',
  `tktitle` varchar(255) DEFAULT NULL,
  `tkdestination` varchar(255) DEFAULT NULL,
  `tkbegintime` timestamp NULL DEFAULT NULL,
  `tkaftertime` timestamp NULL DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `tktime` timestamp NULL DEFAULT NULL,
  `tkphone` varchar(255) DEFAULT NULL,
  `tkdetails` varchar(255) DEFAULT NULL,
  `tkimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tkid`),
  KEY `fk_keep_userid` (`userid`),
  CONSTRAINT `fk_keep_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of travelkeep
-- ----------------------------
BEGIN;
INSERT INTO `travelkeep` VALUES ('123', '【2013年7月1日-2013年7月5日】苏州行', '苏州', '2018-07-08 00:00:00', '2018-07-10 00:00:00', '1d38e60ecaff1036a13650d12a5c507c', '2018-07-08 00:00:00', '15201345955', '苏州（Suzhou），中国华东地区特大城市之一，首批历史文化名城，中国十大重点风景旅游城市之一。地处长江三角洲，位于江苏省东南部，古称吴郡。苏州古城始建于公元前514年的吴王阖闾时期，建城史逾2500年，又因城西南有山曰姑苏，于隋开皇九年（589年）更名为苏州。苏州历史悠久，人文荟萃，以“上有天堂，下有苏杭”而驰声海内，秀丽、典雅且有“甲江南”声名的苏州园林，小桥流水环绕姑苏城内，令人心驰神往。苏州是长江三角洲经济圈北翼重要的副中心城市之一，诚征驴友同行。', '/images/login_poi_2013031109362.jpg');
INSERT INTO `travelkeep` VALUES ('124', '【2013年7月1日-2013年7月5日】日本行', '日本', '2018-07-08 00:00:00', '2018-07-10 00:00:00', 'd2f7624eca5b1036a13650d12a5c507c', '2018-07-08 00:00:00', '15201345955', '日本', '/images/login_poi_2013031109523.jpg');
COMMIT;

-- ----------------------------
-- Table structure for travelmemory
-- ----------------------------
DROP TABLE IF EXISTS `travelmemory`;
CREATE TABLE `travelmemory` (
  `tmid` varchar(255) NOT NULL DEFAULT '',
  `tmtitle` varchar(255) DEFAULT NULL,
  `memorytypeid` int(11) DEFAULT NULL,
  `tmimg` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `tmtime` date DEFAULT NULL,
  `tmcontent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tmid`),
  KEY `fk_mem_userid` (`userid`),
  KEY `memorytypeid` (`memorytypeid`),
  CONSTRAINT `fk_mem_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `travelmemory_ibfk_1` FOREIGN KEY (`memorytypeid`) REFERENCES `memorytype` (`memorytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of travelmemory
-- ----------------------------
BEGIN;
INSERT INTO `travelmemory` VALUES ('asdaffdafadfadf', '历山水库', 1001, '/images/login_poi_2013031109362.jpg', 'b2238d65ca571036a13650d12a5c507c', '2018-07-08', '西丽水库历史悠久，风景优美，是春天骑行的好去处.');
INSERT INTO `travelmemory` VALUES ('asdaffdafasddfadf', '历山水库', 1001, '/images/login_poi_2013031109362.jpg', '1d38e60ecaff1036a13650d12a5c507c', '2018-07-08', '西丽水库历史悠久，风景优美，是春天骑行的好去处.');
INSERT INTO `travelmemory` VALUES ('asdasfas', '历山水库', 1002, '/images/login_poi_2013031109362.jpg', '1d38e60ecaff1036a13650d12a5c507c', '2018-07-01', '西丽水库历史悠久，风景优美，是春天骑行的好去处。');
INSERT INTO `travelmemory` VALUES ('asdasfasds1', '历山水库', 1002, '/images/login_poi_2013031109362.jpg', 'd2f7624eca5b1036a13650d12a5c507c', '2018-07-01', '西丽水库历史悠久，风景优美，是春天骑行的好去处。');
INSERT INTO `travelmemory` VALUES ('asdasfdsfsas3', '历山水库', 1004, '/images/login_poi_2013031109362.jpg', '1d38e60ecaff1036a13650d12a5c507c', '2018-07-01', '西丽水库历史悠久，风景优美，是春天骑行的好去处。');
INSERT INTO `travelmemory` VALUES ('asdasfsdfsas2', '历山水库', 1003, '/images/login_poi_2013031109362.jpg', 'b2238d65ca571036a13650d12a5c507c', '2018-07-01', '西丽水库历史悠久，风景优美，是春天骑行的好去处。');
INSERT INTO `travelmemory` VALUES ('qweqassa', '惠州罗浮山', 1001, '/images/001.jpg', 'fa859a48ca571036a13650d12a5c507c', '2018-07-06', '惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。');
INSERT INTO `travelmemory` VALUES ('qweqassasada1', '婺源', 1001, '/images/login_poi_2013031109523.jpg', '1d38e60ecaff1036a13650d12a5c507c', '2018-07-06', '漫步在婺源油菜花田间，不知有多么的诗情画意。');
INSERT INTO `travelmemory` VALUES ('qweqassasada14', '婺源', 1004, '/images/login_poi_2013031109523.jpg', 'd2f7624eca5b1036a13650d12a5c507c', '2018-07-06', '漫步在婺源油菜花田间，不知有多么的诗情画意。');
INSERT INTO `travelmemory` VALUES ('qweqassasada2', '婺源', 1002, '/images/login_poi_2013031109523.jpg', 'b2238d65ca571036a13650d12a5c507c', '2018-07-06', '漫步在婺源油菜花田间，不知有多么的诗情画意。');
INSERT INTO `travelmemory` VALUES ('qweqassasada3', '婺源', 1003, '/images/login_poi_2013031109523.jpg', 'fa859a48ca571036a13650d12a5c507c', '2018-07-06', '漫步在婺源油菜花田间，不知有多么的诗情画意。');
INSERT INTO `travelmemory` VALUES ('qweqassdfssa1', '惠州罗浮山', 1001, '/images/001.jpg', '1d38e60ecaff1036a13650d12a5c507c', '2018-07-06', '惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。');
INSERT INTO `travelmemory` VALUES ('qweqassdfssa2', '惠州罗浮山', 1002, '/images/001.jpg', '1d38e60ecaff1036a13650d12a5c507c', '2018-07-06', '惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。');
INSERT INTO `travelmemory` VALUES ('qweqassdfssa3', '惠州罗浮山', 1003, '/images/001.jpg', 'd2f7624eca5b1036a13650d12a5c507c', '2018-07-06', '惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。');
INSERT INTO `travelmemory` VALUES ('qweqasswqwa4', '惠州罗浮山', 1004, '/images/001.jpg', 'b2238d65ca571036a13650d12a5c507c', '2018-07-06', '惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。');
COMMIT;

-- ----------------------------
-- Table structure for travelstrategy
-- ----------------------------
DROP TABLE IF EXISTS `travelstrategy`;
CREATE TABLE `travelstrategy` (
  `tsid` varchar(255) NOT NULL,
  `tstitle` varchar(255) DEFAULT NULL,
  `tsapptime` varchar(255) DEFAULT NULL,
  `tspppeople` varchar(255) DEFAULT NULL,
  `tsimg` varchar(255) DEFAULT NULL,
  `stypesid` int(11) NOT NULL,
  `tsintro` varchar(255) DEFAULT NULL,
  `tsequip` varchar(255) DEFAULT NULL,
  `tsnotice` varchar(255) DEFAULT NULL,
  `tswant` int(11) DEFAULT NULL,
  `tsbeen` int(11) DEFAULT NULL,
  `tsname` varchar(255) DEFAULT NULL,
  `tsaddress` varchar(255) DEFAULT NULL,
  `tsdescribe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tsid`),
  KEY `stypesid` (`stypesid`),
  CONSTRAINT `travelstrategy_ibfk_1` FOREIGN KEY (`stypesid`) REFERENCES `strategytype` (`stypesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of travelstrategy
-- ----------------------------
BEGIN;
INSERT INTO `travelstrategy` VALUES ('asfadfgsdhghfdhgfjghk', '玩水嬉游 海滩撒欢', '夏季', '老少皆宜', '/images/intro_201301102121_-1.jpg', 1001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋5.泳衣', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 193, 57, '深圳大小梅沙', '大梅沙海滨公园是1999年深圳市委、市政府为民办的十件实事之一，它于1999年5月1日正式免门票对公众开放，1999年6月18日正式落成，建设总投入1.2亿元。大梅沙海滨公园总面积36万平方米，其中沙滩全长约1.8公里，沙滩总面积18万平方米，公园绿地面积为10万平方米，内湖面积为8万平方米。', '深圳拥有滩长、浪软、沙细的多个海滩，去寻找最休闲最娱乐最美丽的那片海滩吧。');
INSERT INTO `travelstrategy` VALUES ('asfadfgsdhghfdhgfjghk1', '玩水嬉游 海滩撒欢', '夏季', '老少皆宜', '/images/intro_201301102121_-1.jpg', 2001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋5.泳衣', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 193, 57, '深圳大小梅沙', '大梅沙海滨公园是1999年深圳市委、市政府为民办的十件实事之一，它于1999年5月1日正式免门票对公众开放，1999年6月18日正式落成，建设总投入1.2亿元。大梅沙海滨公园总面积36万平方米，其中沙滩全长约1.8公里，沙滩总面积18万平方米，公园绿地面积为10万平方米，内湖面积为8万平方米。', '深圳拥有滩长、浪软、沙细的多个海滩，去寻找最休闲最娱乐最美丽的那片海滩吧。');
INSERT INTO `travelstrategy` VALUES ('qweqwreasfdssadxvfg', '一街两制  中英街', '四季皆宜', '老少皆宜', '/images/intro_201301102121_-4.jpg', 2001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋5.泳衣', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 100, 57, '中英街', '中英街，位于深圳市盐田区沙头角街道的中英街，由梧桐山流向大鹏湾的小河河床淤积成，原名“鹭鹚径”。长不足0.5公里，宽不够7米，街心以“界碑石”为界，街边商店林立，有来自五大洲的产品，品种十分齐全。因到特区的人要到深圳市公安局办理一张“前往边防禁区特许通行证”，才能进入“中英街”，故“中英街”被称作特区中的“特区”。因为里面有香港区域，入景区需要办通行证，普通人办蓝证，每人十元，办证工作时间为8：30~12：00和13：00~16：00，就在景区门口的办证大厅。', '沧桑和繁华的中英街，深圳特有的、全世界独一无二的“一街两制”免税商业街。');
INSERT INTO `travelstrategy` VALUES ('qweqwrewtwrtfdgfggjfg', '大鹏古城 深圳发源地', '四季皆宜', '老少皆宜', '/images/intro_201301102121_-2.jpg', 1001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋5.泳衣', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 193, 57, '大鹏古城', '大鹏古城即大鹏所城 ,位于深圳市东部龙岗区大鹏镇鹏城村，占地11万平方米，始建于明洪武二十七年（1394年）。是深圳目前唯一的国家级重点文物保护单位。鸦片战争时抗英名将广东水师提督赖恩爵的“振威将军第”和福建水师提督刘启龙的“将军第”规模宏大，气势不凡。1839年9月，赖恩爵指挥抗英取得胜利的九龙海战，拉开了鸦片战争的序幕。当年大鹏所城占地约10万平方米，城墙高6米、长1200米，城墙由山麻石、青石砖砌成。深圳今天的简称“鹏城”即源于此。', '古城小巷间，隐匿着多少失落的历史光阴，寻古探幽，发现历史与禅意。');
INSERT INTO `travelstrategy` VALUES ('qweqwrewtwrtfdgfggjfg1', '大鹏古城 深圳发源地', '四季皆宜', '老少皆宜', '/images/intro_201301102121_-2.jpg', 2001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋5.泳衣', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 193, 57, '大鹏古城', '大鹏古城即大鹏所城 ,位于深圳市东部龙岗区大鹏镇鹏城村，占地11万平方米，始建于明洪武二十七年（1394年）。是深圳目前唯一的国家级重点文物保护单位。鸦片战争时抗英名将广东水师提督赖恩爵的“振威将军第”和福建水师提督刘启龙的“将军第”规模宏大，气势不凡。1839年9月，赖恩爵指挥抗英取得胜利的九龙海战，拉开了鸦片战争的序幕。当年大鹏所城占地约10万平方米，城墙高6米、长1200米，城墙由山麻石、青石砖砌成。深圳今天的简称“鹏城”即源于此。', '古城小巷间，隐匿着多少失落的历史光阴，寻古探幽，发现历史与禅意。');
INSERT INTO `travelstrategy` VALUES ('qweqwrewtwrzxczxvfg', '大望梧桐  深圳桃花源', '春季', '老少皆宜', '/images/intro_201301102121_-3.jpg', 2001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋5.泳衣', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 123, 57, '梧桐山', '梧桐山风景名胜区位于东经113 °17～114 °18，北纬22 °23～22 °43的沿海地区，在深圳经济特区东部，西临深圳水库，东至盐田港，南北均临近特区边界。风景名胜区邻近繁华市区，面临南海大鹏湾，与香港新界山脉相连、溪水相通，具备了国内风景区名胜区中独特的地理位置。', '不经意间，在深圳大望，发现那么一个地方，只一眼，所有小时候的记忆呼之欲出。');
INSERT INTO `travelstrategy` VALUES ('qweqwrewtwrzxczxvfg1', '大望梧桐  深圳桃花源', '春季', '老少皆宜', '/images/intro_201301102121_-3.jpg', 1001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋5.泳衣', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 123, 57, '梧桐山', '梧桐山风景名胜区位于东经113 °17～114 °18，北纬22 °23～22 °43的沿海地区，在深圳经济特区东部，西临深圳水库，东至盐田港，南北均临近特区边界。风景名胜区邻近繁华市区，面临南海大鹏湾，与香港新界山脉相连、溪水相通，具备了国内风景区名胜区中独特的地理位置。', '不经意间，在深圳大望，发现那么一个地方，只一眼，所有小时候的记忆呼之欲出。');
INSERT INTO `travelstrategy` VALUES ('qwqrfsdgdfhfgjghjfg', '观澜版画村 画中有话', '春季', '老少皆宜', '/images/intro_201301102119_-1.jpg', 1001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 143, 57, '观澜版画村', '深圳梧桐山风景名胜区位于东经113 °17\'～114 °18\',北纬22 °23\'～22 °43\'的沿海地区，在深圳经济特区东部，西临深圳水库，东至盐田港，南北均临近特区边界。风景名胜区邻近繁华市区，面临南海大鹏湾，与香港新界山脉相连、溪水相通，具备了国内风景区名胜区中独特的地理位置。', '久负盛名客家小村，都市繁华深处的一块净土，深圳最美丽的乡村。');
INSERT INTO `travelstrategy` VALUES ('qwqrfsdgdfhfgjghjfg1', '观澜版画村 画中有话', '春季', '老少皆宜', '/images/intro_201301102119_-1.jpg', 2001, '深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。', '1.雨伞2.外套3.充电器4.运动鞋', '1、出门在外，安全第一（人身、财产、证件）；2、穿衣佩戴，应时应景；3、自备药品，有备无患；4、入乡随俗，尊重为要', 143, 57, '观澜版画村', '深圳观澜版画村风景名胜区位于东经113 °17\'～114 °18\',北纬22 °23\'～22 °43\'的沿海地区，在深圳经济特区东部，西临深圳水库，东至盐田港，南北均临近特区边界。风景名胜区邻近繁华市区，面临南海大鹏湾，与香港新界山脉相连、溪水相通，具备了国内风景区名胜区中独特的地理位置。', '久负盛名客家小村，都市繁华深处的一块净土，深圳最美丽的乡村。');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `userstate` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `usercount` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1d38e60ecaff1036a13650d12a5c507c', 'qwe', '123', NULL, 'qwert@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES ('b2238d65ca571036a13650d12a5c507c', 'wangwu', '123', NULL, '123@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES ('d2f7624eca5b1036a13650d12a5c507c', 'limin001', '123456', NULL, '778998776@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES ('fa859a48ca571036a13650d12a5c507c', 'zhangsan', 'qwertyuiop', NULL, '88839992@qq.com', NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
