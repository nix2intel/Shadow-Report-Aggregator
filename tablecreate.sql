#
# SQL Export
# Created by Querious (201024)
# Created: February 8, 2018 at 10:17:57 AM MST
# Encoding: Unicode (UTF-8)
#


CREATE DATABASE IF NOT EXISTS `ShadowReports` DEFAULT CHARACTER SET latin1 DEFAULT COLLATE latin1_swedish_ci;
USE `ShadowReports`;




SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `vnc`;
DROP TABLE IF EXISTS `tftp`;
DROP TABLE IF EXISTS `telnet`;
DROP TABLE IF EXISTS `snmp`;
DROP TABLE IF EXISTS `sinkholehttpdrone`;
DROP TABLE IF EXISTS `poodle`;
DROP TABLE IF EXISTS `openportmapper`;
DROP TABLE IF EXISTS `ntp`;
DROP TABLE IF EXISTS `netbios`;
DROP TABLE IF EXISTS `contacted`;
DROP TABLE IF EXISTS `ciscosmartinstall`;
DROP TABLE IF EXISTS `botnet`;
DROP TABLE IF EXISTS `blacklist`;


CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `source` varchar(128) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `sector` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;


CREATE TABLE `botnet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `infection` varchar(128) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `agent` varchar(128) DEFAULT NULL,
  `cc_ip` varchar(128) DEFAULT NULL,
  `cc_port` varchar(128) DEFAULT NULL,
  `cc_asn` varchar(128) DEFAULT NULL,
  `cc_geo` varchar(128) DEFAULT NULL,
  `cc_dns` varchar(128) DEFAULT NULL,
  `count` varchar(128) DEFAULT NULL,
  `proxy` varchar(128) DEFAULT NULL,
  `application` varchar(128) DEFAULT NULL,
  `p0f_genre` varchar(128) DEFAULT NULL,
  `p0f_detail` varchar(128) DEFAULT NULL,
  `machine_name` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `cc_naics` varchar(128) DEFAULT NULL,
  `cc_sic` varchar(128) DEFAULT NULL,
  `sector` varchar(128) DEFAULT NULL,
  `cc_sector` varchar(128) DEFAULT NULL,
  `ssl_cipher` varchar(128) DEFAULT NULL,
  `family` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `public_source` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


CREATE TABLE `ciscosmartinstall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `protocol` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;


CREATE TABLE `contacted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `service` varchar(128) DEFAULT NULL,
  `contact` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE TABLE `netbios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `protocol` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `mac_address` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `workgroup` varchar(128) DEFAULT NULL,
  `machine_name` varchar(128) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `sector` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;


CREATE TABLE `ntp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `protocol` varchar(6) DEFAULT NULL,
  `port` varchar(8) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `packets` varchar(128) DEFAULT NULL,
  `size` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `version` varchar(128) DEFAULT NULL,
  `clk_wander` varchar(128) DEFAULT NULL,
  `clock` varchar(128) DEFAULT NULL,
  `error` varchar(128) DEFAULT NULL,
  `frequency` varchar(128) DEFAULT NULL,
  `jitter` varchar(128) DEFAULT NULL,
  `leap` varchar(128) DEFAULT NULL,
  `mintc` varchar(128) DEFAULT NULL,
  `noise` varchar(128) DEFAULT NULL,
  `offset` varchar(128) DEFAULT NULL,
  `peer` varchar(128) DEFAULT NULL,
  `phase` varchar(128) DEFAULT NULL,
  `poll` varchar(128) DEFAULT NULL,
  `precision` varchar(128) DEFAULT NULL,
  `processor` varchar(128) DEFAULT NULL,
  `refid` varchar(128) DEFAULT NULL,
  `reftime` varchar(128) DEFAULT NULL,
  `rootdelay` varchar(128) DEFAULT NULL,
  `rootdispersion` varchar(128) DEFAULT NULL,
  `stability` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `stratum` varchar(128) DEFAULT NULL,
  `system` varchar(128) DEFAULT NULL,
  `tai` varchar(128) DEFAULT NULL,
  `tc` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `sector` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8;


CREATE TABLE `openportmapper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `protocol` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `programs` mediumtext,
  `mountd_port` mediumtext,
  `exports` mediumtext,
  `sector` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;


CREATE TABLE `poodle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `handshake` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `cipher_suite` varchar(128) DEFAULT NULL,
  `ssl_poodle` tinyint(4) DEFAULT '1',
  `cert_length` varchar(128) DEFAULT NULL,
  `subject_common_name` varchar(128) DEFAULT NULL,
  `issuer_common_name` varchar(128) DEFAULT NULL,
  `cert_issue_date` varchar(128) DEFAULT NULL,
  `cert_expiration_date` varchar(128) DEFAULT NULL,
  `sha1_fingerprint` varchar(128) DEFAULT NULL,
  `cert_serial_number` varchar(128) DEFAULT NULL,
  `ssl_version` varchar(128) DEFAULT NULL,
  `signature_algorithm` varchar(128) DEFAULT NULL,
  `key_algorithm` varchar(128) DEFAULT NULL,
  `subject_organization_name` varchar(128) DEFAULT NULL,
  `subject_organization_unit_name` varchar(128) DEFAULT NULL,
  `subject_country` varchar(128) DEFAULT NULL,
  `subject_state_or_province_name` varchar(128) DEFAULT NULL,
  `subject_locality_name` varchar(128) DEFAULT NULL,
  `subject_street_address` varchar(128) DEFAULT NULL,
  `subject_postal_code` varchar(128) DEFAULT NULL,
  `subject_surname` varchar(128) DEFAULT NULL,
  `subject_given_name` varchar(128) DEFAULT NULL,
  `subject_email_address` varchar(128) DEFAULT NULL,
  `subject_business_category` varchar(128) DEFAULT NULL,
  `subject_serial_number` varchar(128) DEFAULT NULL,
  `issuer_organization_name` varchar(128) DEFAULT NULL,
  `issuer_organization_unit_name` varchar(128) DEFAULT NULL,
  `issuer_country` varchar(128) DEFAULT NULL,
  `issuer_state_or_province_name` varchar(128) DEFAULT NULL,
  `issuer_locality_name` varchar(128) DEFAULT NULL,
  `issuer_street_address` varchar(128) DEFAULT NULL,
  `issuer_postal_code` varchar(128) DEFAULT NULL,
  `issuer_surname` varchar(128) DEFAULT NULL,
  `issuer_given_name` varchar(128) DEFAULT NULL,
  `issuer_email_address` varchar(128) DEFAULT NULL,
  `issuer_business_category` varchar(128) DEFAULT NULL,
  `issuer_serial_number` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `sector` varchar(128) DEFAULT NULL,
  `sha256_fingerprint` varchar(128) DEFAULT NULL,
  `sha512_fingerprint` varchar(128) DEFAULT NULL,
  `md5_fingerprint` varchar(128) DEFAULT NULL,
  `device_serial` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3844 DEFAULT CHARSET=utf8;


CREATE TABLE `sinkholehttpdrone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `http_agent` varchar(256) DEFAULT NULL,
  `tor` varchar(128) DEFAULT NULL,
  `src_port` varchar(128) DEFAULT NULL,
  `p0f_genre` varchar(128) DEFAULT NULL,
  `p0f_detail` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `dst_port` varchar(128) DEFAULT NULL,
  `http_host` varchar(128) DEFAULT NULL,
  `http_referer` varchar(128) DEFAULT NULL,
  `http_referer_ip` varchar(128) DEFAULT NULL,
  `http_referer_asn` varchar(128) DEFAULT NULL,
  `http_referer_geo` varchar(128) DEFAULT NULL,
  `dst_ip` varchar(128) DEFAULT NULL,
  `dst_asn` varchar(128) DEFAULT NULL,
  `dst_geo` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `http_referer_naics` varchar(128) DEFAULT NULL,
  `http_referer_sic` varchar(128) DEFAULT NULL,
  `sector` varchar(128) DEFAULT NULL,
  `ssl_cipher` varchar(128) DEFAULT NULL,
  `application` varchar(128) DEFAULT NULL,
  `version` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `snmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `protocol` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `sysdesc` varchar(128) DEFAULT NULL,
  `sysname` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `sector` varchar(128) DEFAULT NULL,
  `version` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;


CREATE TABLE `telnet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `protocol` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `banner` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8;


CREATE TABLE `tftp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `protocol` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `opcode` varchar(128) DEFAULT NULL,
  `errorcode` varchar(128) DEFAULT NULL,
  `error` varchar(128) DEFAULT NULL,
  `errormessage` varchar(128) DEFAULT NULL,
  `size` varchar(128) DEFAULT NULL,
  `contacted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;


CREATE TABLE `vnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `asn` varchar(128) DEFAULT NULL,
  `geo` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `naics` varchar(128) DEFAULT NULL,
  `sic` varchar(128) DEFAULT NULL,
  `product` varchar(128) DEFAULT NULL,
  `banner` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


DROP VIEW IF EXISTS `vulnerabilities`;


CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vulnerabilities` AS select `netbios`.`timestamp` AS `timestamp`,`netbios`.`ip` AS `ip`,`netbios`.`port` AS `port`,`netbios`.`hostname` AS `hostname`,'netbios' AS `type` from `netbios` where ((cast(`netbios`.`timestamp` as date) = (curdate() - interval 1 day)) and (`netbios`.`ip` like '192.%')) union select `ntp`.`timestamp` AS `timestamp`,`ntp`.`ip` AS `ip`,`ntp`.`port` AS `port`,`ntp`.`hostname` AS `hostname`,'ntp' AS `type` from `ntp` where ((cast(`ntp`.`timestamp` as date) = (curdate() - interval 1 day)) and (`ntp`.`ip` like '192.%')) union select `openportmapper`.`timestamp` AS `timestamp`,`openportmapper`.`ip` AS `ip`,`openportmapper`.`port` AS `port`,`openportmapper`.`hostname` AS `hostname`,'openportmapper' AS `type` from `openportmapper` where ((cast(`openportmapper`.`timestamp` as date) = (curdate() - interval 1 day)) and (`openportmapper`.`ip` like '192.%')) union select `poodle`.`timestamp` AS `timestamp`,`poodle`.`ip` AS `ip`,`poodle`.`port` AS `port`,`poodle`.`hostname` AS `hostname`,'poodle' AS `type` from `poodle` where ((cast(`poodle`.`timestamp` as date) = (curdate() - interval 1 day)) and (`poodle`.`ip` like '192.%')) union select `snmp`.`timestamp` AS `timestamp`,`snmp`.`ip` AS `ip`,`snmp`.`port` AS `port`,`snmp`.`hostname` AS `hostname`,'snmp' AS `type` from `snmp` where ((cast(`snmp`.`timestamp` as date) = (curdate() - interval 1 day)) and (`snmp`.`ip` like '192.%')) union select `telnet`.`timestamp` AS `timestamp`,`telnet`.`ip` AS `ip`,`telnet`.`port` AS `port`,`telnet`.`hostname` AS `hostname`,'telnet' AS `type` from `telnet` where ((cast(`telnet`.`timestamp` as date) = (curdate() - interval 1 day)) and (`telnet`.`ip` like '192.%')) union select `tftp`.`timestamp` AS `timestamp`,`tftp`.`ip` AS `ip`,`tftp`.`port` AS `port`,`tftp`.`hostname` AS `hostname`,'tftp' AS `type` from `tftp` where ((cast(`tftp`.`timestamp` as date) = (curdate() - interval 1 day)) and (`tftp`.`ip` like '192.%')) union select `vnc`.`timestamp` AS `timestamp`,`vnc`.`ip` AS `ip`,`vnc`.`port` AS `port`,`vnc`.`hostname` AS `hostname`,'vnc' AS `type` from `vnc` where ((cast(`vnc`.`timestamp` as date) = (curdate() - interval 1 day)) and (`vnc`.`ip` like '192.%')) union select `sinkholehttpdrone`.`timestamp` AS `timestamp`,`sinkholehttpdrone`.`ip` AS `ip`,`sinkholehttpdrone`.`src_port` AS `port`,`sinkholehttpdrone`.`hostname` AS `hostname`,'sinkholehttpdrone' AS `type` from `sinkholehttpdrone` where ((cast(`sinkholehttpdrone`.`timestamp` as date) = (curdate() - interval 1 day)) and (`sinkholehttpdrone`.`ip` like '192.%')) union select `ciscosmartinstall`.`timestamp` AS `timestamp`,`ciscosmartinstall`.`ip` AS `ip`,`ciscosmartinstall`.`port` AS `port`,`ciscosmartinstall`.`hostname` AS `hostname`,'cisco_install' AS `type` from `ciscosmartinstall` where ((cast(`ciscosmartinstall`.`timestamp` as date) = (curdate() - interval 1 day)) and (`ciscosmartinstall`.`ip` like '192.%')) union select `blacklist`.`timestamp` AS `timestamp`,`blacklist`.`ip` AS `ip`,'NA' AS `port`,`blacklist`.`hostname` AS `hostname`,'blacklist' AS `type` from `blacklist` where ((cast(`blacklist`.`timestamp` as date) = (curdate() - interval 1 day)) and (`blacklist`.`ip` like '192.%'));




