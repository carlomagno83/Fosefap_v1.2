/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : fosefap

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2013-09-23 22:06:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ataudes
-- ----------------------------
DROP TABLE IF EXISTS `ataudes`;
CREATE TABLE `ataudes` (
  `idcolor` int(11) NOT NULL,
  `idmodeloAtaudes` int(11) NOT NULL,
  `idtamanoAtaudes` int(11) NOT NULL,
  `observacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcolor`,`idmodeloAtaudes`,`idtamanoAtaudes`),
  KEY `fk_ataudes_colores1_idx` (`idcolor`),
  KEY `fk_ataudes_modeloataudes1_idx` (`idmodeloAtaudes`),
  KEY `fk_ataudes_tamanoAtaudes1_idx` (`idtamanoAtaudes`),
  CONSTRAINT `fk_ataudes_colores1` FOREIGN KEY (`idcolor`) REFERENCES `colores` (`idcolor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ataudes_modeloataudes1` FOREIGN KEY (`idmodeloAtaudes`) REFERENCES `modeloataudes` (`idmodeloAtaudes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ataudes_tamanoAtaudes1` FOREIGN KEY (`idtamanoAtaudes`) REFERENCES `tamanoataudes` (`idtamanoAtaudes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of ataudes
-- ----------------------------
INSERT INTO `ataudes` VALUES ('2', '1', '1', 'oo');

-- ----------------------------
-- Table structure for candelabros
-- ----------------------------
DROP TABLE IF EXISTS `candelabros`;
CREATE TABLE `candelabros` (
  `idcandelabros` int(11) NOT NULL AUTO_INCREMENT,
  `observacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idtipoCandelabros` int(11) NOT NULL,
  PRIMARY KEY (`idcandelabros`),
  KEY `fk_candelabros_tipo1_idx` (`idtipoCandelabros`),
  CONSTRAINT `fk_candelabros_tipo1` FOREIGN KEY (`idtipoCandelabros`) REFERENCES `tipocandelabros` (`idtipoCandelabros`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of candelabros
-- ----------------------------

-- ----------------------------
-- Table structure for capillas
-- ----------------------------
DROP TABLE IF EXISTS `capillas`;
CREATE TABLE `capillas` (
  `idcapilla` int(11) NOT NULL AUTO_INCREMENT,
  `manto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `cristo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `velas` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `flamas` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `alfombra` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `letrero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `tarjetero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idataud` int(11) NOT NULL,
  `idcandelabros` int(11) NOT NULL,
  PRIMARY KEY (`idcapilla`),
  KEY `fk_capilla_candelabros1_idx` (`idcandelabros`),
  CONSTRAINT `fk_capilla_candelabros1` FOREIGN KEY (`idcandelabros`) REFERENCES `candelabros` (`idcandelabros`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of capillas
-- ----------------------------

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'Velatorio');
INSERT INTO `categorias` VALUES ('2', 'Crematorio');
INSERT INTO `categorias` VALUES ('4', 'Flores');
INSERT INTO `categorias` VALUES ('6', 'Cementerio');

-- ----------------------------
-- Table structure for colores
-- ----------------------------
DROP TABLE IF EXISTS `colores`;
CREATE TABLE `colores` (
  `idcolor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcolor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of colores
-- ----------------------------
INSERT INTO `colores` VALUES ('1', 'Negro');
INSERT INTO `colores` VALUES ('2', 'Blanco');
INSERT INTO `colores` VALUES ('3', 'Azul');
INSERT INTO `colores` VALUES ('4', 'Being');

-- ----------------------------
-- Table structure for combustibles
-- ----------------------------
DROP TABLE IF EXISTS `combustibles`;
CREATE TABLE `combustibles` (
  `idcombustible` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcombustible`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of combustibles
-- ----------------------------
INSERT INTO `combustibles` VALUES ('1', 'Diesel');
INSERT INTO `combustibles` VALUES ('2', 'GLP');
INSERT INTO `combustibles` VALUES ('3', 'Gasolina');
INSERT INTO `combustibles` VALUES ('4', 'GNV');

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `iddepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES ('1', 'AMAZONAS');
INSERT INTO `departamentos` VALUES ('2', 'ANCASH');
INSERT INTO `departamentos` VALUES ('3', 'APURIMAC');
INSERT INTO `departamentos` VALUES ('4', 'AREQUIPA');
INSERT INTO `departamentos` VALUES ('5', 'AYACUCHO');
INSERT INTO `departamentos` VALUES ('6', 'CAJAMARCA');
INSERT INTO `departamentos` VALUES ('7', 'CALLAO');
INSERT INTO `departamentos` VALUES ('8', 'CUSCO');
INSERT INTO `departamentos` VALUES ('9', 'HUANCAVELICA');
INSERT INTO `departamentos` VALUES ('10', 'HUANUCO');
INSERT INTO `departamentos` VALUES ('11', 'ICA');
INSERT INTO `departamentos` VALUES ('12', 'JUNIN');
INSERT INTO `departamentos` VALUES ('13', 'LA LIBERTAD');
INSERT INTO `departamentos` VALUES ('14', 'LAMBAYEQUE');
INSERT INTO `departamentos` VALUES ('15', 'LIMA');
INSERT INTO `departamentos` VALUES ('16', 'LORETO');
INSERT INTO `departamentos` VALUES ('17', 'MADRE DE DIOS');
INSERT INTO `departamentos` VALUES ('18', 'MOQUEGUA');
INSERT INTO `departamentos` VALUES ('19', 'PASCO');
INSERT INTO `departamentos` VALUES ('20', 'PIURA');
INSERT INTO `departamentos` VALUES ('21', 'PUNO');
INSERT INTO `departamentos` VALUES ('22', 'SAN MARTIN');
INSERT INTO `departamentos` VALUES ('23', 'TACNA');
INSERT INTO `departamentos` VALUES ('24', 'TUMBES');
INSERT INTO `departamentos` VALUES ('25', 'UCAYALI');

-- ----------------------------
-- Table structure for distritos
-- ----------------------------
DROP TABLE IF EXISTS `distritos`;
CREATE TABLE `distritos` (
  `iddistrito` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idprovincia` int(11) NOT NULL,
  PRIMARY KEY (`iddistrito`),
  KEY `fk_distritos_provincias1` (`idprovincia`),
  CONSTRAINT `fk_distritos_provincias1` FOREIGN KEY (`idprovincia`) REFERENCES `provincias` (`idprovincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1832 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of distritos
-- ----------------------------
INSERT INTO `distritos` VALUES ('1', 'CHACHAPOYAS', '1');
INSERT INTO `distritos` VALUES ('2', 'ASUNCION', '1');
INSERT INTO `distritos` VALUES ('3', 'BALSAS', '1');
INSERT INTO `distritos` VALUES ('4', 'CHETO', '1');
INSERT INTO `distritos` VALUES ('5', 'CHILIQUIN', '1');
INSERT INTO `distritos` VALUES ('6', 'CHUQUIBAMBA', '1');
INSERT INTO `distritos` VALUES ('7', 'GRANADA', '1');
INSERT INTO `distritos` VALUES ('8', 'HUANCAS', '1');
INSERT INTO `distritos` VALUES ('9', 'LA JALCA', '1');
INSERT INTO `distritos` VALUES ('10', 'LEIMEBAMBA', '1');
INSERT INTO `distritos` VALUES ('11', 'LEVANTO', '1');
INSERT INTO `distritos` VALUES ('12', 'MAGDALENA', '1');
INSERT INTO `distritos` VALUES ('13', 'MARISCAL CASTILLA', '1');
INSERT INTO `distritos` VALUES ('14', 'MOLINOPAMPA', '1');
INSERT INTO `distritos` VALUES ('15', 'MONTEVIDEO', '1');
INSERT INTO `distritos` VALUES ('16', 'OLLEROS', '1');
INSERT INTO `distritos` VALUES ('17', 'QUINJALCA', '1');
INSERT INTO `distritos` VALUES ('18', 'SAN FRANCISCO DE DAGUAS', '1');
INSERT INTO `distritos` VALUES ('19', 'SAN ISIDRO DE MAINO', '1');
INSERT INTO `distritos` VALUES ('20', 'SOLOCO', '1');
INSERT INTO `distritos` VALUES ('21', 'SONCHE', '1');
INSERT INTO `distritos` VALUES ('22', 'LA PECA', '2');
INSERT INTO `distritos` VALUES ('23', 'ARAMANGO', '2');
INSERT INTO `distritos` VALUES ('24', 'COPALLIN', '2');
INSERT INTO `distritos` VALUES ('25', 'EL PARCO', '2');
INSERT INTO `distritos` VALUES ('26', 'IMAZA', '2');
INSERT INTO `distritos` VALUES ('27', 'JUMBILLA', '3');
INSERT INTO `distritos` VALUES ('28', 'CHISQUILLA', '3');
INSERT INTO `distritos` VALUES ('29', 'CHURUJA', '3');
INSERT INTO `distritos` VALUES ('30', 'COROSHA', '3');
INSERT INTO `distritos` VALUES ('31', 'CUISPES', '3');
INSERT INTO `distritos` VALUES ('32', 'FLORIDA', '3');
INSERT INTO `distritos` VALUES ('33', 'JAZAN', '3');
INSERT INTO `distritos` VALUES ('34', 'RECTA', '3');
INSERT INTO `distritos` VALUES ('35', 'SAN CARLOS', '3');
INSERT INTO `distritos` VALUES ('36', 'SHIPASBAMBA', '3');
INSERT INTO `distritos` VALUES ('37', 'VALERA', '3');
INSERT INTO `distritos` VALUES ('38', 'YAMBRASBAMBA', '3');
INSERT INTO `distritos` VALUES ('39', 'NIEVA', '4');
INSERT INTO `distritos` VALUES ('40', 'EL CENEPA', '4');
INSERT INTO `distritos` VALUES ('41', 'RIO SANTIAGO', '4');
INSERT INTO `distritos` VALUES ('42', 'LAMUD', '5');
INSERT INTO `distritos` VALUES ('43', 'CAMPORREDONDO', '5');
INSERT INTO `distritos` VALUES ('44', 'COCABAMBA', '5');
INSERT INTO `distritos` VALUES ('45', 'COLCAMAR', '5');
INSERT INTO `distritos` VALUES ('46', 'CONILA', '5');
INSERT INTO `distritos` VALUES ('47', 'INGUILPATA', '5');
INSERT INTO `distritos` VALUES ('48', 'LONGUITA', '5');
INSERT INTO `distritos` VALUES ('49', 'LONYA CHICO', '5');
INSERT INTO `distritos` VALUES ('50', 'LUYA', '5');
INSERT INTO `distritos` VALUES ('51', 'LUYA VIEJO', '5');
INSERT INTO `distritos` VALUES ('52', 'MARIA', '5');
INSERT INTO `distritos` VALUES ('53', 'OCALLI', '5');
INSERT INTO `distritos` VALUES ('54', 'OCUMAL', '5');
INSERT INTO `distritos` VALUES ('55', 'PISUQUIA', '5');
INSERT INTO `distritos` VALUES ('56', 'PROVIDENCIA', '5');
INSERT INTO `distritos` VALUES ('57', 'SAN CRISTOBAL', '5');
INSERT INTO `distritos` VALUES ('58', 'SAN FRANCISCO DEL YESO', '5');
INSERT INTO `distritos` VALUES ('59', 'SAN JERONIMO', '5');
INSERT INTO `distritos` VALUES ('60', 'SAN JUAN DE LOPECANCHA', '5');
INSERT INTO `distritos` VALUES ('61', 'SANTA CATALINA', '5');
INSERT INTO `distritos` VALUES ('62', 'SANTO TOMAS', '5');
INSERT INTO `distritos` VALUES ('63', 'TINGO', '5');
INSERT INTO `distritos` VALUES ('64', 'TRITA', '5');
INSERT INTO `distritos` VALUES ('65', 'SAN NICOLAS', '6');
INSERT INTO `distritos` VALUES ('66', 'CHIRIMOTO', '6');
INSERT INTO `distritos` VALUES ('67', 'COCHAMAL', '6');
INSERT INTO `distritos` VALUES ('68', 'HUAMBO', '6');
INSERT INTO `distritos` VALUES ('69', 'LIMABAMBA', '6');
INSERT INTO `distritos` VALUES ('70', 'LONGAR', '6');
INSERT INTO `distritos` VALUES ('71', 'MARISCAL BENAVIDES', '6');
INSERT INTO `distritos` VALUES ('72', 'MILPUC', '6');
INSERT INTO `distritos` VALUES ('73', 'OMIA', '6');
INSERT INTO `distritos` VALUES ('74', 'SANTA ROSA', '6');
INSERT INTO `distritos` VALUES ('75', 'TOTORA', '6');
INSERT INTO `distritos` VALUES ('76', 'VISTA ALEGRE', '6');
INSERT INTO `distritos` VALUES ('77', 'BAGUA GRANDE', '7');
INSERT INTO `distritos` VALUES ('78', 'CAJARURO', '7');
INSERT INTO `distritos` VALUES ('79', 'CUMBA', '7');
INSERT INTO `distritos` VALUES ('80', 'EL MILAGRO', '7');
INSERT INTO `distritos` VALUES ('81', 'JAMALCA', '7');
INSERT INTO `distritos` VALUES ('82', 'LONYA GRANDE', '7');
INSERT INTO `distritos` VALUES ('83', 'YAMON', '7');
INSERT INTO `distritos` VALUES ('84', 'HUARAZ', '8');
INSERT INTO `distritos` VALUES ('85', 'COCHABAMBA', '8');
INSERT INTO `distritos` VALUES ('86', 'COLCABAMBA', '8');
INSERT INTO `distritos` VALUES ('87', 'HUANCHAY', '8');
INSERT INTO `distritos` VALUES ('88', 'INDEPENDENCIA', '8');
INSERT INTO `distritos` VALUES ('89', 'JANGAS', '8');
INSERT INTO `distritos` VALUES ('90', 'LA LIBERTAD', '8');
INSERT INTO `distritos` VALUES ('91', 'OLLEROS', '8');
INSERT INTO `distritos` VALUES ('92', 'PAMPAS', '8');
INSERT INTO `distritos` VALUES ('93', 'PARIACOTO', '8');
INSERT INTO `distritos` VALUES ('94', 'PIRA', '8');
INSERT INTO `distritos` VALUES ('95', 'TARICA', '8');
INSERT INTO `distritos` VALUES ('96', 'AIJA', '9');
INSERT INTO `distritos` VALUES ('97', 'CORIS', '9');
INSERT INTO `distritos` VALUES ('98', 'HUACLLAN', '9');
INSERT INTO `distritos` VALUES ('99', 'LA MERCED', '9');
INSERT INTO `distritos` VALUES ('100', 'SUCCHA', '9');
INSERT INTO `distritos` VALUES ('101', 'LLAMELLIN', '10');
INSERT INTO `distritos` VALUES ('102', 'ACZO', '10');
INSERT INTO `distritos` VALUES ('103', 'CHACCHO', '10');
INSERT INTO `distritos` VALUES ('104', 'CHINGAS', '10');
INSERT INTO `distritos` VALUES ('105', 'MIRGAS', '10');
INSERT INTO `distritos` VALUES ('106', 'SAN JUAN DE RONTOY', '10');
INSERT INTO `distritos` VALUES ('107', 'CHACAS', '11');
INSERT INTO `distritos` VALUES ('108', 'ACOCHACA', '11');
INSERT INTO `distritos` VALUES ('109', 'CHIQUIAN', '12');
INSERT INTO `distritos` VALUES ('110', 'ABELARDO PARDO LEZAMETA', '12');
INSERT INTO `distritos` VALUES ('111', 'ANTONIO RAYMONDI', '12');
INSERT INTO `distritos` VALUES ('112', 'AQUIA', '12');
INSERT INTO `distritos` VALUES ('113', 'CAJACAY', '12');
INSERT INTO `distritos` VALUES ('114', 'CANIS', '12');
INSERT INTO `distritos` VALUES ('115', 'COLQUIOC', '12');
INSERT INTO `distritos` VALUES ('116', 'HUALLANCA', '12');
INSERT INTO `distritos` VALUES ('117', 'HUASTA', '12');
INSERT INTO `distritos` VALUES ('118', 'HUAYLLACAYAN', '12');
INSERT INTO `distritos` VALUES ('119', 'LA PRIMAVERA', '12');
INSERT INTO `distritos` VALUES ('120', 'MANGAS', '12');
INSERT INTO `distritos` VALUES ('121', 'PACLLON', '12');
INSERT INTO `distritos` VALUES ('122', 'SAN MIGUEL DE CORPANQUI', '12');
INSERT INTO `distritos` VALUES ('123', 'TICLLOS', '12');
INSERT INTO `distritos` VALUES ('124', 'CARHUAZ', '13');
INSERT INTO `distritos` VALUES ('125', 'ACOPAMPA', '13');
INSERT INTO `distritos` VALUES ('126', 'AMASHCA', '13');
INSERT INTO `distritos` VALUES ('127', 'ANTA', '13');
INSERT INTO `distritos` VALUES ('128', 'ATAQUERO', '13');
INSERT INTO `distritos` VALUES ('129', 'MARCARA', '13');
INSERT INTO `distritos` VALUES ('130', 'PARIAHUANCA', '13');
INSERT INTO `distritos` VALUES ('131', 'SAN MIGUEL DE ACO', '13');
INSERT INTO `distritos` VALUES ('132', 'SHILLA', '13');
INSERT INTO `distritos` VALUES ('133', 'TINCO', '13');
INSERT INTO `distritos` VALUES ('134', 'YUNGAR', '13');
INSERT INTO `distritos` VALUES ('135', 'SAN LUIS', '14');
INSERT INTO `distritos` VALUES ('136', 'SAN NICOLAS', '14');
INSERT INTO `distritos` VALUES ('137', 'YAUYA', '14');
INSERT INTO `distritos` VALUES ('138', 'CASMA', '15');
INSERT INTO `distritos` VALUES ('139', 'BUENA VISTA ALTA', '15');
INSERT INTO `distritos` VALUES ('140', 'COMANDANTE NOEL', '15');
INSERT INTO `distritos` VALUES ('141', 'YAUTAN', '15');
INSERT INTO `distritos` VALUES ('142', 'CORONGO', '16');
INSERT INTO `distritos` VALUES ('143', 'ACO', '16');
INSERT INTO `distritos` VALUES ('144', 'BAMBAS', '16');
INSERT INTO `distritos` VALUES ('145', 'CUSCA', '16');
INSERT INTO `distritos` VALUES ('146', 'LA PAMPA', '16');
INSERT INTO `distritos` VALUES ('147', 'YANAC', '16');
INSERT INTO `distritos` VALUES ('148', 'YUPAN', '16');
INSERT INTO `distritos` VALUES ('149', 'HUARI', '17');
INSERT INTO `distritos` VALUES ('150', 'ANRA', '17');
INSERT INTO `distritos` VALUES ('151', 'CAJAY', '17');
INSERT INTO `distritos` VALUES ('152', 'CHAVIN DE HUANTAR', '17');
INSERT INTO `distritos` VALUES ('153', 'HUACACHI', '17');
INSERT INTO `distritos` VALUES ('154', 'HUACCHIS', '17');
INSERT INTO `distritos` VALUES ('155', 'HUACHIS', '17');
INSERT INTO `distritos` VALUES ('156', 'HUANTAR', '17');
INSERT INTO `distritos` VALUES ('157', 'MASIN', '17');
INSERT INTO `distritos` VALUES ('158', 'PAUCAS', '17');
INSERT INTO `distritos` VALUES ('159', 'PONTO', '17');
INSERT INTO `distritos` VALUES ('160', 'RAHUAPAMPA', '17');
INSERT INTO `distritos` VALUES ('161', 'RAPAYAN', '17');
INSERT INTO `distritos` VALUES ('162', 'SAN MARCOS', '17');
INSERT INTO `distritos` VALUES ('163', 'SAN PEDRO DE CHANA', '17');
INSERT INTO `distritos` VALUES ('164', 'UCO', '17');
INSERT INTO `distritos` VALUES ('165', 'HUARMEY', '18');
INSERT INTO `distritos` VALUES ('166', 'COCHAPETI', '18');
INSERT INTO `distritos` VALUES ('167', 'CULEBRAS', '18');
INSERT INTO `distritos` VALUES ('168', 'HUAYAN', '18');
INSERT INTO `distritos` VALUES ('169', 'MALVAS', '18');
INSERT INTO `distritos` VALUES ('170', 'CARAZ', '26');
INSERT INTO `distritos` VALUES ('171', 'HUALLANCA', '26');
INSERT INTO `distritos` VALUES ('172', 'HUATA', '26');
INSERT INTO `distritos` VALUES ('173', 'HUAYLAS', '26');
INSERT INTO `distritos` VALUES ('174', 'MATO', '26');
INSERT INTO `distritos` VALUES ('175', 'PAMPAROMAS', '26');
INSERT INTO `distritos` VALUES ('176', 'PUEBLO LIBRE', '26');
INSERT INTO `distritos` VALUES ('177', 'SANTA CRUZ', '26');
INSERT INTO `distritos` VALUES ('178', 'SANTO TORIBIO', '26');
INSERT INTO `distritos` VALUES ('179', 'YURACMARCA', '26');
INSERT INTO `distritos` VALUES ('180', 'PISCOBAMBA', '27');
INSERT INTO `distritos` VALUES ('181', 'CASCA', '27');
INSERT INTO `distritos` VALUES ('182', 'ELEAZAR GUZMAN BARRON', '27');
INSERT INTO `distritos` VALUES ('183', 'FIDEL OLIVAS ESCUDERO', '27');
INSERT INTO `distritos` VALUES ('184', 'LLAMA', '27');
INSERT INTO `distritos` VALUES ('185', 'LLUMPA', '27');
INSERT INTO `distritos` VALUES ('186', 'LUCMA', '27');
INSERT INTO `distritos` VALUES ('187', 'MUSGA', '27');
INSERT INTO `distritos` VALUES ('188', 'OCROS', '21');
INSERT INTO `distritos` VALUES ('189', 'ACAS', '21');
INSERT INTO `distritos` VALUES ('190', 'CAJAMARQUILLA', '21');
INSERT INTO `distritos` VALUES ('191', 'CARHUAPAMPA', '21');
INSERT INTO `distritos` VALUES ('192', 'COCHAS', '21');
INSERT INTO `distritos` VALUES ('193', 'CONGAS', '21');
INSERT INTO `distritos` VALUES ('194', 'LLIPA', '21');
INSERT INTO `distritos` VALUES ('195', 'SAN CRISTOBAL DE RAJAN', '21');
INSERT INTO `distritos` VALUES ('196', 'SAN PEDRO', '21');
INSERT INTO `distritos` VALUES ('197', 'SANTIAGO DE CHILCAS', '21');
INSERT INTO `distritos` VALUES ('198', 'CABANA', '22');
INSERT INTO `distritos` VALUES ('199', 'BOLOGNESI', '22');
INSERT INTO `distritos` VALUES ('200', 'CONCHUCOS', '22');
INSERT INTO `distritos` VALUES ('201', 'HUACASCHUQUE', '22');
INSERT INTO `distritos` VALUES ('202', 'HUANDOVAL', '22');
INSERT INTO `distritos` VALUES ('203', 'LACABAMBA', '22');
INSERT INTO `distritos` VALUES ('204', 'LLAPO', '22');
INSERT INTO `distritos` VALUES ('205', 'PALLASCA', '22');
INSERT INTO `distritos` VALUES ('206', 'PAMPAS', '22');
INSERT INTO `distritos` VALUES ('207', 'SANTA ROSA', '22');
INSERT INTO `distritos` VALUES ('208', 'TAUCA', '22');
INSERT INTO `distritos` VALUES ('209', 'POMABAMBA', '23');
INSERT INTO `distritos` VALUES ('210', 'HUAYLLAN', '23');
INSERT INTO `distritos` VALUES ('211', 'PAROBAMBA', '23');
INSERT INTO `distritos` VALUES ('212', 'QUINUABAMBA', '23');
INSERT INTO `distritos` VALUES ('213', 'RECUAY', '24');
INSERT INTO `distritos` VALUES ('214', 'CATAC', '24');
INSERT INTO `distritos` VALUES ('215', 'COTAPARACO', '24');
INSERT INTO `distritos` VALUES ('216', 'HUAYLLAPAMPA', '24');
INSERT INTO `distritos` VALUES ('217', 'LLACLLIN', '24');
INSERT INTO `distritos` VALUES ('218', 'MARCA', '24');
INSERT INTO `distritos` VALUES ('219', 'PAMPAS CHICO', '24');
INSERT INTO `distritos` VALUES ('220', 'PARARIN', '24');
INSERT INTO `distritos` VALUES ('221', 'TAPACOCHA', '24');
INSERT INTO `distritos` VALUES ('222', 'TICAPAMPA', '24');
INSERT INTO `distritos` VALUES ('223', 'CHIMBOTE', '25');
INSERT INTO `distritos` VALUES ('224', 'CACERES DEL PERU', '25');
INSERT INTO `distritos` VALUES ('225', 'COISHCO', '25');
INSERT INTO `distritos` VALUES ('226', 'MACATE', '25');
INSERT INTO `distritos` VALUES ('227', 'MORO', '25');
INSERT INTO `distritos` VALUES ('228', 'NEPE&Ntilde;A', '25');
INSERT INTO `distritos` VALUES ('229', 'SAMANCO', '25');
INSERT INTO `distritos` VALUES ('230', 'SANTA', '25');
INSERT INTO `distritos` VALUES ('231', 'NUEVO CHIMBOTE', '25');
INSERT INTO `distritos` VALUES ('232', 'SIHUAS', '26');
INSERT INTO `distritos` VALUES ('233', 'ACOBAMBA', '26');
INSERT INTO `distritos` VALUES ('234', 'ALFONSO UGARTE', '26');
INSERT INTO `distritos` VALUES ('235', 'CASHAPAMPA', '26');
INSERT INTO `distritos` VALUES ('236', 'CHINGALPO', '26');
INSERT INTO `distritos` VALUES ('237', 'HUAYLLABAMBA', '26');
INSERT INTO `distritos` VALUES ('238', 'QUICHES', '26');
INSERT INTO `distritos` VALUES ('239', 'RAGASH', '26');
INSERT INTO `distritos` VALUES ('240', 'SAN JUAN', '26');
INSERT INTO `distritos` VALUES ('241', 'SICSIBAMBA', '26');
INSERT INTO `distritos` VALUES ('242', 'YUNGAY', '27');
INSERT INTO `distritos` VALUES ('243', 'CASCAPARA', '27');
INSERT INTO `distritos` VALUES ('244', 'MANCOS', '27');
INSERT INTO `distritos` VALUES ('245', 'MATACOTO', '27');
INSERT INTO `distritos` VALUES ('246', 'QUILLO', '27');
INSERT INTO `distritos` VALUES ('247', 'RANRAHIRCA', '27');
INSERT INTO `distritos` VALUES ('248', 'SHUPLUY', '27');
INSERT INTO `distritos` VALUES ('249', 'YANAMA', '27');
INSERT INTO `distritos` VALUES ('250', 'ABANCAY', '28');
INSERT INTO `distritos` VALUES ('251', 'CHACOCHE', '28');
INSERT INTO `distritos` VALUES ('252', 'CIRCA', '28');
INSERT INTO `distritos` VALUES ('253', 'CURAHUASI', '28');
INSERT INTO `distritos` VALUES ('254', 'HUANIPACA', '28');
INSERT INTO `distritos` VALUES ('255', 'LAMBRAMA', '28');
INSERT INTO `distritos` VALUES ('256', 'PICHIRHUA', '28');
INSERT INTO `distritos` VALUES ('257', 'SAN PEDRO DE CACHORA', '28');
INSERT INTO `distritos` VALUES ('258', 'TAMBURCO', '28');
INSERT INTO `distritos` VALUES ('259', 'ANDAHUAYLAS', '29');
INSERT INTO `distritos` VALUES ('260', 'ANDARAPA', '29');
INSERT INTO `distritos` VALUES ('261', 'CHIARA', '29');
INSERT INTO `distritos` VALUES ('262', 'HUANCARAMA', '29');
INSERT INTO `distritos` VALUES ('263', 'HUANCARAY', '29');
INSERT INTO `distritos` VALUES ('264', 'HUAYANA', '29');
INSERT INTO `distritos` VALUES ('265', 'KISHUARA', '29');
INSERT INTO `distritos` VALUES ('266', 'PACOBAMBA', '29');
INSERT INTO `distritos` VALUES ('267', 'PACUCHA', '29');
INSERT INTO `distritos` VALUES ('268', 'PAMPACHIRI', '29');
INSERT INTO `distritos` VALUES ('269', 'POMACOCHA', '29');
INSERT INTO `distritos` VALUES ('270', 'SAN ANTONIO DE CACHI', '29');
INSERT INTO `distritos` VALUES ('271', 'SAN JERONIMO', '29');
INSERT INTO `distritos` VALUES ('272', 'SAN MIGUEL DE CHACCRAMPA', '29');
INSERT INTO `distritos` VALUES ('273', 'SANTA MARIA DE CHICMO', '29');
INSERT INTO `distritos` VALUES ('274', 'TALAVERA', '29');
INSERT INTO `distritos` VALUES ('275', 'TUMAY HUARACA', '29');
INSERT INTO `distritos` VALUES ('276', 'TURPO', '29');
INSERT INTO `distritos` VALUES ('277', 'KAQUIABAMBA', '29');
INSERT INTO `distritos` VALUES ('278', 'ANTABAMBA', '30');
INSERT INTO `distritos` VALUES ('279', 'EL ORO', '30');
INSERT INTO `distritos` VALUES ('280', 'HUAQUIRCA', '30');
INSERT INTO `distritos` VALUES ('281', 'JUAN ESPINOZA MEDRANO', '30');
INSERT INTO `distritos` VALUES ('282', 'OROPESA', '30');
INSERT INTO `distritos` VALUES ('283', 'PACHACONAS', '30');
INSERT INTO `distritos` VALUES ('284', 'SABAINO', '30');
INSERT INTO `distritos` VALUES ('285', 'CHALHUANCA', '31');
INSERT INTO `distritos` VALUES ('286', 'CAPAYA', '31');
INSERT INTO `distritos` VALUES ('287', 'CARAYBAMBA', '31');
INSERT INTO `distritos` VALUES ('288', 'CHAPIMARCA', '31');
INSERT INTO `distritos` VALUES ('289', 'COLCABAMBA', '31');
INSERT INTO `distritos` VALUES ('290', 'COTARUSE', '31');
INSERT INTO `distritos` VALUES ('291', 'HUAYLLO', '31');
INSERT INTO `distritos` VALUES ('292', 'JUSTO APU SAHUARAURA', '31');
INSERT INTO `distritos` VALUES ('293', 'LUCRE', '31');
INSERT INTO `distritos` VALUES ('294', 'POCOHUANCA', '31');
INSERT INTO `distritos` VALUES ('295', 'SAN JUAN DE CHAC&Ntilde;A', '31');
INSERT INTO `distritos` VALUES ('296', 'SA&Ntilde;AYCA', '31');
INSERT INTO `distritos` VALUES ('297', 'SORAYA', '31');
INSERT INTO `distritos` VALUES ('298', 'TAPAIRIHUA', '31');
INSERT INTO `distritos` VALUES ('299', 'TINTAY', '31');
INSERT INTO `distritos` VALUES ('300', 'TORAYA', '31');
INSERT INTO `distritos` VALUES ('301', 'YANACA', '31');
INSERT INTO `distritos` VALUES ('302', 'TAMBOBAMBA', '32');
INSERT INTO `distritos` VALUES ('303', 'COTABAMBAS', '32');
INSERT INTO `distritos` VALUES ('304', 'COYLLURQUI', '32');
INSERT INTO `distritos` VALUES ('305', 'HAQUIRA', '32');
INSERT INTO `distritos` VALUES ('306', 'MARA', '32');
INSERT INTO `distritos` VALUES ('307', 'CHALLHUAHUACHO', '32');
INSERT INTO `distritos` VALUES ('308', 'CHINCHEROS', '33');
INSERT INTO `distritos` VALUES ('309', 'ANCO-HUALLO', '33');
INSERT INTO `distritos` VALUES ('310', 'COCHARCAS', '33');
INSERT INTO `distritos` VALUES ('311', 'HUACCANA', '33');
INSERT INTO `distritos` VALUES ('312', 'OCOBAMBA', '33');
INSERT INTO `distritos` VALUES ('313', 'ONGOY', '33');
INSERT INTO `distritos` VALUES ('314', 'URANMARCA', '33');
INSERT INTO `distritos` VALUES ('315', 'RANRACANCHA', '33');
INSERT INTO `distritos` VALUES ('316', 'CHUQUIBAMBILLA', '34');
INSERT INTO `distritos` VALUES ('317', 'CURPAHUASI', '34');
INSERT INTO `distritos` VALUES ('318', 'GAMARRA', '34');
INSERT INTO `distritos` VALUES ('319', 'HUAYLLATI', '34');
INSERT INTO `distritos` VALUES ('320', 'MAMARA', '34');
INSERT INTO `distritos` VALUES ('321', 'MICAELA BASTIDAS', '34');
INSERT INTO `distritos` VALUES ('322', 'PATAYPAMPA', '34');
INSERT INTO `distritos` VALUES ('323', 'PROGRESO', '34');
INSERT INTO `distritos` VALUES ('324', 'SAN ANTONIO', '34');
INSERT INTO `distritos` VALUES ('325', 'SANTA ROSA', '34');
INSERT INTO `distritos` VALUES ('326', 'TURPAY', '34');
INSERT INTO `distritos` VALUES ('327', 'VILCABAMBA', '34');
INSERT INTO `distritos` VALUES ('328', 'VIRUNDO', '34');
INSERT INTO `distritos` VALUES ('329', 'CURASCO', '34');
INSERT INTO `distritos` VALUES ('330', 'AREQUIPA', '35');
INSERT INTO `distritos` VALUES ('331', 'ALTO SELVA ALEGRE', '35');
INSERT INTO `distritos` VALUES ('332', 'CAYMA', '35');
INSERT INTO `distritos` VALUES ('333', 'CERRO COLORADO', '35');
INSERT INTO `distritos` VALUES ('334', 'CHARACATO', '35');
INSERT INTO `distritos` VALUES ('335', 'CHIGUATA', '35');
INSERT INTO `distritos` VALUES ('336', 'JACOBO HUNTER', '35');
INSERT INTO `distritos` VALUES ('337', 'LA JOYA', '35');
INSERT INTO `distritos` VALUES ('338', 'MARIANO MELGAR', '35');
INSERT INTO `distritos` VALUES ('339', 'MIRAFLORES', '35');
INSERT INTO `distritos` VALUES ('340', 'MOLLEBAYA', '35');
INSERT INTO `distritos` VALUES ('341', 'PAUCARPATA', '35');
INSERT INTO `distritos` VALUES ('342', 'POCSI', '35');
INSERT INTO `distritos` VALUES ('343', 'POLOBAYA', '35');
INSERT INTO `distritos` VALUES ('344', 'QUEQUE&Ntilde;A', '35');
INSERT INTO `distritos` VALUES ('345', 'SABANDIA', '35');
INSERT INTO `distritos` VALUES ('346', 'SACHACA', '35');
INSERT INTO `distritos` VALUES ('347', 'SAN JUAN DE SIGUAS', '35');
INSERT INTO `distritos` VALUES ('348', 'SAN JUAN DE TARUCANI', '35');
INSERT INTO `distritos` VALUES ('349', 'SANTA ISABEL DE SIGUAS', '35');
INSERT INTO `distritos` VALUES ('350', 'SANTA RITA DE SIGUAS', '35');
INSERT INTO `distritos` VALUES ('351', 'SOCABAYA', '35');
INSERT INTO `distritos` VALUES ('352', 'TIABAYA', '35');
INSERT INTO `distritos` VALUES ('353', 'UCHUMAYO', '35');
INSERT INTO `distritos` VALUES ('354', 'VITOR', '35');
INSERT INTO `distritos` VALUES ('355', 'YANAHUARA', '35');
INSERT INTO `distritos` VALUES ('356', 'YARABAMBA', '35');
INSERT INTO `distritos` VALUES ('357', 'YURA', '35');
INSERT INTO `distritos` VALUES ('358', 'JOSE LUIS BUSTAMANTE Y RIVERO', '35');
INSERT INTO `distritos` VALUES ('359', 'CAMANA', '36');
INSERT INTO `distritos` VALUES ('360', 'JOSE MARIA QUIMPER', '36');
INSERT INTO `distritos` VALUES ('361', 'MARIANO NICOLAS VALCARCEL', '36');
INSERT INTO `distritos` VALUES ('362', 'MARISCAL CACERES', '36');
INSERT INTO `distritos` VALUES ('363', 'NICOLAS DE PIEROLA', '36');
INSERT INTO `distritos` VALUES ('364', 'OCO&Ntilde;A', '36');
INSERT INTO `distritos` VALUES ('365', 'QUILCA', '36');
INSERT INTO `distritos` VALUES ('366', 'SAMUEL PASTOR', '36');
INSERT INTO `distritos` VALUES ('367', 'CARAVELI', '37');
INSERT INTO `distritos` VALUES ('368', 'ACARI', '37');
INSERT INTO `distritos` VALUES ('369', 'ATICO', '37');
INSERT INTO `distritos` VALUES ('370', 'ATIQUIPA', '37');
INSERT INTO `distritos` VALUES ('371', 'BELLA UNION', '37');
INSERT INTO `distritos` VALUES ('372', 'CAHUACHO', '37');
INSERT INTO `distritos` VALUES ('373', 'CHALA', '37');
INSERT INTO `distritos` VALUES ('374', 'CHAPARRA', '37');
INSERT INTO `distritos` VALUES ('375', 'HUANUHUANU', '37');
INSERT INTO `distritos` VALUES ('376', 'JAQUI', '37');
INSERT INTO `distritos` VALUES ('377', 'LOMAS', '37');
INSERT INTO `distritos` VALUES ('378', 'QUICACHA', '37');
INSERT INTO `distritos` VALUES ('379', 'YAUCA', '37');
INSERT INTO `distritos` VALUES ('380', 'APLAO', '38');
INSERT INTO `distritos` VALUES ('381', 'ANDAGUA', '38');
INSERT INTO `distritos` VALUES ('382', 'AYO', '38');
INSERT INTO `distritos` VALUES ('383', 'CHACHAS', '38');
INSERT INTO `distritos` VALUES ('384', 'CHILCAYMARCA', '38');
INSERT INTO `distritos` VALUES ('385', 'CHOCO', '38');
INSERT INTO `distritos` VALUES ('386', 'HUANCARQUI', '38');
INSERT INTO `distritos` VALUES ('387', 'MACHAGUAY', '38');
INSERT INTO `distritos` VALUES ('388', 'ORCOPAMPA', '38');
INSERT INTO `distritos` VALUES ('389', 'PAMPACOLCA', '38');
INSERT INTO `distritos` VALUES ('390', 'TIPAN', '38');
INSERT INTO `distritos` VALUES ('391', 'U&Ntilde;ON', '38');
INSERT INTO `distritos` VALUES ('392', 'URACA', '38');
INSERT INTO `distritos` VALUES ('393', 'VIRACO', '38');
INSERT INTO `distritos` VALUES ('394', 'CHIVAY', '39');
INSERT INTO `distritos` VALUES ('395', 'ACHOMA', '39');
INSERT INTO `distritos` VALUES ('396', 'CABANACONDE', '39');
INSERT INTO `distritos` VALUES ('397', 'CALLALLI', '39');
INSERT INTO `distritos` VALUES ('398', 'CAYLLOMA', '39');
INSERT INTO `distritos` VALUES ('399', 'COPORAQUE', '39');
INSERT INTO `distritos` VALUES ('400', 'HUAMBO', '39');
INSERT INTO `distritos` VALUES ('401', 'HUANCA', '39');
INSERT INTO `distritos` VALUES ('402', 'ICHUPAMPA', '39');
INSERT INTO `distritos` VALUES ('403', 'LARI', '39');
INSERT INTO `distritos` VALUES ('404', 'LLUTA', '39');
INSERT INTO `distritos` VALUES ('405', 'MACA', '39');
INSERT INTO `distritos` VALUES ('406', 'MADRIGAL', '39');
INSERT INTO `distritos` VALUES ('407', 'SAN ANTONIO DE CHUCA', '39');
INSERT INTO `distritos` VALUES ('408', 'SIBAYO', '39');
INSERT INTO `distritos` VALUES ('409', 'TAPAY', '39');
INSERT INTO `distritos` VALUES ('410', 'TISCO', '39');
INSERT INTO `distritos` VALUES ('411', 'TUTI', '39');
INSERT INTO `distritos` VALUES ('412', 'YANQUE', '39');
INSERT INTO `distritos` VALUES ('413', 'MAJES', '39');
INSERT INTO `distritos` VALUES ('414', 'CHUQUIBAMBA', '40');
INSERT INTO `distritos` VALUES ('415', 'ANDARAY', '40');
INSERT INTO `distritos` VALUES ('416', 'CAYARANI', '40');
INSERT INTO `distritos` VALUES ('417', 'CHICHAS', '40');
INSERT INTO `distritos` VALUES ('418', 'IRAY', '40');
INSERT INTO `distritos` VALUES ('419', 'RIO GRANDE', '40');
INSERT INTO `distritos` VALUES ('420', 'SALAMANCA', '40');
INSERT INTO `distritos` VALUES ('421', 'YANAQUIHUA', '40');
INSERT INTO `distritos` VALUES ('422', 'MOLLENDO', '41');
INSERT INTO `distritos` VALUES ('423', 'COCACHACRA', '41');
INSERT INTO `distritos` VALUES ('424', 'DEAN VALDIVIA', '41');
INSERT INTO `distritos` VALUES ('425', 'ISLAY', '41');
INSERT INTO `distritos` VALUES ('426', 'MEJIA', '41');
INSERT INTO `distritos` VALUES ('427', 'PUNTA DE BOMBON', '41');
INSERT INTO `distritos` VALUES ('428', 'COTAHUASI', '42');
INSERT INTO `distritos` VALUES ('429', 'ALCA', '42');
INSERT INTO `distritos` VALUES ('430', 'CHARCANA', '42');
INSERT INTO `distritos` VALUES ('431', 'HUAYNACOTAS', '42');
INSERT INTO `distritos` VALUES ('432', 'PAMPAMARCA', '42');
INSERT INTO `distritos` VALUES ('433', 'PUYCA', '42');
INSERT INTO `distritos` VALUES ('434', 'QUECHUALLA', '42');
INSERT INTO `distritos` VALUES ('435', 'SAYLA', '42');
INSERT INTO `distritos` VALUES ('436', 'TAURIA', '42');
INSERT INTO `distritos` VALUES ('437', 'TOMEPAMPA', '42');
INSERT INTO `distritos` VALUES ('438', 'TORO', '42');
INSERT INTO `distritos` VALUES ('439', 'AYACUCHO', '43');
INSERT INTO `distritos` VALUES ('440', 'ACOCRO', '43');
INSERT INTO `distritos` VALUES ('441', 'ACOS VINCHOS', '43');
INSERT INTO `distritos` VALUES ('442', 'CARMEN ALTO', '43');
INSERT INTO `distritos` VALUES ('443', 'CHIARA', '43');
INSERT INTO `distritos` VALUES ('444', 'OCROS', '43');
INSERT INTO `distritos` VALUES ('445', 'PACAYCASA', '43');
INSERT INTO `distritos` VALUES ('446', 'QUINUA', '43');
INSERT INTO `distritos` VALUES ('447', 'SAN JOSE DE TICLLAS', '43');
INSERT INTO `distritos` VALUES ('448', 'SAN JUAN BAUTISTA', '43');
INSERT INTO `distritos` VALUES ('449', 'SANTIAGO DE PISCHA', '43');
INSERT INTO `distritos` VALUES ('450', 'SOCOS', '43');
INSERT INTO `distritos` VALUES ('451', 'TAMBILLO', '43');
INSERT INTO `distritos` VALUES ('452', 'VINCHOS', '43');
INSERT INTO `distritos` VALUES ('453', 'JESUS NAZARENO', '43');
INSERT INTO `distritos` VALUES ('454', 'CANGALLO', '44');
INSERT INTO `distritos` VALUES ('455', 'CHUSCHI', '44');
INSERT INTO `distritos` VALUES ('456', 'LOS MOROCHUCOS', '44');
INSERT INTO `distritos` VALUES ('457', 'MARIA PARADO DE BELLIDO', '44');
INSERT INTO `distritos` VALUES ('458', 'PARAS', '44');
INSERT INTO `distritos` VALUES ('459', 'TOTOS', '44');
INSERT INTO `distritos` VALUES ('460', 'SANCOS', '45');
INSERT INTO `distritos` VALUES ('461', 'CARAPO', '45');
INSERT INTO `distritos` VALUES ('462', 'SACSAMARCA', '45');
INSERT INTO `distritos` VALUES ('463', 'SANTIAGO DE LUCANAMARCA', '45');
INSERT INTO `distritos` VALUES ('464', 'HUANTA', '46');
INSERT INTO `distritos` VALUES ('465', 'AYAHUANCO', '46');
INSERT INTO `distritos` VALUES ('466', 'HUAMANGUILLA', '46');
INSERT INTO `distritos` VALUES ('467', 'IGUAIN', '46');
INSERT INTO `distritos` VALUES ('468', 'LURICOCHA', '46');
INSERT INTO `distritos` VALUES ('469', 'SANTILLANA', '46');
INSERT INTO `distritos` VALUES ('470', 'SIVIA', '46');
INSERT INTO `distritos` VALUES ('471', 'LLOCHEGUA', '46');
INSERT INTO `distritos` VALUES ('472', 'SAN MIGUEL', '47');
INSERT INTO `distritos` VALUES ('473', 'ANCO', '47');
INSERT INTO `distritos` VALUES ('474', 'AYNA', '47');
INSERT INTO `distritos` VALUES ('475', 'CHILCAS', '47');
INSERT INTO `distritos` VALUES ('476', 'CHUNGUI', '47');
INSERT INTO `distritos` VALUES ('477', 'LUIS CARRANZA', '47');
INSERT INTO `distritos` VALUES ('478', 'SANTA ROSA', '47');
INSERT INTO `distritos` VALUES ('479', 'TAMBO', '47');
INSERT INTO `distritos` VALUES ('480', 'PUQUIO', '48');
INSERT INTO `distritos` VALUES ('481', 'AUCARA', '48');
INSERT INTO `distritos` VALUES ('482', 'CABANA', '48');
INSERT INTO `distritos` VALUES ('483', 'CARMEN SALCEDO', '48');
INSERT INTO `distritos` VALUES ('484', 'CHAVI&Ntilde;A', '48');
INSERT INTO `distritos` VALUES ('485', 'CHIPAO', '48');
INSERT INTO `distritos` VALUES ('486', 'HUAC-HUAS', '48');
INSERT INTO `distritos` VALUES ('487', 'LARAMATE', '48');
INSERT INTO `distritos` VALUES ('488', 'LEONCIO PRADO', '48');
INSERT INTO `distritos` VALUES ('489', 'LLAUTA', '48');
INSERT INTO `distritos` VALUES ('490', 'LUCANAS', '48');
INSERT INTO `distritos` VALUES ('491', 'OCA&Ntilde;A', '48');
INSERT INTO `distritos` VALUES ('492', 'OTOCA', '48');
INSERT INTO `distritos` VALUES ('493', 'SAISA', '48');
INSERT INTO `distritos` VALUES ('494', 'SAN CRISTOBAL', '48');
INSERT INTO `distritos` VALUES ('495', 'SAN JUAN', '48');
INSERT INTO `distritos` VALUES ('496', 'SAN PEDRO', '48');
INSERT INTO `distritos` VALUES ('497', 'SAN PEDRO DE PALCO', '48');
INSERT INTO `distritos` VALUES ('498', 'SANCOS', '48');
INSERT INTO `distritos` VALUES ('499', 'SANTA ANA DE HUAYCAHUACHO', '48');
INSERT INTO `distritos` VALUES ('500', 'SANTA LUCIA', '48');
INSERT INTO `distritos` VALUES ('501', 'CORACORA', '49');
INSERT INTO `distritos` VALUES ('502', 'CHUMPI', '49');
INSERT INTO `distritos` VALUES ('503', 'CORONEL CASTA&Ntilde;EDA', '49');
INSERT INTO `distritos` VALUES ('504', 'PACAPAUSA', '49');
INSERT INTO `distritos` VALUES ('505', 'PULLO', '49');
INSERT INTO `distritos` VALUES ('506', 'PUYUSCA', '49');
INSERT INTO `distritos` VALUES ('507', 'SAN FRANCISCO DE RAVACAYCO', '49');
INSERT INTO `distritos` VALUES ('508', 'UPAHUACHO', '49');
INSERT INTO `distritos` VALUES ('509', 'PAUSA', '50');
INSERT INTO `distritos` VALUES ('510', 'COLTA', '50');
INSERT INTO `distritos` VALUES ('511', 'CORCULLA', '50');
INSERT INTO `distritos` VALUES ('512', 'LAMPA', '50');
INSERT INTO `distritos` VALUES ('513', 'MARCABAMBA', '50');
INSERT INTO `distritos` VALUES ('514', 'OYOLO', '50');
INSERT INTO `distritos` VALUES ('515', 'PARARCA', '50');
INSERT INTO `distritos` VALUES ('516', 'SAN JAVIER DE ALPABAMBA', '50');
INSERT INTO `distritos` VALUES ('517', 'SAN JOSE DE USHUA', '50');
INSERT INTO `distritos` VALUES ('518', 'SARA SARA', '50');
INSERT INTO `distritos` VALUES ('519', 'QUEROBAMBA', '51');
INSERT INTO `distritos` VALUES ('520', 'BELEN', '51');
INSERT INTO `distritos` VALUES ('521', 'CHALCOS', '51');
INSERT INTO `distritos` VALUES ('522', 'CHILCAYOC', '51');
INSERT INTO `distritos` VALUES ('523', 'HUACA&Ntilde;A', '51');
INSERT INTO `distritos` VALUES ('524', 'MORCOLLA', '51');
INSERT INTO `distritos` VALUES ('525', 'PAICO', '51');
INSERT INTO `distritos` VALUES ('526', 'SAN PEDRO DE LARCAY', '51');
INSERT INTO `distritos` VALUES ('527', 'SAN SALVADOR DE QUIJE', '51');
INSERT INTO `distritos` VALUES ('528', 'SANTIAGO DE PAUCARAY', '51');
INSERT INTO `distritos` VALUES ('529', 'SORAS', '51');
INSERT INTO `distritos` VALUES ('530', 'HUANCAPI', '52');
INSERT INTO `distritos` VALUES ('531', 'ALCAMENCA', '52');
INSERT INTO `distritos` VALUES ('532', 'APONGO', '52');
INSERT INTO `distritos` VALUES ('533', 'ASQUIPATA', '52');
INSERT INTO `distritos` VALUES ('534', 'CANARIA', '52');
INSERT INTO `distritos` VALUES ('535', 'CAYARA', '52');
INSERT INTO `distritos` VALUES ('536', 'COLCA', '52');
INSERT INTO `distritos` VALUES ('537', 'HUAMANQUIQUIA', '52');
INSERT INTO `distritos` VALUES ('538', 'HUANCARAYLLA', '52');
INSERT INTO `distritos` VALUES ('539', 'HUAYA', '52');
INSERT INTO `distritos` VALUES ('540', 'SARHUA', '52');
INSERT INTO `distritos` VALUES ('541', 'VILCANCHOS', '52');
INSERT INTO `distritos` VALUES ('542', 'VILCAS HUAMAN', '53');
INSERT INTO `distritos` VALUES ('543', 'ACCOMARCA', '53');
INSERT INTO `distritos` VALUES ('544', 'CARHUANCA', '53');
INSERT INTO `distritos` VALUES ('545', 'CONCEPCION', '53');
INSERT INTO `distritos` VALUES ('546', 'HUAMBALPA', '53');
INSERT INTO `distritos` VALUES ('547', 'INDEPENDENCIA', '53');
INSERT INTO `distritos` VALUES ('548', 'SAURAMA', '53');
INSERT INTO `distritos` VALUES ('549', 'VISCHONGO', '53');
INSERT INTO `distritos` VALUES ('550', 'CAJAMARCA', '54');
INSERT INTO `distritos` VALUES ('551', 'CAJAMARCA', '54');
INSERT INTO `distritos` VALUES ('552', 'ASUNCION', '54');
INSERT INTO `distritos` VALUES ('553', 'CHETILLA', '54');
INSERT INTO `distritos` VALUES ('554', 'COSPAN', '54');
INSERT INTO `distritos` VALUES ('555', 'ENCA&Ntilde;ADA', '54');
INSERT INTO `distritos` VALUES ('556', 'JESUS', '54');
INSERT INTO `distritos` VALUES ('557', 'LLACANORA', '54');
INSERT INTO `distritos` VALUES ('558', 'LOS BA&Ntilde;OS DEL INCA', '54');
INSERT INTO `distritos` VALUES ('559', 'MAGDALENA', '54');
INSERT INTO `distritos` VALUES ('560', 'MATARA', '54');
INSERT INTO `distritos` VALUES ('561', 'NAMORA', '54');
INSERT INTO `distritos` VALUES ('562', 'SAN JUAN', '54');
INSERT INTO `distritos` VALUES ('563', 'CAJABAMBA', '55');
INSERT INTO `distritos` VALUES ('564', 'CACHACHI', '55');
INSERT INTO `distritos` VALUES ('565', 'CONDEBAMBA', '55');
INSERT INTO `distritos` VALUES ('566', 'SITACOCHA', '55');
INSERT INTO `distritos` VALUES ('567', 'CELENDIN', '56');
INSERT INTO `distritos` VALUES ('568', 'CHUMUCH', '56');
INSERT INTO `distritos` VALUES ('569', 'CORTEGANA', '56');
INSERT INTO `distritos` VALUES ('570', 'HUASMIN', '56');
INSERT INTO `distritos` VALUES ('571', 'JORGE CHAVEZ', '56');
INSERT INTO `distritos` VALUES ('572', 'JOSE GALVEZ', '56');
INSERT INTO `distritos` VALUES ('573', 'MIGUEL IGLESIAS', '56');
INSERT INTO `distritos` VALUES ('574', 'OXAMARCA', '56');
INSERT INTO `distritos` VALUES ('575', 'SOROCHUCO', '56');
INSERT INTO `distritos` VALUES ('576', 'SUCRE', '56');
INSERT INTO `distritos` VALUES ('577', 'UTCO', '56');
INSERT INTO `distritos` VALUES ('578', 'LA LIBERTAD DE PALLAN', '56');
INSERT INTO `distritos` VALUES ('579', 'CHOTA', '57');
INSERT INTO `distritos` VALUES ('580', 'ANGUIA', '57');
INSERT INTO `distritos` VALUES ('581', 'CHADIN', '57');
INSERT INTO `distritos` VALUES ('582', 'CHIGUIRIP', '57');
INSERT INTO `distritos` VALUES ('583', 'CHIMBAN', '57');
INSERT INTO `distritos` VALUES ('584', 'CHOROPAMPA', '57');
INSERT INTO `distritos` VALUES ('585', 'COCHABAMBA', '57');
INSERT INTO `distritos` VALUES ('586', 'CONCHAN', '57');
INSERT INTO `distritos` VALUES ('587', 'HUAMBOS', '57');
INSERT INTO `distritos` VALUES ('588', 'LAJAS', '57');
INSERT INTO `distritos` VALUES ('589', 'LLAMA', '57');
INSERT INTO `distritos` VALUES ('590', 'MIRACOSTA', '57');
INSERT INTO `distritos` VALUES ('591', 'PACCHA', '57');
INSERT INTO `distritos` VALUES ('592', 'PION', '57');
INSERT INTO `distritos` VALUES ('593', 'QUEROCOTO', '57');
INSERT INTO `distritos` VALUES ('594', 'SAN JUAN DE LICUPIS', '57');
INSERT INTO `distritos` VALUES ('595', 'TACABAMBA', '57');
INSERT INTO `distritos` VALUES ('596', 'TOCMOCHE', '57');
INSERT INTO `distritos` VALUES ('597', 'CHALAMARCA', '57');
INSERT INTO `distritos` VALUES ('598', 'CONTUMAZA', '58');
INSERT INTO `distritos` VALUES ('599', 'CHILETE', '58');
INSERT INTO `distritos` VALUES ('600', 'CUPISNIQUE', '58');
INSERT INTO `distritos` VALUES ('601', 'GUZMANGO', '58');
INSERT INTO `distritos` VALUES ('602', 'SAN BENITO', '58');
INSERT INTO `distritos` VALUES ('603', 'SANTA CRUZ DE TOLED', '58');
INSERT INTO `distritos` VALUES ('604', 'TANTARICA', '58');
INSERT INTO `distritos` VALUES ('605', 'YONAN', '58');
INSERT INTO `distritos` VALUES ('606', 'CUTERVO', '59');
INSERT INTO `distritos` VALUES ('607', 'CALLAYUC', '59');
INSERT INTO `distritos` VALUES ('608', 'CHOROS', '59');
INSERT INTO `distritos` VALUES ('609', 'CUJILLO', '59');
INSERT INTO `distritos` VALUES ('610', 'LA RAMADA', '59');
INSERT INTO `distritos` VALUES ('611', 'PIMPINGOS', '59');
INSERT INTO `distritos` VALUES ('612', 'QUEROCOTILLO', '59');
INSERT INTO `distritos` VALUES ('613', 'SAN ANDRES DE CUTERVO', '59');
INSERT INTO `distritos` VALUES ('614', 'SAN JUAN DE CUTERVO', '59');
INSERT INTO `distritos` VALUES ('615', 'SAN LUIS DE LUCMA', '59');
INSERT INTO `distritos` VALUES ('616', 'SANTA CRUZ', '59');
INSERT INTO `distritos` VALUES ('617', 'SANTO DOMINGO DE LA CAPILLA', '59');
INSERT INTO `distritos` VALUES ('618', 'SANTO TOMAS', '59');
INSERT INTO `distritos` VALUES ('619', 'SOCOTA', '59');
INSERT INTO `distritos` VALUES ('620', 'TORIBIO CASANOVA', '59');
INSERT INTO `distritos` VALUES ('621', 'BAMBAMARCA', '60');
INSERT INTO `distritos` VALUES ('622', 'CHUGUR', '60');
INSERT INTO `distritos` VALUES ('623', 'HUALGAYOC', '60');
INSERT INTO `distritos` VALUES ('624', 'JAEN', '61');
INSERT INTO `distritos` VALUES ('625', 'BELLAVISTA', '61');
INSERT INTO `distritos` VALUES ('626', 'CHONTALI', '61');
INSERT INTO `distritos` VALUES ('627', 'COLASAY', '61');
INSERT INTO `distritos` VALUES ('628', 'HUABAL', '61');
INSERT INTO `distritos` VALUES ('629', 'LAS PIRIAS', '61');
INSERT INTO `distritos` VALUES ('630', 'POMAHUACA', '61');
INSERT INTO `distritos` VALUES ('631', 'PUCARA', '61');
INSERT INTO `distritos` VALUES ('632', 'SALLIQUE', '61');
INSERT INTO `distritos` VALUES ('633', 'SAN FELIPE', '61');
INSERT INTO `distritos` VALUES ('634', 'SAN JOSE DEL ALTO', '61');
INSERT INTO `distritos` VALUES ('635', 'SANTA ROSA', '61');
INSERT INTO `distritos` VALUES ('636', 'SAN IGNACIO', '62');
INSERT INTO `distritos` VALUES ('637', 'CHIRINOS', '62');
INSERT INTO `distritos` VALUES ('638', 'HUARANGO', '62');
INSERT INTO `distritos` VALUES ('639', 'LA COIPA', '62');
INSERT INTO `distritos` VALUES ('640', 'NAMBALLE', '62');
INSERT INTO `distritos` VALUES ('641', 'SAN JOSE DE LOURDES', '62');
INSERT INTO `distritos` VALUES ('642', 'TABACONAS', '62');
INSERT INTO `distritos` VALUES ('643', 'PEDRO GALVEZ', '63');
INSERT INTO `distritos` VALUES ('644', 'CHANCAY', '63');
INSERT INTO `distritos` VALUES ('645', 'EDUARDO VILLANUEVA', '63');
INSERT INTO `distritos` VALUES ('646', 'GREGORIO PITA', '63');
INSERT INTO `distritos` VALUES ('647', 'ICHOCAN', '63');
INSERT INTO `distritos` VALUES ('648', 'JOSE MANUEL QUIROZ', '63');
INSERT INTO `distritos` VALUES ('649', 'JOSE SABOGAL', '63');
INSERT INTO `distritos` VALUES ('650', 'SAN MIGUEL', '64');
INSERT INTO `distritos` VALUES ('651', 'SAN MIGUEL', '64');
INSERT INTO `distritos` VALUES ('652', 'BOLIVAR', '64');
INSERT INTO `distritos` VALUES ('653', 'CALQUIS', '64');
INSERT INTO `distritos` VALUES ('654', 'CATILLUC', '64');
INSERT INTO `distritos` VALUES ('655', 'EL PRADO', '64');
INSERT INTO `distritos` VALUES ('656', 'LA FLORIDA', '64');
INSERT INTO `distritos` VALUES ('657', 'LLAPA', '64');
INSERT INTO `distritos` VALUES ('658', 'NANCHOC', '64');
INSERT INTO `distritos` VALUES ('659', 'NIEPOS', '64');
INSERT INTO `distritos` VALUES ('660', 'SAN GREGORIO', '64');
INSERT INTO `distritos` VALUES ('661', 'SAN SILVESTRE DE COCHAN', '64');
INSERT INTO `distritos` VALUES ('662', 'TONGOD', '64');
INSERT INTO `distritos` VALUES ('663', 'UNION AGUA BLANCA', '64');
INSERT INTO `distritos` VALUES ('664', 'SAN PABLO', '65');
INSERT INTO `distritos` VALUES ('665', 'SAN BERNARDINO', '65');
INSERT INTO `distritos` VALUES ('666', 'SAN LUIS', '65');
INSERT INTO `distritos` VALUES ('667', 'TUMBADEN', '65');
INSERT INTO `distritos` VALUES ('668', 'SANTA CRUZ', '66');
INSERT INTO `distritos` VALUES ('669', 'ANDABAMBA', '66');
INSERT INTO `distritos` VALUES ('670', 'CATACHE', '66');
INSERT INTO `distritos` VALUES ('671', 'CHANCAYBA&Ntilde;OS', '66');
INSERT INTO `distritos` VALUES ('672', 'LA ESPERANZA', '66');
INSERT INTO `distritos` VALUES ('673', 'NINABAMBA', '66');
INSERT INTO `distritos` VALUES ('674', 'PULAN', '66');
INSERT INTO `distritos` VALUES ('675', 'SAUCEPAMPA', '66');
INSERT INTO `distritos` VALUES ('676', 'SEXI', '66');
INSERT INTO `distritos` VALUES ('677', 'UTICYACU', '66');
INSERT INTO `distritos` VALUES ('678', 'YAUYUCAN', '66');
INSERT INTO `distritos` VALUES ('679', 'CALLAO', '67');
INSERT INTO `distritos` VALUES ('680', 'BELLAVISTA', '67');
INSERT INTO `distritos` VALUES ('681', 'CARMEN DE LA LEGUA REYNOSO', '67');
INSERT INTO `distritos` VALUES ('682', 'LA PERLA', '67');
INSERT INTO `distritos` VALUES ('683', 'LA PUNTA', '67');
INSERT INTO `distritos` VALUES ('684', 'VENTANILLA', '67');
INSERT INTO `distritos` VALUES ('685', 'CUSCO', '67');
INSERT INTO `distritos` VALUES ('686', 'CCORCA', '67');
INSERT INTO `distritos` VALUES ('687', 'POROY', '67');
INSERT INTO `distritos` VALUES ('688', 'SAN JERONIMO', '67');
INSERT INTO `distritos` VALUES ('689', 'SAN SEBASTIAN', '67');
INSERT INTO `distritos` VALUES ('690', 'SANTIAGO', '67');
INSERT INTO `distritos` VALUES ('691', 'SAYLLA', '67');
INSERT INTO `distritos` VALUES ('692', 'WANCHAQ', '67');
INSERT INTO `distritos` VALUES ('693', 'ACOMAYO', '68');
INSERT INTO `distritos` VALUES ('694', 'ACOPIA', '68');
INSERT INTO `distritos` VALUES ('695', 'ACOS', '68');
INSERT INTO `distritos` VALUES ('696', 'MOSOC LLACTA', '68');
INSERT INTO `distritos` VALUES ('697', 'POMACANCHI', '68');
INSERT INTO `distritos` VALUES ('698', 'RONDOCAN', '68');
INSERT INTO `distritos` VALUES ('699', 'SANGARARA', '68');
INSERT INTO `distritos` VALUES ('700', 'ANTA', '69');
INSERT INTO `distritos` VALUES ('701', 'ANCAHUASI', '69');
INSERT INTO `distritos` VALUES ('702', 'CACHIMAYO', '69');
INSERT INTO `distritos` VALUES ('703', 'CHINCHAYPUJIO', '69');
INSERT INTO `distritos` VALUES ('704', 'HUAROCONDO', '69');
INSERT INTO `distritos` VALUES ('705', 'LIMATAMBO', '69');
INSERT INTO `distritos` VALUES ('706', 'MOLLEPATA', '69');
INSERT INTO `distritos` VALUES ('707', 'PUCYURA', '69');
INSERT INTO `distritos` VALUES ('708', 'ZURITE', '69');
INSERT INTO `distritos` VALUES ('709', 'CALCA', '70');
INSERT INTO `distritos` VALUES ('710', 'COYA', '70');
INSERT INTO `distritos` VALUES ('711', 'LAMAY', '70');
INSERT INTO `distritos` VALUES ('712', 'LARES', '70');
INSERT INTO `distritos` VALUES ('713', 'PISAC', '70');
INSERT INTO `distritos` VALUES ('714', 'SAN SALVADOR', '70');
INSERT INTO `distritos` VALUES ('715', 'TARAY', '70');
INSERT INTO `distritos` VALUES ('716', 'YANATILE', '70');
INSERT INTO `distritos` VALUES ('717', 'YANAOCA', '71');
INSERT INTO `distritos` VALUES ('718', 'CHECCA', '71');
INSERT INTO `distritos` VALUES ('719', 'KUNTURKANKI', '71');
INSERT INTO `distritos` VALUES ('720', 'LANGUI', '71');
INSERT INTO `distritos` VALUES ('721', 'LAYO', '71');
INSERT INTO `distritos` VALUES ('722', 'PAMPAMARCA', '71');
INSERT INTO `distritos` VALUES ('723', 'QUEHUE', '71');
INSERT INTO `distritos` VALUES ('724', 'TUPAC AMARU', '71');
INSERT INTO `distritos` VALUES ('725', 'SICUANI', '72');
INSERT INTO `distritos` VALUES ('726', 'CHECACUPE', '72');
INSERT INTO `distritos` VALUES ('727', 'COMBAPATA', '72');
INSERT INTO `distritos` VALUES ('728', 'MARANGANI', '72');
INSERT INTO `distritos` VALUES ('729', 'PITUMARCA', '72');
INSERT INTO `distritos` VALUES ('730', 'SAN PABLO', '72');
INSERT INTO `distritos` VALUES ('731', 'SAN PEDRO', '72');
INSERT INTO `distritos` VALUES ('732', 'TINTA', '72');
INSERT INTO `distritos` VALUES ('733', 'SANTO TOMAS', '73');
INSERT INTO `distritos` VALUES ('734', 'CAPACMARCA', '73');
INSERT INTO `distritos` VALUES ('735', 'CHAMACA', '73');
INSERT INTO `distritos` VALUES ('736', 'COLQUEMARCA', '73');
INSERT INTO `distritos` VALUES ('737', 'LIVITACA', '73');
INSERT INTO `distritos` VALUES ('738', 'LLUSCO', '73');
INSERT INTO `distritos` VALUES ('739', 'QUI&Ntilde;OTA', '73');
INSERT INTO `distritos` VALUES ('740', 'VELILLE', '73');
INSERT INTO `distritos` VALUES ('741', 'ESPINAR', '74');
INSERT INTO `distritos` VALUES ('742', 'CONDOROMA', '74');
INSERT INTO `distritos` VALUES ('743', 'COPORAQUE', '74');
INSERT INTO `distritos` VALUES ('744', 'OCORURO', '74');
INSERT INTO `distritos` VALUES ('745', 'PALLPATA', '74');
INSERT INTO `distritos` VALUES ('746', 'PICHIGUA', '74');
INSERT INTO `distritos` VALUES ('747', 'SUYCKUTAMBO', '74');
INSERT INTO `distritos` VALUES ('748', 'ALTO PICHIGUA', '74');
INSERT INTO `distritos` VALUES ('749', 'SANTA ANA', '75');
INSERT INTO `distritos` VALUES ('750', 'ECHARATE', '75');
INSERT INTO `distritos` VALUES ('751', 'HUAYOPATA', '75');
INSERT INTO `distritos` VALUES ('752', 'MARANURA', '75');
INSERT INTO `distritos` VALUES ('753', 'OCOBAMBA', '75');
INSERT INTO `distritos` VALUES ('754', 'QUELLOUNO', '75');
INSERT INTO `distritos` VALUES ('755', 'KIMBIRI', '75');
INSERT INTO `distritos` VALUES ('756', 'SANTA TERESA', '75');
INSERT INTO `distritos` VALUES ('757', 'VILCABAMBA', '75');
INSERT INTO `distritos` VALUES ('758', 'PICHARI', '75');
INSERT INTO `distritos` VALUES ('759', 'PARURO', '76');
INSERT INTO `distritos` VALUES ('760', 'ACCHA', '76');
INSERT INTO `distritos` VALUES ('761', 'CCAPI', '76');
INSERT INTO `distritos` VALUES ('762', 'COLCHA', '76');
INSERT INTO `distritos` VALUES ('763', 'HUANOQUITE', '76');
INSERT INTO `distritos` VALUES ('764', 'OMACHA', '76');
INSERT INTO `distritos` VALUES ('765', 'PACCARITAMBO', '76');
INSERT INTO `distritos` VALUES ('766', 'PILLPINTO', '76');
INSERT INTO `distritos` VALUES ('767', 'YAURISQUE', '76');
INSERT INTO `distritos` VALUES ('768', 'PAUCARTAMBO', '77');
INSERT INTO `distritos` VALUES ('769', 'CAICAY', '77');
INSERT INTO `distritos` VALUES ('770', 'CHALLABAMBA', '77');
INSERT INTO `distritos` VALUES ('771', 'COLQUEPATA', '77');
INSERT INTO `distritos` VALUES ('772', 'HUANCARANI', '77');
INSERT INTO `distritos` VALUES ('773', 'KOS&Ntilde;IPATA', '77');
INSERT INTO `distritos` VALUES ('774', 'URCOS', '78');
INSERT INTO `distritos` VALUES ('775', 'ANDAHUAYLILLAS', '78');
INSERT INTO `distritos` VALUES ('776', 'CAMANTI', '78');
INSERT INTO `distritos` VALUES ('777', 'CCARHUAYO', '78');
INSERT INTO `distritos` VALUES ('778', 'CCATCA', '78');
INSERT INTO `distritos` VALUES ('779', 'CUSIPATA', '78');
INSERT INTO `distritos` VALUES ('780', 'HUARO', '78');
INSERT INTO `distritos` VALUES ('781', 'LUCRE', '78');
INSERT INTO `distritos` VALUES ('782', 'MARCAPATA', '78');
INSERT INTO `distritos` VALUES ('783', 'OCONGATE', '78');
INSERT INTO `distritos` VALUES ('784', 'OROPESA', '78');
INSERT INTO `distritos` VALUES ('785', 'QUIQUIJANA', '78');
INSERT INTO `distritos` VALUES ('786', 'URUBAMBA', '79');
INSERT INTO `distritos` VALUES ('787', 'CHINCHERO', '79');
INSERT INTO `distritos` VALUES ('788', 'HUAYLLABAMBA', '79');
INSERT INTO `distritos` VALUES ('789', 'MACHUPICCHU', '79');
INSERT INTO `distritos` VALUES ('790', 'MARAS', '79');
INSERT INTO `distritos` VALUES ('791', 'OLLANTAYTAMBO', '79');
INSERT INTO `distritos` VALUES ('792', 'YUCAY', '79');
INSERT INTO `distritos` VALUES ('793', 'HUANCAVELICA', '80');
INSERT INTO `distritos` VALUES ('794', 'ACOBAMBILLA', '80');
INSERT INTO `distritos` VALUES ('795', 'ACORIA', '80');
INSERT INTO `distritos` VALUES ('796', 'CONAYCA', '80');
INSERT INTO `distritos` VALUES ('797', 'CUENCA', '80');
INSERT INTO `distritos` VALUES ('798', 'HUACHOCOLPA', '80');
INSERT INTO `distritos` VALUES ('799', 'HUAYLLAHUARA', '80');
INSERT INTO `distritos` VALUES ('800', 'IZCUCHACA', '80');
INSERT INTO `distritos` VALUES ('801', 'LARIA', '80');
INSERT INTO `distritos` VALUES ('802', 'MANTA', '80');
INSERT INTO `distritos` VALUES ('803', 'MARISCAL CACERES', '80');
INSERT INTO `distritos` VALUES ('804', 'MOYA', '80');
INSERT INTO `distritos` VALUES ('805', 'NUEVO OCCORO', '80');
INSERT INTO `distritos` VALUES ('806', 'PALCA', '80');
INSERT INTO `distritos` VALUES ('807', 'PILCHACA', '80');
INSERT INTO `distritos` VALUES ('808', 'VILCA', '80');
INSERT INTO `distritos` VALUES ('809', 'YAULI', '80');
INSERT INTO `distritos` VALUES ('810', 'ASCENSION', '80');
INSERT INTO `distritos` VALUES ('811', 'HUANDO', '80');
INSERT INTO `distritos` VALUES ('812', 'ACOBAMBA', '81');
INSERT INTO `distritos` VALUES ('813', 'ANDABAMBA', '81');
INSERT INTO `distritos` VALUES ('814', 'ANTA', '81');
INSERT INTO `distritos` VALUES ('815', 'CAJA', '81');
INSERT INTO `distritos` VALUES ('816', 'MARCAS', '81');
INSERT INTO `distritos` VALUES ('817', 'PAUCARA', '81');
INSERT INTO `distritos` VALUES ('818', 'POMACOCHA', '81');
INSERT INTO `distritos` VALUES ('819', 'ROSARIO', '81');
INSERT INTO `distritos` VALUES ('820', 'LIRCAY', '82');
INSERT INTO `distritos` VALUES ('821', 'ANCHONGA', '82');
INSERT INTO `distritos` VALUES ('822', 'CALLANMARCA', '82');
INSERT INTO `distritos` VALUES ('823', 'CCOCHACCASA', '82');
INSERT INTO `distritos` VALUES ('824', 'CHINCHO', '82');
INSERT INTO `distritos` VALUES ('825', 'CONGALLA', '82');
INSERT INTO `distritos` VALUES ('826', 'HUANCA-HUANCA', '82');
INSERT INTO `distritos` VALUES ('827', 'HUAYLLAY GRANDE', '82');
INSERT INTO `distritos` VALUES ('828', 'JULCAMARCA', '82');
INSERT INTO `distritos` VALUES ('829', 'SAN ANTONIO DE ANTAPARCO', '82');
INSERT INTO `distritos` VALUES ('830', 'SANTO TOMAS DE PATA', '82');
INSERT INTO `distritos` VALUES ('831', 'SECCLLA', '82');
INSERT INTO `distritos` VALUES ('832', 'CASTROVIRREYNA', '83');
INSERT INTO `distritos` VALUES ('833', 'ARMA', '83');
INSERT INTO `distritos` VALUES ('834', 'AURAHUA', '83');
INSERT INTO `distritos` VALUES ('835', 'CAPILLAS', '83');
INSERT INTO `distritos` VALUES ('836', 'CHUPAMARCA', '83');
INSERT INTO `distritos` VALUES ('837', 'COCAS', '83');
INSERT INTO `distritos` VALUES ('838', 'HUACHOS', '83');
INSERT INTO `distritos` VALUES ('839', 'HUAMATAMBO', '83');
INSERT INTO `distritos` VALUES ('840', 'MOLLEPAMPA', '83');
INSERT INTO `distritos` VALUES ('841', 'SAN JUAN', '83');
INSERT INTO `distritos` VALUES ('842', 'SANTA ANA', '83');
INSERT INTO `distritos` VALUES ('843', 'TANTARA', '83');
INSERT INTO `distritos` VALUES ('844', 'TICRAPO', '83');
INSERT INTO `distritos` VALUES ('845', 'CHURCAMPA', '84');
INSERT INTO `distritos` VALUES ('846', 'ANCO', '84');
INSERT INTO `distritos` VALUES ('847', 'CHINCHIHUASI', '84');
INSERT INTO `distritos` VALUES ('848', 'EL CARMEN', '84');
INSERT INTO `distritos` VALUES ('849', 'LA MERCED', '84');
INSERT INTO `distritos` VALUES ('850', 'LOCROJA', '84');
INSERT INTO `distritos` VALUES ('851', 'PAUCARBAMBA', '84');
INSERT INTO `distritos` VALUES ('852', 'SAN MIGUEL DE MAYOCC', '84');
INSERT INTO `distritos` VALUES ('853', 'SAN PEDRO DE CORIS', '84');
INSERT INTO `distritos` VALUES ('854', 'PACHAMARCA', '84');
INSERT INTO `distritos` VALUES ('855', 'HUAYTARA', '85');
INSERT INTO `distritos` VALUES ('856', 'AYAVI', '85');
INSERT INTO `distritos` VALUES ('857', 'CORDOVA', '85');
INSERT INTO `distritos` VALUES ('858', 'HUAYACUNDO ARMA', '85');
INSERT INTO `distritos` VALUES ('859', 'LARAMARCA', '85');
INSERT INTO `distritos` VALUES ('860', 'OCOYO', '85');
INSERT INTO `distritos` VALUES ('861', 'PILPICHACA', '85');
INSERT INTO `distritos` VALUES ('862', 'QUERCO', '85');
INSERT INTO `distritos` VALUES ('863', 'QUITO-ARMA', '85');
INSERT INTO `distritos` VALUES ('864', 'SAN ANTONIO DE CUSICANCHA', '85');
INSERT INTO `distritos` VALUES ('865', 'SAN FRANCISCO DE SANGAYAICO', '85');
INSERT INTO `distritos` VALUES ('866', 'SAN ISIDRO', '85');
INSERT INTO `distritos` VALUES ('867', 'SANTIAGO DE CHOCORVOS', '85');
INSERT INTO `distritos` VALUES ('868', 'SANTIAGO DE QUIRAHUARA', '85');
INSERT INTO `distritos` VALUES ('869', 'SANTO DOMINGO DE CAPILLAS', '85');
INSERT INTO `distritos` VALUES ('870', 'TAMBO', '85');
INSERT INTO `distritos` VALUES ('871', 'PAMPAS', '86');
INSERT INTO `distritos` VALUES ('872', 'ACOSTAMBO', '86');
INSERT INTO `distritos` VALUES ('873', 'ACRAQUIA', '86');
INSERT INTO `distritos` VALUES ('874', 'AHUAYCHA', '86');
INSERT INTO `distritos` VALUES ('875', 'COLCABAMBA', '86');
INSERT INTO `distritos` VALUES ('876', 'DANIEL HERNANDEZ', '86');
INSERT INTO `distritos` VALUES ('877', 'HUACHOCOLPA', '86');
INSERT INTO `distritos` VALUES ('878', 'HUARIBAMBA', '86');
INSERT INTO `distritos` VALUES ('879', '&Ntilde;AHUIMPUQUIO', '86');
INSERT INTO `distritos` VALUES ('880', 'PAZOS', '86');
INSERT INTO `distritos` VALUES ('881', 'QUISHUAR', '86');
INSERT INTO `distritos` VALUES ('882', 'SALCABAMBA', '86');
INSERT INTO `distritos` VALUES ('883', 'SALCAHUASI', '86');
INSERT INTO `distritos` VALUES ('884', 'SAN MARCOS DE ROCCHAC', '86');
INSERT INTO `distritos` VALUES ('885', 'SURCUBAMBA', '86');
INSERT INTO `distritos` VALUES ('886', 'TINTAY PUNCU', '86');
INSERT INTO `distritos` VALUES ('887', 'HUANUCO', '87');
INSERT INTO `distritos` VALUES ('888', 'AMARILIS', '87');
INSERT INTO `distritos` VALUES ('889', 'CHINCHAO', '87');
INSERT INTO `distritos` VALUES ('890', 'CHURUBAMBA', '87');
INSERT INTO `distritos` VALUES ('891', 'MARGOS', '87');
INSERT INTO `distritos` VALUES ('892', 'QUISQUI', '87');
INSERT INTO `distritos` VALUES ('893', 'SAN FRANCISCO DE CAYRAN', '87');
INSERT INTO `distritos` VALUES ('894', 'SAN PEDRO DE CHAULAN', '87');
INSERT INTO `distritos` VALUES ('895', 'SANTA MARIA DEL VALLE', '87');
INSERT INTO `distritos` VALUES ('896', 'YARUMAYO', '87');
INSERT INTO `distritos` VALUES ('897', 'PILLCO MARCA', '87');
INSERT INTO `distritos` VALUES ('898', 'AMBO', '88');
INSERT INTO `distritos` VALUES ('899', 'CAYNA', '88');
INSERT INTO `distritos` VALUES ('900', 'COLPAS', '88');
INSERT INTO `distritos` VALUES ('901', 'CONCHAMARCA', '88');
INSERT INTO `distritos` VALUES ('902', 'HUACAR', '88');
INSERT INTO `distritos` VALUES ('903', 'SAN FRANCISCO', '88');
INSERT INTO `distritos` VALUES ('904', 'SAN RAFAEL', '88');
INSERT INTO `distritos` VALUES ('905', 'TOMAY KICHWA', '88');
INSERT INTO `distritos` VALUES ('906', 'LA UNION', '89');
INSERT INTO `distritos` VALUES ('907', 'CHUQUIS', '89');
INSERT INTO `distritos` VALUES ('908', 'MARIAS', '89');
INSERT INTO `distritos` VALUES ('909', 'PACHAS', '89');
INSERT INTO `distritos` VALUES ('910', 'QUIVILLA', '89');
INSERT INTO `distritos` VALUES ('911', 'RIPAN', '89');
INSERT INTO `distritos` VALUES ('912', 'SHUNQUI', '89');
INSERT INTO `distritos` VALUES ('913', 'SILLAPATA', '89');
INSERT INTO `distritos` VALUES ('914', 'YANAS', '89');
INSERT INTO `distritos` VALUES ('915', 'HUACAYBAMBA', '90');
INSERT INTO `distritos` VALUES ('916', 'CANCHABAMBA', '90');
INSERT INTO `distritos` VALUES ('917', 'COCHABAMBA', '90');
INSERT INTO `distritos` VALUES ('918', 'PINRA', '90');
INSERT INTO `distritos` VALUES ('919', 'LLATA', '91');
INSERT INTO `distritos` VALUES ('920', 'ARANCAY', '91');
INSERT INTO `distritos` VALUES ('921', 'CHAVIN DE PARIARCA', '91');
INSERT INTO `distritos` VALUES ('922', 'JACAS GRANDE', '91');
INSERT INTO `distritos` VALUES ('923', 'JIRCAN', '91');
INSERT INTO `distritos` VALUES ('924', 'MIRAFLORES', '91');
INSERT INTO `distritos` VALUES ('925', 'MONZON', '91');
INSERT INTO `distritos` VALUES ('926', 'PUNCHAO', '91');
INSERT INTO `distritos` VALUES ('927', 'PU&Ntilde;OS', '91');
INSERT INTO `distritos` VALUES ('928', 'SINGA', '91');
INSERT INTO `distritos` VALUES ('929', 'TANTAMAYO', '91');
INSERT INTO `distritos` VALUES ('930', 'RUPA-RUPA', '92');
INSERT INTO `distritos` VALUES ('931', 'DANIEL ALOMIA ROBLES', '92');
INSERT INTO `distritos` VALUES ('932', 'HERMILIO VALDIZAN', '92');
INSERT INTO `distritos` VALUES ('933', 'JOSE CRESPO Y CASTILLO', '92');
INSERT INTO `distritos` VALUES ('934', 'LUYANDO', '92');
INSERT INTO `distritos` VALUES ('935', 'MARIANO DAMASO BERAUN', '92');
INSERT INTO `distritos` VALUES ('936', 'HUACRACHUCO', '93');
INSERT INTO `distritos` VALUES ('937', 'CHOLON', '93');
INSERT INTO `distritos` VALUES ('938', 'SAN BUENAVENTURA', '93');
INSERT INTO `distritos` VALUES ('939', 'PANAO', '94');
INSERT INTO `distritos` VALUES ('940', 'CHAGLLA', '94');
INSERT INTO `distritos` VALUES ('941', 'MOLINO', '94');
INSERT INTO `distritos` VALUES ('942', 'UMARI', '94');
INSERT INTO `distritos` VALUES ('943', 'PUERTO INCA', '95');
INSERT INTO `distritos` VALUES ('944', 'CODO DEL POZUZO', '95');
INSERT INTO `distritos` VALUES ('945', 'HONORIA', '95');
INSERT INTO `distritos` VALUES ('946', 'TOURNAVISTA', '95');
INSERT INTO `distritos` VALUES ('947', 'YUYAPICHIS', '95');
INSERT INTO `distritos` VALUES ('948', 'JESUS', '96');
INSERT INTO `distritos` VALUES ('949', 'BA&Ntilde;OS', '96');
INSERT INTO `distritos` VALUES ('950', 'JIVIA', '96');
INSERT INTO `distritos` VALUES ('951', 'QUEROPALCA', '96');
INSERT INTO `distritos` VALUES ('952', 'RONDOS', '96');
INSERT INTO `distritos` VALUES ('953', 'SAN FRANCISCO DE ASIS', '96');
INSERT INTO `distritos` VALUES ('954', 'SAN MIGUEL DE CAURI', '96');
INSERT INTO `distritos` VALUES ('955', 'CHAVINILLO', '97');
INSERT INTO `distritos` VALUES ('956', 'CAHUAC', '97');
INSERT INTO `distritos` VALUES ('957', 'CHACABAMBA', '97');
INSERT INTO `distritos` VALUES ('958', 'APARICIO POMARES', '97');
INSERT INTO `distritos` VALUES ('959', 'JACAS CHICO', '97');
INSERT INTO `distritos` VALUES ('960', 'OBAS', '97');
INSERT INTO `distritos` VALUES ('961', 'PAMPAMARCA', '97');
INSERT INTO `distritos` VALUES ('962', 'CHORAS', '97');
INSERT INTO `distritos` VALUES ('963', 'ICA', '98');
INSERT INTO `distritos` VALUES ('964', 'LA TINGUI&Ntilde;A', '98');
INSERT INTO `distritos` VALUES ('965', 'LOS AQUIJES', '98');
INSERT INTO `distritos` VALUES ('966', 'OCUCAJE', '98');
INSERT INTO `distritos` VALUES ('967', 'PACHACUTEC', '98');
INSERT INTO `distritos` VALUES ('968', 'PARCONA', '98');
INSERT INTO `distritos` VALUES ('969', 'PUEBLO NUEVO', '98');
INSERT INTO `distritos` VALUES ('970', 'SALAS', '98');
INSERT INTO `distritos` VALUES ('971', 'SAN JOSE DE LOS MOLINOS', '98');
INSERT INTO `distritos` VALUES ('972', 'SAN JUAN BAUTISTA', '98');
INSERT INTO `distritos` VALUES ('973', 'SANTIAGO', '98');
INSERT INTO `distritos` VALUES ('974', 'SUBTANJALLA', '98');
INSERT INTO `distritos` VALUES ('975', 'TATE', '98');
INSERT INTO `distritos` VALUES ('976', 'YAUCA DEL ROSARIO', '98');
INSERT INTO `distritos` VALUES ('977', 'CHINCHA ALTA', '99');
INSERT INTO `distritos` VALUES ('978', 'ALTO LARAN', '99');
INSERT INTO `distritos` VALUES ('979', 'CHAVIN', '99');
INSERT INTO `distritos` VALUES ('980', 'CHINCHA BAJA', '99');
INSERT INTO `distritos` VALUES ('981', 'EL CARMEN', '99');
INSERT INTO `distritos` VALUES ('982', 'GROCIO PRADO', '99');
INSERT INTO `distritos` VALUES ('983', 'PUEBLO NUEVO', '99');
INSERT INTO `distritos` VALUES ('984', 'SAN JUAN DE YANAC', '99');
INSERT INTO `distritos` VALUES ('985', 'SAN PEDRO DE HUACARPANA', '99');
INSERT INTO `distritos` VALUES ('986', 'SUNAMPE', '99');
INSERT INTO `distritos` VALUES ('987', 'TAMBO DE MORA', '99');
INSERT INTO `distritos` VALUES ('988', 'NAZCA', '100');
INSERT INTO `distritos` VALUES ('989', 'CHANGUILLO', '100');
INSERT INTO `distritos` VALUES ('990', 'EL INGENIO', '100');
INSERT INTO `distritos` VALUES ('991', 'MARCONA', '100');
INSERT INTO `distritos` VALUES ('992', 'VISTA ALEGRE', '100');
INSERT INTO `distritos` VALUES ('993', 'PALPA', '101');
INSERT INTO `distritos` VALUES ('994', 'LLIPATA', '101');
INSERT INTO `distritos` VALUES ('995', 'RIO GRANDE', '101');
INSERT INTO `distritos` VALUES ('996', 'SANTA CRUZ', '101');
INSERT INTO `distritos` VALUES ('997', 'TIBILLO', '101');
INSERT INTO `distritos` VALUES ('998', 'PISCO', '102');
INSERT INTO `distritos` VALUES ('999', 'HUANCANO', '102');
INSERT INTO `distritos` VALUES ('1000', 'HUMAY', '102');
INSERT INTO `distritos` VALUES ('1001', 'INDEPENDENCIA', '102');
INSERT INTO `distritos` VALUES ('1002', 'PARACAS', '102');
INSERT INTO `distritos` VALUES ('1003', 'SAN ANDRES', '102');
INSERT INTO `distritos` VALUES ('1004', 'SAN CLEMENTE', '102');
INSERT INTO `distritos` VALUES ('1005', 'TUPAC AMARU INCA', '102');
INSERT INTO `distritos` VALUES ('1006', 'HUANCAYO', '103');
INSERT INTO `distritos` VALUES ('1007', 'CARHUACALLANGA', '103');
INSERT INTO `distritos` VALUES ('1008', 'CHACAPAMPA', '103');
INSERT INTO `distritos` VALUES ('1009', 'CHICCHE', '103');
INSERT INTO `distritos` VALUES ('1010', 'CHILCA', '103');
INSERT INTO `distritos` VALUES ('1011', 'CHONGOS ALTO', '103');
INSERT INTO `distritos` VALUES ('1012', 'CHUPURO', '103');
INSERT INTO `distritos` VALUES ('1013', 'COLCA', '103');
INSERT INTO `distritos` VALUES ('1014', 'CULLHUAS', '103');
INSERT INTO `distritos` VALUES ('1015', 'EL TAMBO', '103');
INSERT INTO `distritos` VALUES ('1016', 'HUACRAPUQUIO', '103');
INSERT INTO `distritos` VALUES ('1017', 'HUALHUAS', '103');
INSERT INTO `distritos` VALUES ('1018', 'HUANCAN', '103');
INSERT INTO `distritos` VALUES ('1019', 'HUASICANCHA', '103');
INSERT INTO `distritos` VALUES ('1020', 'HUAYUCACHI', '103');
INSERT INTO `distritos` VALUES ('1021', 'INGENIO', '103');
INSERT INTO `distritos` VALUES ('1022', 'PARIAHUANCA', '103');
INSERT INTO `distritos` VALUES ('1023', 'PILCOMAYO', '103');
INSERT INTO `distritos` VALUES ('1024', 'PUCARA', '103');
INSERT INTO `distritos` VALUES ('1025', 'QUICHUAY', '103');
INSERT INTO `distritos` VALUES ('1026', 'QUILCAS', '103');
INSERT INTO `distritos` VALUES ('1027', 'SAN AGUSTIN', '103');
INSERT INTO `distritos` VALUES ('1028', 'SAN JERONIMO DE TUNAN', '103');
INSERT INTO `distritos` VALUES ('1029', 'SA&Ntilde;O', '103');
INSERT INTO `distritos` VALUES ('1030', 'SAPALLANGA', '103');
INSERT INTO `distritos` VALUES ('1031', 'SICAYA', '103');
INSERT INTO `distritos` VALUES ('1032', 'SANTO DOMINGO DE ACOBAMBA', '103');
INSERT INTO `distritos` VALUES ('1033', 'VIQUES', '103');
INSERT INTO `distritos` VALUES ('1034', 'CONCEPCION', '104');
INSERT INTO `distritos` VALUES ('1035', 'ACO', '104');
INSERT INTO `distritos` VALUES ('1036', 'ANDAMARCA', '104');
INSERT INTO `distritos` VALUES ('1037', 'CHAMBARA', '104');
INSERT INTO `distritos` VALUES ('1038', 'COCHAS', '104');
INSERT INTO `distritos` VALUES ('1039', 'COMAS', '104');
INSERT INTO `distritos` VALUES ('1040', 'HEROINAS TOLEDO', '104');
INSERT INTO `distritos` VALUES ('1041', 'MANZANARES', '104');
INSERT INTO `distritos` VALUES ('1042', 'MARISCAL CASTILLA', '104');
INSERT INTO `distritos` VALUES ('1043', 'MATAHUASI', '104');
INSERT INTO `distritos` VALUES ('1044', 'MITO', '104');
INSERT INTO `distritos` VALUES ('1045', 'NUEVE DE JULIO', '104');
INSERT INTO `distritos` VALUES ('1046', 'ORCOTUNA', '104');
INSERT INTO `distritos` VALUES ('1047', 'SAN JOSE DE QUERO', '104');
INSERT INTO `distritos` VALUES ('1048', 'SANTA ROSA DE OCOPA', '104');
INSERT INTO `distritos` VALUES ('1049', 'CHANCHAMAYO', '105');
INSERT INTO `distritos` VALUES ('1050', 'PERENE', '105');
INSERT INTO `distritos` VALUES ('1051', 'PICHANAQUI', '105');
INSERT INTO `distritos` VALUES ('1052', 'SAN LUIS DE SHUARO', '105');
INSERT INTO `distritos` VALUES ('1053', 'SAN RAMON', '105');
INSERT INTO `distritos` VALUES ('1054', 'VITOC', '105');
INSERT INTO `distritos` VALUES ('1055', 'JAUJA', '106');
INSERT INTO `distritos` VALUES ('1056', 'ACOLLA', '106');
INSERT INTO `distritos` VALUES ('1057', 'APATA', '106');
INSERT INTO `distritos` VALUES ('1058', 'ATAURA', '106');
INSERT INTO `distritos` VALUES ('1059', 'CANCHAYLLO', '106');
INSERT INTO `distritos` VALUES ('1060', 'CURICACA', '106');
INSERT INTO `distritos` VALUES ('1061', 'EL MANTARO', '106');
INSERT INTO `distritos` VALUES ('1062', 'HUAMALI', '106');
INSERT INTO `distritos` VALUES ('1063', 'HUARIPAMPA', '106');
INSERT INTO `distritos` VALUES ('1064', 'HUERTAS', '106');
INSERT INTO `distritos` VALUES ('1065', 'JANJAILLO', '106');
INSERT INTO `distritos` VALUES ('1066', 'JULCAN', '106');
INSERT INTO `distritos` VALUES ('1067', 'LEONOR ORDO&Ntilde;EZ', '106');
INSERT INTO `distritos` VALUES ('1068', 'LLOCLLAPAMPA', '106');
INSERT INTO `distritos` VALUES ('1069', 'MARCO', '106');
INSERT INTO `distritos` VALUES ('1070', 'MASMA', '106');
INSERT INTO `distritos` VALUES ('1071', 'MASMA CHICCHE', '106');
INSERT INTO `distritos` VALUES ('1072', 'MOLINOS', '106');
INSERT INTO `distritos` VALUES ('1073', 'MONOBAMBA', '106');
INSERT INTO `distritos` VALUES ('1074', 'MUQUI', '106');
INSERT INTO `distritos` VALUES ('1075', 'MUQUIYAUYO', '106');
INSERT INTO `distritos` VALUES ('1076', 'PACA', '106');
INSERT INTO `distritos` VALUES ('1077', 'PACCHA', '106');
INSERT INTO `distritos` VALUES ('1078', 'PANCAN', '106');
INSERT INTO `distritos` VALUES ('1079', 'PARCO', '106');
INSERT INTO `distritos` VALUES ('1080', 'POMACANCHA', '106');
INSERT INTO `distritos` VALUES ('1081', 'RICRAN', '106');
INSERT INTO `distritos` VALUES ('1082', 'SAN LORENZO', '106');
INSERT INTO `distritos` VALUES ('1083', 'SAN PEDRO DE CHUNAN', '106');
INSERT INTO `distritos` VALUES ('1084', 'SAUSA', '106');
INSERT INTO `distritos` VALUES ('1085', 'SINCOS', '106');
INSERT INTO `distritos` VALUES ('1086', 'TUNAN MARCA', '106');
INSERT INTO `distritos` VALUES ('1087', 'YAULI', '106');
INSERT INTO `distritos` VALUES ('1088', 'YAUYOS', '106');
INSERT INTO `distritos` VALUES ('1089', 'JUNIN', '107');
INSERT INTO `distritos` VALUES ('1090', 'CARHUAMAYO', '107');
INSERT INTO `distritos` VALUES ('1091', 'ONDORES', '107');
INSERT INTO `distritos` VALUES ('1092', 'ULCUMAYO', '107');
INSERT INTO `distritos` VALUES ('1093', 'SATIPO', '108');
INSERT INTO `distritos` VALUES ('1094', 'COVIRIALI', '108');
INSERT INTO `distritos` VALUES ('1095', 'LLAYLLA', '108');
INSERT INTO `distritos` VALUES ('1096', 'MAZAMARI', '108');
INSERT INTO `distritos` VALUES ('1097', 'PAMPA HERMOSA', '108');
INSERT INTO `distritos` VALUES ('1098', 'PANGOA', '108');
INSERT INTO `distritos` VALUES ('1099', 'RIO NEGRO', '108');
INSERT INTO `distritos` VALUES ('1100', 'RIO TAMBO', '108');
INSERT INTO `distritos` VALUES ('1101', 'TARMA', '109');
INSERT INTO `distritos` VALUES ('1102', 'ACOBAMBA', '109');
INSERT INTO `distritos` VALUES ('1103', 'HUARICOLCA', '109');
INSERT INTO `distritos` VALUES ('1104', 'HUASAHUASI', '109');
INSERT INTO `distritos` VALUES ('1105', 'LA UNION', '109');
INSERT INTO `distritos` VALUES ('1106', 'PALCA', '109');
INSERT INTO `distritos` VALUES ('1107', 'PALCAMAYO', '109');
INSERT INTO `distritos` VALUES ('1108', 'SAN PEDRO DE CAJAS', '109');
INSERT INTO `distritos` VALUES ('1109', 'TAPO', '109');
INSERT INTO `distritos` VALUES ('1110', 'LA OROYA', '110');
INSERT INTO `distritos` VALUES ('1111', 'CHACAPALPA', '110');
INSERT INTO `distritos` VALUES ('1112', 'HUAY-HUAY', '110');
INSERT INTO `distritos` VALUES ('1113', 'MARCAPOMACOCHA', '110');
INSERT INTO `distritos` VALUES ('1114', 'MOROCOCHA', '110');
INSERT INTO `distritos` VALUES ('1115', 'PACCHA', '110');
INSERT INTO `distritos` VALUES ('1116', 'SANTA BARBARA DE CARHUACAYAN', '110');
INSERT INTO `distritos` VALUES ('1117', 'SANTA ROSA DE SACCO', '110');
INSERT INTO `distritos` VALUES ('1118', 'SUITUCANCHA', '110');
INSERT INTO `distritos` VALUES ('1119', 'YAULI', '110');
INSERT INTO `distritos` VALUES ('1120', 'CHUPACA', '111');
INSERT INTO `distritos` VALUES ('1121', 'AHUAC', '111');
INSERT INTO `distritos` VALUES ('1122', 'CHONGOS BAJO', '111');
INSERT INTO `distritos` VALUES ('1123', 'HUACHAC', '111');
INSERT INTO `distritos` VALUES ('1124', 'HUAMANCACA CHICO', '111');
INSERT INTO `distritos` VALUES ('1125', 'SAN JUAN DE ISCOS', '111');
INSERT INTO `distritos` VALUES ('1126', 'SAN JUAN DE JARPA', '111');
INSERT INTO `distritos` VALUES ('1127', 'TRES DE DICIEMBRE', '111');
INSERT INTO `distritos` VALUES ('1128', 'YANACANCHA', '111');
INSERT INTO `distritos` VALUES ('1129', 'TRUJILLO', '112');
INSERT INTO `distritos` VALUES ('1130', 'EL PORVENIR', '112');
INSERT INTO `distritos` VALUES ('1131', 'FLORENCIA DE MORA', '112');
INSERT INTO `distritos` VALUES ('1132', 'HUANCHACO', '112');
INSERT INTO `distritos` VALUES ('1133', 'LA ESPERANZA', '112');
INSERT INTO `distritos` VALUES ('1134', 'LAREDO', '112');
INSERT INTO `distritos` VALUES ('1135', 'MOCHE', '112');
INSERT INTO `distritos` VALUES ('1136', 'POROTO', '112');
INSERT INTO `distritos` VALUES ('1137', 'SALAVERRY', '112');
INSERT INTO `distritos` VALUES ('1138', 'SIMBAL', '112');
INSERT INTO `distritos` VALUES ('1139', 'VICTOR LARCO HERRERA', '112');
INSERT INTO `distritos` VALUES ('1140', 'ASCOPE', '113');
INSERT INTO `distritos` VALUES ('1141', 'CHICAMA', '113');
INSERT INTO `distritos` VALUES ('1142', 'CHOCOPE', '113');
INSERT INTO `distritos` VALUES ('1143', 'MAGDALENA DE CAO', '113');
INSERT INTO `distritos` VALUES ('1144', 'PAIJAN', '113');
INSERT INTO `distritos` VALUES ('1145', 'RAZURI', '113');
INSERT INTO `distritos` VALUES ('1146', 'SANTIAGO DE CAO', '113');
INSERT INTO `distritos` VALUES ('1147', 'CASA GRANDE', '113');
INSERT INTO `distritos` VALUES ('1148', 'BOLIVAR', '114');
INSERT INTO `distritos` VALUES ('1149', 'BAMBAMARCA', '114');
INSERT INTO `distritos` VALUES ('1150', 'CONDORMARCA', '114');
INSERT INTO `distritos` VALUES ('1151', 'LONGOTEA', '114');
INSERT INTO `distritos` VALUES ('1152', 'UCHUMARCA', '114');
INSERT INTO `distritos` VALUES ('1153', 'UCUNCHA', '114');
INSERT INTO `distritos` VALUES ('1154', 'CHEPEN', '115');
INSERT INTO `distritos` VALUES ('1155', 'PACANGA', '115');
INSERT INTO `distritos` VALUES ('1156', 'PUEBLO NUEVO', '115');
INSERT INTO `distritos` VALUES ('1157', 'JULCAN', '116');
INSERT INTO `distritos` VALUES ('1158', 'CALAMARCA', '116');
INSERT INTO `distritos` VALUES ('1159', 'CARABAMBA', '116');
INSERT INTO `distritos` VALUES ('1160', 'HUASO', '116');
INSERT INTO `distritos` VALUES ('1161', 'OTUZCO', '117');
INSERT INTO `distritos` VALUES ('1162', 'AGALLPAMPA', '117');
INSERT INTO `distritos` VALUES ('1163', 'CHARAT', '117');
INSERT INTO `distritos` VALUES ('1164', 'HUARANCHAL', '117');
INSERT INTO `distritos` VALUES ('1165', 'LA CUESTA', '117');
INSERT INTO `distritos` VALUES ('1166', 'MACHE', '117');
INSERT INTO `distritos` VALUES ('1167', 'PARANDAY', '117');
INSERT INTO `distritos` VALUES ('1168', 'SALPO', '117');
INSERT INTO `distritos` VALUES ('1169', 'SINSICAP', '117');
INSERT INTO `distritos` VALUES ('1170', 'USQUIL', '117');
INSERT INTO `distritos` VALUES ('1171', 'SAN PEDRO DE LLOC', '118');
INSERT INTO `distritos` VALUES ('1172', 'GUADALUPE', '118');
INSERT INTO `distritos` VALUES ('1173', 'JEQUETEPEQUE', '118');
INSERT INTO `distritos` VALUES ('1174', 'PACASMAYO', '118');
INSERT INTO `distritos` VALUES ('1175', 'SAN JOSE', '118');
INSERT INTO `distritos` VALUES ('1176', 'TAYABAMBA', '119');
INSERT INTO `distritos` VALUES ('1177', 'BULDIBUYO', '119');
INSERT INTO `distritos` VALUES ('1178', 'CHILLIA', '119');
INSERT INTO `distritos` VALUES ('1179', 'HUANCASPATA', '119');
INSERT INTO `distritos` VALUES ('1180', 'HUAYLILLAS', '119');
INSERT INTO `distritos` VALUES ('1181', 'HUAYO', '119');
INSERT INTO `distritos` VALUES ('1182', 'ONGON', '119');
INSERT INTO `distritos` VALUES ('1183', 'PARCOY', '119');
INSERT INTO `distritos` VALUES ('1184', 'PATAZ', '119');
INSERT INTO `distritos` VALUES ('1185', 'PIAS', '119');
INSERT INTO `distritos` VALUES ('1186', 'SANTIAGO DE CHALLAS', '119');
INSERT INTO `distritos` VALUES ('1187', 'TAURIJA', '119');
INSERT INTO `distritos` VALUES ('1188', 'URPAY', '119');
INSERT INTO `distritos` VALUES ('1189', 'HUAMACHUCO', '120');
INSERT INTO `distritos` VALUES ('1190', 'CHUGAY', '120');
INSERT INTO `distritos` VALUES ('1191', 'COCHORCO', '120');
INSERT INTO `distritos` VALUES ('1192', 'CURGOS', '120');
INSERT INTO `distritos` VALUES ('1193', 'MARCABAL', '120');
INSERT INTO `distritos` VALUES ('1194', 'SANAGORAN', '120');
INSERT INTO `distritos` VALUES ('1195', 'SARIN', '120');
INSERT INTO `distritos` VALUES ('1196', 'SARTIMBAMBA', '120');
INSERT INTO `distritos` VALUES ('1197', 'SANTIAGO DE CHUCO', '121');
INSERT INTO `distritos` VALUES ('1198', 'ANGASMARCA', '121');
INSERT INTO `distritos` VALUES ('1199', 'CACHICADAN', '121');
INSERT INTO `distritos` VALUES ('1200', 'MOLLEBAMBA', '121');
INSERT INTO `distritos` VALUES ('1201', 'MOLLEPATA', '121');
INSERT INTO `distritos` VALUES ('1202', 'QUIRUVILCA', '121');
INSERT INTO `distritos` VALUES ('1203', 'SANTA CRUZ DE CHUCA', '121');
INSERT INTO `distritos` VALUES ('1204', 'SITABAMBA', '121');
INSERT INTO `distritos` VALUES ('1205', 'GRAN CHIMU', '122');
INSERT INTO `distritos` VALUES ('1206', 'CASCAS', '122');
INSERT INTO `distritos` VALUES ('1207', 'LUCMA', '122');
INSERT INTO `distritos` VALUES ('1208', 'MARMOT', '122');
INSERT INTO `distritos` VALUES ('1209', 'SAYAPULLO', '122');
INSERT INTO `distritos` VALUES ('1210', 'VIRU', '123');
INSERT INTO `distritos` VALUES ('1211', 'CHAO', '123');
INSERT INTO `distritos` VALUES ('1212', 'GUADALUPITO', '123');
INSERT INTO `distritos` VALUES ('1213', 'CHICLAYO', '124');
INSERT INTO `distritos` VALUES ('1214', 'CHONGOYAPE', '124');
INSERT INTO `distritos` VALUES ('1215', 'ETEN', '124');
INSERT INTO `distritos` VALUES ('1216', 'ETEN PUERTO', '124');
INSERT INTO `distritos` VALUES ('1217', 'JOSE LEONARDO ORTIZ', '124');
INSERT INTO `distritos` VALUES ('1218', 'LA VICTORIA', '124');
INSERT INTO `distritos` VALUES ('1219', 'LAGUNAS', '124');
INSERT INTO `distritos` VALUES ('1220', 'MONSEFU', '124');
INSERT INTO `distritos` VALUES ('1221', 'NUEVA ARICA', '124');
INSERT INTO `distritos` VALUES ('1222', 'OYOTUN', '124');
INSERT INTO `distritos` VALUES ('1223', 'PICSI', '124');
INSERT INTO `distritos` VALUES ('1224', 'PIMENTEL', '124');
INSERT INTO `distritos` VALUES ('1225', 'REQUE', '124');
INSERT INTO `distritos` VALUES ('1226', 'SANTA ROSA', '124');
INSERT INTO `distritos` VALUES ('1227', 'SA&Ntilde;A', '124');
INSERT INTO `distritos` VALUES ('1228', 'CAYALTI', '124');
INSERT INTO `distritos` VALUES ('1229', 'PATAPO', '124');
INSERT INTO `distritos` VALUES ('1230', 'POMALCA', '124');
INSERT INTO `distritos` VALUES ('1231', 'PUCALA', '124');
INSERT INTO `distritos` VALUES ('1232', 'TUMAN', '124');
INSERT INTO `distritos` VALUES ('1233', 'FERRE&Ntilde;AFE', '125');
INSERT INTO `distritos` VALUES ('1234', 'CA&Ntilde;ARIS', '125');
INSERT INTO `distritos` VALUES ('1235', 'INCAHUASI', '125');
INSERT INTO `distritos` VALUES ('1236', 'MANUEL ANTONIO MESONES MURO', '125');
INSERT INTO `distritos` VALUES ('1237', 'PITIPO', '125');
INSERT INTO `distritos` VALUES ('1238', 'PUEBLO NUEVO', '125');
INSERT INTO `distritos` VALUES ('1239', 'LAMBAYEQUE', '126');
INSERT INTO `distritos` VALUES ('1240', 'CHOCHOPE', '126');
INSERT INTO `distritos` VALUES ('1241', 'ILLIMO', '126');
INSERT INTO `distritos` VALUES ('1242', 'JAYANCA', '126');
INSERT INTO `distritos` VALUES ('1243', 'MOCHUMI', '126');
INSERT INTO `distritos` VALUES ('1244', 'MORROPE', '126');
INSERT INTO `distritos` VALUES ('1245', 'MOTUPE', '126');
INSERT INTO `distritos` VALUES ('1246', 'OLMOS', '126');
INSERT INTO `distritos` VALUES ('1247', 'PACORA', '126');
INSERT INTO `distritos` VALUES ('1248', 'SALAS', '126');
INSERT INTO `distritos` VALUES ('1249', 'SAN JOSE', '126');
INSERT INTO `distritos` VALUES ('1250', 'TUCUME', '126');
INSERT INTO `distritos` VALUES ('1251', 'LIMA', '127');
INSERT INTO `distritos` VALUES ('1252', 'ANCON', '127');
INSERT INTO `distritos` VALUES ('1253', 'ATE', '127');
INSERT INTO `distritos` VALUES ('1254', 'BARRANCO', '127');
INSERT INTO `distritos` VALUES ('1255', 'BRE&Ntilde;A', '127');
INSERT INTO `distritos` VALUES ('1256', 'CARABAYLLO', '127');
INSERT INTO `distritos` VALUES ('1257', 'CHACLACAYO', '127');
INSERT INTO `distritos` VALUES ('1258', 'CHORRILLOS', '127');
INSERT INTO `distritos` VALUES ('1259', 'CIENEGUILLA', '127');
INSERT INTO `distritos` VALUES ('1260', 'COMAS', '127');
INSERT INTO `distritos` VALUES ('1261', 'EL AGUSTINO', '127');
INSERT INTO `distritos` VALUES ('1262', 'INDEPENDENCIA', '127');
INSERT INTO `distritos` VALUES ('1263', 'JESUS MARIA', '127');
INSERT INTO `distritos` VALUES ('1264', 'LA MOLINA', '127');
INSERT INTO `distritos` VALUES ('1265', 'LA VICTORIA', '127');
INSERT INTO `distritos` VALUES ('1266', 'LINCE', '127');
INSERT INTO `distritos` VALUES ('1267', 'LOS OLIVOS', '127');
INSERT INTO `distritos` VALUES ('1268', 'LURIGANCHO', '127');
INSERT INTO `distritos` VALUES ('1269', 'LURIN', '127');
INSERT INTO `distritos` VALUES ('1270', 'MAGDALENA DEL MAR', '127');
INSERT INTO `distritos` VALUES ('1271', 'MAGDALENA VIEJA', '127');
INSERT INTO `distritos` VALUES ('1272', 'MIRAFLORES', '127');
INSERT INTO `distritos` VALUES ('1273', 'PACHACAMAC', '127');
INSERT INTO `distritos` VALUES ('1274', 'PUCUSANA', '127');
INSERT INTO `distritos` VALUES ('1275', 'PUENTE PIEDRA', '127');
INSERT INTO `distritos` VALUES ('1276', 'PUNTA HERMOSA', '127');
INSERT INTO `distritos` VALUES ('1277', 'PUNTA NEGRA', '127');
INSERT INTO `distritos` VALUES ('1278', 'RIMAC', '127');
INSERT INTO `distritos` VALUES ('1279', 'SAN BARTOLO', '127');
INSERT INTO `distritos` VALUES ('1280', 'SAN BORJA', '127');
INSERT INTO `distritos` VALUES ('1281', 'SAN ISIDRO', '127');
INSERT INTO `distritos` VALUES ('1282', 'SAN JUAN DE LURIGANCHO', '127');
INSERT INTO `distritos` VALUES ('1283', 'SAN JUAN DE MIRAFLORES', '127');
INSERT INTO `distritos` VALUES ('1284', 'SAN LUIS', '127');
INSERT INTO `distritos` VALUES ('1285', 'SAN MARTIN DE PORRES', '127');
INSERT INTO `distritos` VALUES ('1286', 'SAN MIGUEL', '127');
INSERT INTO `distritos` VALUES ('1287', 'SANTA ANITA', '127');
INSERT INTO `distritos` VALUES ('1288', 'SANTA MARIA DEL MAR', '127');
INSERT INTO `distritos` VALUES ('1289', 'SANTA ROSA', '127');
INSERT INTO `distritos` VALUES ('1290', 'SANTIAGO DE SURCO', '127');
INSERT INTO `distritos` VALUES ('1291', 'SURQUILLO', '127');
INSERT INTO `distritos` VALUES ('1292', 'VILLA EL SALVADOR', '127');
INSERT INTO `distritos` VALUES ('1293', 'VILLA MARIA DEL TRIUNFO', '127');
INSERT INTO `distritos` VALUES ('1294', 'BARRANCA', '128');
INSERT INTO `distritos` VALUES ('1295', 'PARAMONGA', '128');
INSERT INTO `distritos` VALUES ('1296', 'PATIVILCA', '128');
INSERT INTO `distritos` VALUES ('1297', 'SUPE', '128');
INSERT INTO `distritos` VALUES ('1298', 'SUPE PUERTO', '128');
INSERT INTO `distritos` VALUES ('1299', 'CAJATAMBO', '129');
INSERT INTO `distritos` VALUES ('1300', 'COPA', '129');
INSERT INTO `distritos` VALUES ('1301', 'GORGOR', '129');
INSERT INTO `distritos` VALUES ('1302', 'HUANCAPON', '129');
INSERT INTO `distritos` VALUES ('1303', 'MANAS', '129');
INSERT INTO `distritos` VALUES ('1304', 'CANTA', '130');
INSERT INTO `distritos` VALUES ('1305', 'ARAHUAY', '130');
INSERT INTO `distritos` VALUES ('1306', 'HUAMANTANGA', '130');
INSERT INTO `distritos` VALUES ('1307', 'HUAROS', '130');
INSERT INTO `distritos` VALUES ('1308', 'LACHAQUI', '130');
INSERT INTO `distritos` VALUES ('1309', 'SAN BUENAVENTURA', '130');
INSERT INTO `distritos` VALUES ('1310', 'SANTA ROSA DE QUIVES', '130');
INSERT INTO `distritos` VALUES ('1311', 'SAN VICENTE DE CA&Ntilde;ETE', '131');
INSERT INTO `distritos` VALUES ('1312', 'ASIA', '131');
INSERT INTO `distritos` VALUES ('1313', 'CALANGO', '131');
INSERT INTO `distritos` VALUES ('1314', 'CERRO AZUL', '131');
INSERT INTO `distritos` VALUES ('1315', 'CHILCA', '131');
INSERT INTO `distritos` VALUES ('1316', 'COAYLLO', '131');
INSERT INTO `distritos` VALUES ('1317', 'IMPERIAL', '131');
INSERT INTO `distritos` VALUES ('1318', 'LUNAHUANA', '131');
INSERT INTO `distritos` VALUES ('1319', 'MALA', '131');
INSERT INTO `distritos` VALUES ('1320', 'NUEVO IMPERIAL', '131');
INSERT INTO `distritos` VALUES ('1321', 'PACARAN', '131');
INSERT INTO `distritos` VALUES ('1322', 'QUILMANA', '131');
INSERT INTO `distritos` VALUES ('1323', 'SAN ANTONIO', '131');
INSERT INTO `distritos` VALUES ('1324', 'SAN LUIS', '131');
INSERT INTO `distritos` VALUES ('1325', 'SANTA CRUZ DE FLORES', '131');
INSERT INTO `distritos` VALUES ('1326', 'ZU&Ntilde;IGA', '131');
INSERT INTO `distritos` VALUES ('1327', 'HUARAL', '132');
INSERT INTO `distritos` VALUES ('1328', 'ATAVILLOS ALTO', '132');
INSERT INTO `distritos` VALUES ('1329', 'ATAVILLOS BAJO', '132');
INSERT INTO `distritos` VALUES ('1330', 'AUCALLAMA', '132');
INSERT INTO `distritos` VALUES ('1331', 'CHANCAY', '132');
INSERT INTO `distritos` VALUES ('1332', 'IHUARI', '132');
INSERT INTO `distritos` VALUES ('1333', 'LAMPIAN', '132');
INSERT INTO `distritos` VALUES ('1334', 'PACARAOS', '132');
INSERT INTO `distritos` VALUES ('1335', 'SAN MIGUEL DE ACOS', '132');
INSERT INTO `distritos` VALUES ('1336', 'SANTA CRUZ DE ANDAMARCA', '132');
INSERT INTO `distritos` VALUES ('1337', 'SUMBILCA', '132');
INSERT INTO `distritos` VALUES ('1338', 'VEINTISIETE DE NOVIEMBRE', '132');
INSERT INTO `distritos` VALUES ('1339', 'MATUCANA', '133');
INSERT INTO `distritos` VALUES ('1340', 'ANTIOQUIA', '133');
INSERT INTO `distritos` VALUES ('1341', 'CALLAHUANCA', '133');
INSERT INTO `distritos` VALUES ('1342', 'CARAMPOMA', '133');
INSERT INTO `distritos` VALUES ('1343', 'CHICLA', '133');
INSERT INTO `distritos` VALUES ('1344', 'CUENCA', '133');
INSERT INTO `distritos` VALUES ('1345', 'HUACHUPAMPA', '133');
INSERT INTO `distritos` VALUES ('1346', 'HUANZA', '133');
INSERT INTO `distritos` VALUES ('1347', 'HUAROCHIRI', '133');
INSERT INTO `distritos` VALUES ('1348', 'LAHUAYTAMBO', '133');
INSERT INTO `distritos` VALUES ('1349', 'LANGA', '133');
INSERT INTO `distritos` VALUES ('1350', 'LARAOS', '133');
INSERT INTO `distritos` VALUES ('1351', 'MARIATANA', '133');
INSERT INTO `distritos` VALUES ('1352', 'RICARDO PALMA', '133');
INSERT INTO `distritos` VALUES ('1353', 'SAN ANDRES DE TUPICOCHA', '133');
INSERT INTO `distritos` VALUES ('1354', 'SAN ANTONIO', '133');
INSERT INTO `distritos` VALUES ('1355', 'SAN BARTOLOME', '133');
INSERT INTO `distritos` VALUES ('1356', 'SAN DAMIAN', '133');
INSERT INTO `distritos` VALUES ('1357', 'SAN JUAN DE IRIS', '133');
INSERT INTO `distritos` VALUES ('1358', 'SAN JUAN DE TANTARANCHE', '133');
INSERT INTO `distritos` VALUES ('1359', 'SAN LORENZO DE QUINTI', '133');
INSERT INTO `distritos` VALUES ('1360', 'SAN MATEO', '133');
INSERT INTO `distritos` VALUES ('1361', 'SAN MATEO DE OTAO', '133');
INSERT INTO `distritos` VALUES ('1362', 'SAN PEDRO DE CASTA', '133');
INSERT INTO `distritos` VALUES ('1363', 'SAN PEDRO DE HUANCAYRE', '133');
INSERT INTO `distritos` VALUES ('1364', 'SANGALLAYA', '133');
INSERT INTO `distritos` VALUES ('1365', 'SANTA CRUZ DE COCACHACRA', '133');
INSERT INTO `distritos` VALUES ('1366', 'SANTA EULALIA', '133');
INSERT INTO `distritos` VALUES ('1367', 'SANTIAGO DE ANCHUCAYA', '133');
INSERT INTO `distritos` VALUES ('1368', 'SANTIAGO DE TUNA', '133');
INSERT INTO `distritos` VALUES ('1369', 'SANTO DOMINGO DE LOS OLLEROS', '133');
INSERT INTO `distritos` VALUES ('1370', 'SURCO', '133');
INSERT INTO `distritos` VALUES ('1371', 'HUACHO', '134');
INSERT INTO `distritos` VALUES ('1372', 'AMBAR', '134');
INSERT INTO `distritos` VALUES ('1373', 'CALETA DE CARQUIN', '134');
INSERT INTO `distritos` VALUES ('1374', 'CHECRAS', '134');
INSERT INTO `distritos` VALUES ('1375', 'HUALMAY', '134');
INSERT INTO `distritos` VALUES ('1376', 'HUAURA', '134');
INSERT INTO `distritos` VALUES ('1377', 'LEONCIO PRADO', '134');
INSERT INTO `distritos` VALUES ('1378', 'PACCHO', '134');
INSERT INTO `distritos` VALUES ('1379', 'SANTA LEONOR', '134');
INSERT INTO `distritos` VALUES ('1380', 'SANTA MARIA', '134');
INSERT INTO `distritos` VALUES ('1381', 'SAYAN', '134');
INSERT INTO `distritos` VALUES ('1382', 'VEGUETA', '134');
INSERT INTO `distritos` VALUES ('1383', 'OYON', '135');
INSERT INTO `distritos` VALUES ('1384', 'ANDAJES', '135');
INSERT INTO `distritos` VALUES ('1385', 'CAUJUL', '135');
INSERT INTO `distritos` VALUES ('1386', 'COCHAMARCA', '135');
INSERT INTO `distritos` VALUES ('1387', 'NAVAN', '135');
INSERT INTO `distritos` VALUES ('1388', 'PACHANGARA', '135');
INSERT INTO `distritos` VALUES ('1389', 'YAUYOS', '136');
INSERT INTO `distritos` VALUES ('1390', 'ALIS', '136');
INSERT INTO `distritos` VALUES ('1391', 'AYAUCA', '136');
INSERT INTO `distritos` VALUES ('1392', 'AYAVIRI', '136');
INSERT INTO `distritos` VALUES ('1393', 'AZANGARO', '136');
INSERT INTO `distritos` VALUES ('1394', 'CACRA', '136');
INSERT INTO `distritos` VALUES ('1395', 'CARANIA', '136');
INSERT INTO `distritos` VALUES ('1396', 'CATAHUASI', '136');
INSERT INTO `distritos` VALUES ('1397', 'CHOCOS', '136');
INSERT INTO `distritos` VALUES ('1398', 'COCHAS', '136');
INSERT INTO `distritos` VALUES ('1399', 'COLONIA', '136');
INSERT INTO `distritos` VALUES ('1400', 'HONGOS', '136');
INSERT INTO `distritos` VALUES ('1401', 'HUAMPARA', '136');
INSERT INTO `distritos` VALUES ('1402', 'HUANCAYA', '136');
INSERT INTO `distritos` VALUES ('1403', 'HUANGASCAR', '136');
INSERT INTO `distritos` VALUES ('1404', 'HUANTAN', '136');
INSERT INTO `distritos` VALUES ('1405', 'HUA&Ntilde;EC', '136');
INSERT INTO `distritos` VALUES ('1406', 'LARAOS', '136');
INSERT INTO `distritos` VALUES ('1407', 'LINCHA', '136');
INSERT INTO `distritos` VALUES ('1408', 'MADEAN', '136');
INSERT INTO `distritos` VALUES ('1409', 'MIRAFLORES', '136');
INSERT INTO `distritos` VALUES ('1410', 'OMAS', '136');
INSERT INTO `distritos` VALUES ('1411', 'PUTINZA', '136');
INSERT INTO `distritos` VALUES ('1412', 'QUINCHES', '136');
INSERT INTO `distritos` VALUES ('1413', 'QUINOCAY', '136');
INSERT INTO `distritos` VALUES ('1414', 'SAN JOAQUIN', '136');
INSERT INTO `distritos` VALUES ('1415', 'SAN PEDRO DE PILAS', '136');
INSERT INTO `distritos` VALUES ('1416', 'TANTA', '136');
INSERT INTO `distritos` VALUES ('1417', 'TAURIPAMPA', '136');
INSERT INTO `distritos` VALUES ('1418', 'TOMAS', '136');
INSERT INTO `distritos` VALUES ('1419', 'TUPE', '136');
INSERT INTO `distritos` VALUES ('1420', 'VI&Ntilde;AC', '136');
INSERT INTO `distritos` VALUES ('1421', 'VITIS', '136');
INSERT INTO `distritos` VALUES ('1422', 'IQUITOS', '137');
INSERT INTO `distritos` VALUES ('1423', 'ALTO NANAY', '137');
INSERT INTO `distritos` VALUES ('1424', 'FERNANDO LORES', '137');
INSERT INTO `distritos` VALUES ('1425', 'INDIANA', '137');
INSERT INTO `distritos` VALUES ('1426', 'LAS AMAZONAS', '137');
INSERT INTO `distritos` VALUES ('1427', 'MAZAN', '137');
INSERT INTO `distritos` VALUES ('1428', 'NAPO', '137');
INSERT INTO `distritos` VALUES ('1429', 'PUNCHANA', '137');
INSERT INTO `distritos` VALUES ('1430', 'PUTUMAYO', '137');
INSERT INTO `distritos` VALUES ('1431', 'TORRES CAUSANA', '137');
INSERT INTO `distritos` VALUES ('1432', 'BELEN', '137');
INSERT INTO `distritos` VALUES ('1433', 'SAN JUAN BAUTISTA', '137');
INSERT INTO `distritos` VALUES ('1434', 'YURIMAGUAS', '138');
INSERT INTO `distritos` VALUES ('1435', 'BALSAPUERTO', '138');
INSERT INTO `distritos` VALUES ('1436', 'BARRANCA', '138');
INSERT INTO `distritos` VALUES ('1437', 'CAHUAPANAS', '138');
INSERT INTO `distritos` VALUES ('1438', 'JEBEROS', '138');
INSERT INTO `distritos` VALUES ('1439', 'LAGUNAS', '138');
INSERT INTO `distritos` VALUES ('1440', 'MANSERICHE', '138');
INSERT INTO `distritos` VALUES ('1441', 'MORONA', '138');
INSERT INTO `distritos` VALUES ('1442', 'PASTAZA', '138');
INSERT INTO `distritos` VALUES ('1443', 'SANTA CRUZ', '138');
INSERT INTO `distritos` VALUES ('1444', 'TENIENTE CESAR LOPEZ ROJAS', '138');
INSERT INTO `distritos` VALUES ('1445', 'NAUTA', '139');
INSERT INTO `distritos` VALUES ('1446', 'PARINARI', '139');
INSERT INTO `distritos` VALUES ('1447', 'TIGRE', '139');
INSERT INTO `distritos` VALUES ('1448', 'TROMPETEROS', '139');
INSERT INTO `distritos` VALUES ('1449', 'URARINAS', '139');
INSERT INTO `distritos` VALUES ('1450', 'RAMON CASTILLA', '140');
INSERT INTO `distritos` VALUES ('1451', 'PEBAS', '140');
INSERT INTO `distritos` VALUES ('1452', 'YAVARI', '140');
INSERT INTO `distritos` VALUES ('1453', 'SAN PABLO', '140');
INSERT INTO `distritos` VALUES ('1454', 'REQUENA', '141');
INSERT INTO `distritos` VALUES ('1455', 'ALTO TAPICHE', '141');
INSERT INTO `distritos` VALUES ('1456', 'CAPELO', '141');
INSERT INTO `distritos` VALUES ('1457', 'EMILIO SAN MARTIN', '141');
INSERT INTO `distritos` VALUES ('1458', 'MAQUIA', '141');
INSERT INTO `distritos` VALUES ('1459', 'PUINAHUA', '141');
INSERT INTO `distritos` VALUES ('1460', 'SAQUENA', '141');
INSERT INTO `distritos` VALUES ('1461', 'SOPLIN', '141');
INSERT INTO `distritos` VALUES ('1462', 'TAPICHE', '141');
INSERT INTO `distritos` VALUES ('1463', 'JENARO HERRERA', '141');
INSERT INTO `distritos` VALUES ('1464', 'YAQUERANA', '141');
INSERT INTO `distritos` VALUES ('1465', 'CONTAMANA', '142');
INSERT INTO `distritos` VALUES ('1466', 'INAHUAYA', '142');
INSERT INTO `distritos` VALUES ('1467', 'PADRE MARQUEZ', '142');
INSERT INTO `distritos` VALUES ('1468', 'PAMPA HERMOSA', '142');
INSERT INTO `distritos` VALUES ('1469', 'SARAYACU', '142');
INSERT INTO `distritos` VALUES ('1470', 'VARGAS GUERRA', '142');
INSERT INTO `distritos` VALUES ('1471', 'TAMBOPATA', '143');
INSERT INTO `distritos` VALUES ('1472', 'INAMBARI', '143');
INSERT INTO `distritos` VALUES ('1473', 'LAS PIEDRAS', '143');
INSERT INTO `distritos` VALUES ('1474', 'LABERINTO', '143');
INSERT INTO `distritos` VALUES ('1475', 'MANU', '144');
INSERT INTO `distritos` VALUES ('1476', 'FITZCARRALD', '144');
INSERT INTO `distritos` VALUES ('1477', 'MADRE DE DIOS', '144');
INSERT INTO `distritos` VALUES ('1478', 'HUEPETUHE', '144');
INSERT INTO `distritos` VALUES ('1479', 'I&Ntilde;APARI', '145');
INSERT INTO `distritos` VALUES ('1480', 'IBERIA', '145');
INSERT INTO `distritos` VALUES ('1481', 'TAHUAMANU', '145');
INSERT INTO `distritos` VALUES ('1482', 'MOQUEGUA', '146');
INSERT INTO `distritos` VALUES ('1483', 'CARUMAS', '146');
INSERT INTO `distritos` VALUES ('1484', 'CUCHUMBAYA', '146');
INSERT INTO `distritos` VALUES ('1485', 'SAMEGUA', '146');
INSERT INTO `distritos` VALUES ('1486', 'SAN CRISTOBAL', '146');
INSERT INTO `distritos` VALUES ('1487', 'TORATA', '146');
INSERT INTO `distritos` VALUES ('1488', 'OMATE', '147');
INSERT INTO `distritos` VALUES ('1489', 'CHOJATA', '147');
INSERT INTO `distritos` VALUES ('1490', 'COALAQUE', '147');
INSERT INTO `distritos` VALUES ('1491', 'ICHU&Ntilde;A', '147');
INSERT INTO `distritos` VALUES ('1492', 'LA CAPILLA', '147');
INSERT INTO `distritos` VALUES ('1493', 'LLOQUE', '147');
INSERT INTO `distritos` VALUES ('1494', 'MATALAQUE', '147');
INSERT INTO `distritos` VALUES ('1495', 'PUQUINA', '147');
INSERT INTO `distritos` VALUES ('1496', 'QUINISTAQUILLAS', '147');
INSERT INTO `distritos` VALUES ('1497', 'UBINAS', '147');
INSERT INTO `distritos` VALUES ('1498', 'YUNGA', '147');
INSERT INTO `distritos` VALUES ('1499', 'ILO', '148');
INSERT INTO `distritos` VALUES ('1500', 'EL ALGARROBAL', '148');
INSERT INTO `distritos` VALUES ('1501', 'PACOCHA', '148');
INSERT INTO `distritos` VALUES ('1502', 'CHAUPIMARCA', '149');
INSERT INTO `distritos` VALUES ('1503', 'HUACHON', '149');
INSERT INTO `distritos` VALUES ('1504', 'HUARIACA', '149');
INSERT INTO `distritos` VALUES ('1505', 'HUAYLLAY', '149');
INSERT INTO `distritos` VALUES ('1506', 'NINACACA', '149');
INSERT INTO `distritos` VALUES ('1507', 'PALLANCHACRA', '149');
INSERT INTO `distritos` VALUES ('1508', 'PAUCARTAMBO', '149');
INSERT INTO `distritos` VALUES ('1509', 'SAN FCO.DE ASIS DE YARUSYACAN', '149');
INSERT INTO `distritos` VALUES ('1510', 'SIMON BOLIVAR', '149');
INSERT INTO `distritos` VALUES ('1511', 'TICLACAYAN', '149');
INSERT INTO `distritos` VALUES ('1512', 'TINYAHUARCO', '149');
INSERT INTO `distritos` VALUES ('1513', 'VICCO', '149');
INSERT INTO `distritos` VALUES ('1514', 'YANACANCHA', '149');
INSERT INTO `distritos` VALUES ('1515', 'YANAHUANCA', '150');
INSERT INTO `distritos` VALUES ('1516', 'CHACAYAN', '150');
INSERT INTO `distritos` VALUES ('1517', 'GOYLLARISQUIZGA', '150');
INSERT INTO `distritos` VALUES ('1518', 'PAUCAR', '150');
INSERT INTO `distritos` VALUES ('1519', 'SAN PEDRO DE PILLAO', '150');
INSERT INTO `distritos` VALUES ('1520', 'SANTA ANA DE TUSI', '150');
INSERT INTO `distritos` VALUES ('1521', 'TAPUC', '150');
INSERT INTO `distritos` VALUES ('1522', 'VILCABAMBA', '150');
INSERT INTO `distritos` VALUES ('1523', 'OXAPAMPA', '151');
INSERT INTO `distritos` VALUES ('1524', 'CHONTABAMBA', '151');
INSERT INTO `distritos` VALUES ('1525', 'HUANCABAMBA', '151');
INSERT INTO `distritos` VALUES ('1526', 'PALCAZU', '151');
INSERT INTO `distritos` VALUES ('1527', 'POZUZO', '151');
INSERT INTO `distritos` VALUES ('1528', 'PUERTO BERMUDEZ', '151');
INSERT INTO `distritos` VALUES ('1529', 'VILLA RICA', '151');
INSERT INTO `distritos` VALUES ('1530', 'PIURA', '152');
INSERT INTO `distritos` VALUES ('1531', 'CASTILLA', '152');
INSERT INTO `distritos` VALUES ('1532', 'CATACAOS', '152');
INSERT INTO `distritos` VALUES ('1533', 'CURA MORI', '152');
INSERT INTO `distritos` VALUES ('1534', 'EL TALLAN', '152');
INSERT INTO `distritos` VALUES ('1535', 'LA ARENA', '152');
INSERT INTO `distritos` VALUES ('1536', 'LA UNION', '152');
INSERT INTO `distritos` VALUES ('1537', 'LAS LOMAS', '152');
INSERT INTO `distritos` VALUES ('1538', 'TAMBO GRANDE', '152');
INSERT INTO `distritos` VALUES ('1539', 'AYABACA', '153');
INSERT INTO `distritos` VALUES ('1540', 'FRIAS', '153');
INSERT INTO `distritos` VALUES ('1541', 'JILILI', '153');
INSERT INTO `distritos` VALUES ('1542', 'LAGUNAS', '153');
INSERT INTO `distritos` VALUES ('1543', 'MONTERO', '153');
INSERT INTO `distritos` VALUES ('1544', 'PACAIPAMPA', '153');
INSERT INTO `distritos` VALUES ('1545', 'PAIMAS', '153');
INSERT INTO `distritos` VALUES ('1546', 'SAPILLICA', '153');
INSERT INTO `distritos` VALUES ('1547', 'SICCHEZ', '153');
INSERT INTO `distritos` VALUES ('1548', 'SUYO', '153');
INSERT INTO `distritos` VALUES ('1549', 'HUANCABAMBA', '154');
INSERT INTO `distritos` VALUES ('1550', 'CANCHAQUE', '154');
INSERT INTO `distritos` VALUES ('1551', 'EL CARMEN DE LA FRONTERA', '154');
INSERT INTO `distritos` VALUES ('1552', 'HUARMACA', '154');
INSERT INTO `distritos` VALUES ('1553', 'LALAQUIZ', '154');
INSERT INTO `distritos` VALUES ('1554', 'SAN MIGUEL DE EL FAIQUE', '154');
INSERT INTO `distritos` VALUES ('1555', 'SONDOR', '154');
INSERT INTO `distritos` VALUES ('1556', 'SONDORILLO', '154');
INSERT INTO `distritos` VALUES ('1557', 'CHULUCANAS', '155');
INSERT INTO `distritos` VALUES ('1558', 'BUENOS AIRES', '155');
INSERT INTO `distritos` VALUES ('1559', 'CHALACO', '155');
INSERT INTO `distritos` VALUES ('1560', 'LA MATANZA', '155');
INSERT INTO `distritos` VALUES ('1561', 'MORROPON', '155');
INSERT INTO `distritos` VALUES ('1562', 'SALITRAL', '155');
INSERT INTO `distritos` VALUES ('1563', 'SAN JUAN DE BIGOTE', '155');
INSERT INTO `distritos` VALUES ('1564', 'SANTA CATALINA DE MOSSA', '155');
INSERT INTO `distritos` VALUES ('1565', 'SANTO DOMINGO', '155');
INSERT INTO `distritos` VALUES ('1566', 'YAMANGO', '155');
INSERT INTO `distritos` VALUES ('1567', 'PAITA', '156');
INSERT INTO `distritos` VALUES ('1568', 'AMOTAPE', '156');
INSERT INTO `distritos` VALUES ('1569', 'ARENAL', '156');
INSERT INTO `distritos` VALUES ('1570', 'COLAN', '156');
INSERT INTO `distritos` VALUES ('1571', 'LA HUACA', '156');
INSERT INTO `distritos` VALUES ('1572', 'TAMARINDO', '156');
INSERT INTO `distritos` VALUES ('1573', 'VICHAYAL', '156');
INSERT INTO `distritos` VALUES ('1574', 'SULLANA', '157');
INSERT INTO `distritos` VALUES ('1575', 'BELLAVISTA', '157');
INSERT INTO `distritos` VALUES ('1576', 'IGNACIO ESCUDERO', '157');
INSERT INTO `distritos` VALUES ('1577', 'LANCONES', '157');
INSERT INTO `distritos` VALUES ('1578', 'MARCAVELICA', '157');
INSERT INTO `distritos` VALUES ('1579', 'MIGUEL CHECA', '157');
INSERT INTO `distritos` VALUES ('1580', 'QUERECOTILLO', '157');
INSERT INTO `distritos` VALUES ('1581', 'SALITRAL', '157');
INSERT INTO `distritos` VALUES ('1582', 'PARI&Ntilde;AS', '158');
INSERT INTO `distritos` VALUES ('1583', 'EL ALTO', '158');
INSERT INTO `distritos` VALUES ('1584', 'LA BREA', '158');
INSERT INTO `distritos` VALUES ('1585', 'LOBITOS', '158');
INSERT INTO `distritos` VALUES ('1586', 'LOS ORGANOS', '158');
INSERT INTO `distritos` VALUES ('1587', 'MANCORA', '158');
INSERT INTO `distritos` VALUES ('1588', 'SECHURA', '159');
INSERT INTO `distritos` VALUES ('1589', 'BELLAVISTA DE LA UNION', '159');
INSERT INTO `distritos` VALUES ('1590', 'BERNAL', '159');
INSERT INTO `distritos` VALUES ('1591', 'CRISTO NOS VALGA', '159');
INSERT INTO `distritos` VALUES ('1592', 'VICE', '159');
INSERT INTO `distritos` VALUES ('1593', 'RINCONADA LLICUAR', '159');
INSERT INTO `distritos` VALUES ('1594', 'PUNO', '160');
INSERT INTO `distritos` VALUES ('1595', 'ACORA', '160');
INSERT INTO `distritos` VALUES ('1596', 'AMANTANI', '160');
INSERT INTO `distritos` VALUES ('1597', 'ATUNCOLLA', '160');
INSERT INTO `distritos` VALUES ('1598', 'CAPACHICA', '160');
INSERT INTO `distritos` VALUES ('1599', 'CHUCUITO', '160');
INSERT INTO `distritos` VALUES ('1600', 'COATA', '160');
INSERT INTO `distritos` VALUES ('1601', 'HUATA', '160');
INSERT INTO `distritos` VALUES ('1602', 'MA&Ntilde;AZO', '160');
INSERT INTO `distritos` VALUES ('1603', 'PAUCARCOLLA', '160');
INSERT INTO `distritos` VALUES ('1604', 'PICHACANI', '160');
INSERT INTO `distritos` VALUES ('1605', 'PLATERIA', '160');
INSERT INTO `distritos` VALUES ('1606', 'SAN ANTONIO', '160');
INSERT INTO `distritos` VALUES ('1607', 'TIQUILLACA', '160');
INSERT INTO `distritos` VALUES ('1608', 'VILQUE', '160');
INSERT INTO `distritos` VALUES ('1609', 'AZANGARO', '161');
INSERT INTO `distritos` VALUES ('1610', 'ACHAYA', '161');
INSERT INTO `distritos` VALUES ('1611', 'ARAPA', '161');
INSERT INTO `distritos` VALUES ('1612', 'ASILLO', '161');
INSERT INTO `distritos` VALUES ('1613', 'CAMINACA', '161');
INSERT INTO `distritos` VALUES ('1614', 'CHUPA', '161');
INSERT INTO `distritos` VALUES ('1615', 'JOSE DOMINGO CHOQUEHUANCA', '161');
INSERT INTO `distritos` VALUES ('1616', 'MU&Ntilde;ANI', '161');
INSERT INTO `distritos` VALUES ('1617', 'POTONI', '161');
INSERT INTO `distritos` VALUES ('1618', 'SAMAN', '161');
INSERT INTO `distritos` VALUES ('1619', 'SAN ANTON', '161');
INSERT INTO `distritos` VALUES ('1620', 'SAN JOSE', '161');
INSERT INTO `distritos` VALUES ('1621', 'SAN JUAN DE SALINAS', '161');
INSERT INTO `distritos` VALUES ('1622', 'SANTIAGO DE PUPUJA', '161');
INSERT INTO `distritos` VALUES ('1623', 'TIRAPATA', '161');
INSERT INTO `distritos` VALUES ('1624', 'MACUSANI', '162');
INSERT INTO `distritos` VALUES ('1625', 'AJOYANI', '162');
INSERT INTO `distritos` VALUES ('1626', 'AYAPATA', '162');
INSERT INTO `distritos` VALUES ('1627', 'COASA', '162');
INSERT INTO `distritos` VALUES ('1628', 'CORANI', '162');
INSERT INTO `distritos` VALUES ('1629', 'CRUCERO', '162');
INSERT INTO `distritos` VALUES ('1630', 'ITUATA', '162');
INSERT INTO `distritos` VALUES ('1631', 'OLLACHEA', '162');
INSERT INTO `distritos` VALUES ('1632', 'SAN GABAN', '162');
INSERT INTO `distritos` VALUES ('1633', 'USICAYOS', '162');
INSERT INTO `distritos` VALUES ('1634', 'JULI', '163');
INSERT INTO `distritos` VALUES ('1635', 'DESAGUADERO', '163');
INSERT INTO `distritos` VALUES ('1636', 'HUACULLANI', '163');
INSERT INTO `distritos` VALUES ('1637', 'KELLUYO', '163');
INSERT INTO `distritos` VALUES ('1638', 'PISACOMA', '163');
INSERT INTO `distritos` VALUES ('1639', 'POMATA', '163');
INSERT INTO `distritos` VALUES ('1640', 'ZEPITA', '163');
INSERT INTO `distritos` VALUES ('1641', 'ILAVE', '164');
INSERT INTO `distritos` VALUES ('1642', 'CAPAZO', '164');
INSERT INTO `distritos` VALUES ('1643', 'PILCUYO', '164');
INSERT INTO `distritos` VALUES ('1644', 'SANTA ROSA', '164');
INSERT INTO `distritos` VALUES ('1645', 'CONDURIRI', '164');
INSERT INTO `distritos` VALUES ('1646', 'HUANCANE', '165');
INSERT INTO `distritos` VALUES ('1647', 'COJATA', '165');
INSERT INTO `distritos` VALUES ('1648', 'HUATASANI', '165');
INSERT INTO `distritos` VALUES ('1649', 'INCHUPALLA', '165');
INSERT INTO `distritos` VALUES ('1650', 'PUSI', '165');
INSERT INTO `distritos` VALUES ('1651', 'ROSASPATA', '165');
INSERT INTO `distritos` VALUES ('1652', 'TARACO', '165');
INSERT INTO `distritos` VALUES ('1653', 'VILQUE CHICO', '165');
INSERT INTO `distritos` VALUES ('1654', 'LAMPA', '166');
INSERT INTO `distritos` VALUES ('1655', 'CABANILLA', '166');
INSERT INTO `distritos` VALUES ('1656', 'CALAPUJA', '166');
INSERT INTO `distritos` VALUES ('1657', 'NICASIO', '166');
INSERT INTO `distritos` VALUES ('1658', 'OCUVIRI', '166');
INSERT INTO `distritos` VALUES ('1659', 'PALCA', '166');
INSERT INTO `distritos` VALUES ('1660', 'PARATIA', '166');
INSERT INTO `distritos` VALUES ('1661', 'PUCARA', '166');
INSERT INTO `distritos` VALUES ('1662', 'SANTA LUCIA', '166');
INSERT INTO `distritos` VALUES ('1663', 'VILAVILA', '166');
INSERT INTO `distritos` VALUES ('1664', 'AYAVIRI', '167');
INSERT INTO `distritos` VALUES ('1665', 'ANTAUTA', '167');
INSERT INTO `distritos` VALUES ('1666', 'CUPI', '167');
INSERT INTO `distritos` VALUES ('1667', 'LLALLI', '167');
INSERT INTO `distritos` VALUES ('1668', 'MACARI', '167');
INSERT INTO `distritos` VALUES ('1669', 'NU&Ntilde;OA', '167');
INSERT INTO `distritos` VALUES ('1670', 'ORURILLO', '167');
INSERT INTO `distritos` VALUES ('1671', 'SANTA ROSA', '167');
INSERT INTO `distritos` VALUES ('1672', 'UMACHIRI', '167');
INSERT INTO `distritos` VALUES ('1673', 'MOHO', '168');
INSERT INTO `distritos` VALUES ('1674', 'CONIMA', '168');
INSERT INTO `distritos` VALUES ('1675', 'HUAYRAPATA', '168');
INSERT INTO `distritos` VALUES ('1676', 'TILALI', '168');
INSERT INTO `distritos` VALUES ('1677', 'PUTINA', '169');
INSERT INTO `distritos` VALUES ('1678', 'ANANEA', '169');
INSERT INTO `distritos` VALUES ('1679', 'PEDRO VILCA APAZA', '169');
INSERT INTO `distritos` VALUES ('1680', 'QUILCAPUNCU', '169');
INSERT INTO `distritos` VALUES ('1681', 'SINA', '169');
INSERT INTO `distritos` VALUES ('1682', 'JULIACA', '170');
INSERT INTO `distritos` VALUES ('1683', 'CABANA', '170');
INSERT INTO `distritos` VALUES ('1684', 'CABANILLAS', '170');
INSERT INTO `distritos` VALUES ('1685', 'CARACOTO', '170');
INSERT INTO `distritos` VALUES ('1686', 'SANDIA', '171');
INSERT INTO `distritos` VALUES ('1687', 'CUYOCUYO', '171');
INSERT INTO `distritos` VALUES ('1688', 'LIMBANI', '171');
INSERT INTO `distritos` VALUES ('1689', 'PATAMBUCO', '171');
INSERT INTO `distritos` VALUES ('1690', 'PHARA', '171');
INSERT INTO `distritos` VALUES ('1691', 'QUIACA', '171');
INSERT INTO `distritos` VALUES ('1692', 'SAN JUAN DEL ORO', '171');
INSERT INTO `distritos` VALUES ('1693', 'YANAHUAYA', '171');
INSERT INTO `distritos` VALUES ('1694', 'ALTO INAMBARI', '171');
INSERT INTO `distritos` VALUES ('1695', 'YUNGUYO', '172');
INSERT INTO `distritos` VALUES ('1696', 'ANAPIA', '172');
INSERT INTO `distritos` VALUES ('1697', 'COPANI', '172');
INSERT INTO `distritos` VALUES ('1698', 'CUTURAPI', '172');
INSERT INTO `distritos` VALUES ('1699', 'OLLARAYA', '172');
INSERT INTO `distritos` VALUES ('1700', 'TINICACHI', '172');
INSERT INTO `distritos` VALUES ('1701', 'UNICACHI', '172');
INSERT INTO `distritos` VALUES ('1702', 'MOYOBAMBA', '173');
INSERT INTO `distritos` VALUES ('1703', 'CALZADA', '173');
INSERT INTO `distritos` VALUES ('1704', 'HABANA', '173');
INSERT INTO `distritos` VALUES ('1705', 'JEPELACIO', '173');
INSERT INTO `distritos` VALUES ('1706', 'SORITOR', '173');
INSERT INTO `distritos` VALUES ('1707', 'YANTALO', '173');
INSERT INTO `distritos` VALUES ('1708', 'BELLAVISTA', '174');
INSERT INTO `distritos` VALUES ('1709', 'ALTO BIAVO', '174');
INSERT INTO `distritos` VALUES ('1710', 'BAJO BIAVO', '174');
INSERT INTO `distritos` VALUES ('1711', 'HUALLAGA', '174');
INSERT INTO `distritos` VALUES ('1712', 'SAN PABLO', '174');
INSERT INTO `distritos` VALUES ('1713', 'SAN RAFAEL', '174');
INSERT INTO `distritos` VALUES ('1714', 'SAN JOSE DE SISA', '175');
INSERT INTO `distritos` VALUES ('1715', 'AGUA BLANCA', '175');
INSERT INTO `distritos` VALUES ('1716', 'SAN MARTIN', '175');
INSERT INTO `distritos` VALUES ('1717', 'SANTA ROSA', '175');
INSERT INTO `distritos` VALUES ('1718', 'SHATOJA', '175');
INSERT INTO `distritos` VALUES ('1719', 'SAPOSOA', '176');
INSERT INTO `distritos` VALUES ('1720', 'ALTO SAPOSOA', '176');
INSERT INTO `distritos` VALUES ('1721', 'EL ESLABON', '176');
INSERT INTO `distritos` VALUES ('1722', 'PISCOYACU', '176');
INSERT INTO `distritos` VALUES ('1723', 'SACANCHE', '176');
INSERT INTO `distritos` VALUES ('1724', 'TINGO DE SAPOSOA', '176');
INSERT INTO `distritos` VALUES ('1725', 'LAMAS', '177');
INSERT INTO `distritos` VALUES ('1726', 'ALONSO DE ALVARADO', '177');
INSERT INTO `distritos` VALUES ('1727', 'BARRANQUITA', '177');
INSERT INTO `distritos` VALUES ('1728', 'CAYNARACHI', '177');
INSERT INTO `distritos` VALUES ('1729', 'CU&Ntilde;UMBUQUI', '177');
INSERT INTO `distritos` VALUES ('1730', 'PINTO RECODO', '177');
INSERT INTO `distritos` VALUES ('1731', 'RUMISAPA', '177');
INSERT INTO `distritos` VALUES ('1732', 'SAN ROQUE DE CUMBAZA', '177');
INSERT INTO `distritos` VALUES ('1733', 'SHANAO', '177');
INSERT INTO `distritos` VALUES ('1734', 'TABALOSOS', '177');
INSERT INTO `distritos` VALUES ('1735', 'ZAPATERO', '177');
INSERT INTO `distritos` VALUES ('1736', 'JUANJUI', '178');
INSERT INTO `distritos` VALUES ('1737', 'CAMPANILLA', '178');
INSERT INTO `distritos` VALUES ('1738', 'HUICUNGO', '178');
INSERT INTO `distritos` VALUES ('1739', 'PACHIZA', '178');
INSERT INTO `distritos` VALUES ('1740', 'PAJARILLO', '178');
INSERT INTO `distritos` VALUES ('1741', 'PICOTA', '179');
INSERT INTO `distritos` VALUES ('1742', 'BUENOS AIRES', '179');
INSERT INTO `distritos` VALUES ('1743', 'CASPISAPA', '179');
INSERT INTO `distritos` VALUES ('1744', 'PILLUANA', '179');
INSERT INTO `distritos` VALUES ('1745', 'PUCACACA', '179');
INSERT INTO `distritos` VALUES ('1746', 'SAN CRISTOBAL', '179');
INSERT INTO `distritos` VALUES ('1747', 'SAN HILARION', '179');
INSERT INTO `distritos` VALUES ('1748', 'SHAMBOYACU', '179');
INSERT INTO `distritos` VALUES ('1749', 'TINGO DE PONASA', '179');
INSERT INTO `distritos` VALUES ('1750', 'TRES UNIDOS', '179');
INSERT INTO `distritos` VALUES ('1751', 'RIOJA', '180');
INSERT INTO `distritos` VALUES ('1752', 'AWAJUN', '180');
INSERT INTO `distritos` VALUES ('1753', 'ELIAS SOPLIN VARGAS', '180');
INSERT INTO `distritos` VALUES ('1754', 'NUEVA CAJAMARCA', '180');
INSERT INTO `distritos` VALUES ('1755', 'PARDO MIGUEL', '180');
INSERT INTO `distritos` VALUES ('1756', 'POSIC', '180');
INSERT INTO `distritos` VALUES ('1757', 'SAN FERNANDO', '180');
INSERT INTO `distritos` VALUES ('1758', 'YORONGOS', '180');
INSERT INTO `distritos` VALUES ('1759', 'YURACYACU', '180');
INSERT INTO `distritos` VALUES ('1760', 'TARAPOTO', '181');
INSERT INTO `distritos` VALUES ('1761', 'ALBERTO LEVEAU', '181');
INSERT INTO `distritos` VALUES ('1762', 'CACATACHI', '181');
INSERT INTO `distritos` VALUES ('1763', 'CHAZUTA', '181');
INSERT INTO `distritos` VALUES ('1764', 'CHIPURANA', '181');
INSERT INTO `distritos` VALUES ('1765', 'EL PORVENIR', '181');
INSERT INTO `distritos` VALUES ('1766', 'HUIMBAYOC', '181');
INSERT INTO `distritos` VALUES ('1767', 'JUAN GUERRA', '181');
INSERT INTO `distritos` VALUES ('1768', 'LA BANDA DE SHILCAYO', '181');
INSERT INTO `distritos` VALUES ('1769', 'MORALES', '181');
INSERT INTO `distritos` VALUES ('1770', 'PAPAPLAYA', '181');
INSERT INTO `distritos` VALUES ('1771', 'SAN ANTONIO', '181');
INSERT INTO `distritos` VALUES ('1772', 'SAUCE', '181');
INSERT INTO `distritos` VALUES ('1773', 'SHAPAJA', '181');
INSERT INTO `distritos` VALUES ('1774', 'TOCACHE', '182');
INSERT INTO `distritos` VALUES ('1775', 'NUEVO PROGRESO', '182');
INSERT INTO `distritos` VALUES ('1776', 'POLVORA', '182');
INSERT INTO `distritos` VALUES ('1777', 'SHUNTE', '182');
INSERT INTO `distritos` VALUES ('1778', 'UCHIZA', '182');
INSERT INTO `distritos` VALUES ('1779', 'TACNA', '183');
INSERT INTO `distritos` VALUES ('1780', 'ALTO DE LA ALIANZA', '183');
INSERT INTO `distritos` VALUES ('1781', 'CALANA', '183');
INSERT INTO `distritos` VALUES ('1782', 'CIUDAD NUEVA', '183');
INSERT INTO `distritos` VALUES ('1783', 'INCLAN', '183');
INSERT INTO `distritos` VALUES ('1784', 'PACHIA', '183');
INSERT INTO `distritos` VALUES ('1785', 'PALCA', '183');
INSERT INTO `distritos` VALUES ('1786', 'POCOLLAY', '183');
INSERT INTO `distritos` VALUES ('1787', 'SAMA', '183');
INSERT INTO `distritos` VALUES ('1788', 'CORONEL GREGORIO ALBARRACIN LANCHIPA', '183');
INSERT INTO `distritos` VALUES ('1789', 'CANDARAVE', '184');
INSERT INTO `distritos` VALUES ('1790', 'CAIRANI', '184');
INSERT INTO `distritos` VALUES ('1791', 'CAMILACA', '184');
INSERT INTO `distritos` VALUES ('1792', 'CURIBAYA', '184');
INSERT INTO `distritos` VALUES ('1793', 'HUANUARA', '184');
INSERT INTO `distritos` VALUES ('1794', 'QUILAHUANI', '184');
INSERT INTO `distritos` VALUES ('1795', 'LOCUMBA', '185');
INSERT INTO `distritos` VALUES ('1796', 'ILABAYA', '185');
INSERT INTO `distritos` VALUES ('1797', 'ITE', '185');
INSERT INTO `distritos` VALUES ('1798', 'TARATA', '186');
INSERT INTO `distritos` VALUES ('1799', 'CHUCATAMANI', '186');
INSERT INTO `distritos` VALUES ('1800', 'ESTIQUE', '186');
INSERT INTO `distritos` VALUES ('1801', 'ESTIQUE-PAMPA', '186');
INSERT INTO `distritos` VALUES ('1802', 'SITAJARA', '186');
INSERT INTO `distritos` VALUES ('1803', 'SUSAPAYA', '186');
INSERT INTO `distritos` VALUES ('1804', 'TARUCACHI', '186');
INSERT INTO `distritos` VALUES ('1805', 'TICACO', '186');
INSERT INTO `distritos` VALUES ('1806', 'TUMBES', '187');
INSERT INTO `distritos` VALUES ('1807', 'CORRALES', '187');
INSERT INTO `distritos` VALUES ('1808', 'LA CRUZ', '187');
INSERT INTO `distritos` VALUES ('1809', 'PAMPAS DE HOSPITAL', '187');
INSERT INTO `distritos` VALUES ('1810', 'SAN JACINTO', '187');
INSERT INTO `distritos` VALUES ('1811', 'SAN JUAN DE LA VIRGEN', '187');
INSERT INTO `distritos` VALUES ('1812', 'ZORRITOS', '188');
INSERT INTO `distritos` VALUES ('1813', 'CASITAS', '188');
INSERT INTO `distritos` VALUES ('1814', 'ZARUMILLA', '189');
INSERT INTO `distritos` VALUES ('1815', 'AGUAS VERDES', '189');
INSERT INTO `distritos` VALUES ('1816', 'MATAPALO', '189');
INSERT INTO `distritos` VALUES ('1817', 'PAPAYAL', '189');
INSERT INTO `distritos` VALUES ('1818', 'CALLERIA', '190');
INSERT INTO `distritos` VALUES ('1819', 'CAMPOVERDE', '190');
INSERT INTO `distritos` VALUES ('1820', 'IPARIA', '190');
INSERT INTO `distritos` VALUES ('1821', 'MASISEA', '190');
INSERT INTO `distritos` VALUES ('1822', 'YARINACOCHA', '190');
INSERT INTO `distritos` VALUES ('1823', 'NUEVA REQUENA', '190');
INSERT INTO `distritos` VALUES ('1824', 'RAYMONDI', '191');
INSERT INTO `distritos` VALUES ('1825', 'SEPAHUA', '191');
INSERT INTO `distritos` VALUES ('1826', 'TAHUANIA', '191');
INSERT INTO `distritos` VALUES ('1827', 'YURUA', '191');
INSERT INTO `distritos` VALUES ('1828', 'PADRE ABAD', '192');
INSERT INTO `distritos` VALUES ('1829', 'IRAZOLA', '192');
INSERT INTO `distritos` VALUES ('1830', 'CURIMANA', '192');
INSERT INTO `distritos` VALUES ('1831', 'PURUS', '193');

-- ----------------------------
-- Table structure for historico_velatorio
-- ----------------------------
DROP TABLE IF EXISTS `historico_velatorio`;
CREATE TABLE `historico_velatorio` (
  `idhistorico_velatorio` int(11) NOT NULL,
  `velatorios_idvelatorio` int(11) NOT NULL,
  `velatorios_RUC` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `iddistrito` int(11) DEFAULT NULL,
  `telefono_fijo` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono_celular` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mail` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `observacion` text COLLATE utf8_spanish_ci,
  `user` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idhistorico_velatorio`),
  KEY `fk_historico_velatorio_velatorios1_idx` (`velatorios_idvelatorio`,`velatorios_RUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of historico_velatorio
-- ----------------------------

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES ('1', 'Toyota');
INSERT INTO `marcas` VALUES ('2', 'Nissan');
INSERT INTO `marcas` VALUES ('3', 'Volvo');

-- ----------------------------
-- Table structure for modeloataudes
-- ----------------------------
DROP TABLE IF EXISTS `modeloataudes`;
CREATE TABLE `modeloataudes` (
  `idmodeloAtaudes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmodeloAtaudes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of modeloataudes
-- ----------------------------
INSERT INTO `modeloataudes` VALUES ('1', 'Standar', 'obs');
INSERT INTO `modeloataudes` VALUES ('3', 'statns33', 'obs33');

-- ----------------------------
-- Table structure for modelos
-- ----------------------------
DROP TABLE IF EXISTS `modelos`;
CREATE TABLE `modelos` (
  `idmodelo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmodelo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of modelos
-- ----------------------------
INSERT INTO `modelos` VALUES ('1', 'sedan');
INSERT INTO `modelos` VALUES ('2', 'ligero');

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `permiso` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO `permisos` VALUES ('add', null);
INSERT INTO `permisos` VALUES ('busquedaxnombre', null);
INSERT INTO `permisos` VALUES ('busquedaxruc', null);
INSERT INTO `permisos` VALUES ('delete', null);
INSERT INTO `permisos` VALUES ('exportarpd', null);
INSERT INTO `permisos` VALUES ('exportarpdf', null);
INSERT INTO `permisos` VALUES ('index', null);
INSERT INTO `permisos` VALUES ('listarcategorias', null);
INSERT INTO `permisos` VALUES ('listardistri', null);
INSERT INTO `permisos` VALUES ('listarpermisos', null);
INSERT INTO `permisos` VALUES ('listarprov', null);
INSERT INTO `permisos` VALUES ('listarproveedores', null);
INSERT INTO `permisos` VALUES ('listarvehiculos', null);
INSERT INTO `permisos` VALUES ('logout', null);
INSERT INTO `permisos` VALUES ('update', null);
INSERT INTO `permisos` VALUES ('viewrecord', null);

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `RUC` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `iddistrito` int(11) NOT NULL,
  `telefono_fijo` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono_celular` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mail` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `observacion` text COLLATE utf8_spanish_ci,
  `user` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`RUC`),
  KEY `fk_crematorios_distritos1_idx` (`iddistrito`),
  KEY `fk_proveedores_categorias1_idx` (`idcategoria`),
  CONSTRAINT `fk_proveedores_categorias1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_distritos1` FOREIGN KEY (`iddistrito`) REFERENCES `distritos` (`iddistrito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES ('12345678911', 'nnnnn', 'ddd', '2', '111', '456465', 'mario.conchaflores@gmail.com', '44', 'oo', null, '2013-09-22 23:17:09', '1');
INSERT INTO `proveedores` VALUES ('2345678901', 'merino', 'av. las palmas 123', '1263', '1234567', '123456789', 'totos@hotmail.com', '200', 'sssss', null, '2013-07-13 17:31:18', '2');
INSERT INTO `proveedores` VALUES ('23456789012', 'Jardines de la Paz', 'Av. La Molina 1245', '1264', '123456789', '987456123', 'jardinez@gmail.com', '200', 'Para los socios', null, '2013-07-25 18:37:15', '1');
INSERT INTO `proveedores` VALUES ('3456789012', 'Anita', 'Av. San luis 123', '1251', '23456790', '2345678902', 'anita@hotmail.com', '345', '2233', null, '2013-07-13 18:22:29', '1');

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iddepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idprovincia`),
  KEY `fk_provincias_departamentos1` (`iddepartamento`),
  CONSTRAINT `fk_provincias_departamentos1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`iddepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of provincias
-- ----------------------------
INSERT INTO `provincias` VALUES ('1', 'CHACHAPOYAS ', '1');
INSERT INTO `provincias` VALUES ('2', 'BAGUA', '1');
INSERT INTO `provincias` VALUES ('3', 'BONGARA', '1');
INSERT INTO `provincias` VALUES ('4', 'CONDORCANQUI', '1');
INSERT INTO `provincias` VALUES ('5', 'LUYA', '1');
INSERT INTO `provincias` VALUES ('6', 'RODRIGUEZ DE MENDOZA', '1');
INSERT INTO `provincias` VALUES ('7', 'UTCUBAMBA', '1');
INSERT INTO `provincias` VALUES ('8', 'HUARAZ', '2');
INSERT INTO `provincias` VALUES ('9', 'AIJA', '2');
INSERT INTO `provincias` VALUES ('10', 'ANTONIO RAYMONDI', '2');
INSERT INTO `provincias` VALUES ('11', 'ASUNCION', '2');
INSERT INTO `provincias` VALUES ('12', 'BOLOGNESI', '2');
INSERT INTO `provincias` VALUES ('13', 'CARHUAZ', '2');
INSERT INTO `provincias` VALUES ('14', 'CARLOS FERMIN FITZCARRALD', '2');
INSERT INTO `provincias` VALUES ('15', 'CASMA', '2');
INSERT INTO `provincias` VALUES ('16', 'CORONGO', '2');
INSERT INTO `provincias` VALUES ('17', 'HUARI', '2');
INSERT INTO `provincias` VALUES ('18', 'HUARMEY', '2');
INSERT INTO `provincias` VALUES ('19', 'HUAYLAS', '2');
INSERT INTO `provincias` VALUES ('20', 'MARISCAL LUZURIAGA', '2');
INSERT INTO `provincias` VALUES ('21', 'OCROS', '2');
INSERT INTO `provincias` VALUES ('22', 'PALLASCA', '2');
INSERT INTO `provincias` VALUES ('23', 'POMABAMBA', '2');
INSERT INTO `provincias` VALUES ('24', 'RECUAY', '2');
INSERT INTO `provincias` VALUES ('25', 'SANTA', '2');
INSERT INTO `provincias` VALUES ('26', 'SIHUAS', '2');
INSERT INTO `provincias` VALUES ('27', 'YUNGAY', '2');
INSERT INTO `provincias` VALUES ('28', 'ABANCAY', '3');
INSERT INTO `provincias` VALUES ('29', 'ANDAHUAYLAS', '3');
INSERT INTO `provincias` VALUES ('30', 'ANTABAMBA', '3');
INSERT INTO `provincias` VALUES ('31', 'AYMARAES', '3');
INSERT INTO `provincias` VALUES ('32', 'COTABAMBAS', '3');
INSERT INTO `provincias` VALUES ('33', 'CHINCHEROS', '3');
INSERT INTO `provincias` VALUES ('34', 'GRAU', '3');
INSERT INTO `provincias` VALUES ('35', 'AREQUIPA', '4');
INSERT INTO `provincias` VALUES ('36', 'CAMANA', '4');
INSERT INTO `provincias` VALUES ('37', 'CARAVELI', '4');
INSERT INTO `provincias` VALUES ('38', 'CASTILLA', '4');
INSERT INTO `provincias` VALUES ('39', 'CAYLLOMA', '4');
INSERT INTO `provincias` VALUES ('40', 'CONDESUYOS', '4');
INSERT INTO `provincias` VALUES ('41', 'ISLAY', '4');
INSERT INTO `provincias` VALUES ('42', 'LA UNION', '4');
INSERT INTO `provincias` VALUES ('43', 'HUAMANGA', '5');
INSERT INTO `provincias` VALUES ('44', 'CANGALLO', '5');
INSERT INTO `provincias` VALUES ('45', 'HUANCA SANCOS', '5');
INSERT INTO `provincias` VALUES ('46', 'HUANTA', '5');
INSERT INTO `provincias` VALUES ('47', 'LA MAR', '5');
INSERT INTO `provincias` VALUES ('48', 'LUCANAS', '5');
INSERT INTO `provincias` VALUES ('49', 'PARINACOCHAS', '5');
INSERT INTO `provincias` VALUES ('50', 'PAUCAR DEL SARA SARA', '5');
INSERT INTO `provincias` VALUES ('51', 'SUCRE', '5');
INSERT INTO `provincias` VALUES ('52', 'VICTOR FAJARDO', '5');
INSERT INTO `provincias` VALUES ('53', 'VILCAS HUAMAN', '5');
INSERT INTO `provincias` VALUES ('54', 'CAJAMARCA', '6');
INSERT INTO `provincias` VALUES ('55', 'CAJABAMBA', '6');
INSERT INTO `provincias` VALUES ('56', 'CELENDIN', '6');
INSERT INTO `provincias` VALUES ('57', 'CHOTA ', '6');
INSERT INTO `provincias` VALUES ('58', 'CONTUMAZA', '6');
INSERT INTO `provincias` VALUES ('59', 'CUTERVO', '6');
INSERT INTO `provincias` VALUES ('60', 'HUALGAYOC', '6');
INSERT INTO `provincias` VALUES ('61', 'JAEN', '6');
INSERT INTO `provincias` VALUES ('62', 'SAN IGNACIO', '6');
INSERT INTO `provincias` VALUES ('63', 'SAN MARCOS', '6');
INSERT INTO `provincias` VALUES ('64', 'SAN PABLO', '6');
INSERT INTO `provincias` VALUES ('65', 'SANTA CRUZ', '6');
INSERT INTO `provincias` VALUES ('66', 'CALLAO', '7');
INSERT INTO `provincias` VALUES ('67', 'CUSCO', '8');
INSERT INTO `provincias` VALUES ('68', 'ACOMAYO', '8');
INSERT INTO `provincias` VALUES ('69', 'ANTA', '8');
INSERT INTO `provincias` VALUES ('70', 'CALCA', '8');
INSERT INTO `provincias` VALUES ('71', 'CANAS', '8');
INSERT INTO `provincias` VALUES ('72', 'CANCHIS', '8');
INSERT INTO `provincias` VALUES ('73', 'CHUMBIVILCAS', '8');
INSERT INTO `provincias` VALUES ('74', 'ESPINAR', '8');
INSERT INTO `provincias` VALUES ('75', 'LA CONVENCION', '8');
INSERT INTO `provincias` VALUES ('76', 'PARURO', '8');
INSERT INTO `provincias` VALUES ('77', 'PAUCARTAMBO', '8');
INSERT INTO `provincias` VALUES ('78', 'QUISPICANCHI', '8');
INSERT INTO `provincias` VALUES ('79', 'URUBAMBA', '8');
INSERT INTO `provincias` VALUES ('80', 'HUANCAVELICA', '9');
INSERT INTO `provincias` VALUES ('81', 'ACOBAMBA', '9');
INSERT INTO `provincias` VALUES ('82', 'ANGARAES', '9');
INSERT INTO `provincias` VALUES ('83', 'CASTROVIRREYNA', '9');
INSERT INTO `provincias` VALUES ('84', 'CHURCAMPA', '9');
INSERT INTO `provincias` VALUES ('85', 'HUAYTARA', '9');
INSERT INTO `provincias` VALUES ('86', 'TAYACAJA', '9');
INSERT INTO `provincias` VALUES ('87', 'HUANUCO', '10');
INSERT INTO `provincias` VALUES ('88', 'AMBO', '10');
INSERT INTO `provincias` VALUES ('89', 'DOS DE MAYO', '10');
INSERT INTO `provincias` VALUES ('90', 'HUACAYBAMBA', '10');
INSERT INTO `provincias` VALUES ('91', 'HUAMALIES', '10');
INSERT INTO `provincias` VALUES ('92', 'LEONCIO PRADO', '10');
INSERT INTO `provincias` VALUES ('93', 'MARA&Ntilde;ON', '10');
INSERT INTO `provincias` VALUES ('94', 'PACHITEA', '10');
INSERT INTO `provincias` VALUES ('95', 'PUERTO INCA', '10');
INSERT INTO `provincias` VALUES ('96', 'LAURICOCHA', '10');
INSERT INTO `provincias` VALUES ('97', 'YAROWILCA', '10');
INSERT INTO `provincias` VALUES ('98', 'ICA', '11');
INSERT INTO `provincias` VALUES ('99', 'CHINCHA', '11');
INSERT INTO `provincias` VALUES ('100', 'NAZCA', '11');
INSERT INTO `provincias` VALUES ('101', 'PALPA', '11');
INSERT INTO `provincias` VALUES ('102', 'PISCO', '11');
INSERT INTO `provincias` VALUES ('103', 'HUANCAYO', '12');
INSERT INTO `provincias` VALUES ('104', 'CONCEPCION', '12');
INSERT INTO `provincias` VALUES ('105', 'CHANCHAMAYO', '12');
INSERT INTO `provincias` VALUES ('106', 'JAUJA', '12');
INSERT INTO `provincias` VALUES ('107', 'JUNIN', '12');
INSERT INTO `provincias` VALUES ('108', 'SATIPO', '12');
INSERT INTO `provincias` VALUES ('109', 'TARMA', '12');
INSERT INTO `provincias` VALUES ('110', 'YAULI', '12');
INSERT INTO `provincias` VALUES ('111', 'CHUPACA', '12');
INSERT INTO `provincias` VALUES ('112', 'TRUJILLO', '13');
INSERT INTO `provincias` VALUES ('113', 'ASCOPE', '13');
INSERT INTO `provincias` VALUES ('114', 'BOLIVAR', '13');
INSERT INTO `provincias` VALUES ('115', 'CHEPEN', '13');
INSERT INTO `provincias` VALUES ('116', 'JULCAN', '13');
INSERT INTO `provincias` VALUES ('117', 'OTUZCO', '13');
INSERT INTO `provincias` VALUES ('118', 'PACASMAYO', '13');
INSERT INTO `provincias` VALUES ('119', 'PATAZ', '13');
INSERT INTO `provincias` VALUES ('120', 'SANCHEZ CARRION', '13');
INSERT INTO `provincias` VALUES ('121', 'SANTIAGO DE CHUCO', '13');
INSERT INTO `provincias` VALUES ('122', 'GRAN CHIMU', '13');
INSERT INTO `provincias` VALUES ('123', 'VIRU', '13');
INSERT INTO `provincias` VALUES ('124', 'CHICLAYO', '14');
INSERT INTO `provincias` VALUES ('125', 'FERRE&Ntilde;AFE', '14');
INSERT INTO `provincias` VALUES ('126', 'LAMBAYEQUE', '14');
INSERT INTO `provincias` VALUES ('127', 'LIMA', '15');
INSERT INTO `provincias` VALUES ('128', 'BARRANCA', '15');
INSERT INTO `provincias` VALUES ('129', 'CAJATAMBO', '15');
INSERT INTO `provincias` VALUES ('130', 'CANTA', '15');
INSERT INTO `provincias` VALUES ('131', 'CA&Ntilde;ETE', '15');
INSERT INTO `provincias` VALUES ('132', 'HUARAL', '15');
INSERT INTO `provincias` VALUES ('133', 'HUAROCHIRI', '15');
INSERT INTO `provincias` VALUES ('134', 'HUAURA', '15');
INSERT INTO `provincias` VALUES ('135', 'OYON', '15');
INSERT INTO `provincias` VALUES ('136', 'YAUYOS', '15');
INSERT INTO `provincias` VALUES ('137', 'MAYNAS', '16');
INSERT INTO `provincias` VALUES ('138', 'ALTO AMAZONAS', '16');
INSERT INTO `provincias` VALUES ('139', 'LORETO', '16');
INSERT INTO `provincias` VALUES ('140', 'MARISCAL RAMON CASTILLA', '16');
INSERT INTO `provincias` VALUES ('141', 'REQUENA', '16');
INSERT INTO `provincias` VALUES ('142', 'UCAYALI', '16');
INSERT INTO `provincias` VALUES ('143', 'TAMBOPATA', '17');
INSERT INTO `provincias` VALUES ('144', 'MANU', '17');
INSERT INTO `provincias` VALUES ('145', 'TAHUAMANU', '17');
INSERT INTO `provincias` VALUES ('146', 'MARISCAL NIETO', '18');
INSERT INTO `provincias` VALUES ('147', 'GENERAL SANCHEZ CERRO', '18');
INSERT INTO `provincias` VALUES ('148', 'ILO', '18');
INSERT INTO `provincias` VALUES ('149', 'PASCO', '19');
INSERT INTO `provincias` VALUES ('150', 'DANIEL ALCIDES CARRION', '19');
INSERT INTO `provincias` VALUES ('151', 'OXAPAMPA', '19');
INSERT INTO `provincias` VALUES ('152', 'PIURA', '20');
INSERT INTO `provincias` VALUES ('153', 'AYABACA', '20');
INSERT INTO `provincias` VALUES ('154', 'HUANCABAMBA', '20');
INSERT INTO `provincias` VALUES ('155', 'MORROPON', '20');
INSERT INTO `provincias` VALUES ('156', 'PAITA', '20');
INSERT INTO `provincias` VALUES ('157', 'SULLANA', '20');
INSERT INTO `provincias` VALUES ('158', 'TALARA', '20');
INSERT INTO `provincias` VALUES ('159', 'SECHURA', '20');
INSERT INTO `provincias` VALUES ('160', 'PUNO', '21');
INSERT INTO `provincias` VALUES ('161', 'AZANGARO', '21');
INSERT INTO `provincias` VALUES ('162', 'CARABAYA', '21');
INSERT INTO `provincias` VALUES ('163', 'CHUCUITO', '21');
INSERT INTO `provincias` VALUES ('164', 'EL COLLAO', '21');
INSERT INTO `provincias` VALUES ('165', 'HUANCANE', '21');
INSERT INTO `provincias` VALUES ('166', 'LAMPA', '21');
INSERT INTO `provincias` VALUES ('167', 'MELGAR', '21');
INSERT INTO `provincias` VALUES ('168', 'MOHO', '21');
INSERT INTO `provincias` VALUES ('169', 'SAN ANTONIO DE PUTINA', '21');
INSERT INTO `provincias` VALUES ('170', 'SAN ROMAN', '21');
INSERT INTO `provincias` VALUES ('171', 'SANDIA', '21');
INSERT INTO `provincias` VALUES ('172', 'YUNGUYO', '21');
INSERT INTO `provincias` VALUES ('173', 'MOYOBAMBA', '22');
INSERT INTO `provincias` VALUES ('174', 'BELLAVISTA', '22');
INSERT INTO `provincias` VALUES ('175', 'EL DORADO', '22');
INSERT INTO `provincias` VALUES ('176', 'HUALLAGA', '22');
INSERT INTO `provincias` VALUES ('177', 'LAMAS', '22');
INSERT INTO `provincias` VALUES ('178', 'MARISCAL CACERES', '22');
INSERT INTO `provincias` VALUES ('179', 'PICOTA', '22');
INSERT INTO `provincias` VALUES ('180', 'RIOJA', '22');
INSERT INTO `provincias` VALUES ('181', 'SAN MARTIN', '22');
INSERT INTO `provincias` VALUES ('182', 'TOCACHE', '22');
INSERT INTO `provincias` VALUES ('183', 'TACNA', '23');
INSERT INTO `provincias` VALUES ('184', 'CANDARAVE', '23');
INSERT INTO `provincias` VALUES ('185', 'JORGE BASADRE', '23');
INSERT INTO `provincias` VALUES ('186', 'TARATA', '23');
INSERT INTO `provincias` VALUES ('187', 'TUMBES', '24');
INSERT INTO `provincias` VALUES ('188', 'CONTRALMIRANTE VILLAR', '24');
INSERT INTO `provincias` VALUES ('189', 'ZARUMILLA', '24');
INSERT INTO `provincias` VALUES ('190', 'CORONEL PORTILLO', '25');
INSERT INTO `provincias` VALUES ('191', 'ATALAYA', '25');
INSERT INTO `provincias` VALUES ('192', 'PADRE ABAD', '25');
INSERT INTO `provincias` VALUES ('193', 'PURUS', '25');

-- ----------------------------
-- Table structure for recursos
-- ----------------------------
DROP TABLE IF EXISTS `recursos`;
CREATE TABLE `recursos` (
  `recurso` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of recursos
-- ----------------------------
INSERT INTO `recursos` VALUES ('ataud', null);
INSERT INTO `recursos` VALUES ('auth', null);
INSERT INTO `recursos` VALUES ('candelabro', null);
INSERT INTO `recursos` VALUES ('capilla', null);
INSERT INTO `recursos` VALUES ('categoria', null);
INSERT INTO `recursos` VALUES ('color', null);
INSERT INTO `recursos` VALUES ('combustible', null);
INSERT INTO `recursos` VALUES ('departamento', null);
INSERT INTO `recursos` VALUES ('distrito', null);
INSERT INTO `recursos` VALUES ('error', null);
INSERT INTO `recursos` VALUES ('index', null);
INSERT INTO `recursos` VALUES ('marca', null);
INSERT INTO `recursos` VALUES ('modelo', null);
INSERT INTO `recursos` VALUES ('modeloataud', null);
INSERT INTO `recursos` VALUES ('permisos', null);
INSERT INTO `recursos` VALUES ('proveedor', null);
INSERT INTO `recursos` VALUES ('provincia', null);
INSERT INTO `recursos` VALUES ('reporte', null);
INSERT INTO `recursos` VALUES ('tablas', null);
INSERT INTO `recursos` VALUES ('tamanoataud', null);
INSERT INTO `recursos` VALUES ('tipo', null);
INSERT INTO `recursos` VALUES ('tipocandelabro', null);
INSERT INTO `recursos` VALUES ('vehiculo', null);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('admin', null);
INSERT INTO `roles` VALUES ('alumno', null);

-- ----------------------------
-- Table structure for rol_recurso_permiso
-- ----------------------------
DROP TABLE IF EXISTS `rol_recurso_permiso`;
CREATE TABLE `rol_recurso_permiso` (
  `permiso` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `role` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `recurso` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`permiso`,`role`,`recurso`),
  KEY `fk_rol_recurso_permiso_permisos1_idx` (`permiso`),
  KEY `fk_rol_recurso_permiso_roles1` (`role`),
  KEY `fk_rol_recurso_permiso_recursos1` (`recurso`),
  CONSTRAINT `fk_rol_recurso_permiso_permisos1` FOREIGN KEY (`permiso`) REFERENCES `permisos` (`permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_recurso_permiso_recursos1` FOREIGN KEY (`recurso`) REFERENCES `recursos` (`recurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_recurso_permiso_roles1` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of rol_recurso_permiso
-- ----------------------------
INSERT INTO `rol_recurso_permiso` VALUES ('add', 'admin', 'categoria');
INSERT INTO `rol_recurso_permiso` VALUES ('add', 'admin', 'permisos');
INSERT INTO `rol_recurso_permiso` VALUES ('add', 'admin', 'proveedor');
INSERT INTO `rol_recurso_permiso` VALUES ('add', 'admin', 'vehiculo');
INSERT INTO `rol_recurso_permiso` VALUES ('delete', 'admin', 'categoria');
INSERT INTO `rol_recurso_permiso` VALUES ('delete', 'admin', 'proveedor');
INSERT INTO `rol_recurso_permiso` VALUES ('delete', 'admin', 'vehiculo');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'ataud');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'auth');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'categoria');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'error');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'index');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'permisos');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'proveedor');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'admin', 'vehiculo');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'alumno', 'auth');
INSERT INTO `rol_recurso_permiso` VALUES ('index', 'alumno', 'index');
INSERT INTO `rol_recurso_permiso` VALUES ('listarcategorias', 'admin', 'categoria');
INSERT INTO `rol_recurso_permiso` VALUES ('listardistri', 'admin', 'proveedor');
INSERT INTO `rol_recurso_permiso` VALUES ('listarpermisos', 'admin', 'permisos');
INSERT INTO `rol_recurso_permiso` VALUES ('listarprov', 'admin', 'proveedor');
INSERT INTO `rol_recurso_permiso` VALUES ('listarproveedores', 'admin', 'proveedor');
INSERT INTO `rol_recurso_permiso` VALUES ('listarvehiculos', 'admin', 'vehiculo');
INSERT INTO `rol_recurso_permiso` VALUES ('logout', 'admin', 'auth');
INSERT INTO `rol_recurso_permiso` VALUES ('update', 'admin', 'categoria');
INSERT INTO `rol_recurso_permiso` VALUES ('update', 'admin', 'proveedor');
INSERT INTO `rol_recurso_permiso` VALUES ('update', 'admin', 'vehiculo');

-- ----------------------------
-- Table structure for tamanoataudes
-- ----------------------------
DROP TABLE IF EXISTS `tamanoataudes`;
CREATE TABLE `tamanoataudes` (
  `idtamanoAtaudes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtamanoAtaudes`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tamanoataudes
-- ----------------------------
INSERT INTO `tamanoataudes` VALUES ('1', 'ttt', 'ooo');
INSERT INTO `tamanoataudes` VALUES ('2', '2', 'ooo');

-- ----------------------------
-- Table structure for tipocandelabros
-- ----------------------------
DROP TABLE IF EXISTS `tipocandelabros`;
CREATE TABLE `tipocandelabros` (
  `idtipoCandelabros` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipoCandelabros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tipocandelabros
-- ----------------------------

-- ----------------------------
-- Table structure for tipos
-- ----------------------------
DROP TABLE IF EXISTS `tipos`;
CREATE TABLE `tipos` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of tipos
-- ----------------------------
INSERT INTO `tipos` VALUES ('1', 'Floral');
INSERT INTO `tipos` VALUES ('2', 'Carroza');
INSERT INTO `tipos` VALUES ('3', 'Acompañante');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `salt` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `role` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_roles1_idx` (`role`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'mario', '02c81c92dd5201c32dc54dd5bfe6167c94fd79d6', 'ce8d96d579d389e783f95b3772785783ea1a9854', '2013-09-21 16:29:01', 'edwin.jpg', 'Edwin Laguna', 'admin');

-- ----------------------------
-- Table structure for vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE `vehiculos` (
  `placa` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idmarca` int(11) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idcolor` int(11) NOT NULL,
  `idcombustible` int(11) NOT NULL,
  `motor` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `serie` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pasajero` int(11) NOT NULL,
  `asiento` int(11) NOT NULL,
  `FechaFab` date NOT NULL,
  PRIMARY KEY (`placa`),
  KEY `fk_vehiculo_marca1_idx` (`idmarca`),
  KEY `fk_vehiculo_color1_idx` (`idcolor`),
  KEY `fk_vehiculo_modelo1_idx` (`idmodelo`),
  KEY `fk_vehiculo_tipo1_idx` (`idtipo`),
  KEY `fk_vehiculo_combustible1_idx` (`idcombustible`),
  CONSTRAINT `fk_vehiculo_color1` FOREIGN KEY (`idcolor`) REFERENCES `colores` (`idcolor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_combustible1` FOREIGN KEY (`idcombustible`) REFERENCES `combustibles` (`idcombustible`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_marca1` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_modelo1` FOREIGN KEY (`idmodelo`) REFERENCES `modelos` (`idmodelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_tipo1` FOREIGN KEY (`idtipo`) REFERENCES `tipos` (`idtipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of vehiculos
-- ----------------------------
INSERT INTO `vehiculos` VALUES ('ABC123', 'bmbm,', '1', '1', '1', '2', '2', '65675675', '68698698', '123', '21', '2013-07-02');
INSERT INTO `vehiculos` VALUES ('ABC124', 'bmbm,', '2', '2', '2', '3', '3', '65675675', '68698698', '123', '21', '2013-07-02');
INSERT INTO `vehiculos` VALUES ('ABC127', 'bmbm,', '3', '1', '3', '2', '2', '65675675', '68698698', '123', '21', '2013-07-02');
INSERT INTO `vehiculos` VALUES ('ABZ-123', 'Vehiculo de la carroza', '1', '2', '3', '3', '3', 'ACSSS-1458', '123456987', '20', '12', '2011-02-03');
INSERT INTO `vehiculos` VALUES ('ANB-201', 'VEHICULO PARA TRASLADO DE PERSONAL', '2', '2', '2', '3', '3', 'ZAD-1258-FG', 'AS10124555', '20', '10', '2013-01-02');
INSERT INTO `vehiculos` VALUES ('AQ-002', 'OO', '1', '1', '1', '1', '1', '124587-SSS-9', '22', '3', '4', '2013-09-01');
INSERT INTO `vehiculos` VALUES ('ASD-258', 'OK', '2', '1', '3', '4', '4', '124587-SSS-9', 'ASS-98512', '20', '10', '2012-01-09');
