--
-- Table structure for table `tNotice`
--

DROP TABLE IF EXISTS `tNotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tNotice` (
  `NIndex` int(11) NOT NULL auto_increment COMMENT 'お知らせId',
  `NTitle` varchar(255) NOT NULL default 'お知らせ' COMMENT 'お知らせTitle',
  `NCreatedDate` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT 'お知らせ投稿日時',
  `NContent` text NOT NULL COMMENT 'お知らせ内容',
  `NStartDate` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '掲載開始日時',
  `NEndDate` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '掲載終了日時',
  PRIMARY KEY  (`NIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tNotice`
--

LOCK TABLES `tNotice` WRITE;
/*!40000 ALTER TABLE `tNotice` DISABLE KEYS */;
INSERT INTO `tNotice` VALUES (20,'NEW BOOK IN','2016-06-12 05:12:56','RubyOnRails','0000-00-00 00:00:00','2016-04-10 22:12:55');
INSERT INTO `tNotice` VALUES (21,'BOOK IN','2016-06-11 05:14:46','cakePHP','0000-00-00 00:00:00','2013-04-10 22:14:46');
/*!40000 ALTER TABLE `tNotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tMember`
--

DROP TABLE IF EXISTS `tMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tMember` (
  `memberId` varchar(255) NOT NULL COMMENT 'メンバーId',
  `memberPassword` char(41) NOT NULL COMMENT 'パスワード',
  `memberName` varchar(255) NOT NULL COMMENT '本名',
  `memberAddress` varchar(255) default NULL COMMENT '住まい',
  `memberWorkPlace` varchar(255) default NULL COMMENT '勤務地',
  `memberGender` varchar(255) default NULL COMMENT '性別',
  `memberCreateDate` timestamp NOT NULL DEFAULT 0 COMMENT '登録日時',
  `memberDeleteDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '削除日時',
  `memberPrivilege` int(11) NOT NULL default '1' COMMENT '権限',
  PRIMARY KEY  (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tMember`
--

LOCK TABLES `tMember` WRITE;
/*!40000 ALTER TABLE `tMember` DISABLE KEYS */;
INSERT INTO `tMember` VALUES('admin','admin','Administrator','Tokyo','Soumu','male','2016-04-11 09:17:43','0000-00-00 00:00:00',0);
INSERT INTO `tMember` VALUES('hanako','hanako','AdminHanako','Tokyo','Jinji','female','2016-04-12 01:46:48','0000-00-00 00:00:00',0);
INSERT INTO `tMember` VALUES('taro','taro','Tanaka Taro','Osaka','Kaihatu','male','2013-04-11 06:53:53','0000-00-00 00:00:00',1);
INSERT INTO `tMember` VALUES('high','high','Haichi Jin','Kanagawa','Keiri','male','2013-04-11 09:00:13','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `tMember` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tCategory`;
CREATE TABLE  tCategory (
  CId NUMERIC(10) PRIMARY KEY,
  CName varchar(100) NOT NULL
);


DROP TABLE IF EXISTS `tIsbnBook`;
CREATE TABLE  tIsbnBook (
  IBId int auto_increment PRIMARY KEY,
  IBisbn varchar(20) NOT NULL,
  CId NUMERIC(10) NOT NULL,
  IBTitle varchar(100) NOT NULL,
  IBAuthor varchar(100) NOT NULL,
  IBStatflg NUMERIC(1) NOT NULL,
  IBisbnCreateDate timestamp NOT NULL DEFAULT 0 COMMENT '書籍入荷日',
  IBisbnDeleteDate timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '書籍廃棄日'
);


DROP TABLE IF EXISTS `tLending`;
CREATE TABLE  tLending (
  LId int auto_increment PRIMARY KEY,
  IBId NUMERIC(10) NOT NULL,
  memberId varchar(255) NOT NULL,
  LStartDate date NOT NULL,
  LReturnDate date NULL
);

INSERT INTO tCategory VALUES (1, '文学・評論');
INSERT INTO tCategory VALUES (2, '人文・思想');
INSERT INTO tCategory VALUES (3, '社会・政治・法律');
INSERT INTO tCategory VALUES (4, '歴史・地理');
INSERT INTO tCategory VALUES (5, '科学・テクノロジー');
INSERT INTO tCategory VALUES (6, '医学・薬学');
INSERT INTO tCategory VALUES (7, 'コンピュータ・インターネット');
INSERT INTO tCategory VALUES (8, '暮らし・健康・子育て');
INSERT INTO tCategory VALUES (9, 'アダルト');

INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('kei000001', 1, '税金はなぜ高いのか', '税博士', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('kei000002', 1, '金融のからくり', '利惟哉', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('rek000001', 2, '日本の歴史', '足利信長', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('rek000002', 2, '米国の歴史', 'グッシュ', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('com000001', 3, 'わかりやすいJava', '益田陽一', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('com000002', 3, 'DBリファレンス', '戸塚信二', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('bun000001', 4, '戦争と試合', 'トルトル', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('bun000002', 4, '摘み賭罰', 'ドストアイスキー', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('sei000001', 5, '猫と仲良くなるには', '猫田恵美', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('sei000002', 5, 'らくちんダイエット', '細区奈留代', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('eho000001', 6, 'さんすうができるようになるほん', 'やまもとさや', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('eho000002', 6, 'たのしいどうよう', 'ふるたまさあき', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');
INSERT INTO tIsbnBook(IBisbn,CId,IBTitle,IBAuthor,IBStatflg,IBisbnCreateDate,IBisbnDeleteDate) VALUES ('eho000003', 6, 'もふもふテクニック', 'ねこ', 0,'2016-04-11 09:17:43','0000-00-00 00:00:00');

