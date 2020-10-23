-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: allysfast_shopcart
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'allysfast_shopcart'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddPermissionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `AddPermissionProcedure`(IN `_name` VARCHAR(250), IN `_description` TEXT, IN `_idpermcommand` INT(11), IN `_idcategory` INT(11))
BEGIN             
                INSERT into permissions(`name`,description,idpermcommand,idcategory) VALUES (_name, _description, _idpermcommand, _idcategory);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateMenuHasIdCateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `CreateMenuHasIdCateProcedure`(IN `_str_query` VARCHAR(255))
BEGIN
                SET @sqlv=_str_query;
                PREPARE stmt FROM @sqlv;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;  
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateProfileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `CreateProfileProcedure`(IN `_iduser` INT, IN `_firstname` VARCHAR(255), IN `_middlename` VARCHAR(255), IN `_lastname` VARCHAR(255), IN `_address` VARCHAR(255), IN `_idcitytown` INT, IN `_iddistrict` INT, IN `_mobile` VARCHAR(255), IN `_about` VARCHAR(255), IN `_facebook` VARCHAR(255), IN `_zalo` VARCHAR(255), IN `_url_avatar` VARCHAR(255))
BEGIN
                insert into profile(iduser, firstname, middlename, lastname, address, idcitytown, iddistrict, mobile, about, facebook , zalo, url_avatar) values (_iduser, _firstname, _middlename, _lastname, _address, _idcitytown, _iddistrict, _mobile, _about, _facebook , _zalo, _url_avatar);
            SELECT LAST_INSERT_ID() as idprofile;
						END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatPostApiProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `CreatPostApiProcedure`(IN `_firstname` VARCHAR(255) CHARSET utf8mb4, IN `_body` TEXT CHARSET utf8mb4, IN `_nametype` VARCHAR(255), IN `_idfile` INT(11), IN `_namecat` VARCHAR(255), IN `_mobile` VARCHAR(255), IN `_email` VARCHAR(255), IN `_address` VARCHAR(255) CHARSET utf8mb4, IN `_name_status_type` VARCHAR(250), IN `_birthday` VARCHAR(255), IN `_job` VARCHAR(255) CHARSET utf8mb4, IN `_facebook` VARCHAR(255) CHARSET utf8mb4)
BEGIN
            DECLARE _idcategory INT;
            DECLARE _idposttype INT;
            DECLARE _idpost INT;
            DECLARE _idcattype INT;
            DECLARE _catnametype VARCHAR(255);
            DECLARE _hastype VARCHAR(255);
            DECLARE _idcustomer INT;
            DECLARE _percent_process INT;
            DECLARE _id_status_type INT;
            DECLARE _id_imppost INT;
            SET _percent_process = 0;
            SET _id_status_type = (SELECT id_status_type FROM status_types WHERE name_status_type = _name_status_type);
            SET _catnametype = "website";
            SET _idcattype = (SELECT idcattype FROM category_types WHERE catnametype=_catnametype); 
            SET _idposttype = (SELECT idposttype FROM post_types WHERE nametype = _nametype);
            SET _hastype = "image";
            IF EXISTS(SELECT _idcustomer FROM sv_customers WHERE mobile = _mobile LIMIT 1) THEN
                BEGIN
                SET _idcustomer = (SELECT idcustomer FROM sv_customers WHERE mobile = _mobile LIMIT 1);
                END;
            ELSE
                BEGIN
                INSERT INTO sv_customers(firstname, email, mobile, address, birthday, job, facebook) VALUES(_firstname,_email,_mobile,_address, _birthday, _job, _facebook);
                SET _idcustomer = LAST_INSERT_ID();
                END;
            END IF;
            IF EXISTS(SELECT idcategory FROM categories WHERE namecat = _namecat LIMIT 1) THEN
                BEGIN
                SET _idcategory = (SELECT idcategory FROM categories WHERE namecat = _namecat LIMIT 1);
                END;
            ELSE
                BEGIN
                INSERT INTO categories(namecat,idcattype,idparent) VALUES(_namecat,_idcattype,NULL); 
                SET _idcategory = LAST_INSERT_ID();
                END;
            END IF;
            INSERT INTO posts(body,id_post_type,idcategory) VALUES(_body,_idposttype,_idcategory);
            SET _idpost = LAST_INSERT_ID();
            INSERT INTO post_has_files (idpost,hastype,idfile) VALUES(_idpost,_hastype,_idfile);
            INSERT INTO impposts(idpost,id_status_type,percent_process,iduser_imp,address_reg) VALUES(_idpost,_id_status_type,_percent_process,_idcustomer,_address);
            SET _id_imppost = LAST_INSERT_ID();
            SELECT _id_imppost;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CrossProductHasFileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `CrossProductHasFileProcedure`(IN `_idproduct` INT(11), IN `_cross_idproduct` INT(11), IN `_idfile` INT(11), IN `_crosstype` VARCHAR(255))
BEGIN
                insert into cross_product(idproduct,crosstype,idproduct_cross) values(_idproduct,_crosstype,_cross_idproduct);
                insert into producthasfile(idproduct,hastype,idfile,status_file) values(_cross_idproduct,"thumbnail",_idfile,1);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_interactive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `customer_interactive`(IN `_parent_idpost_exp` INT, IN `_body` TEXT CHARSET utf8mb4, IN `_id_post_type` INT, IN `_id_status_type` INT, IN `_idemployee` INT)
BEGIN
	DECLARE	_idpost INT;
	INSERT INTO posts(body,id_post_type) VALUES(_body,_id_post_type);
        SET _idpost = LAST_INSERT_ID();
        INSERT INTO expposts(idpost,id_status_type,idemployee,parent_idpost_exp) VALUES(_idpost,_id_status_type,_idemployee,_parent_idpost_exp);
	select LAST_INSERT_ID() as id_exppost;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePermissionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DeletePermissionProcedure`(IN `_id_impperm` INT)
BEGIN
	UPDATE imp_perms set trash = 1 WHERE idimp_perm = _id_impperm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteProducthasFileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DeleteProducthasFileProcedure`(IN `_idproducthasfile` INT(11))
BEGIN
                UPDATE producthasfile set status_file = 0 where idproducthasfile = _idproducthasfile;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteRoleProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DeleteRoleProcedure`(IN `_idrole` INT)
BEGIN
	update roles set trash = 1 WHERE idrole = _idrole;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUserProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DeleteUserProcedure`(IN `_iduser` INT)
BEGIN
                update users 
								set trash = 1
								where id=_iduser;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetailByIdProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DetailByIdProductProcedure`(IN `_idproduct` INT(11), IN `_idstore` INT(11))
BEGIN
                 DECLARE id_thumbnail int;
                                declare url_thumbnail varchar(255);
                                set id_thumbnail =  (SELECT idfile from producthasfile WHERE idproduct=_idproduct and hastype= 1 ORDER BY idproducthasfile DESC LIMIT 1);
                                set url_thumbnail = (SELECT urlfile FROM files where idfile = id_thumbnail);
                                select imp.idimp, p.idproduct,p.namepro,p.slug,p.short_desc,p.description,p.idsize,(select `value` from size where idsize=p.idsize) as _size, p.idcolor,p.id_post_type,p.created_at as created_pro,p.updated_at as updated_pro,imp.*,id_thumbnail, url_thumbnail from (select * FROM products WHERE idproduct=_idproduct) as p join (SELECT * from imp_products where idproduct=_idproduct and idstore=_idstore) as imp on p.idproduct = imp.idproduct;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetailCustomerProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DetailCustomerProcedure`(IN `_iduser` INT(11))
BEGIN
    select cus.firstname,cus.middlename, cus.lastname,cus.mobile,cus.email, (CONCAT_WS(', ',address,(select namedist from district where iddistrict = cus.iddistrict),(select namecitytown from city_town where idcitytown = cus.idcitytown))) as address from sv_customers as cus where idcustomer = _iduser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetailInteractive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DetailInteractive`(IN `_idimport` INT)
BEGIN
	select post_imp.*, cus.* from (select p.idpost, p.body, imp.iduser_imp from (select * from impposts where idimppost = _idimport) as imp left join posts as p on imp.idpost=p.idpost) as post_imp join
	 sv_customers as cus on cus.idcustomer = post_imp.iduser_imp;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetailOrderByIdnumberOrderProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DetailOrderByIdnumberOrderProcedure`(IN `_idnumberorder` INT(11))
BEGIN             
               SELECT info1.*,phf1.idfile, f.urlfile,p.namepro, p.slug, p.short_desc, p.description FROM (SELECT * FROM `exp_products` WHERE idstore = 11 and id_status_type = 1 and idnumberorder = _idnumberorder) as info1 LEFT JOIN producthasfile as phf1 on info1.prev_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on info1.idproduct = p.idproduct; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetailOrderByIdorderProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `DetailOrderByIdorderProcedure`(IN `_idnumberorder` INT(11), IN `_idstore` INT(11))
BEGIN 
SELECT info1.*,phf1.idfile, f.urlfile,p.namepro, p.slug, p.short_desc, p.description FROM (SELECT * FROM `exp_products` WHERE idstore = _idstore and id_status_type = 1 and idnumberorder = _idnumberorder) as info1 LEFT JOIN producthasfile as phf1 on info1.prev_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on info1.idproduct = p.idproduct; 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditDetailByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `EditDetailByIdProcedure`(IN `_idproduct` INT(11), IN `_idstore` INT(11))
BEGIN             
               set @idorder:= 0;
							 SELECT info1.*, imp3.*,phf2.idfile, f.urlfile as url_thumbnail, p.namepro, p.sku_category, p.sku_product, p.slug, p.short_desc, p.description,p.id_post_type FROM (SELECT imp2.idimp, imp2.idproduct, MAX(phf1.idproducthasfile) as max_idproducthasfile FROM (SELECT (@idorder:= @idorder + 1) as idorder,imp1.* FROM (SELECT * FROM imp_products WHERE idstore = 31 and idcrosstype = 0 AND idproduct = _idproduct) as imp1) as imp2 LEFT JOIN producthasfile as phf1 on phf1.idproduct = imp2.idproduct GROUP BY imp2.idorder) as info1 LEFT JOIN imp_products as imp3 on info1.idimp = imp3.idimp LEFT JOIN producthasfile as phf2 on info1.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN products as p on info1.idproduct = p.idproduct;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnableAddUserProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `EnableAddUserProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					 SELECT *,1 as allow FROM users WHERE trash < 1;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'edit' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'delete' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnableCreateNewCategoryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `EnableCreateNewCategoryProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					 SELECT 1 as allow;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'edit' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'delete' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'insert' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnableListCateTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `EnableListCateTypeProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					SELECT *,1 as allow from category_types;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnableListPostTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `EnableListPostTypeProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					SELECT *,1 as allow from post_types;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnableListStatusTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `EnableListStatusTypeProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					SELECT *,1 as allow from status_types;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Getparentidprocedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `Getparentidprocedure`(IN `id_post` INT(11))
BEGIN
                  DECLARE A INT;
                  DECLARE XYZ Varchar(50);
                  SET A = 1;
                  SET XYZ = "";
                  WHILE A <=10 DO
                  SET XYZ = CONCAT(XYZ,A,",");
                  SET A = A + 1;
                  END WHILE;
                  SELECT XYZ;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GrantPermissionRoleProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `GrantPermissionRoleProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					SELECT 1 as allow, imp.idimp_perm, p.name as nameperm, r.name as namerole, u.name as nameuser, imp.trash FROM (select * from imp_perms where trash < 1) as imp left join permissions as p ON imp.idperm = p.idperm LEFT join roles as r on imp.idrole = r.idrole LEFT join users as u ON imp.iduserimp = u.id;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'edit' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'delete' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GrantRoleForUserProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `GrantRoleForUserProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					 SELECT 1 as allow, g.idgrant, r.idrole, r.`name` as namerole, (select name from users where id = g.to_iduser) as touser, (select name from users where id=g.by_iduser) as byuser from `grants` as g LEFT join roles as r on g.idrole = r.idrole;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'edit' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'delete' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImportByCrossParentProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ImportByCrossParentProcedure`(IN `_idproduct` INT(11), IN `_idcustomer` INT(11), IN `_iduser` INT(11), IN `_idcrosstype` INT(11), IN `_idparentcross` INT(11), IN `_amount` DOUBLE(20,0), IN `_price_import` DOUBLE(20,0), IN `_price` DOUBLE(20,0), IN `_quality_sale` INT(11), IN `_note` TEXT, IN `_axis_x` INT(11), IN `_axis_y` INT(11), IN `_axis_z` INT(11), IN `_id_status_type` INT(11), IN `_catnametype` VARCHAR(250), IN `_shortname` VARCHAR(250))
BEGIN             
                DECLARE _idcattype int;
                declare _idstore int;
                set _idcattype = 0; set _idstore = 0;
                set _idcattype = (select idcattype from category_types where catnametype=_catnametype order by idcattype DESC limit 1);
                set _idstore = (select cat.idcategory from (select * from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname = _shortname);
                set @prev_id = 0;
                set @prev_id = ( SELECT MAX(idimp) as max_idimp FROM imp_products WHERE idstore = _idstore and id_status_type = 4 and idproduct = _idproduct and idcrosstype in (0,_idcrosstype) GROUP BY idproduct );
                INSERT INTO imp_products(idproduct, idcustomer, iduser, idcrosstype, idparentcross, amount, price_import, price, quality_sale, note, idstore, axis_x, axis_y, axis_z,id_status_type, prev_id) VALUES ( _idproduct, _idcustomer, _iduser, _idcrosstype, _idparentcross, _amount, _price_import, _price, _quality_sale, _note, _idstore, _axis_x, _axis_y, _axis_z,_id_status_type, @prev_id);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImportProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ImportProductProcedure`(IN `_idproduct` INT(11), IN `_idcustomer` INT(11), IN `_iduser` INT(11), IN `_idcrosstype` INT(11), IN `_idparentcross` INT(11), IN `_amount` DOUBLE(20,0), IN `_price_import` DOUBLE(20,0), IN `_price` DOUBLE(20,0), IN `_quality_sale` INT(11), IN `_note` TEXT, IN `_axis_x` INT(11), IN `_axis_y` INT(11), IN `_axis_z` INT(11), IN `_id_status_type` INT(11), IN `_catnametype` VARCHAR(250), IN `_shortname` VARCHAR(250), IN `_prev_id` INT(11))
BEGIN
                DECLARE _idcattype int;
								declare _idstore int;
								set _idcattype = 0; set _idstore = 0;
								set _idcattype = (select idcattype from category_types where catnametype=_catnametype order by idcattype DESC limit 1);
								set _idstore = (select cat.idcategory from (select * from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname = _shortname);
								INSERT INTO imp_products(idproduct, idcustomer, iduser, idcrosstype, idparentcross, amount, price_import, price, quality_sale, note, idstore, axis_x, axis_y, axis_z,id_status_type, prev_id) VALUES ( _idproduct, _idcustomer, _iduser, _idcrosstype, _idparentcross, _amount, _price_import, _price, _quality_sale, _note, _idstore, _axis_x, _axis_y, _axis_z,_id_status_type, _prev_id);             
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImppermbyidProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ImppermbyidProcedure`(IN `idimpperm` INT(11))
BEGIN
                SELECT imp.idimp_perm, imp.idperm, p.name as nameperm,p.description as desperm, imp.idrole, r.name as namerole,r.description as desrole,u.name as nameuser FROM (select * from imp_perms where idimp_perm = idimpperm) as imp left join permissions as p ON imp.idperm = p.idperm LEFT join roles as r on imp.idrole = r.idrole LEFT join users as u ON imp.iduserimp = u.id;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InfoCustomerOrderProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InfoCustomerOrderProcedure`(IN `_idnumberorder` INT)
BEGIN
	SELECT info5.*,w.nameward, d.namedist, ct.namecitytown, prv.nameprovince, c.namecountry FROM (SELECT 1 as cus,info4.* FROM (SELECT info1.*,svc1.lastname, svc1.middlename, svc1.firstname, svc1.mobile, svc1.address, svc1.idward, svc1.iddistrict, svc1.idcitytown, svc1.idprovince, svc1.idcountry FROM (SELECT idcustomer,idrecipent,iduser FROM `exp_products` WHERE idstore = 11 and id_status_type = 1 and idnumberorder = _idnumberorder and idcustomer > 0 GROUP BY idnumberorder) as info1 LEFT JOIN sv_customers as svc1 on svc1.idcustomer = info1.idcustomer UNION SELECT info3.*,prf.lastname, prf.middlename, prf.firstname, prf.mobile, prf.address, prf.idward, prf.iddistrict, prf.idcitytown, prf.idprovince, prf.idcountry FROM (SELECT idcustomer,idrecipent,iduser FROM `exp_products` WHERE idstore = 11 and id_status_type = 1 and idnumberorder = _idnumberorder and iduser > 0 GROUP BY idnumberorder) as info3 LEFT JOIN `profile` as prf on prf.iduser = info3.iduser) as info4 UNION ALL SELECT 2 as cus, info2.*,svc2.lastname, svc2.middlename, svc2.firstname, svc2.mobile, svc2.address, svc2.idward, svc2.iddistrict, svc2.idcitytown, svc2.idprovince, svc2.idcountry FROM (SELECT idcustomer,idrecipent,iduser FROM `exp_products` WHERE idstore = 11 and id_status_type = 1 and idnumberorder = _idnumberorder and idrecipent >= 0 GROUP BY idnumberorder) as info2 LEFT JOIN sv_customers as svc2 on svc2.idcustomer = info2.idrecipent) as info5 LEFT JOIN ward as w on info5.idward = w.idward LEFT JOIN district as d on info5.iddistrict = d.iddistrict LEFT JOIN city_town as ct on info5.idcitytown =ct.idcitytown LEFT JOIN province as prv on info5.idprovince = prv.idprovince LEFT JOIN country as c on c.idcountry = info5.idcountry;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InfoOrderProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InfoOrderProductProcedure`(IN `_ordernumber` INT(11))
BEGIN
                select inf.*, (inf.price_top+inf.price_parent) as unit_price, ((inf.price_top+inf.price_parent)*inf.amount_panent) as mountxprice from (select GROUP_CONCAT(info_order.l_topping SEPARATOR " ") as ltopping, sum(info_order.price) as price_top, info_order.parentidproduct, info_order.namepro, info_order.amount_panent,info_order.price_parent, info_order.urlparent, info_order.created_at from (select CONCAT("<li><lable>",info.topping,"</label> <span class=\"currency\">",info.price,"</span><span class=\"vnd\"></span></li>") as l_topping,info.idproduct, info.parentidproduct, info.price, info.namepro, price_parent, info.amount_panent,info.urlparent, info.created_at from (select cte1.namepro as topping, cte1.idproduct,cte1.parentidproduct, cte1.amount, cte1.price, cte1.urlfile ,cte2.namepro,cte2.price as price_parent,cte2.amount as amount_panent,cte2.urlfile as urlparent, cte2.created_at from (select  ordpro.namepro,ordpro.idproduct,parentidproduct,ordpro.amount,ordpro.price,(select urlfile from files where idfile = ordpro.idfile) as urlfile from (select p.namepro,(select idfile from producthasfile where idproduct = p.idproduct and hastype="thumbnail" ORDER BY idproducthasfile desc limit 1) as idfile, ex.* from (select * from exp_products where ordernumber =  _ordernumber) as ex join products as p on ex.idproduct = p.idproduct) as ordpro) as cte1 LEFT JOIN (select  ordpro.namepro,ordpro.idproduct,parentidproduct,ordpro.amount,ordpro.price,(select urlfile from files where idfile = ordpro.idfile) as urlfile, ordpro.created_at from (select p.namepro,(select idfile from producthasfile where idproduct = p.idproduct and hastype="thumbnail" ORDER BY idproducthasfile desc limit 1) as idfile, ex.* from (select * from exp_products where ordernumber =  _ordernumber and parentidproduct = 0) as ex join products as p on ex.idproduct = p.idproduct) as ordpro) as cte2 on cte1.parentidproduct = cte2.idproduct) as info) as info_order GROUP BY info_order.parentidproduct) as inf;    
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InitImportProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InitImportProductProcedure`(IN `_idproduct` INT(11), IN `_idcustomer` INT(11), IN `_iduser` INT(11), IN `_idcrosstype` INT(11), IN `_idparentcross` INT(11), IN `_amount` DOUBLE(20,0), IN `_price_import` DOUBLE(20,0), IN `_price` DOUBLE(20,0), IN `_quality_sale` INT(11), IN `_note` TEXT, IN `_axis_x` INT(11), IN `_axis_y` INT(11), IN `_axis_z` INT(11), IN `_id_status_type` INT(11), IN `_catnametype` VARCHAR(250), IN `_shortname` VARCHAR(250), IN `_prev_id` INT(11))
BEGIN             
                DECLARE _idcattype int;
                declare _idstore int;
                set _idcattype = 0; set _idstore = 0;
                set _idcattype = (select idcattype from category_types where catnametype=_catnametype order by idcattype DESC limit 1);
                set _idstore = (select cat.idcategory from (select * from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname = _shortname);
                INSERT INTO imp_products(idproduct, idcustomer, iduser, idcrosstype, idparentcross, amount, price_import, price, quality_sale, note, idstore, axis_x, axis_y, axis_z,id_status_type, prev_id) VALUES ( _idproduct, _idcustomer, _iduser, _idcrosstype, _idparentcross, _amount, _price_import, _price, _quality_sale, _note, _idstore, _axis_x, _axis_y, _axis_z,_id_status_type, _prev_id);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InitsessionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InitsessionProcedure`(IN `_idproduct` BIGINT(11), IN `input_quality` INT(11), IN `_idstore` INT(11), IN `_int_count` INT(11))
BEGIN             
               set @idorder:=(_int_count-1);
               SELECT (@idorder:= @idorder + 1) as idorder, info.* FROM ( SELECT info.* from (select inf1.* from (select idimp, 0 as parent, _idproduct as parent_in, input_quality , idproduct, idcrosstype, idparentcross, amount,price_import, price, quality_sale from imp_products WHERE idproduct = _idproduct and idcrosstype = 0 and idstore = _idstore and id_status_type = 4 and idparentcross = 0 UNION all select idimp, 0 as parent, _idproduct as parent_in, input_quality, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idparentcross = _idproduct and idcrosstype = 4 and idstore = _idstore and id_status_type = 4) as inf1 ORDER BY inf1.idimp DESC LIMIT 1) as info UNION select idimp, _int_count as parent, _idproduct as parent_in, input_quality, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idstore = _idstore and id_status_type = 4 and idcrosstype <> 4 and idparentcross = _idproduct) as info;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCrossProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InsertCrossProductProcedure`(IN `_idproduct` INT(11), IN `_idcrosstype` INT(11), IN `_idproduct_cross` INT(11))
BEGIN
               insert into cross_product(idproduct,idcrosstype,idproduct_cross) VALUES(_idproduct,_idcrosstype,_idproduct_cross);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertFilePath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InsertFilePath`(IN `_str_list_file` VARCHAR(255), OUT `_idfile` INT(11))
BEGIN
                
                SET @s = CONCAT('INSERT INTO files(urlfile,name_origin,namefile, typefile) VALUES ', _str_list_file); 
                PREPARE stmt1 FROM @s; 
                EXECUTE stmt1; 
                DEALLOCATE PREPARE stmt1;
                set _idfile = LAST_INSERT_ID();
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertfileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `InsertfileProcedure`(IN `_urlfile` varchar(255), IN `_name_origin` varchar(255), IN `_namefile` varchar(255), IN `_typefile` varchar(255))
BEGIN          
                INSERT INTO files(urlfile, name_origin, namefile, typefile) VALUES ( _urlfile, _name_origin, _namefile, _typefile);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertFilesProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InsertFilesProcedure`(IN `_urlfile` VARCHAR(255), IN `_name_origin` VARCHAR(255), IN `_namefile` VARCHAR(255), IN `_typefile` VARCHAR(255))
BEGIN
                INSERT INTO files(urlfile,name_origin,namefile, typefile) VALUES (_urlfile,_name_origin, _namefile, _typefile);
                SELECT LAST_INSERT_ID() as idfile;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertImportProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InsertImportProductProcedure`(IN `_idproduct` INT(11), IN `_iduser` INT(11), IN `_idcrosstype` INT(11), IN `_idparentcross` INT(11), IN `_price` INT(11), IN `_quality_sale` INT(11), IN `_idstore` INT(11), IN `_id_status_type` INT(11), IN `_fromdate` DATETIME, IN `_todate` DATETIME)
BEGIN           
set @prev_id = 0;
set @prev_id = ( SELECT MAX(idimp) as max_idimp FROM imp_products WHERE idstore = _idstore and id_status_type = 4 and idproduct = _idproduct and idcrosstype in (0,_idcrosstype) GROUP BY idproduct );
                insert into imp_products(idproduct, iduser, idcrosstype, idparentcross, price, quality_sale, idstore,   id_status_type, fromdate, todate, prev_id) VALUES (_idproduct, _iduser, _idcrosstype, _idparentcross, _price,  _quality_sale, _idstore, _id_status_type, _fromdate, _todate, @prev_id);
                select LAST_INSERT_ID() as idimp;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertPostProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InsertPostProcedure`(IN `_title` VARCHAR(255), IN `_body` TEXT, IN `_slug` VARCHAR(255), IN `_id_post_type` INT(11), IN `_idcategory` INT(11), IN `_id_status_type` INT(11), IN `_processing` DECIMAL(6,2), IN `_iduser_imp` INT(11))
BEGIN
                INSERT INTO posts(title, body, slug, id_post_type, idcategory) VALUES ( _title, _body, _slug, _id_post_type, _idcategory);
                    SET @_idpost = LAST_INSERT_ID();
                    INSERT INTO impposts(idpost, id_status_type, processing, iduser_imp) VALUES ( @_idpost, _id_status_type, _processing, _iduser_imp);
                    select @_idpost as outidpost;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `InsertProductProcedure`(IN `_namepro` VARCHAR(255) CHARSET utf8mb4, IN `_description` TEXT CHARSET utf8mb4, IN `_short_desc` TEXT CHARSET utf8mb4, IN `_slug` VARCHAR(255) CHARSET utf8mb4, IN `_id_post_type` INT(11), IN `_idcustomer` INT(11), IN `_idemployee` INT(11), IN `_amount` FLOAT(10), IN `_price` FLOAT(10), IN `_note` TEXT CHARSET utf8mb4, IN `_idstore` INT(11), IN `_axis_x` INT(11), IN `_axis_y` INT(11), IN `_axis_z` INT(11), IN `_size` VARCHAR(10) CHARSET utf8mb4, IN `_ice_water` FLOAT(10), IN `_sugar` FLOAT(10), IN `_topping` VARCHAR(255) CHARSET utf8mb4, IN `_status_type` INT(11), IN `_list_idcat` VARCHAR(255) CHARSET utf8mb4, IN `_list_file` TEXT CHARSET utf8mb4, IN `_thumbnail` TEXT CHARSET utf8mb4)
BEGIN
                DECLARE _idproduct INT;
								DECLARE _idfile INT;
								DECLARE list_file VARCHAR(255);
								DECLARE list_idcat VARCHAR(255);
								DECLARE str_query VARCHAR(255);
								set _idproduct = 0;
								INSERT INTO products(namepro, description, short_desc, slug, id_post_type) VALUES ( _namepro, _description, _short_desc , _slug, _id_post_type );
                SET _idproduct = LAST_INSERT_ID();								
                INSERT INTO imp_products(idproduct, idcustomer, idemployee, amount, price, note, idstore, axis_x, axis_y, axis_z, size, ice_water, sugar, topping, status_type) VALUES ( _idproduct, _idcustomer, _idemployee, _amount, _price, _note, _idstore, _axis_x, _axis_y, _axis_z, _size, _ice_water, _sugar, _topping, _status_type);							
							  call CategoryHasProduct(_list_idcat, _idproduct);
								#call ProducthasFile(_thumbnail, ";","thumbnail", _idproduct);
								call ProducthasFile(_list_file, ";","gallery", _idproduct);				
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LatestPriceProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `LatestPriceProcedure`(IN `_idproduct` BIGINT(11), IN `_idparentcross` INT(11), IN `_idstore` INT(11))
BEGIN             
               SELECT info.price from (SELECT inf_price.* from (select * from (select idimp, idproduct, idcrosstype, idparentcross, amount,price_import, price, quality_sale from imp_products WHERE idproduct = _idproduct and idcrosstype = 0 and idstore = _idstore and id_status_type = 4 and idparentcross = _idparentcross UNION select idimp, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idparentcross = _idproduct and idcrosstype = 4 and idstore = _idstore and id_status_type = 4) as info UNION select idimp, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idstore = _idstore and id_status_type = 4 and idcrosstype <> 4 and idparentcross = _idparentcross and idproduct = _idproduct) as inf_price ORDER BY inf_price.idimp DESC limit 1) as info;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LatestProductByIdcateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `LatestProductByIdcateProcedure`(IN `_idcategory` INT(11), IN `_idstore` INT(11), IN `_limit` INT(11))
BEGIN             
               SELECT inf1.*, imp1.*, imp2.price as old_price, phf.max_idproducthasfile, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description from (SELECT pc.*, info_pr.max_idimp_price from (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory and checked > 0) as pc LEFT JOIN (SELECT MAX(idimp) as max_idimp_price, idproduct from (SELECT * FROM `imp_products` WHERE idstore = _idstore AND id_status_type = 4 and idcrosstype in (0,4)) as inf_price GROUP BY inf_price.idproduct) as info_pr ON pc.idproduct = info_pr.idproduct WHERE info_pr.idproduct is not NULL) as inf1 LEFT JOIN imp_products as imp1 on inf1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN (SELECT MAX(idproducthasfile) as max_idproducthasfile,idproduct FROM producthasfile WHERE hastype = 1 and status_file = 1 GROUP BY idproduct) as phf on inf1.idproduct = phf.idproduct LEFT JOIN producthasfile as phf1 on phf.max_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on inf1.idproduct = p.idproduct ORDER BY imp1.idimp DESC limit _limit;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LatestProductByIdcateProcedure_bk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `LatestProductByIdcateProcedure_bk`(IN `_idcategory` INT(11), IN `_idstore` INT(11), IN `_limit` INT(11))
BEGIN             
               SELECT inf1.*, imp1.*, imp2.price as old_price, phf.max_idproducthasfile, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description from (SELECT pc.*, info_pr.max_idimp_price from (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory) as pc LEFT JOIN (SELECT MAX(idimp) as max_idimp_price, idproduct from (SELECT * FROM `imp_products` WHERE idstore = _idstore AND id_status_type = 4 and idcrosstype in (0,4)) as inf_price GROUP BY inf_price.idproduct) as info_pr ON pc.idproduct = info_pr.idproduct WHERE info_pr.idproduct is not NULL) as inf1 LEFT JOIN imp_products as imp1 on inf1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN (SELECT MAX(idproducthasfile) as max_idproducthasfile,idproduct FROM producthasfile WHERE hastype = 1 and status_file = 1 GROUP BY idproduct) as phf on inf1.idproduct = phf.idproduct LEFT JOIN producthasfile as phf1 on phf.max_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on inf1.idproduct = p.idproduct ORDER BY imp1.idimp DESC limit _limit;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LatestPromotionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `LatestPromotionProcedure`(IN `_idstore` INT(11), IN `_limit` INT(11))
BEGIN             
                SELECT info.*, info_pr.max_idimp_price,p.namepro, p.slug, p.short_desc, p.description,imp1.*, imp2.price as old_price, phf.idfile, f.urlfile FROM (SELECT inf1.idproduct,inf2.max_idproducthasfile from (SELECT idproduct from imp_products WHERE idstore = _idstore and id_status_type = 4 and idcrosstype = 4 GROUP BY idproduct) as inf1 LEFT JOIN (SELECT MAX(idproducthasfile) as max_idproducthasfile,idproduct FROM producthasfile WHERE hastype = 1 and status_file = 1 GROUP BY idproduct) as inf2 on inf1.idproduct = inf2.idproduct WHERE inf2.idproduct is not NULL) as info LEFT JOIN (SELECT MAX(idimp) as max_idimp_price,idproduct from (SELECT * FROM `imp_products` WHERE idstore = 31 AND id_status_type = 4 and idcrosstype in (0,4)) as inf_price GROUP BY inf_price.idproduct) as info_pr ON info.idproduct = info_pr.idproduct LEFT JOIN products as p on info.idproduct = p.idproduct LEFT JOIN imp_products as imp1 on info_pr.max_idimp_price = imp1.idimp LEFT JOIN  imp_products as imp2 on imp1.prev_id = imp2.idimp LEFT JOIN producthasfile as phf on info.max_idproducthasfile = phf.idproducthasfile LEFT JOIN files as f on phf.idfile = f.idfile ORDER BY info_pr.max_idimp_price DESC limit _limit ;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListAllCatByTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListAllCatByTypeProcedure`(IN `_namecattype` VARCHAR(255))
BEGIN
        DECLARE _idcattype INT;
        SET _idcattype = (SELECT idcattype FROM category_types WHERE catnametype = _namecattype limit 1);
        IF _idcattype > 0 THEN
        BEGIN
           SELECT idcattype, c.idcategory, c.shortname, c.namecat, c.slug, _namecattype as catnametype, c.idparent, (select namecat from categories WHERE idcategory = c.idparent) as parent, pathroute FROM categories as c WHERE idcattype = _idcattype and c.trash < 1;
        END; 
        ELSE
        BEGIN
           SELECT c.* FROM categories as c where c.trash < 1;    
        END;
        END IF;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListAllCateByIdcatetype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListAllCateByIdcatetype`(IN `_idcatetype` INT(11))
BEGIN
               IF _idcatetype > 0 THEN
                    BEGIN
                       SELECT c.idcategory, c.shortname, c.namecat, c.idparent, (select namecat from categories WHERE idcategory = c.idparent) as parent FROM categories as c WHERE idcattype = _idcatetype;
                    END; 
                ELSE
                    BEGIN
                       SELECT c.* FROM categories as c;    
                    END;
                END IF;  
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListAllCategoryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListAllCategoryProcedure`()
BEGIN
            SELECT idcategory,namecat,idparent FROM categories;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListAllProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListAllProductProcedure`(IN `_start_date` VARCHAR(255), IN `_end_date` VARCHAR(255), IN `_idcategory` INT(11), IN `_id_post_type` INT(11), IN `_id_status_type` INT(11), IN `_idstore` INT(11))
BEGIN
if _idcategory = 0 THEN
		BEGIN					 
			SELECT info7.*,imp2.*, phf2.idfile, f.urlfile, u.`name` as author FROM (SELECT info6.*, MAX(info6.idproducthasfile) as max_idproducthasfile FROM (SELECT info5.*,phf1.idproducthasfile FROM (SELECT info4.*,MAX(info4.idimp) as max_idimp FROM (SELECT info3.*, imp1.idimp,imp1.idcrosstype from ( SELECT info2.*,GROUP_CONCAT(info2.namecat SEPARATOR ', ') as listcat FROM (SELECT info1.*,p.namepro, p.slug, p.short_desc, p.description FROM (SELECT cate.idcategory, cate.namecat, chp.idcateproduct, chp.idproduct FROM (SELECT * from categories WHERE idcattype = 4) as cate LEFT JOIN catehasproduct as chp on cate.idcategory = chp.idcategory WHERE chp.idcateproduct is not NULL and chp.created_at BETWEEN _start_date AND _end_date) as info1 LEFT JOIN products as p on info1.idproduct = p.idproduct WHERE p.idstatus_type = _id_status_type AND p.idproduct is not NULL and id_post_type = _id_post_type and created_at BETWEEN _start_date AND _end_date) as info2 GROUP BY info2.idproduct ) as info3 LEFT JOIN imp_products as imp1 on info3.idproduct = imp1.idproduct WHERE imp1.idstore=_idstore AND imp1.id_status_type = 4 AND imp1.idcrosstype in (0,4) and imp1.idimp is not NULL) as info4 GROUP BY info4.idproduct) as info5 LEFT JOIN producthasfile as phf1 on info5.idproduct = phf1.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1 and phf1.idproducthasfile is not NULL) as info6 GROUP BY info6.idproduct) as info7 LEFT JOIN imp_products as imp2 on info7.max_idimp = imp2.idimp LEFT JOIN producthasfile as phf2 on info7.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN users as u on imp2.iduser = u.id ORDER BY info7.max_idimp DESC limit 100;
		 END;
 ELSEif _idcategory > 0 THEN
	begin
		SELECT info7.*,imp2.*, phf2.idfile, f.urlfile FROM (SELECT info6.*, MAX(info6.idproducthasfile) as max_idproducthasfile FROM (SELECT info5.*,phf1.idproducthasfile FROM (SELECT info4.*,MAX(info4.idimp) as max_idimp FROM (SELECT info3.*, imp1.idimp,imp1.idcrosstype from ( SELECT info2.*,GROUP_CONCAT(info2.namecat SEPARATOR ', ') as listcat FROM (SELECT info1.*,p.namepro, p.slug, p.short_desc, p.description FROM ( SELECT chp.idproduct, cate.namecat from catehasproduct as chp LEFT JOIN categories as cate on chp.idcategory = cate.idcategory WHERE chp.idcategory = _idcategory and cate.idcategory is not NULL) as info1 LEFT JOIN products as p on info1.idproduct = p.idproduct WHERE p.idstatus_type = _id_status_type AND p.idproduct is not NULL and p.id_post_type = _id_post_type and p.created_at BETWEEN _start_date AND _end_date) as info2 GROUP BY info2.idproduct ) as info3 LEFT JOIN imp_products as imp1 on info3.idproduct = imp1.idproduct WHERE imp1.idstore=_idstore AND imp1.id_status_type = 4 AND imp1.idcrosstype in (0,4) and imp1.idimp is not NULL) as info4 GROUP BY info4.idproduct) as info5 LEFT JOIN producthasfile as phf1 on info5.idproduct = phf1.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1 and phf1.idproducthasfile is not NULL) as info6 GROUP BY info6.idproduct) as info7 LEFT JOIN imp_products as imp2 on info7.max_idimp = imp2.idimp LEFT JOIN producthasfile as phf2 on info7.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN users as u on imp2.iduser = u.id ORDER BY info7.max_idimp DESC LIMIT 100;
	end;
END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListCateByIdmenuProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListCateByIdmenuProcedure`(IN `_idmenu` INT(11))
BEGIN
               SELECT * FROM menu_has_cate WHERE idmenu=_idmenu;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListCategoryByTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListCategoryByTypeProcedure`()
BEGIN
	SELECT idcategory, namecat from categories;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListCategoryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListCategoryProcedure`()
BEGIN
                SELECT c1.idcategory, c1.namecat, c1.idcattype, (select catnametype from category_types where idcattype=c1.idcattype) as catnametype, c2.namecat as parent from categories as c1 left Join categories as c2 on c1.idparent = c2.idcategory;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListcatparentProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListcatparentProcedure`()
BEGIN
                SELECT c1.idcategory, c1.namecat from categories as c1 where c1.idparent = 0;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListCatPermDashboardByTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListCatPermDashboardByTypeProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255))
sp:BEGIN
	set @_idrole = (SELECT idrole FROM `grants` WHERE to_iduser= _iduser limit 1);
	if @_idrole is NULL THEN
		BEGIN
			select 0 as allow;
			LEAVE sp;
		END;
	end if;
		if _command is NULL or _command='' THEN 
			SET _command='select';
		END IF; 
		set @_idcommand = (SELECT idpercommand from perm_commands WHERE command = _command);
		if @_idcommand IS NULL THEN 
			BEGIN
			select 0 as allow;
			LEAVE sp;
			END;
		END IF;
		set @_idcattype = (SELECT idcattype from category_types WHERE catnametype = _catnametype);
		if @_idcattype is NULL then
			BEGIN
			select 0 as allow;
			LEAVE sp;
			END;
		END if;
		select cat2.*,CASE WHEN cat3.idparent > 0 THEN 1 ELSE 0 END haschild from (select cat1.*, c.idcattype, c.namecat, c.pathroute, c.idparent from (SELECT imp.idperm, imp.idrole, imp.iduserimp,perm.`name`, perm.description, perm.idpermcommand, perm.idcategory from (SELECT idrole FROM `grants` WHERE to_iduser= _iduser) as tbrole LEFT JOIN imp_perms as imp on imp.idrole = tbrole.idrole LEFT JOIN permissions as perm on imp.idperm = perm.idperm WHERE perm.idpermcommand = @_idcommand) as cat1 LEFT JOIN categories as c on c.idcategory = cat1.idcategory) as cat2 LEFT JOIN (select DISTINCT c.idparent from (SELECT perm.idcategory from (SELECT idrole FROM `grants` WHERE to_iduser= 2) as tbrole LEFT JOIN imp_perms as imp on imp.idrole = tbrole.idrole LEFT JOIN permissions as perm on imp.idperm = perm.idperm WHERE perm.idpermcommand = 1) as cat1 LEFT JOIN categories as c on c.idcategory = cat1.idcategory) as cat3 on cat2.idcategory = cat3.idparent WHERE cat2.idcattype = @_idcattype;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListCatPermissionByTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListCatPermissionByTypeProcedure`(IN `_namecatetype` VARCHAR(255))
BEGIN
	DECLARE _idcattype INT;
        SET _idcattype = (SELECT idcattype FROM category_types WHERE catnametype = _namecatetype);
        IF _idcattype > 0 THEN
        BEGIN
           SELECT cat4.*, CASE WHEN cat3.idparent > 0 THEN 1 ELSE 0 END haschild from (SELECT * FROM categories  WHERE idcattype = _idcattype) as cat4 LEFT JOIN (SELECT DISTINCT idparent from categories WHERE idcattype =_idcattype) as cat3 on cat4.idcategory = cat3.idparent;
        END; 
        ELSE
        BEGIN
           SELECT c.* FROM categories as c;    
        END;
        END IF;
				/*SELECT cat4.*, CASE WHEN cat3.idcategory > 0 THEN 1 ELSE 0 END haschild from (SELECT * FROM categories  WHERE idcattype = _idcattype) as cat4 LEFT JOIN (SELECT DISTINCT cat1.idcategory from (SELECT idcategory, idparent FROM categories  WHERE idcattype = _idcattype) as cat1 JOIN (SELECT idcategory, idparent FROM categories WHERE idcattype = _idcattype and idparent > 0 ) as cat2 on cat2.idparent = cat1.idcategory) as cat3 on cat4.idcategory = cat3.idcategory;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListCustomerRegister` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListCustomerRegister`(IN `_start_date` VARCHAR(255), IN `_end_date` VARCHAR(255), IN `_idcategory` INT(11), IN `_id_post_type` INT(11), IN `_id_status_type` INT(11), IN `_sel_receive` INT(11))
BEGIN
        DECLARE _now VARCHAR(255);
        DECLARE _str_start VARCHAR(255);
        DECLARE _now_time VARCHAR(255);
        SET _now_time = NOW();
        IF ( _start_date IS NULL OR _start_date ="") THEN
        BEGIN
            SET _now = DATE(_now_time);
            SET _str_start = CONCAT(_now," 00:00:00");
            SET _start_date = STR_TO_DATE(_str_start,"%Y-%m-%d %H:%i:%s");          
        END;
        END IF;
        IF ( _end_date IS NULL OR _end_date = "") THEN SET _end_date = _now_time;       
        END IF;
        if ( _sel_receive = 0 AND _id_post_type = 0) then
		begin
		    SELECT user_reg.idimppost,user_reg.idpost,(select ROW_COUNT() from expposts where parent_idpost_exp = user_reg.idpost) as count_interactive,user_reg.created_at,cus.mobile,cus.firstname,cus.email,user_reg.body,user_reg.address_reg FROM (SELECT imp.created_at,imp.idpost,imp.idimppost,imp.iduser_imp,po.body,imp.address_reg FROM (SELECT im.* FROM (SELECT * FROM impposts WHERE created_at >= _start_date AND  created_at < _end_date) AS im WHERE im.id_status_type = _id_status_type) AS imp JOIN
		    (SELECT pt.* FROM (SELECT p.* FROM (SELECT idpost,body,id_post_type,idcategory FROM posts WHERE created_at >= _start_date AND created_at < _end_date) AS p WHERE p.idcategory=_idcategory) AS pt WHERE pt.id_post_type = '1' OR pt.id_post_type = '2') AS po ON imp.idpost=po.idpost) AS user_reg JOIN
		    sv_customers AS cus ON user_reg.iduser_imp = cus.idcustomer;
		end;
	elseif ( _sel_receive = 1 AND _id_post_type = 0) then
		BEGIN
		    select user_join.idimppost,user_join.idpost,(select count(*) from expposts where parent_idpost_exp = user_join.idpost) as count_interactive,user_join.created_at,cus.mobile,cus.firstname,cus.email,user_join.body,user_join.address_reg, user_join.url  from (SELECT user_reg.idimppost,user_reg.idpost,user_reg.iduser_imp,user_reg.created_at,user_reg.body,user_reg.address_reg FROM (SELECT imp.created_at,imp.idpost,imp.idimppost,imp.iduser_imp,po.body,imp.address_reg, imp.url FROM (SELECT im.* FROM (SELECT * FROM impposts WHERE created_at >= _start_date AND  created_at < _end_date) AS im WHERE im.id_status_type='1') AS imp JOIN
		    (SELECT pt.* FROM (SELECT p.* FROM (SELECT idpost,body,id_post_type,idcategory FROM posts WHERE created_at >= _start_date AND created_at < _end_date) AS p WHERE p.idcategory=_idcategory) AS pt WHERE pt.id_post_type = '1' OR pt.id_post_type = '2') AS po ON imp.idpost = po.idpost) AS user_reg LEFT JOIN expposts AS expp ON user_reg.idpost = expp.parent_idpost_exp WHERE expp.parent_idpost_exp IS NULL) as user_join join sv_customers as cus on cus.idcustomer = user_join.iduser_imp;
		end;
	ELSEIF ( _sel_receive = 2 AND _id_post_type = 0 ) then
		BEGIN
		    SELECT user_join.idimppost,user_join.idpost,(select count(*) from expposts where parent_idpost_exp = user_join.idpost) as count_interactive,user_join.created_at,cus.mobile,cus.firstname,cus.email,user_join.body,user_join.address_reg,user_join.url  FROM (SELECT user_reg.idimppost,user_reg.idpost,user_reg.iduser_imp,user_reg.created_at,user_reg.body,user_reg.address_reg FROM (SELECT imp.created_at,imp.idpost,imp.idimppost,imp.iduser_imp,po.body,imp.address_reg, imp.url FROM (SELECT im.* FROM (SELECT * FROM impposts WHERE created_at >= _start_date AND  created_at < _end_date) AS im WHERE im.id_status_type='1') AS imp JOIN
		    (SELECT pt.* FROM (SELECT p.* FROM (SELECT idpost,body,id_post_type,idcategory FROM posts WHERE created_at >= _start_date AND created_at < _end_date) AS p WHERE p.idcategory=_idcategory) AS pt WHERE pt.id_post_type = '1' OR pt.id_post_type = '2') AS po ON imp.idpost = po.idpost) AS user_reg right JOIN ( select * from expposts GROUP BY parent_idpost_exp ) AS expp ON user_reg.idpost = expp.parent_idpost_exp) AS user_join JOIN sv_customers AS cus ON cus.idcustomer = user_join.iduser_imp;
		END;
	elseIF ( _sel_receive = 0 AND _id_post_type > 0) THEN
		BEGIN
		    SELECT user_reg.idimppost,user_reg.idpost,(select count(*) from expposts where parent_idpost_exp = user_reg.idpost) as count_interactive,user_reg.created_at,cus.mobile,cus.firstname,cus.email,user_reg.body,user_reg.address_reg,user_reg.url FROM (SELECT imp.created_at,imp.idpost,imp.idimppost,imp.iduser_imp,po.body,imp.address_reg,imp.url FROM (SELECT im.* FROM (SELECT * FROM impposts WHERE created_at >= _start_date AND  created_at < _end_date) AS im WHERE im.id_status_type = _id_status_type) AS imp JOIN
		    (SELECT pt.* FROM (SELECT p.* FROM (SELECT idpost,body,id_post_type,idcategory FROM posts WHERE created_at >= _start_date AND created_at < _end_date) AS p WHERE p.idcategory=_idcategory) AS pt WHERE pt.id_post_type = _id_post_type) AS po ON imp.idpost=po.idpost) AS user_reg JOIN
		    sv_customers AS cus ON user_reg.iduser_imp = cus.idcustomer;
		END;
	ELSEIF ( _sel_receive = 1 AND _id_post_type > 0) THEN
		BEGIN
		    SELECT user_join.idimppost,user_join.idpost,(select count(*) from expposts where parent_idpost_exp = user_join.idpost) as count_interactive,user_join.created_at,cus.mobile,cus.firstname,cus.email,user_join.body,user_join.address_reg,user_join.url  FROM (SELECT user_reg.idimppost,user_reg.idpost,user_reg.iduser_imp,user_reg.created_at,user_reg.body,user_reg.address_reg,user_reg.url FROM (SELECT imp.created_at,imp.idpost,imp.idimppost,imp.iduser_imp,po.body,imp.address_reg,imp.url FROM (SELECT im.* FROM (SELECT * FROM impposts WHERE created_at >= _start_date AND  created_at < _end_date) AS im WHERE im.id_status_type='1') AS imp JOIN
		    (SELECT pt.* FROM (SELECT p.* FROM (SELECT idpost,body,id_post_type,idcategory FROM posts WHERE created_at >= _start_date AND created_at < _end_date) AS p WHERE p.idcategory=_idcategory) AS pt WHERE pt.id_post_type = _id_post_type) AS po ON imp.idpost = po.idpost) AS user_reg LEFT JOIN expposts AS expp ON user_reg.idpost = expp.parent_idpost_exp WHERE expp.parent_idpost_exp IS NULL) AS user_join JOIN sv_customers AS cus ON cus.idcustomer = user_join.iduser_imp;
		END;
	ELSEIF ( _sel_receive = 2 AND _id_post_type > 0 ) THEN
		BEGIN
		    SELECT user_join.idimppost,user_join.idpost,(select count(*) from expposts where parent_idpost_exp = user_join.idpost) as count_interactive,user_join.created_at,cus.mobile,cus.firstname,cus.email,user_join.body,user_join.address_reg,user_join.url  FROM (SELECT user_reg.idimppost,user_reg.idpost,user_reg.iduser_imp,user_reg.created_at,user_reg.body,user_reg.address_reg, user_reg.url FROM (SELECT imp.created_at,imp.idpost,imp.idimppost,imp.iduser_imp,po.body,imp.address_reg, imp.url FROM (SELECT im.* FROM (SELECT * FROM impposts WHERE created_at >= _start_date AND  created_at < _end_date) AS im WHERE im.id_status_type='1') AS imp JOIN
		    (SELECT pt.* FROM (SELECT p.* FROM (SELECT idpost,body,id_post_type,idcategory FROM posts WHERE created_at >= _start_date AND created_at < _end_date) AS p WHERE p.idcategory=_idcategory) AS pt WHERE pt.id_post_type = _id_post_type) AS po ON imp.idpost = po.idpost) AS user_reg RIGHT JOIN expposts AS expp ON user_reg.idpost = expp.parent_idpost_exp) AS user_join JOIN sv_customers AS cus ON cus.idcustomer = user_join.iduser_imp;
		END;
        end if;  
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListDepartmentProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListDepartmentProcedure`()
BEGIN
                SELECT c1.iddepart, c1.namedepart, c2.namedepart as parent from departments as c1 left Join departments as c2 on c1.idparent = c2.iddepart;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListDepartParentProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListDepartParentProcedure`()
BEGIN
                SELECT c1.iddepart, c1.namedepart from departments as c1 where c1.idparent is null;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListEnablePermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListEnablePermission`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					SELECT 1 as allow, p.idperm, p.`name`, p.description, pc.command, c.namecat FROM `permissions` as p LEFT JOIN perm_commands as pc on p.idpermcommand = pc.idpercommand LEFT JOIN categories as c on p.idcategory = c.idcategory;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'edit' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'delete' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListgrantbyidProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListgrantbyidProcedure`(IN `id_grant` INT(11))
BEGIN
                SELECT r.idrole, r.name as namerole, g.to_iduser,(select name from users where id = g.to_iduser) as touser, g.by_iduser,(select name from users where id = g.by_iduser) as byuser FROM (select * from grants where idgrant = id_grant) as g LEFT join roles as r on g.idrole = r.idrole;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListgrantProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListgrantProcedure`()
BEGIN
                SELECT g.idgrant, r.idrole, r.name as namerole, (select name from users where id = g.to_iduser) as touser, (select name from users where id=g.by_iduser) as byuser from grants as g LEFT join roles as r on g.idrole = r.idrole;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListImppermProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListImppermProcedure`()
BEGIN
                SELECT imp.idimp_perm, p.name as nameperm, r.name as namerole, u.name as nameuser FROM imp_perms as imp left join permissions as p ON imp.idperm = p.idperm LEFT join roles as r on imp.idrole = r.idrole LEFT join users as u ON imp.iduserimp = u.id;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListItemCateByIdMenuProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListItemCateByIdMenuProcedure`(IN `_idmenu` INT(11))
BEGIN
               select cat1.*,c.idcattype, ct.catnametype, c.slug, c.namecat as namemenu, IF(cat2.idparent is not NULL ,'1','0') as haschild from (SELECT mnhas.idmenuhascate, mnhas.idmenu,mnhas.idcategory, mnhas.idparent, mnhas.reorder, mnhas.depth, mnhas.trash FROM menu_has_cate as mnhas WHERE mnhas.idmenu=_idmenu and mnhas.trash < 1) as cat1 LEFT JOIN (SELECT idparent FROM menu_has_cate WHERE idmenu=_idmenu and trash < 1 GROUP BY idparent) as cat2 on cat1.idmenuhascate = cat2.idparent LEFT JOIN categories as c on cat1.idcategory = c.idcategory LEFT JOIN category_types as ct on c.idcattype = ct.idcattype ORDER BY cat1.reorder ASC;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListItemCateByIdMenuProcedure_bk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListItemCateByIdMenuProcedure_bk`(IN `_idmenu` INT(11))
BEGIN
               select cat1.*, IF(cat2.idparent is not NULL ,'1','0') as haschild from (SELECT mnhas.idmenuhascate, mnhas.idmenu,mnhas.idcategory,(select namecat from categories where idcategory = mnhas.idcategory) as namemenu, mnhas.idparent, mnhas.reorder, mnhas.depth, mnhas.trash FROM menu_has_cate as mnhas WHERE mnhas.idmenu=_idmenu and mnhas.trash < 1 ORDER BY reorder ASC) as cat1 LEFT JOIN (SELECT idparent FROM menu_has_cate WHERE idmenu=_idmenu and trash < 1 GROUP BY idparent) as cat2 on cat1.idmenuhascate = cat2.idparent;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListMenuProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListMenuProcedure`()
BEGIN
               select * from menus;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListOrderProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListOrderProductProcedure`(IN `_start_date` VARCHAR(255), IN `_end_date` VARCHAR(255), IN `_idstore` INT(11), IN `_id_status_type` INT(11))
BEGIN
	select info.*,w.nameward, d.namedist, ct.namecitytown, pv.nameprovince, c.namecountry from (SELECT info1.*,prf.lastname, prf.middlename, prf.firstname,prf.mobile, prf.address, prf.idward, prf.iddistrict, prf.idcitytown, prf.idprovince, prf.idcountry FROM (SELECT idnumberorder, idcustomer, idrecipent, iduser, SUM(price*amount) as itemtotal, created_at, id_status_type FROM exp_products WHERE idstore = _idstore AND created_at BETWEEN _start_date and _end_date and iduser > 0 GROUP BY idnumberorder) as info1 LEFT JOIN `profile` as prf on prf.iduser = info1.iduser UNION SELECT info2.*, svc.lastname, svc.middlename, svc.firstname, svc.mobile, svc.address, svc.idward, svc.iddistrict, svc.idcitytown, svc.idprovince, svc.idcountry FROM (SELECT idnumberorder, idcustomer, idrecipent, iduser, SUM(price*amount) as itemtotal, created_at, id_status_type FROM exp_products WHERE idstore = _idstore AND created_at BETWEEN _start_date and _end_date and idcustomer > 0 GROUP BY idnumberorder) as info2 LEFT JOIN sv_customers as svc on svc.idcustomer = info2.idcustomer) as info LEFT JOIN ward as w on w.idward = info.idward LEFT JOIN district as d on d.iddistrict = info.iddistrict LEFT JOIN city_town as ct on ct.idcitytown = info.idcitytown LEFT JOIN province as pv on pv.idprovince = info.idprovince LEFT JOIN country as c on c.idcountry = info.idcountry;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListParentCatbyIdcattypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListParentCatbyIdcattypeProcedure`(IN `_idcattype` INT)
BEGIN
		IF _idcattype > 0 THEN
		BEGIN
			 SELECT c.idcategory, c.namecat, c.idparent FROM categories as c WHERE c.idcattype = _idcattype;
		END; 
		ELSE
		BEGIN
			 SELECT c.* FROM categories as c;    
		END;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListParentCatByIdpostTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListParentCatByIdpostTypeProcedure`(IN _idperm INT(11))
BEGIN             
                DECLARE _idcattype INT;
                SET _idcattype = (SELECT idcattype FROM category_types  WHERE catnametype LIKE _namecattype ORDER BY idcattype desc limit 1);
                IF _idcattype > 0 THEN
                    BEGIN
                       SELECT c.idcategory, c.namecat FROM categories as c WHERE c.idcattype = _idcattype and c.idparent = 0;
                    END; 
                ELSE
                    BEGIN
                       SELECT c.* FROM categories as c;    
                    END;
                END IF;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListParentCatByTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListParentCatByTypeProcedure`(IN `_namecattype` VARCHAR(255))
BEGIN
	DECLARE _idcattype INT;
        SET _idcattype = (SELECT idcattype FROM category_types  WHERE catnametype LIKE _namecattype ORDER BY idcattype desc limit 1);
        IF _idcattype > 0 THEN
        BEGIN
           SELECT c.idcategory, c.namecat FROM categories as c WHERE c.idcattype = _idcattype and c.idparent = 0 and c.trash < 1;
        END; 
        ELSE
        BEGIN
           SELECT c.* FROM categories as c where c.trash < 1;    
        END;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListParentCatByTypeProcedure_bk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListParentCatByTypeProcedure_bk`(IN `_namecattype` VARCHAR(255))
BEGIN
	DECLARE _idcattype INT;
        SET _idcattype = (SELECT idcattype FROM category_types  WHERE catnametype LIKE _namecattype ORDER BY idcattype desc limit 1);
        IF _idcattype > 0 THEN
        BEGIN
           SELECT c.idcategory, c.namecat FROM categories as c WHERE c.idcattype = _idcattype and c.idparent = 0;
        END; 
        ELSE
        BEGIN
           SELECT c.* FROM categories as c;    
        END;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListPermissionCommands` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListPermissionCommands`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					SELECT *,1 as allow  from perm_commands;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
				ELSEIF _command = 'edit' then
				begin
					select 1 as allow;
				end;
				ELSEIF _command = 'delete' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListPermissionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListPermissionProcedure`()
BEGIN             
SELECT p.idperm, p.`name`, p.description, pc.command, c.namecat FROM `permissions` as p LEFT JOIN perm_commands as pc on p.idpermcommand = pc.idpercommand LEFT JOIN categories as c on p.idcategory = c.idcategory;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListpostProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListpostProcedure`()
BEGIN
                SELECT * from posts;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListPosttypeByIdcateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListPosttypeByIdcateProcedure`(IN `_idcategory` int,IN `_page` int, IN `_idstore` int, IN `_limit` int, IN `_iduser` int, IN `_idposttype` int)
SP:BEGIN                
            DECLARE _start int(11);
                        DECLARE _max_order int(11);
                        set @idorder:= 0;
                        set _start := 0;
                        set @_commit := 0;
                        if _iduser is NULL OR _iduser = '' THEN 
                            BEGIN
                                set _iduser = 36;
                            end;
                        end if;
                        call UserPermission(_iduser, _idcategory, 'select', @_commit);
                        if @_commit < 1 THEN 
                            BEGIN
                            SELECT @_commit as _commit, 0 as count_page;
                            LEAVE sp;
                            END;
                        END IF;
                        DROP TABLE IF EXISTS tmp_product1;
                        DROP TABLE IF EXISTS tmp_product2;
                        DROP TABLE IF EXISTS tmp_product3;
                        
            create TEMPORARY TABLE tmp_product1(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT info4.max_idimp_price, MAX(info4.idproducthasfile) as max_idproducthasfile FROM (SELECT info3.idproduct, info3.max_idimp_price, phf1.idproducthasfile FROM (SELECT info2.idproduct, MAX(info2.idimp) as max_idimp_price FROM (SELECT info1.idproduct, imp1.idimp FROM (SELECT cat.idproduct FROM (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory and checked > 0) as cat JOIN products as p ON p.idproduct = cat.idproduct where p.idstatus_type = 4 and p.id_post_type = _idposttype) as info1 LEFT JOIN imp_products as imp1 on imp1.idproduct = info1.idproduct WHERE imp1.idcrosstype in (0,4) and imp1.id_status_type = 4 ) as info2 GROUP BY info2.idproduct) as info3 LEFT JOIN producthasfile as phf1 on phf1.idproduct = info3.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1) as info4 GROUP BY info4.idproduct ORDER BY info4.max_idimp_price DESC);
                        set _max_order = (SELECT COUNT(*) FROM tmp_product1 as tmp1);
                        create TEMPORARY TABLE tmp_product2(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT * FROM tmp_product1);
                        DROP TABLE tmp_product1;
                        create TEMPORARY TABLE tmp_product3(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL);
                        set @count_page = (_max_order DIV 12);
                        set @end_count_item = (_max_order % 12);        
                        if @end_count_item > 0 THEN
                            BEGIN
                                set @count_page = @count_page + 1;
                            END;
                        END if;
                        set _start = 1 + ((_page-1)*12);
                        set @str :='';
                        set @comma =',';
                        if _page = @count_page THEN
                            BEGIN
                                if _max_order % 12 = 0 THEN
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order) + 1;
                                    END;
                                ELSE
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order % 12) + 1;
                                    END;
                                END if;
                                
                            END;
                        ELSEIF _page < @count_page THEN
                            BEGIN
                                set @maxpage = (_page*12)+1;
                            END;
                        END if;
                        WHILE _start < @maxpage DO
                            if _start =  (@maxpage - 1) THEN
                                set @comma ='';
                            end if;
                            set @str = CONCAT(@str,'(',_start,')',@comma);
                            set _start = _start + 1;
                        END WHILE;
                        if  @str <> '' OR @str is NOT NULL THEN
                            BEGIN
                            set @str = CONCAT('INSERT into tmp_product3(idorder) VALUES ',@str);
                            SET @queryString = @str;
                                    PREPARE stmt FROM @queryString;
                                    EXECUTE stmt;
                                    DEALLOCATE PREPARE stmt;
                                SELECT @_commit as _commit, @count_page as count_page, info1.*,imp1.*,imp2.price as old_price, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description FROM (SELECT tmp3.*, tmp2.max_idimp_price, tmp2.max_idproducthasfile FROM tmp_product3 as tmp3 LEFT JOIN tmp_product2 as tmp2 on tmp3.idorder = tmp2.id) as info1 LEFT JOIN imp_products as imp1 on info1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN producthasfile as phf1 on phf1.idproducthasfile = info1.max_idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on imp1.idproduct = p.idproduct;
                            END;
                        END if;
                        DROP TABLE tmp_product2;
                        DROP TABLE tmp_product3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListPostTypeByIdcatProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListPostTypeByIdcatProcedure`(IN `_idcat` INT)
BEGIN
        IF _idcat > 0 THEN
        BEGIN
           SELECT * FROM post_types WHERE idparent = _idcat;
        END; 
        ELSE
        BEGIN
           SELECT * FROM post_types;    
        END;
        END IF;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListProductByIdcateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListProductByIdcateProcedure`(IN `_idcategory` int,IN `_page` int,`_idstore` int,`_limit` int,`_iduser` int)
SP:BEGIN                
            DECLARE _start int(11);
                        DECLARE _max_order int(11);
                        set @idorder:= 0;
                        set _start := 0;
                        set @_commit := 0;
                        if _iduser is NULL OR _iduser = '' THEN 
                            BEGIN
                                set _iduser = 36;
                            end;
                        end if;
                        call UserPermission(_iduser, _idcategory, 'select', @_commit);
                        if @_commit < 1 THEN 
                            BEGIN
                            SELECT @_commit as _commit, 0 as count_page;
                            LEAVE sp;
                            END;
                        END IF;
                        DROP TABLE IF EXISTS tmp_product1;
                        DROP TABLE IF EXISTS tmp_product2;
                        DROP TABLE IF EXISTS tmp_product3;
                        
            create TEMPORARY TABLE tmp_product1(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT info4.max_idimp_price, MAX(info4.idproducthasfile) as max_idproducthasfile FROM (SELECT info3.idproduct, info3.max_idimp_price, phf1.idproducthasfile FROM (SELECT info2.idproduct, MAX(info2.idimp) as max_idimp_price FROM (SELECT info1.idproduct, imp1.idimp FROM (SELECT cat.idproduct FROM (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory and checked > 0) as cat JOIN products as p ON p.idproduct = cat.idproduct where p.idstatus_type = 4) as info1 LEFT JOIN imp_products as imp1 on imp1.idproduct = info1.idproduct WHERE imp1.idcrosstype in (0,4) and imp1.id_status_type = 4 ) as info2 GROUP BY info2.idproduct) as info3 LEFT JOIN producthasfile as phf1 on phf1.idproduct = info3.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1) as info4 GROUP BY info4.idproduct ORDER BY info4.max_idimp_price DESC);
                        set _max_order = (SELECT COUNT(*) FROM tmp_product1 as tmp1);
                        create TEMPORARY TABLE tmp_product2(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT * FROM tmp_product1);
                        DROP TABLE tmp_product1;
                        create TEMPORARY TABLE tmp_product3(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL);
                        set @count_page = (_max_order DIV 12);
                        set @end_count_item = (_max_order % 12);        
                        if @end_count_item > 0 THEN
                            BEGIN
                                set @count_page = @count_page + 1;
                            END;
                        END if;
                        set _start = 1 + ((_page-1)*12);
                        set @str :='';
                        set @comma =',';
                        if _page = @count_page THEN
                            BEGIN
                                if _max_order % 12 = 0 THEN
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order) + 1;
                                    END;
                                ELSE
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order % 12) + 1;
                                    END;
                                END if;
                                
                            END;
                        ELSEIF _page < @count_page THEN
                            BEGIN
                                set @maxpage = (_page*12)+1;
                            END;
                        END if;
                        WHILE _start < @maxpage DO
                            if _start =  (@maxpage - 1) THEN
                                set @comma ='';
                            end if;
                            set @str = CONCAT(@str,'(',_start,')',@comma);
                            set _start = _start + 1;
                        END WHILE;
                        if  @str <> '' OR @str is NOT NULL THEN
                            BEGIN
                            set @str = CONCAT('INSERT into tmp_product3(idorder) VALUES ',@str);
                            SET @queryString = @str;
                                    PREPARE stmt FROM @queryString;
                                    EXECUTE stmt;
                                    DEALLOCATE PREPARE stmt;
                                SELECT @_commit as _commit, @count_page as count_page, info1.*,imp1.*,imp2.price as old_price, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description, p.id_post_type, pt.nametype FROM (SELECT tmp3.*, tmp2.max_idimp_price, tmp2.max_idproducthasfile FROM tmp_product3 as tmp3 LEFT JOIN tmp_product2 as tmp2 on tmp3.idorder = tmp2.id) as info1 LEFT JOIN imp_products as imp1 on info1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN producthasfile as phf1 on phf1.idproducthasfile = info1.max_idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on imp1.idproduct = p.idproduct LEFT JOIN post_types as pt on p.id_post_type = pt.idposttype;
                            END;
                        END if;
                        DROP TABLE tmp_product2;
                        DROP TABLE tmp_product3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListProductByIdcateProcedure_bk1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListProductByIdcateProcedure_bk1`(IN `_idcategory` int,IN `_page` int,`_idstore` int,`_limit` int,`_iduser` int)
SP:BEGIN                
            DECLARE _start int(11);
                        DECLARE _max_order int(11);
                        set @idorder:= 0;
                        set _start := 0;
                        set @_commit := 0;
                        if _iduser is NULL OR _iduser = '' THEN 
                            BEGIN
                                set _iduser = 36;
                            end;
                        end if;
                        call UserPermission(_iduser, _idcategory, 'select', @_commit);
                        if @_commit < 1 THEN 
                            BEGIN
                            SELECT @_commit as _commit, 0 as count_page;
                            LEAVE sp;
                            END;
                        END IF;
                        DROP TABLE IF EXISTS tmp_product1;
                        DROP TABLE IF EXISTS tmp_product2;
                        DROP TABLE IF EXISTS tmp_product3;
                        
            create TEMPORARY TABLE tmp_product1(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT info4.max_idimp_price, MAX(info4.idproducthasfile) as max_idproducthasfile FROM (SELECT info3.idproduct, info3.max_idimp_price, phf1.idproducthasfile FROM (SELECT info2.idproduct, MAX(info2.idimp) as max_idimp_price FROM (SELECT info1.idproduct, imp1.idimp FROM (SELECT cat.idproduct FROM (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory and checked > 0) as cat JOIN products as p ON p.idproduct = cat.idproduct where p.idstatus_type = 4) as info1 LEFT JOIN imp_products as imp1 on imp1.idproduct = info1.idproduct WHERE imp1.idcrosstype in (0,4) and imp1.id_status_type = 4 ) as info2 GROUP BY info2.idproduct) as info3 LEFT JOIN producthasfile as phf1 on phf1.idproduct = info3.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1) as info4 GROUP BY info4.idproduct ORDER BY info4.max_idimp_price DESC);
                        set _max_order = (SELECT COUNT(*) FROM tmp_product1 as tmp1);
                        create TEMPORARY TABLE tmp_product2(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT * FROM tmp_product1);
                        DROP TABLE tmp_product1;
                        create TEMPORARY TABLE tmp_product3(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL);
                        set @count_page = (_max_order DIV 12);
                        set @end_count_item = (_max_order % 12);        
                        if @end_count_item > 0 THEN
                            BEGIN
                                set @count_page = @count_page + 1;
                            END;
                        END if;
                        set _start = 1 + ((_page-1)*12);
                        set @str :='';
                        set @comma =',';
                        if _page = @count_page THEN
                            BEGIN
                                if _max_order % 12 = 0 THEN
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order) + 1;
                                    END;
                                ELSE
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order % 12) + 1;
                                    END;
                                END if;
                                
                            END;
                        ELSEIF _page < @count_page THEN
                            BEGIN
                                set @maxpage = (_page*12)+1;
                            END;
                        END if;
                        WHILE _start < @maxpage DO
                            if _start =  (@maxpage - 1) THEN
                                set @comma ='';
                            end if;
                            set @str = CONCAT(@str,'(',_start,')',@comma);
                            set _start = _start + 1;
                        END WHILE;
                        if  @str <> '' OR @str is NOT NULL THEN
                            BEGIN
                            set @str = CONCAT('INSERT into tmp_product3(idorder) VALUES ',@str);
                            SET @queryString = @str;
                                    PREPARE stmt FROM @queryString;
                                    EXECUTE stmt;
                                    DEALLOCATE PREPARE stmt;
                                SELECT @_commit as _commit, @count_page as count_page, info1.*,imp1.*,imp2.price as old_price, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description FROM (SELECT tmp3.*, tmp2.max_idimp_price, tmp2.max_idproducthasfile FROM tmp_product3 as tmp3 LEFT JOIN tmp_product2 as tmp2 on tmp3.idorder = tmp2.id) as info1 LEFT JOIN imp_products as imp1 on info1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN producthasfile as phf1 on phf1.idproducthasfile = info1.max_idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on imp1.idproduct = p.idproduct;
                            END;
                        END if;
                        DROP TABLE tmp_product2;
                        DROP TABLE tmp_product3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListProductByLstIdCateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListProductByLstIdCateProcedure`(IN `_str_query` TEXT)
BEGIN             
                DROP TABLE IF EXISTS tmp_cate;
                create TEMPORARY TABLE tmp_cate(idtmpcate INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idcate INTEGER not NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                select info.idproduct,info.namepro,info.price,f.urlfile from (SELECT info_phf.*,phf.idfile from (select info.* from (select inp.*,imp.idimp,imp.price from (select info_p.idproduct,p.namepro from (SELECT DISTINCT idproduct from catehasproduct as chp join tmp_cate as tmp_c on tmp_c.idcate = chp.idcategory) as info_p join products as p on info_p.idproduct = p.idproduct) as inp LEFT JOIN (select * from imp_products WHERE idcrosstype = 0 and idstore = 31) as imp on inp.idproduct = imp.idproduct) as info WHERE idimp > 0) as info_phf LEFT JOIN (SELECT * from producthasfile WHERE hastype = 1 ORDER BY idproducthasfile DESC) as phf on phf.idproduct = info_phf.idproduct) as info LEFT JOIN files as f on info.idfile = f.idfile LIMIT 50;
                DROP TABLE tmp_cate;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListProductComboProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListProductComboProcedure`(IN `_limit` INT(11))
BEGIN             
							select info4.idparentcross as idproduct, imp1.*, phf2.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description from (SELECT info3.*, MAX(phf1.idproducthasfile) as max_idproducthasfile FROM (SELECT info2.*, MAX(info2.idimp) as max_idimp_price FROM (SELECT info1.*, imp1.idimp FROM (SELECT idparentcross FROM imp_products WHERE idstore = 31 and id_status_type = 4 AND idcrosstype = 1 GROUP BY idparentcross) as info1 LEFT JOIN imp_products as imp1 on info1.idparentcross = imp1.idproduct WHERE idcrosstype in (0,4)) as info2 GROUP BY info2.idparentcross) as info3 LEFT JOIN producthasfile as phf1 on info3.idparentcross = phf1.idproduct GROUP BY info3.idparentcross) as info4 LEFT JOIN imp_products as imp1 ON info4.max_idimp_price = imp1.idimp LEFT JOIN producthasfile as phf2 on info4.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN products as p on info4.idparentcross = p.idproduct ORDER BY info4.idimp DESC limit _limit;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListProductProcedure`(IN `_start_date` VARCHAR(255), IN `_end_date` VARCHAR(255), IN `_idcategory` INT(11), IN `_id_post_type` INT(11), IN `_id_status_type` INT(11))
BEGIN
        DECLARE _now VARCHAR(255);
        DECLARE _str_start VARCHAR(255);
        DECLARE _now_time VARCHAR(255);
        SET _now_time = NOW();
        IF ( _start_date IS NULL OR _start_date ="") THEN
        BEGIN
            SET _now = DATE(_now_time);
            SET _str_start = CONCAT(_now," 00:00:00");
            SET _start_date = STR_TO_DATE(_str_start,"%Y-%m-%d %H:%i:%s");          
        END;
        END IF;
        IF ( _end_date IS NULL OR _end_date = "") THEN SET _end_date = _now_time;       
        END IF;  
            select info.created_at,info.idproduct,info.namepro,info.price,info.amount,(select urlfile from files where idfile = info.idfile) as urlfile,info.author,GROUP_CONCAT(info.namecat SEPARATOR ', ') as listcat from (select dtail.created_at,dtail.idproduct,dtail.namepro,dtail.price,dtail.amount,dtail.idfile,dtail.author, (select namecat from categories WHERE idcategory = prohas.idcategory AND prohas.idcategory is not null) as namecat from ( select detail.created_at,detail.idproduct,detail.namepro,detail.price,detail.amount,detail.idfile,(select `name` from users WHERE id = detail.iduser) as author from (select p.*,imp.price,imp.amount,imp.iduser,(select idfile from producthasfile WHERE idproduct = p.idproduct ORDER BY idproducthasfile DESC LIMIT 1) as idfile FROM (select pr.* from products as pr left join cross_product as c on pr.idproduct = c.idproduct_cross where c.idcrossproduct is NULL) as p JOIN imp_products as imp on p.idproduct = imp.idproduct) as detail) as dtail JOIN (select cate.* from (select * from catehasproduct where idcategory > 0) as cate left join exclude_category as excat on cate.idcategory = excat.idcategory where excat.idcategory is null ) as prohas on prohas.idproduct = dtail.idproduct) as info GROUP BY info.idproduct DESC LIMIT 100;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListRoleIdpermProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListRoleIdpermProcedure`(IN `id_perm` INT(11))
BEGIN
                select r.idrole, r.name, p.idimp_perm, p.idrole as id_role from roles as r LEFT join (select * from imp_perms where idperm=id_perm) as p on r.idrole=p.idrole;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListRolePermissionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListRolePermissionProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255))
sp:BEGIN
DECLARE allow int(2) DEFAULT 0;
	set allow = 0;
	CALL UserPermDashByCateProcedure ( _iduser, _command, _catnametype, _curent_url, allow );
	if allow = 0 THEN 
		BEGIN
			SELECT 0 as allow;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
			if _command = 'select' then
				begin
					SELECT *,1 as allow  from roles WHERE trash < 1;
				end;
			ELSEIF _command = 'create' then
				begin
					select 1 as allow;
				end;
			ELSEIF _command = 'edit' then
				begin
					select 1 as allow;
				end;
				ELSEIF _command = 'delete' then
				begin
					select 1 as allow;
				end;
			end if;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListRolesProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListRolesProcedure`()
BEGIN             
                SELECT p.`name`,p.description,pc.command,c.namecat FROM `permissions` as p LEFT JOIN perm_commands as pc on p.idpermcommand = pc.idpercommand LEFT JOIN categories as c on p.idcategory = c.idcategory;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListSelEmpDepartProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListSelEmpDepartProcedure`(IN `_iduser` INT(11))
BEGIN
                SELECT iddepart_employee, iddepart from depart_employees where iduser=_iduser;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListStatusTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListStatusTypeProcedure`(IN `_idparent` INT)
BEGIN
        IF _idparent > 0 THEN
        BEGIN
           SELECT * FROM status_types WHERE idparent = _idparent;
        END; 
        ELSE
        BEGIN
           SELECT * FROM status_types;    
        END;
        END IF;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListTypePostByIdcateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ListTypePostByIdcateProcedure`(IN `_idcategory` int,IN `_page` int,`_idstore` int,`_limit` int,`_iduser` int, `_idposttype` int )
SP:BEGIN                
            DECLARE _start int(11);
                        DECLARE _max_order int(11);
                        set @idorder:= 0;
                        set _start := 0;
                        set @_commit := 0;
                        if _iduser is NULL OR _iduser = '' THEN 
                            BEGIN
                                set _iduser = 36;
                            end;
                        end if;
												if _idposttype is NULL OR _idposttype = '' THEN 
                            BEGIN
                                set _idposttype = 10;
                            end;
                        end if;
                        call UserPermission(_iduser, _idcategory, 'select', @_commit);
                        if @_commit < 1 THEN 
                            BEGIN
                            SELECT @_commit as _commit, 0 as count_page;
                            LEAVE sp;
                            END;
                        END IF;
                        DROP TABLE IF EXISTS tmp_product1;
                        DROP TABLE IF EXISTS tmp_product2;
                        DROP TABLE IF EXISTS tmp_product3;
                        
            create TEMPORARY TABLE tmp_product1(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT info4.max_idimp_price, MAX(info4.idproducthasfile) as max_idproducthasfile FROM (SELECT info3.idproduct, info3.max_idimp_price, phf1.idproducthasfile FROM (SELECT info2.idproduct, MAX(info2.idimp) as max_idimp_price FROM (SELECT info1.idproduct, imp1.idimp FROM (SELECT cat.idproduct FROM (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory and checked > 0) as cat JOIN products as p ON p.idproduct = cat.idproduct and p.idstatus_type = 4 AND p.id_post_type = _idposttype) as info1 LEFT JOIN imp_products as imp1 on imp1.idproduct = info1.idproduct WHERE imp1.idimp is not NULL AND imp1.idcrosstype in (0,4)) as info2 GROUP BY info2.idproduct) as info3 LEFT JOIN producthasfile as phf1 on phf1.idproduct = info3.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1) as info4 GROUP BY info4.idproduct ORDER BY info4.max_idimp_price DESC);
                        set _max_order = (SELECT COUNT(*) FROM tmp_product1 as tmp1);
                        create TEMPORARY TABLE tmp_product2(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , max_idimp_price INTEGER not NULL, max_idproducthasfile INTEGER not NULL) as (SELECT * FROM tmp_product1);
                        DROP TABLE tmp_product1;
                        create TEMPORARY TABLE tmp_product3(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL);
                        set @count_page = (_max_order DIV 12);
                        set @end_count_item = (_max_order % 12);        
                        if @end_count_item > 0 THEN
                            BEGIN
                                set @count_page = @count_page + 1;
                            END;
                        END if;
                        set _start = 1 + ((_page-1)*12);
                        set @str :='';
                        set @comma =',';
                        if _page = @count_page THEN
                            BEGIN
                                if _max_order % 12 = 0 THEN
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order) + 1;
                                    END;
                                ELSE
                                    BEGIN
                                        set @maxpage = ((_page-1)*12) + (_max_order % 12) + 1;
                                    END;
                                END if;
                                
                            END;
                        ELSEIF _page < @count_page THEN
                            BEGIN
                                set @maxpage = (_page*12)+1;
                            END;
                        END if;
                        WHILE _start < @maxpage DO
                            if _start =  (@maxpage - 1) THEN
                                set @comma ='';
                            end if;
                            set @str = CONCAT(@str,'(',_start,')',@comma);
                            set _start = _start + 1;
                        END WHILE;
                        if  @str <> '' OR @str is NOT NULL THEN
                            BEGIN
                            set @str = CONCAT('INSERT into tmp_product3(idorder) VALUES ',@str);
                            SET @queryString = @str;
                                    PREPARE stmt FROM @queryString;
                                    EXECUTE stmt;
                                    DEALLOCATE PREPARE stmt;
                                SELECT @_commit as _commit, @count_page as count_page, info1.*,imp1.*,imp2.price as old_price, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description FROM (SELECT tmp3.*, tmp2.max_idimp_price, tmp2.max_idproducthasfile FROM tmp_product3 as tmp3 LEFT JOIN tmp_product2 as tmp2 on tmp3.idorder = tmp2.id) as info1 LEFT JOIN imp_products as imp1 on info1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN producthasfile as phf1 on phf1.idproducthasfile = info1.max_idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on imp1.idproduct = p.idproduct;
                            END;
                        END if;
                        DROP TABLE tmp_product2;
                        DROP TABLE tmp_product3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListTypeSelectedProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListTypeSelectedProcedure`(IN `id_post` INT(11))
BEGIN
                SELECT p.id_post_type as idposttype,(select nametype from post_types WHERE idposttype = p.id_post_type) as nameposttype,p.idcategory,(SELECT name FROM categories WHERE idcategory = p.idcategory) as namecate FROM posts as p WHERE p.idpost=id_post;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListViewProductByIdCateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ListViewProductByIdCateProcedure`(IN `_idcategory` INT(11))
BEGIN
            select allpro.* from (SELECT alp.*,imp.price,imp.price_sale_origin from (select pro.*,(select urlfile from files WHERE idfile = pro.idfile) as url from (select chp.idproduct,p.namepro,p.slug,p.short_desc,p.description,p.idsize,p.idcolor,(select idfile from producthasfile where hastype = 1 and idproduct = chp.idproduct ORDER BY idproducthasfile DESC LIMIT 1) as idfile from (SELECT * FROM catehasproduct WHERE idcategory=_idcategory) as chp JOIN products as p on chp.idproduct = p.idproduct) as pro) as alp JOIN (SELECT * from imp_products where idstore=31) as imp on alp.idproduct = imp.idproduct) as allpro order by allpro.idproduct DESC limit 10;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadOrderInitSessionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `LoadOrderInitSessionProcedure`(IN `_str_query` VARCHAR(255), IN `_idstore` INT(11), IN `_int_count` INT(11))
BEGIN
                DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                set @idorder:=(_int_count-1);
                create TEMPORARY TABLE tmp_product(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null) as (select idproduct,input_quality from tmp_product);
                select (@idorder:= @idorder + 1) as idorder,info.* from (select 0 as parent, tmp1.id, tmp1.idproduct as parent_in, tmp1.input_quality, imp1.idproduct,imp1.idcrosstype,imp1.idparentcross,imp1.amount,imp1.price_import,imp1.price,imp1.quality_sale from (SELECT * from tmp_product) as tmp1 JOIN (select * from imp_products WHERE idcrosstype = 0 and idstore = @_idstore and id_status_type = 4 and idparentcross = 0) as imp1 on tmp1.idproduct = imp1.idproduct UNION all select @_int_count as parent, tmp2.id, tmp2.idproduct as parent_in, tmp2.input_quality,imp2.idproduct,imp2.idcrosstype,imp2.idparentcross,imp2.amount,imp2.price_import,imp2.price,imp2.quality_sale from (SELECT * from temp_products) as tmp2 JOIN (select * from imp_products WHERE idstore = @_idstore and id_status_type = 4) as imp2 on tmp2.idproduct = imp2.idparentcross) as info;
                DROP TABLE tmp_product;
                DROP TABLE temp_products;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LstOrderFrmSessionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `LstOrderFrmSessionProcedure`(IN `_str_query` TEXT, IN `_idstore` INT(11))
BEGIN             
                DROP TABLE IF EXISTS tmp_product1;
                create TEMPORARY TABLE tmp_product1(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER  NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER  NULL,idproduct  INTEGER NULL,inp_session  INTEGER  NULL,trash INTEGER  NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
								SELECT info2.*,imp2.*, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description FROM (SELECT info1.*, MAX(phf.idproducthasfile) as max_idproducthasfile  FROM (SELECT tmp1.*, MAX(imp1.idimp) as max_idimp_price FROM tmp_product1 as tmp1 LEFT JOIN imp_products as imp1 on tmp1.idproduct = imp1.idproduct WHERE tmp1.idcrosstype = imp1.idcrosstype AND tmp1.idparentcross = imp1.idparentcross GROUP BY tmp1.idorder) as info1 LEFT JOIN producthasfile as phf on info1.idproduct = phf.idproduct GROUP BY info1.idorder) as info2 LEFT JOIN imp_products as imp2 on info2.max_idimp_price = imp2.idimp LEFT JOIN producthasfile as phf1 on info2.max_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on info2.idproduct = p.idproduct;
								/*select info.*, f.urlfile from (SELECT tmp1.*, p.namepro, p.slug, p.description, p.short_desc, latestidfile(p.idproduct,1) as idfile from (SELECT *, Fnc_latestprice(idproduct,idparentcross,_idstore) as price from tmp_product1) as tmp1 LEFT JOIN products as p on tmp1.idproduct = p.idproduct) as info LEFT JOIN files as f on info.idfile = f.idfile;*/
                DROP TABLE tmp_product1;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LstOrderFromSessionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `LstOrderFromSessionProcedure`(IN `_str_query` TEXT, IN `_idstore` INT(11))
BEGIN
                DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                set @idorder:=0;
                create TEMPORARY TABLE tmp_product(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER  NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER  NULL,idproduct  INTEGER NULL,inp_session  INTEGER  NULL,trash INTEGER  NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL) as (SELECT * from tmp_product);
								SELECT inf.* from (select info.*,p.namepro, p.short_desc, p.slug, p.description,phf.idfile,f.urlfile from (select tmp1.*, imp1.idcustomer, imp1.iduser, imp1.price, imp1.quality_sale, imp1.fromdate, imp1.todate from tmp_product as tmp1 left JOIN (select * from imp_products WHERE idstore = _idstore and id_status_type = 4 AND idparentcross = 0) as imp1 on tmp1.idproduct = imp1.idproduct and tmp1.idparentcross = imp1.idparentcross WHERE imp1.idproduct is not NULL UNION ALL select tmp2.*, imp2.idcustomer, imp2.iduser, imp2.price, imp2.quality_sale, imp2.fromdate, imp2.todate from temp_products as tmp2 left JOIN (select * from imp_products WHERE idstore = _idstore and id_status_type = 4 AND idparentcross > 0) as imp2 on tmp2.idproduct = imp2.idproduct and tmp2.idparentcross = imp2.idparentcross WHERE imp2.idproduct is not NULL) as info LEFT JOIN products as p on info.idproduct = p.idproduct LEFT JOIN producthasfile as phf on p.idproduct = phf.idproduct LEFT JOIN files as f on phf.idfile = f.idfile) as inf ORDER BY inf.idorder ASC;
                DROP TABLE tmp_product;
                DROP TABLE temp_products;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LstOrdSessionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `LstOrdSessionProcedure`(IN `_str_query` VARCHAR(255), IN `_idstore` INT(11))
BEGIN
               DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                create TEMPORARY TABLE tmp_product(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null) as (select idproduct,input_quality from tmp_product);
                select rs_info.* from (select inf.*,f.urlfile from (select al_info.*,phf.idfile FROM (select info_pro.namepro,info_pro.slug,info_pro.short_desc,info_pro.description,info_pro.parent,info_pro.id,info_pro.input_quality,imp.* from (select al_pros.*,0 as parent,0 as idcrosstype from (select p.idproduct,p.namepro,p.slug,p.short_desc,p.description,tmp_prs.id,tmp_prs.input_quality from temp_products as tmp_prs JOIN products as p on tmp_prs.idproduct = p.idproduct) as al_pros UNION all select al_pro.* from (select p.idproduct,p.namepro,p.slug,p.short_desc,p.description,pr.id, pr.input_quality,pr.parent,pr.idcrosstype from (select cp.idproduct,cp.idcrosstype,cp.idproduct_cross,tmp_p.id as parent,tmp_p.id, tmp_p.input_quality from tmp_product as tmp_p join cross_product as cp on tmp_p.idproduct = cp.idproduct) as pr join products as p on pr.idproduct_cross = p.idproduct) as al_pro) as info_pro join (select * from imp_products WHERE idstore = _idstore) as imp on info_pro.idproduct = imp.idproduct) as al_info LEFT JOIN producthasfile as phf on al_info.idproduct = phf.idproduct) as inf LEFT JOIN files as f on inf.idfile = f.idfile) as rs_info;
                DROP TABLE tmp_product;
                DROP TABLE temp_products;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LstParentByIdcattypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `LstParentByIdcattypeProcedure`(IN `_idcattype` INT(11))
BEGIN             
                IF _idcattype > 0 THEN
                BEGIN
                   SELECT c.idcategory, c.namecat FROM categories as c WHERE c.idcattype = _idcattype and c.idparent = 0;
                END; 
                ELSE
                BEGIN
                   SELECT c.* FROM categories as c;    
                END;
                END IF; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MakeCrosstypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `MakeCrosstypeProcedure`(IN `_idproduct` INT(11), IN `_iduser` INT(11), IN `_idcrosstype` INT(11), IN `_idparentcross` INT(11), IN `_price` INT(11), IN `_quality_sale` INT(11), IN `_idstore` INT(11), IN `_id_status_type` INT(11))
BEGIN             
      set @prev_id = 0;
			set @prev_id = ( SELECT MAX(idimp) as max_idimp FROM imp_products WHERE idstore = _idstore and id_status_type = 4 and idproduct = _idproduct and idcrosstype in (0,_idcrosstype) GROUP BY idproduct );
								insert into imp_products(idproduct, iduser, idcrosstype, idparentcross, price, quality_sale, idstore, id_status_type, prev_id) VALUES (_idproduct, _iduser, _idcrosstype, _idparentcross, _price, _quality_sale, _idstore, _id_status_type, @prev_id);
                select LAST_INSERT_ID() as idimp;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MenuHasIdcateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `MenuHasIdcateProcedure`(IN `_idmenu` INT(11), IN `_idcategory` INT(11), IN `_idparentmenu` INT(11))
BEGIN
               insert into menu_has_cate(idmenu,idcategory,idparentmenu) values (_idmenu,_idcategory,_idparentmenu);  
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostPopularProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `MostPopularProcedure`()
BEGIN 
                select info.created_at,info.idproduct,info.namepro,info.short_desc, info.price,info.amount,info.urlfile from (select dtail.created_at,dtail.idproduct,dtail.namepro,dtail.short_desc, dtail.price,dtail.amount,dtail.urlfile,dtail.author, (select namecat from categories WHERE idcategory = prohas.idcategory) as namecat from ( select detail.created_at,detail.idproduct,detail.namepro,detail.short_desc, detail.price,detail.amount,f.urlfile,(select `name` from users WHERE id = detail.iduser) as author from (select p.created_at,p.idproduct,p.namepro,p.short_desc, imp.price,imp.amount,imp.iduser,(select idfile from producthasfile WHERE idproduct = p.idproduct ORDER BY idproducthasfile DESC LIMIT 1) as idfile  FROM products as p JOIN imp_products as imp on p.idproduct = imp.idproduct) as detail join files as f on detail.idfile = f.idfile) as dtail JOIN (select * from catehasproduct where idcategory > 0) as prohas on prohas.idproduct = dtail.idproduct) as info limit 8; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MoveOrderToStoreProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `MoveOrderToStoreProcedure`(IN `_iduser` INT, IN `_idstore` INT, IN `_idexp` BIGINT)
BEGIN
	INSERT INTO imp_products (iduser,idstore,prev_idexp) VALUES (_iduser,_idstore,_idexp);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NewProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `NewProc`()
BEGIN
	/*set @pattern = '^admin/aduser/[0-9]+/edit$';*/
	DECLARE curent_url VARCHAR(255);
	DECLARE pattern VARCHAR(255);
	set curent_url = 'admin/aduser/create';
	/*set pattern = '^admin/aduser/[0-9]+/edit$';*/
	set pattern = 'admin/aduser/[1-9][0-9]+/edit';
	SELECT pathroute FROM categories WHERE pathroute = curent_url;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_old_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `new_old_price`(IN `_idproduct` BIGINT, IN `_idstore` INT, OUT `_newprice` INT, OUT `_oldprice` INT)
BEGIN
	set _newprice = 0;
	set _oldprice = 0;
	DROP TABLE IF EXISTS tmp_product1;
	DROP TABLE IF EXISTS tmp_product2;
   create TEMPORARY TABLE tmp_product1 (id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idimp INTEGER NULL, idproduct INTEGER null, idcrosstype INTEGER null, idparentcross INTEGER null, amount INTEGER NULL, price_import INTEGER null, price INTEGER NULL, quality_sale INTEGER NULL) as (select * from (select idimp, idproduct, idcrosstype, idparentcross, amount,price_import, price, quality_sale from imp_products WHERE idproduct = @_idproduct and idcrosstype = 0 and idstore = @_idstore and id_status_type = 4 and idparentcross = 0 UNION select idimp, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idparentcross = @_idproduct and idcrosstype = 4 and idstore = @_idstore and id_status_type = 4) as info ORDER BY info.idimp DESC LIMIT 2);
	 create TEMPORARY TABLE tmp_product2 (id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idimp INTEGER NULL, idproduct INTEGER null, idcrosstype INTEGER null, idparentcross INTEGER null, amount INTEGER NULL, price_import INTEGER null, price INTEGER NULL, quality_sale INTEGER NULL) as (SELECT * from tmp_product1);
	 SELECT info.*, p.namepro, p.short_desc, p.description, f.urlfile FROM (select tmp1.*,latestidfile(tmp1.idproduct,1) as idfile, tmp2.price as old_price from (SELECT * FROM tmp_product1 limit 1) as tmp1 LEFT JOIN tmp_product2 as tmp2 on tmp2.id = 2) as info LEFT JOIN products as p on info.idproduct = p.idproduct LEFT JOIN files as f on info.idfile = f.idfile;
	 DROP TABLE tmp_product1;
	 DROP TABLE tmp_product2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderHistoryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `OrderHistoryProcedure`(IN `_userid_order` INT(11), IN `_idproduct` BIGINT(20), IN `_quality` INT(11))
BEGIN
                insert into order_history(userid_order, idproduct, quality) values(_userid_order, _idproduct, _quality);
                SELECT LAST_INSERT_ID() as idorderhistory;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderProductFromSessionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `OrderProductFromSessionProcedure`(IN `_idcustomer` INT(11), IN `_idrecipent` INT(11), IN `_iduser` INT(11), IN `_note` TEXT CHARSET utf8mb4, IN `_fromnamestore` VARCHAR(255), IN `_tonamestore` VARCHAR(255), IN `_queryStr` TEXT)
BEGIN
                Declare _idcattype int;
                DECLARE _fromidstore int;
								DECLARE _toidstore int;
                DECLARE _idnumberorder int;
                DECLARE _axis_x INT(11);
                DECLARE _axis_y INT(11);
                DECLARE _axis_z INT(11);
								DECLARE ordertotal DOUBLE(20,0);
                set _axis_x = 0;
                set _axis_y = 0;
                set _axis_z = 0;
                set _idcattype = (select idcattype from category_types where catnametype='store');
                set _fromidstore = (select cat.idcategory from (select idcategory,shortname from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname=_fromnamestore);
								set _toidstore = (select cat.idcategory from (select idcategory,shortname from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname=_tonamestore);
								
								DROP TABLE IF EXISTS tmp_product1;
                DROP TABLE IF EXISTS temp_product2;
								DROP TABLE IF EXISTS temp_product3;
                create TEMPORARY TABLE tmp_product1(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER  NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER  NULL,idproduct  INTEGER NULL,inp_session  INTEGER  NULL,trash INTEGER  NULL);
                SET @queryString = _queryStr;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_product2(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL) as (SELECT * from tmp_product1);
								create TEMPORARY TABLE temp_product3(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL) as (SELECT * from tmp_product1);
									INSERT into listorder(note) VALUES (_note);
                    set _idnumberorder = (select LAST_INSERT_ID());
										/*set _idnumberorder = 52;*/
                    /*INSERT into exp_products(idnumberorder, idcrosstype, idproduct,idorder, parentidorder, idcustomer, idrecipent, iduser, amount, price, note, idstore, axis_x, axis_y, axis_z, id_status_type) */
										/*select _idnumberorder, info.idcrosstype, info.idproduct, info.idorder, info.parent, _idcustomer, _idrecipent, _iduser, info.inp_session, info.price,'' as note, _toidstore, _axis_x, _axis_y, _axis_z, info.trash from (select tmp1.*, imp1.idcustomer, imp1.iduser, imp1.price, imp1.quality_sale, imp1.fromdate, imp1.todate from tmp_product as tmp1 left JOIN (select * from imp_products WHERE idstore = _fromidstore and id_status_type = 4 AND idparentcross = 0) as imp1 on tmp1.idproduct = imp1.idproduct and tmp1.idparentcross = imp1.idparentcross WHERE imp1.idproduct is not NULL UNION ALL select tmp2.*, imp2.idcustomer, imp2.iduser, imp2.price, imp2.quality_sale, imp2.fromdate, imp2.todate from temp_products as tmp2 left JOIN (select * from imp_products WHERE idstore = _fromidstore and id_status_type = 4 AND idparentcross > 0) as imp2 on tmp2.idproduct = imp2.idproduct and tmp2.idparentcross = imp2.idparentcross WHERE imp2.idproduct is not NULL) as info order by info.idorder ASC;*/
										
										INSERT into exp_products(idnumberorder, idcrosstype, idproduct,idorder, parentidorder, idcustomer, idrecipent, iduser, amount, price, note, idstore, axis_x, axis_y, axis_z, id_status_type ,prev_idimp, prev_idproducthasfile) (SELECT _idnumberorder, info.idcrosstype, info.idproduct, info.idorder, info.parent, _idcustomer, _idrecipent, _iduser, info.inp_session, info.price,'' as note, _toidstore, _axis_x, _axis_y, _axis_z, info.trash, info.max_idimp_price, MAX(phf1.idproducthasfile) as max_idproducthasfile from (SELECT info1.*, imp1.price FROM (SELECT tmp1.*, MAX(imp1.idimp) as max_idimp_price FROM tmp_product1 as tmp1 LEFT JOIN imp_products as imp1 on tmp1.idproduct = imp1.idproduct WHERE tmp1.idcrosstype = imp1.idcrosstype AND tmp1.idparentcross = imp1.idparentcross GROUP BY tmp1.idorder) as info1 LEFT JOIN imp_products as imp1 on info1.max_idimp_price = imp1.idimp) as info LEFT JOIN producthasfile as phf1 on phf1.idproduct = info.idproduct WHERE phf1.hastype = 1 GROUP BY info.idorder);
												
										set ordertotal = (SELECT inf.ordertotal from (select idnumberorder,SUM(amount*price) as ordertotal from exp_products WHERE idnumberorder = _idnumberorder GROUP BY idnumberorder) as inf);
										select inp_f.*,f.urlfile,ordertotal from (select inf_p.*,phf.idfile from (select inf.*,p.namepro,p.slug,p.short_desc,p.description from (select * from exp_products WHERE idnumberorder = _idnumberorder) as inf LEFT JOIN products as p on inf.idproduct = p.idproduct) as inf_p LEFT JOIN producthasfile as phf on inf_p.prev_idproducthasfile = phf.idproducthasfile) as inp_f LEFT JOIN files f on inp_f.idfile = f.idfile;
                    DROP TABLE tmp_product1;
                    DROP TABLE temp_product2;
										DROP TABLE temp_product3;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `OrderProductProcedure`(IN `_ordernumber` INT(11), IN `_idproduct` INT(11), IN `_parentidproduct` INT(11), IN `_idcustomer` INT(11), IN `_idrecipent` INT(11), IN `_iduser` INT(11), IN `_amount` DOUBLE(20,0), IN `_price` DOUBLE(20,0), IN `_note` TEXT CHARSET utf8mb4, IN `_namestore` VARCHAR(255), IN `_axis_x` INT(11), IN `_axis_y` INT(11), IN `_axis_z` INT(11), IN `_id_status_type` INT(11))
BEGIN
								 Declare _idcattype int;
								 DECLARE _idstore int;
								 set _idstore = 0;
                 set _idcattype = (select idcattype from category_types where catnametype="store");
								 set _idstore = (select cat.idcategory from (select idcategory,shortname from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname=_namestore);
								 INSERT into exp_products(ordernumber, idproduct, parentidproduct, idcustomer, idrecipent, iduser, amount, price, note, idstore, axis_x, axis_y, axis_z, id_status_type) VALUES( _ordernumber, _idproduct, _parentidproduct,_idcustomer, _idrecipent, _iduser, _amount, _price, _note, _idstore, _axis_x, _axis_y, _axis_z, _id_status_type);
								 select LAST_INSERT_ID() as ordernumber;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PermissionByidProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `PermissionByidProcedure`(IN `_idperm` INT(11))
BEGIN             
                SELECT p.*,c.idcattype FROM (SELECT * from permissions WHERE idperm = _idperm) as p LEFT JOIN categories as c on p.idcategory = c.idcategory;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PermissonDashboardProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `PermissonDashboardProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), `_catnametype` VARCHAR(255), OUT `result` BIT)
sp:BEGIN
	set @_idrole = (SELECT idrole FROM `grants` WHERE to_iduser= _iduser limit 1);
	if @_idrole is NULL THEN
		BEGIN
			set result = 0;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
		set @_idcommand = (SELECT idpercommand from perm_commands WHERE command = _command);
		if @_idcommand IS NULL THEN 
			BEGIN
			set result = 0;
			LEAVE sp;
			END;
		END IF;
		set @_idcatetype = (SELECT idcattype FROM category_types WHERE catnametype = _catnametype);
		SELECT cat1.*, CASE WHEN cat2.idparent > 0 THEN 1 ELSE 0 END haschild from (select c.* from ( select DISTINCT perm.idcategory from (SELECT idrole FROM `grants` WHERE to_iduser= _iduser) as tbl_role LEFT JOIN imp_perms as imp on imp.idrole = tbl_role.idrole LEFT JOIN permissions as perm on imp.idperm = perm.idperm LEFT JOIN perm_commands as pcom on pcom.idpercommand = perm.idpermcommand WHERE pcom.idpercommand = @_idcommand) as cateperm LEFT JOIN categories as c on c.idcategory = cateperm.idcategory WHERE c.idcattype = @_idcatetype) as cat1 LEFT JOIN (select DISTINCT c.idparent from ( select DISTINCT perm.idcategory from (SELECT idrole FROM `grants` WHERE to_iduser= _iduser) as tbl_role LEFT JOIN imp_perms as imp on imp.idrole = tbl_role.idrole LEFT JOIN permissions as perm on imp.idperm = perm.idperm LEFT JOIN perm_commands as pcom on pcom.idpercommand = perm.idpermcommand WHERE pcom.idpercommand = @_idcommand) as cateperm LEFT JOIN categories as c on c.idcategory = cateperm.idcategory WHERE c.idcattype = @_idcatetype) as cat2 on cat1.idcategory = cat2.idparent;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PostByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `PostByIdProcedure`(IN `id_post` INT(11))
BEGIN
                SELECT p.title,p.body,p.slug,p.id_post_type as idposttype,(select nametype from post_types WHERE idposttype = p.id_post_type) as nameposttype,p.idcategory,(SELECT namecat FROM categories WHERE idcategory = p.idcategory) as namecate FROM posts as p WHERE p.idpost=id_post;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PostHasFileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `PostHasFileProcedure`(IN `_idpost` INT(11), IN `_idfile` INT(11))
BEGIN
                INSERT INTO post_has_files(idpost,idfile) VALUES (_idpost,_idfile);
                SELECT LAST_INSERT_ID() as idposthasfile;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductBelongCategoryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ProductBelongCategoryProcedure`(IN `_list_idcat` TEXT CHARSET utf8mb4)
BEGIN
                SET @s = CONCAT("INSERT INTO catehasproduct (idproduct,idcategory) VALUES ", _list_idcat); 
                PREPARE stmt1 FROM @s; 
                EXECUTE stmt1; 
                DEALLOCATE PREPARE stmt1;             
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductByIdposttypeIdcateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ProductByIdposttypeIdcateProcedure`(IN `_idcategory` INT(11), IN `_idstore` INT(11), IN `_limit` INT(11), IN `_idposttype` INT(11))
BEGIN             
                SELECT inf1.*, imp1.*, imp2.price as old_price, phf.max_idproducthasfile, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description from (SELECT pc.*, info_pr.max_idimp_price from (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory and checked > 0) as pc LEFT JOIN (SELECT MAX(idimp) as max_idimp_price, idproduct from (SELECT * FROM `imp_products` WHERE idstore = _idstore AND id_status_type = 4 and idcrosstype in (0,4)) as inf_price GROUP BY inf_price.idproduct) as info_pr ON pc.idproduct = info_pr.idproduct WHERE info_pr.idproduct is not NULL) as inf1 LEFT JOIN imp_products as imp1 on inf1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN (SELECT MAX(idproducthasfile) as max_idproducthasfile,idproduct FROM producthasfile WHERE hastype = 1 and status_file = 1 GROUP BY idproduct) as phf on inf1.idproduct = phf.idproduct LEFT JOIN producthasfile as phf1 on phf.max_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on inf1.idproduct = p.idproduct and p.id_post_type = _idposttype ORDER BY imp1.idimp DESC limit _limit;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProducthasFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ProducthasFile`(IN `_list_file` TEXT, IN `_sign` VARCHAR(10), IN `_hastype` VARCHAR(255), IN `_idproduct` INT(11))
BEGIN
                DECLARE x INT;
								DECLARE _idfile INT;
                DECLARE str_item VARCHAR(255);
                DECLARE item VARCHAR(255);
                DECLARE result VARCHAR(255);
                DECLARE rs_split VARCHAR(255); 
                SET x = LENGTH(_list_file);
                set result = "";
                set str_item ="";
                SET item = "";
								set _idfile = 0;
                set rs_split = _list_file;
                WHILE x  > 0 DO
                set item = SUBSTRING_INDEX(rs_split, _sign, -1);
                set rs_split = SUBSTRING(_list_file, 1, (LENGTH(rs_split)-LENGTH(item)-1));
                set str_item = CONCAT("(",item,")");
                call InsertFilePath(str_item, _idfile);
								INSERT into producthasfile(idproduct,hastype,idfile) VALUES (_idproduct,_hastype,_idfile);
                set x = LENGTH(rs_split);
                END WHILE;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProducthasFileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ProducthasFileProcedure`(IN `_urlfile` VARCHAR(255), IN `_name_origin` VARCHAR(255), IN `_namefile` VARCHAR(255), IN `_typefile` VARCHAR(255), IN `_idproduct` INT(11), IN `_hastype` INT(10))
BEGIN
               DECLARE _idfile INT(11);
               INSERT INTO files(urlfile,name_origin,namefile, typefile) VALUES (_urlfile,_name_origin, _namefile, _typefile);
               set _idfile = LAST_INSERT_ID();
               INSERT INTO producthasfile(idproduct,hastype,idfile) VALUES (_idproduct,_hastype,_idfile);
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReachInitSessionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ReachInitSessionProcedure`(IN `_str_query` TEXT, IN `_idstore` INT(11), IN `_int_count` INT(11))
BEGIN             
                DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                set @idorder:=(_int_count-1);
                create TEMPORARY TABLE tmp_product(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null) as (select idproduct,input_quality from tmp_product);
								select (@idorder:= @idorder + 1) as idorder, info.* from (select 0 as parent, tmp1.id, tmp1.idproduct as parent_in, tmp1.input_quality, imp1.idproduct,imp1.idcrosstype,imp1.idparentcross,imp1.amount,imp1.price_import,imp1.price,imp1.quality_sale from (SELECT * from tmp_product) as tmp1 JOIN (select * from imp_products WHERE idcrosstype = 0 and idstore = _idstore and id_status_type = 4 and idparentcross = 0) as imp1 on tmp1.idproduct = imp1.idproduct UNION all select _int_count as parent, tmp2.id, tmp2.idproduct as parent_in, tmp2.input_quality,imp2.idproduct,imp2.idcrosstype,imp2.idparentcross,imp2.amount,imp2.price_import,imp2.price,imp2.quality_sale from (SELECT * from temp_products) as tmp2 JOIN (select * from imp_products WHERE idstore = _idstore and id_status_type = 4) as imp2 on tmp2.idproduct = imp2.idparentcross) as info;
								DROP TABLE tmp_product;
                DROP TABLE temp_products;	
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RelateProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `RelateProductProcedure`()
BEGIN
                select info.created_at,info.idproduct,info.namepro,info.short_desc, info.price_import, info.price, info.amount,info.urlfile from (select dtail.created_at,dtail.idproduct,dtail.namepro,dtail.short_desc, dtail.price_import, dtail.price, dtail.amount,dtail.urlfile,dtail.author, (select namecat from categories WHERE idcategory = prohas.idcategory) as namecat from ( select detail.created_at,detail.idproduct,detail.namepro,detail.short_desc, detail.price_import, detail.price, detail.amount,f.urlfile,(select `name` from users WHERE id = detail.iduser) as author from (select p.created_at,p.idproduct,p.namepro,p.short_desc, imp.price_import, imp.price, imp.amount,imp.iduser,(select idfile from producthasfile WHERE idproduct = p.idproduct and hastype=1 ORDER BY idproducthasfile DESC LIMIT 1) as idfile  FROM (select pr.* from products as pr left join cross_product as c on pr.idproduct = c.idproduct_cross where c.idcrossproduct is NULL) as p JOIN imp_products as imp on p.idproduct = imp.idproduct) as detail join files as f on detail.idfile = f.idfile) as dtail JOIN (select * from catehasproduct where idcategory > 0) as prohas on prohas.idproduct = dtail.idproduct) as info limit 8; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ReportProductProcedure`(IN `strqr_tmp_cate` TEXT, IN `_id_post_type` INT, IN `_id_status_type` INT, IN `_idstore` INT, IN `_start_date` TIMESTAMP, `_end_date` TIMESTAMP)
BEGIN
set @rg = (select strqr_tmp_cate REGEXP '^[(0-9,)]{1,}');
if @rg > 0 THEN 
BEGIN
	DROP TABLE IF EXISTS tmp_category;
	create TEMPORARY TABLE tmp_category(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idcategory INTEGER not NULL);
	set @str = CONCAT('INSERT into tmp_category(idcategory) VALUES ', strqr_tmp_cate);
	SET @queryString = @str;
	PREPARE stmt FROM @queryString;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	select info8.*, imp2.*, phf2.idfile, f.urlfile, u.`name` as author from (SELECT info7.*, MAX(info7.idproducthasfile) as max_idproducthasfile FROM (select info6.*,phf1.idproducthasfile from (SELECT info5.*,MAX(info5.idimp) as max_idimp from (select info4.*, imp1.idimp,imp1.idcrosstype from (SELECT info3.*, GROUP_CONCAT(info3.namecat SEPARATOR ', ') as listcat from (select info2.*,c.namecat from (select info1.*,p.namepro, p.slug, p.short_desc, p.description FROM ( SELECT chp.idproduct, chp.idcategory from catehasproduct as chp right JOIN tmp_category as tmp_c on chp.idcategory = tmp_c.idcategory WHERE chp.checked > 0 and chp.created_at BETWEEN _start_date and _end_date) as info1 LEFT JOIN products as p on info1.idproduct = p.idproduct WHERE p.idstatus_type = _id_status_type AND p.idproduct is not NULL and p.id_post_type = _id_post_type and p.created_at BETWEEN _start_date AND _end_date) as info2 LEFT JOIN categories as c on c.idcategory = info2.idcategory) as info3 GROUP BY info3.idproduct) as info4 LEFT JOIN imp_products as imp1 on info4.idproduct = imp1.idproduct WHERE imp1.idstore=_idstore AND imp1.id_status_type = 4 AND imp1.idcrosstype in (0,4) and imp1.idimp is not NULL) as info5 GROUP BY info5.idproduct) as info6 LEFT JOIN producthasfile as phf1 on info6.idproduct = phf1.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1 and phf1.idproducthasfile is not NULL) as info7 GROUP BY info7.idproduct) as info8 LEFT JOIN imp_products as imp2 on info8.max_idimp = imp2.idimp LEFT JOIN producthasfile as phf2 on info8.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN users as u on imp2.iduser = u.id ORDER BY info8.max_idimp DESC LIMIT 100;
	DROP TABLE tmp_category;
END;
ELSE
	begin
			SELECT info7.*,imp2.*, phf2.idfile, f.urlfile, u.`name` as author FROM (SELECT info6.*, MAX(info6.idproducthasfile) as max_idproducthasfile FROM (SELECT info5.*,phf1.idproducthasfile FROM (SELECT info4.*,MAX(info4.idimp) as max_idimp FROM (SELECT info3.*, imp1.idimp,imp1.idcrosstype from ( SELECT info2.*,GROUP_CONCAT(info2.namecat SEPARATOR ', ') as listcat FROM (SELECT info1.*,p.namepro, p.slug, p.short_desc, p.description FROM (SELECT cate.idcategory, cate.namecat, chp.idcateproduct, chp.idproduct FROM catehasproduct as chp LEFT JOIN categories as cate on cate.idcategory = chp.idcategory WHERE chp.idcateproduct is not NULL and chp.checked > 0 and chp.created_at BETWEEN _start_date AND _end_date) as info1 LEFT JOIN products as p on info1.idproduct = p.idproduct WHERE p.idstatus_type = _id_status_type AND p.idproduct is not NULL and id_post_type = _id_post_type and created_at BETWEEN _start_date AND _end_date) as info2 GROUP BY info2.idproduct ) as info3 LEFT JOIN imp_products as imp1 on info3.idproduct = imp1.idproduct WHERE imp1.idstore=_idstore AND imp1.id_status_type = 4 AND imp1.idcrosstype in (0,4) and imp1.idimp is not NULL) as info4 GROUP BY info4.idproduct) as info5 LEFT JOIN producthasfile as phf1 on info5.idproduct = phf1.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1 and phf1.idproducthasfile is not NULL) as info6 GROUP BY info6.idproduct) as info7 LEFT JOIN imp_products as imp2 on info7.max_idimp = imp2.idimp LEFT JOIN producthasfile as phf2 on info7.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN users as u on imp2.iduser = u.id ORDER BY info7.max_idimp DESC limit 100;
	END;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportProductProcedure_bk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `ReportProductProcedure_bk`(IN `strqr_tmp_cate` TEXT, IN `_id_post_type` INT, IN `_id_status_type` INT, IN `_idstore` INT, IN `_start_date` TIMESTAMP, `_end_date` TIMESTAMP)
BEGIN
set @rg = (select strqr_tmp_cate REGEXP '^[(0-9,)]{1,}');
if @rg > 0 THEN
BEGIN 
	DROP TABLE IF EXISTS tmp_category;
	create TEMPORARY TABLE tmp_category(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idcategory INTEGER not NULL);
	set @str = CONCAT('INSERT into tmp_category(idcategory) VALUES ', strqr_tmp_cate);
	SET @queryString = @str;
	PREPARE stmt FROM @queryString;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	select info8.*, imp2.*, phf2.idfile, f.urlfile, u.`name` as author from (SELECT info7.*, MAX(info7.idproducthasfile) as max_idproducthasfile FROM (select info6.*,phf1.idproducthasfile from (SELECT info5.*,MAX(info5.idimp) as max_idimp from (select info4.*, imp1.idimp,imp1.idcrosstype from (SELECT info3.*, GROUP_CONCAT(info3.namecat SEPARATOR ', ') as listcat from (select info2.*,c.namecat from (select info1.*,p.namepro, p.slug, p.short_desc, p.description FROM ( SELECT chp.idproduct, chp.idcategory from catehasproduct as chp right JOIN tmp_category as tmp_c on chp.idcategory = tmp_c.idcategory WHERE chp.created_at BETWEEN _start_date and _end_date ) as info1 LEFT JOIN products as p on info1.idproduct = p.idproduct WHERE p.idstatus_type = _id_status_type AND p.idproduct is not NULL and p.id_post_type = _id_post_type and p.created_at BETWEEN _start_date AND _end_date) as info2 LEFT JOIN categories as c on c.idcategory = info2.idcategory) as info3 GROUP BY info3.idproduct) as info4 LEFT JOIN imp_products as imp1 on info4.idproduct = imp1.idproduct WHERE imp1.idstore=_idstore AND imp1.id_status_type = 4 AND imp1.idcrosstype in (0,4) and imp1.idimp is not NULL) as info5 GROUP BY info5.idproduct) as info6 LEFT JOIN producthasfile as phf1 on info6.idproduct = phf1.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1 and phf1.idproducthasfile is not NULL) as info7 GROUP BY info7.idproduct) as info8 LEFT JOIN imp_products as imp2 on info8.max_idimp = imp2.idimp LEFT JOIN producthasfile as phf2 on info8.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN users as u on imp2.iduser = u.id ORDER BY info8.max_idimp DESC LIMIT 100;
	DROP TABLE tmp_category;
END;
ELSE
BEGIN
	SELECT info7.*,imp2.*, phf2.idfile, f.urlfile, u.`name` as author FROM (SELECT info6.*, MAX(info6.idproducthasfile) as max_idproducthasfile FROM (SELECT info5.*,phf1.idproducthasfile FROM (SELECT info4.*,MAX(info4.idimp) as max_idimp FROM (SELECT info3.*, imp1.idimp,imp1.idcrosstype from ( SELECT info2.*,GROUP_CONCAT(info2.namecat SEPARATOR ', ') as listcat FROM (SELECT info1.*,p.namepro, p.slug, p.short_desc, p.description FROM (SELECT cate.idcategory, cate.namecat, chp.idcateproduct, chp.idproduct FROM catehasproduct as chp LEFT JOIN categories as cate on cate.idcategory = chp.idcategory WHERE chp.idcateproduct is not NULL and chp.created_at BETWEEN _start_date AND _end_date) as info1 LEFT JOIN products as p on info1.idproduct = p.idproduct WHERE p.idstatus_type = _id_status_type AND p.idproduct is not NULL and id_post_type = _id_post_type and created_at BETWEEN _start_date AND _end_date) as info2 GROUP BY info2.idproduct ) as info3 LEFT JOIN imp_products as imp1 on info3.idproduct = imp1.idproduct WHERE imp1.idstore=_idstore AND imp1.id_status_type = 4 AND imp1.idcrosstype in (0,4) and imp1.idimp is not NULL) as info4 GROUP BY info4.idproduct) as info5 LEFT JOIN producthasfile as phf1 on info5.idproduct = phf1.idproduct WHERE phf1.hastype = 1 and phf1.status_file = 1 and phf1.idproducthasfile is not NULL) as info6 GROUP BY info6.idproduct) as info7 LEFT JOIN imp_products as imp2 on info7.max_idimp = imp2.idimp LEFT JOIN producthasfile as phf2 on info7.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN users as u on imp2.iduser = u.id ORDER BY info7.max_idimp DESC limit 100;
END;
END IF;
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelAllColorProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelAllColorProcedure`()
BEGIN
                select idcolor,value from color; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelAllSizeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelAllSizeProcedure`()
BEGIN
                select idsize,value from size; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelCategorybyIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelCategorybyIdProcedure`(IN `idcat` INT(11))
BEGIN
                SELECT c1.idcategory, c1.namecat, c1.idcattype, (select catnametype from category_types where idcattype=c1.idcattype) as catnametype, c1.idparent, c2.namecat as parent from (select * from categories where idcategory=idcat) as c1 left Join categories as c2 on c1.idparent = c2.idcategory;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelCateSelectedProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelCateSelectedProcedure`(IN `_idproduct` INT(11))
BEGIN
                SELECT c.idcateproduct,c.idcategory from catehasproduct as c where c.idproduct = _idproduct and c.checked > 0 ORDER BY c.idcateproduct;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelCityTownProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelCityTownProcedure`()
BEGIN
                 select idcitytown, namecitytown from city_town; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelCrossProductByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelCrossProductByIdProcedure`(IN `_idproduct` INT(11), IN `_idcrosstype` INT(11))
BEGIN
								select infoc.*, (SELECT urlfile FROM files where idfile = infoc.idfile) as urlfile from (select pro.idproduct,pro.namepro, pro.short_desc, pro.description, pro.idsize,(select `value` from size where idsize = pro.idsize) as size,pro.idcolor,(select `value` from color where idcolor = pro.idcolor) as color,imp.price_import, imp.price, imp.price_sale_origin, imp.price_combo, imp.quality_combo, imp.price_gift, imp.quality_gift, imp.amount,(SELECT idfile from producthasfile WHERE idproduct= pro.idproduct and hastype= 1 ORDER BY idproducthasfile DESC LIMIT 1) as idfile from (select p.* from (SELECT idproduct_cross FROM cross_product WHERE idproduct = _idproduct and idcrosstype = _idcrosstype) as crp left join products as p on p.idproduct = crp.idproduct_cross) as pro join imp_products as imp on pro.idproduct = imp.idproduct) as infoc;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelCrossTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelCrossTypeProcedure`()
BEGIN
               SELECT * FROM cross_type;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelDelCategoryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `SelDelCategoryProcedure`(IN `_idcategory` int)
BEGIN          
   update categories set trash = 1 where idcategory = _idcategory;
	SELECT (select catnametype from category_types where idcattype = c.idcattype) as catenametype FROM categories as c where c.idcategory = _idcategory;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelDepartmentByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelDepartmentByIdProcedure`(IN `_iddepart` INT(11))
BEGIN
                SELECT c1.iddepart, c1.namedepart, c1.idparent, c2.namedepart as parent from (select * from departments where iddepart=_iddepart) as c1 left Join departments as c2 on c1.idparent = c2.iddepart;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelDicstrictProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelDicstrictProcedure`(IN `_idcitytown` INT(11))
BEGIN
                 select iddistrict,namedist from district where idcitytown =_idcitytown; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelectProfileByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelectProfileByIdProcedure`(IN `_idprofile` INT)
BEGIN
	select * from `profile` WHERE idprofile=_idprofile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelectProfileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelectProfileProcedure`(IN `_iduser` INT(11))
BEGIN
                select u.*,p.* from (select id,email from users where id = _iduser) as u JOIN `profile` as p on u.id = p.iduser;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelGalleryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelGalleryProcedure`(IN `_idproduct` INT(11), IN `_idgallery` INT(10))
BEGIN
                select pf.idproducthasfile,f.idfile,f.urlfile from (SELECT idproducthasfile,idfile from producthasfile  where idproduct = _idproduct and hastype = _idgallery and status_file='1') as pf join files as f on pf.idfile = f.idfile;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelIdcategoryBySlugProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `SelIdcategoryBySlugProcedure`(IN `_slug` varchar(255))
BEGIN
		SET @slug = CONCAT(_slug, '%');          
		select idcategory from categories WHERE slug like @slug and trash < 1 limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelIdproductBySlugProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `SelIdproductBySlugProcedure`(IN `_slug` varchar(255))
BEGIN
                SET @slug = CONCAT(_slug, '%');          
                select p.idproduct,(select nametype from post_types WHERE idposttype = p.id_post_type) as nametype from products as p WHERE slug like @slug limit 1;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelIdproductHisProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelIdproductHisProcedure`(IN `_idhis` BIGINT(20))
BEGIN
               SELECT idproduct FROM `order_history` where idorderhistory = _idhis;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelImportByIDProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelImportByIDProductProcedure`(IN `_idproduct` INT(11), IN `_idstore` INT(11))
BEGIN
               SELECT p.namepro, p. slug, p.short_desc, p.description, info.*, phf.max_idproducthasfile, phf2.idfile, f.urlfile FROM (SELECT * FROM imp_products WHERE idstore = _idstore AND id_status_type = 4 and idproduct = _idproduct and idcrosstype > 0) as info LEFT JOIN (SELECT max(phf1.idproducthasfile) as max_idproducthasfile, phf1.idproduct from (SELECT * from producthasfile WHERE hastype = 1 and status_file = 1) as phf1 GROUP BY phf1.idproduct) as phf on info.idparentcross = phf.idproduct LEFT JOIN producthasfile as phf2 on  phf.max_idproducthasfile = phf2.idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN products as p on phf2.idproduct = p.idproduct;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SellistcategorybyidProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SellistcategorybyidProcedure`(IN `_idcat` INT(11))
BEGIN
     SELECT idcategory, namecat from categories where idparent = _idcat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelListDepartmentByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelListDepartmentByIdProcedure`(IN `_iddepart` INT(11))
BEGIN
                SELECT c1.iddepart, c1.namedepart from departments as c1 where c1.idparent = _iddepart;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelListOrderSesProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelListOrderSesProcedure`(IN `_str_query` VARCHAR(255), IN `_idstore` INT(11))
BEGIN
                DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                set @idorder:=0;
                create TEMPORARY TABLE tmp_product(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null) as (select idproduct,input_quality from tmp_product);
                select (@idorder:= @idorder + 1) as idorder, info_pro.idcrosstype,info_pro.parent,info_pro.id,info_pro.input_quality,imp.*,(CASE WHEN info_pro.idcrosstype = 1 THEN info_pro.input_quality*imp.quality_combo WHEN info_pro.idcrosstype = 2 THEN info_pro.input_quality*imp.quality_gift ELSE info_pro.input_quality END) as inp_session from (select al_pros.*,0 as parent,0 as idcrosstype from (select p.idproduct,tmp_prs.id,tmp_prs.input_quality from temp_products as tmp_prs JOIN products as p on tmp_prs.idproduct = p.idproduct) as al_pros UNION all select al_pro.* from (select p.idproduct,pr.id, pr.input_quality,pr.parent,pr.idcrosstype from (select cp.idproduct,cp.idcrosstype,cp.idproduct_cross,tmp_p.id as parent,tmp_p.id, tmp_p.input_quality from tmp_product as tmp_p join cross_product as cp on tmp_p.idproduct = cp.idproduct) as pr join products as p on pr.idproduct_cross = p.idproduct) as al_pro) as info_pro join (select idproduct,price,price_gift,quality_gift,price_combo,quality_combo from imp_products WHERE idstore = _idstore) as imp on info_pro.idproduct = imp.idproduct;
                DROP TABLE tmp_product;
                DROP TABLE temp_products;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelParentCrossProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelParentCrossProductProcedure`(IN `_idproduct` INT(11))
BEGIN
                 select idproduct from cross_product where idproduct_cross = _idproduct limit 1;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelParentProductCrossProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelParentProductCrossProcedure`(IN `_idproduct` INT(11))
BEGIN
               select idparentcross from imp_products where idproduct = _idproduct limit 1;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelProductByIdimpProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelProductByIdimpProcedure`(IN `_idimp` INT(11))
BEGIN
               select idproduct,idcrosstype,idparentcross,price,quality_sale from imp_products WHERE idimp = _idimp;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelProductByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `SelProductByIdProcedure`(IN `_idproduct` INT(11), IN `_idstore` INT(11), IN `_iduser` INT)
sp:BEGIN
						set @_commit := 0;
						call UserProductPermissionProcedure(_iduser,'select',_idproduct , @_commit );
						if @_commit < 1 THEN 
							BEGIN
							SELECT @_commit as _commit;
							LEAVE sp;
							END;
						END IF;
						
    SELECT  @_commit as _commit, p.namepro,p.short_desc, p.slug, p.description, info3.*, imp1.*, imp2.price as old_price, phf.idfile as idfile, f.urlfile as url_thumbnail, pt.nametype from (SELECT info1.idproduct, info1.max_idimp_price, info2.max_idproducthasfile from (SELECT MAX(idimp) as max_idimp_price, info.idproduct FROM (SELECT * FROM imp_products WHERE idstore = _idstore and id_status_type = 4 and idproduct = _idproduct and idcrosstype in (0,4)) as info GROUP BY info.idproduct) as info1 LEFT JOIN (SELECT MAX(idproducthasfile) as max_idproducthasfile,idproduct from producthasfile WHERE idproduct = _idproduct and hastype = 1 GROUP BY idproduct) as info2 on info1.idproduct = info2.idproduct) as info3 LEFT JOIN products as p on info3.idproduct = p.idproduct LEFT JOIN imp_products as imp1 on info3.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 on imp1.prev_id = imp2.idimp LEFT JOIN producthasfile as phf on info3.max_idproducthasfile = phf.idproducthasfile LEFT JOIN files as f on phf.idfile = f.idfile LEFT JOIN post_types as pt on p.id_post_type = pt.idposttype;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelProductCrossByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelProductCrossByIdProcedure`(IN `_idproduct` INT(11))
BEGIN
               set @idorder:= 0;
							 SELECT info2.*,imp1.*, p.namepro, p.slug, p.short_desc, p.description, phf2.idfile, f.urlfile, ct.namecross FROM (SELECT info1.*, MAX(info1.idproducthasfile) as max_idproducthasfile FROM (SELECT (@idorder:= @idorder + 1) as idorder, imp1.idimp, imp1.idproduct, phf1.idproducthasfile from (SELECT * FROM imp_products WHERE idstore = 31 and id_status_type = 4 and idparentcross = _idproduct and idcrosstype <> 4 and idcrosstype > 0) as imp1 LEFT JOIN producthasfile as phf1 on imp1.idproduct = phf1.idproduct) as info1 GROUP BY info1.idorder) as info2 LEFT JOIN imp_products as imp1 on info2.idimp = imp1.idimp LEFT JOIN products as p on info2.idproduct = p.idproduct LEFT JOIN producthasfile as phf2 on phf2.idproducthasfile = info2.max_idproducthasfile LEFT JOIN files as f on phf2.idfile = f.idfile LEFT JOIN cross_type as ct on ct.idcrosstype = imp1.idcrosstype;
		
							 /*select inf_p.*,f.urlfile from (select inf.*,phf.idfile from (SELECT imp.idimp,imp.idproduct, imp.idcrosstype,(SELECT namecross FROM cross_type WHERE idcrosstype = imp.idcrosstype) as namecross,imp.idparentcross , imp.amount, imp.price_import, imp.price, imp.quality_sale,imp.id_status_type,imp.fromdate,imp.todate,p.namepro,p.slug,p.short_desc,p.description from (select * from imp_products where idparentcross = _idproduct and id_status_type = 4 and idproduct <> _idproduct) as imp LEFT JOIN products as p on imp.idproduct = p.idproduct) as inf LEFT JOIN producthasfile as phf on inf.idproduct = phf.idproduct) as inf_p LEFT JOIN files as f on inf_p.idfile = f.idfile;*/
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelRowCategoryByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelRowCategoryByIdProcedure`(IN `_idcategory` INT(11))
BEGIN
                SELECT idcategory, namecat from categories where idcategory = _idcategory;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelSexProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelSexProcedure`()
BEGIN
                 select idsex, namesex from sex; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelToppingProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `SelToppingProcedure`(IN `_topping` VARCHAR(255))
BEGIN
                 declare _idcategory varchar(255);
                 set _idcategory = (select idcategory FROM categories WHERE shortname=_topping limit 1);
								 IF (_idcategory > 0) THEN
											BEGIN
												select protop.idproduct,protop.namepro,protop.price,protop.amount,(SELECT urlfile from files where idfile = protop.idfile) as url_thumbnail from (select pr.idproduct,(select idfile from producthasfile WHERE idproduct = pr.idproduct and hastype="thumbnail" ORDER BY idproducthasfile DESC LIMIT 1) as idfile,pr.namepro,imp.price,imp.amount from (select p.* from (select idproduct from catehasproduct where idcategory = _idcategory) as catep JOIN products as p on catep.idproduct = p.idproduct) as pr JOIN imp_products as imp on pr.idproduct = imp.idproduct) as protop;
											END;
									END IF;          
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ShortTotalProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `ShortTotalProcedure`(IN `_ordernumber` INT(11))
BEGIN
               select sum(p.amount * p.price) as total from exp_products as p where ordernumber = _ordernumber;  
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `split_pattern` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `split_pattern`(IN `string_split` VARCHAR(255), IN `_sign` VARCHAR(10), OUT `outresult` VARCHAR(255))
BEGIN
		DECLARE x INT;
		DECLARE str_item VARCHAR(255);
		DECLARE item VARCHAR(255);
		DECLARE result VARCHAR(255);
		DECLARE rs_split VARCHAR(255); 
		SET x = LENGTH(string_split);
		set result = "";
		set str_item ="";
		SET item = "";
		set rs_split = string_split;
		WHILE x  > 0 DO
		set item = SUBSTRING_INDEX(rs_split,_sign, -1);
		set rs_split = SUBSTRING(string_split, 1, (LENGTH(rs_split)-LENGTH(item)-1));
		set str_item = CONCAT("(", item,")");
		set result = CONCAT(result,",", str_item);
		set x = LENGTH(rs_split);
		END WHILE;
		set outresult = SUBSTRING(result,2); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `split_string` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `split_string`(IN `string_split` VARCHAR(255), IN `_idextend` VARCHAR(255), IN `_sign` VARCHAR(10), OUT `outresult` VARCHAR(255))
BEGIN
		DECLARE x INT;
		DECLARE str_item VARCHAR(255);
		DECLARE item VARCHAR(255);
		DECLARE result VARCHAR(255);
		DECLARE rs_split VARCHAR(255); 
		SET x = LENGTH(string_split);
		set result = "";
		set str_item ="";
		SET item = "";
		set rs_split = string_split;
		WHILE x  > 0 DO
		set item = SUBSTRING_INDEX(rs_split,_sign, -1);
		set rs_split = SUBSTRING(string_split, 1, (LENGTH(rs_split)-LENGTH(item)-1));
		set str_item = CONCAT("(",_idextend,",", item,")");
		set result = CONCAT(result,",", str_item);
		set x = LENGTH(rs_split);
		END WHILE;
		set outresult = SUBSTRING(result,2);
		SELECT outresult;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TrashGelleryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `TrashGelleryProcedure`(IN `_idproducthasfile` INT(11))
BEGIN
                update producthasfile set status_file = 0 where idproducthasfile = _idproducthasfile; 
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TrashIdmenuhascateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `TrashIdmenuhascateProcedure`(IN `_idmenuhascate` INT)
BEGIN
	UPDATE menu_has_cate set trash = 1 WHERE idmenuhascate = _idmenuhascate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCatehasproProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateCatehasproProcedure`(IN `_idcateproduct` INT(11))
BEGIN
                update catehasproduct set idcategory = 0 where idcateproduct = _idcateproduct;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateIdcategoryProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateIdcategoryProcedure`(IN `_idcategory` INT, IN `_idproduct` INT, IN `_checked` INT, IN `_hidden_idcate` INT)
BEGIN
 if _checked = 0 THEN
 BEGIN
	UPDATE catehasproduct set checked = 0
	WHERE idcateproduct = _hidden_idcate;
 END;
 ELSE
 BEGIN
	set @_idcateproduct = (SELECT idcateproduct from (SELECT * FROM catehasproduct WHERE checked < 1 ) as cate WHERE cate.idproduct = _idproduct AND cate.idcategory = _idcategory);
	if @_idcateproduct > 0 THEN
		BEGIN
			UPDATE catehasproduct set checked = 1
			WHERE idcateproduct = @_idcateproduct;
		END;
	ELSE
		BEGIN
			INSERT INTO catehasproduct(idproduct,idcategory,checked) VALUES (_idproduct,_idcategory,1);
		END;
	END IF;
 END;
 end if;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImportProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateImportProductProcedure`(IN `_idimp` INT(11), IN `_idcustomer` INT(11), IN `_iduser` INT(11), IN `_idcrosstype` INT(11), IN `_amount` DOUBLE(11,2), IN `_price_import` DOUBLE(20,0), IN `_price` DOUBLE(20,0), IN `_quality_sale` INT(11), IN `_note` TEXT, IN `_idstore` INT(11), IN `_axis_x` INT(11), IN `_axis_y` INT(11), IN `_axis_z` INT(11), IN `_id_status_type` INT(11))
BEGIN
                update imp_products set idcustomer=_idcustomer, iduser = _iduser, idcrosstype = _idcrosstype, amount = _amount, price_import = _price_import,price = _price, quality_sale =_quality_sale, note = _note, idstore = _idstore, axis_x = _axis_x, axis_y = _axis_y, axis_z = _axis_z, id_status_type = _id_status_type where idimp = _idimp;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImppostByIdProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateImppostByIdProcedure`(IN `id_imp_post` INT(11), IN `id_post` INT(11), IN `id_category` INT(11), IN `id_posttype` INT(11), IN `id_statustype` INT(11), IN `id_user_imp` INT(11))
if (id_imp_post > 0 )  then
                    update impposts set idpost=id_post,idcategory=id_category,id_post_type=id_posttype,id_status_type = id_statustype,iduser_imp = id_user_imp
                    where idimppost = id_imp_post;
                else
                    insert into impposts(idpost,idcategory,id_post_type,id_status_type,iduser_imp) values(id_post,id_category,id_posttype,id_statustype,id_user_imp);
                end if ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImpProductProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateImpProductProcedure`(IN `_str_query` TEXT)
BEGIN
                DROP TABLE IF EXISTS tmp_import;
                create TEMPORARY TABLE tmp_import(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idimp INTEGER not NULL, idcrosstype INTEGER not NULL, price INTEGER not NULL, quality_sale  INTEGER not NULL, id_status_type  INTEGER not NULL, fromdate datetime NULL, todate datetime NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                update imp_products as imp JOIN tmp_import as tmp_imp on imp.idimp = tmp_imp.idimp 
                set imp.idcrosstype = tmp_imp.idcrosstype, imp.price = tmp_imp.price, imp.quality_sale = tmp_imp.quality_sale, imp.id_status_type = tmp_imp.id_status_type, imp.fromdate = tmp_imp.fromdate, imp.todate = tmp_imp.todate
                WHERE imp.idimp > 0;
                DROP TABLE tmp_import;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMenuHasCateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `UpdateMenuHasCateProcedure`(IN `_idmenuhascate` INT(11), IN `_idmenu` INT(11), IN `_idcategory` INT(11), IN `_idparent` INT(11), IN `_depth` INT(11), IN `_reorder` INT(11), IN `_trash` INT(11))
BEGIN
               update menu_has_cate set idmenu=_idmenu, idcategory = _idcategory, idparent = _idparent, depth = _depth, reorder = _reorder, trash = _trash where idmenuhascate=_idmenuhascate;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMenuItemByIdhasProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateMenuItemByIdhasProcedure`(IN `_str_query` VARCHAR(255))
BEGIN
                SET @sqlv=_str_query;
                PREPARE stmt FROM @sqlv;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;  
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateOrderNumberProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateOrderNumberProcedure`(IN `_ordernumber` INT(11))
BEGIN
                 update exp_products set ordernumber = _ordernumber where idexp = _ordernumber;  
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePermissionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdatePermissionProcedure`(IN `_name` VARCHAR(250), IN `_description` TEXT, IN `_idpermcommand` INT(11), IN `_idcategory` INT(11), IN `_idperm` INT(11))
BEGIN             
                update permissions set `name` = _name, description = _description, idpermcommand = _idpermcommand, idcategory = _idcategory where idperm = _idperm;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateProfileProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UpdateProfileProcedure`(IN `_idprofile` INT, IN `_firstname` VARCHAR(255) CHARSET utf8mb4, IN `_lastname` VARCHAR(255) CHARSET utf8mb4, IN `_middlename` VARCHAR(255) CHARSET utf8mb4, IN `_idsex` INT, IN `_birthday` DATETIME, IN `_address` VARCHAR(255) CHARSET utf8mb4, IN `_mobile` VARCHAR(255) CHARSET utf8mb4, IN `_idcitytown` INT, IN `_iddistrict` INT)
BEGIN
	update `profile` set firstname = _firstname, lastname=_lastname, middlename=_middlename, idsex=_idsex, birthday = _birthday, address=_address, mobile=_mobile, idcitytown=_idcitytown, iddistrict=_iddistrict where idprofile = _idprofile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_hascate_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`%` PROCEDURE `update_menu_hascate_procedure`(IN `str_sql` text,IN `idmenu` int)
BEGIN          
                DROP TABLE IF EXISTS tmp_product1;
                create TEMPORARY TABLE tmp_product1(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idmenuhascate INTEGER not NULL, idcategory INTEGER  NULL,idparent  INTEGER not NULL, depth INTEGER NULL, reorder  INTEGER  NULL,trash INTEGER NULL);
                SET @queryString = CONCAT('INSERT into tmp_product1(idmenuhascate, idcategory, idparent, depth, reorder, trash) VALUES ', str_sql);
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                                UPDATE menu_has_cate as mhc JOIN tmp_product1 as tmp ON  mhc.idmenuhascate = tmp.idmenuhascate
                                SET mhc.idmenu = idmenu, mhc.idcategory = tmp.idcategory, mhc.idparent = tmp.idparent, mhc.depth = tmp.depth, mhc.reorder = tmp.reorder, mhc.trash = tmp.trash;
                DROP TABLE tmp_product1;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UploadAvatarProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UploadAvatarProcedure`(IN `_idprofile` INT, IN `_url_avatar` VARCHAR(255))
BEGIN
                update `profile` set url_avatar = _url_avatar where idprofile=_idprofile;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserPermDashboardByTypeProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UserPermDashboardByTypeProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255), OUT `result` BIT)
sp:BEGIN
	set @_idrole = (SELECT idrole FROM `grants` WHERE to_iduser= _iduser limit 1);
	if @_idrole is NULL THEN
		BEGIN
			set result = 0;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
		set @_idcommand = (SELECT idpercommand from perm_commands WHERE command = _command);
		if @_idcommand IS NULL THEN 
			BEGIN
			set result = 0;
			LEAVE sp; 
			END;
		END IF;
		SET @_idcategory = (SELECT idcategory from categories WHERE pathroute REGEXP _curent_url limit 1);
		if @_idcategory is NULL THEN
			BEGIN
				set result = 0;
				LEAVE sp;
			END;
		ELSE
			 BEGIN
					if EXISTS (SELECT imp.idperm, imp.idrole, imp.iduserimp,perm.`name`, perm.description, perm.idpermcommand, perm.idcategory from (SELECT idrole FROM `grants` WHERE to_iduser= _iduser) as tbrole LEFT JOIN imp_perms as imp on imp.idrole = tbrole.idrole LEFT JOIN permissions as perm on imp.idperm = perm.idperm WHERE perm.idpermcommand = @_idcommand AND perm.idcategory = @_idcategory) THEN
					set result = 1;
					ELSE
						set result = 0;
					end if;
			 END;
		END IF;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserPermDashByCateProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UserPermDashByCateProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), IN `_catnametype` VARCHAR(255), IN `_curent_url` VARCHAR(255), OUT `result` INT)
sp:BEGIN
	set @_idrole = (SELECT idrole FROM `grants` WHERE to_iduser= _iduser limit 1);
	if @_idrole is NULL THEN
		BEGIN
			set result = 0;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
		if _command = '' THEN 
			SET _command='select';
		END IF;
		set @_idcommand = (SELECT idpercommand from perm_commands WHERE command = _command limit 1);
		
		if @_idcommand = '' THEN 
			BEGIN
			set result = 0;
			LEAVE sp;
			END;
		END IF;
		SET @_idcategory = (SELECT idcategory from categories WHERE pathroute REGEXP CONCAT('^',_curent_url,'$') ORDER BY idcategory  desc limit 1);
		if @_idcategory = '' THEN
			BEGIN
				set result = 0;
				LEAVE sp;
			END;
		ELSE
			 BEGIN
					if EXISTS (SELECT imp.idperm from (SELECT * from imp_perms WHERE idrole = @_idrole and trash < 1) as imp LEFT JOIN permissions as perm on imp.idperm = perm.idperm WHERE perm.idpermcommand = @_idcommand AND perm.idcategory = @_idcategory LIMIT 1) THEN
					set result = 1;
					ELSE
						set result = 0;
					end if;
			 END;
		END IF;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UserPermission`(IN `iduser` INT, IN `_idcategory` INT, IN `_command` VARCHAR(255), OUT `result` BIT)
sp:BEGIN
	set @_idrole = (SELECT idrole FROM `grants` WHERE to_iduser= iduser limit 1);
	if @_idrole is NULL THEN
		BEGIN
			set result = 0;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
		set @_idcommand = (SELECT idpercommand from perm_commands WHERE command = _command LIMIT 1);
		if @_idcommand IS NULL THEN 
			BEGIN
			set result = 0;
			LEAVE sp;
			END;
		END IF;
		if EXISTS (SELECT tbl_perm.idcategory from (select pcom.idpercommand,pcom.command,perm.idcategory from (select * from imp_perms WHERE trash < 1 and idrole = @_idrole ) as imp LEFT JOIN permissions as perm on imp.idperm = perm.idperm LEFT JOIN perm_commands as pcom on pcom.idpercommand = perm.idpermcommand) as tbl_perm WHERE tbl_perm.idcategory = _idcategory and tbl_perm.idpercommand = @_idcommand limit 1) THEN
		BEGIN
		set result = 1;
		END;
		ELSE SET result = 0;
		END IF;
		/*select rl.`name` as role, perm.`name`,pcom.idpercommand,pcom.command,cate.idcategory,cate.namecat from (SELECT idrole FROM `grants` WHERE to_iduser= iduser) as tbl_role LEFT JOIN imp_perms as imp on imp.idrole = tbl_role.idrole LEFT JOIN permissions as perm on imp.idperm = perm.idperm LEFT JOIN perm_commands as pcom on pcom.idpercommand = perm.idpermcommand LEFT JOIN categories as cate on cate.idcategory = perm.idcatogory LEFT JOIN roles as rl on imp.idrole = rl.idrole;*/
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserProductPermissionProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`allysfast_shopcart`@`localhost` PROCEDURE `UserProductPermissionProcedure`(IN `_iduser` INT, IN `_command` VARCHAR(255), `_idproduct` INT, OUT `result` BIT)
sp:BEGIN
	if _iduser is NULL or _iduser = '' THEN
		BEGIN
			set _iduser = 36;
		END;
	end if;
	set @_idrole = (SELECT idrole FROM `grants` WHERE to_iduser= _iduser limit 1);
	if @_idrole is NULL THEN
		BEGIN
			set result = 0;
			LEAVE sp;
		END;
	 ELSE
		BEGIN
		set @_idcommand = (SELECT idpercommand from perm_commands WHERE command = _command);
		if @_idcommand IS NULL THEN 
			BEGIN
			set result = 0;
			LEAVE sp;
			END;
		END IF;
		
		if EXISTS (SELECT cateperm.idcategory from (select DISTINCT perm.idcategory from (select * from imp_perms WHERE idrole = @_idrole and trash < 1) as imp LEFT JOIN permissions as perm on imp.idperm = perm.idperm LEFT JOIN perm_commands as pcom on pcom.idpercommand = perm.idpermcommand WHERE pcom.idpercommand = @_idcommand) as cateperm LEFT JOIN (SELECT idcategory FROM catehasproduct WHERE idproduct = _idproduct and checked > 0) as curidcate on cateperm.idcategory = curidcate.idcategory WHERE curidcate.idcategory is not NULL) THEN
		BEGIN
		set result = 1;
		END;
		ELSE SET result = 0;
		END IF;
		END;
	END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-11 22:27:10
