set @_str_query = 'INSERT into tmp_product1(idorder, idcrosstype, parent, idparentcross, input_quality, idproduct, inp_session, trash) VALUES (1,0,0,0,1,20,1,1),(2,1,1,20,1,21,5,1),(3,2,1,20,1,22,10,1),(4,2,1,20,1,2,9,1)';
 /*set @_str_query = 'INSERT into tmp_product1(idorder, idcrosstype, parent, idparentcross, input_quality, idproduct, inp_session, trash) VALUES (1,0,0,0,1,29,1,1)';*/
 set @_idstore=31;
 DROP TABLE IF EXISTS tmp_product1;
                DROP TABLE IF EXISTS tmp_product2;
								DROP TABLE IF EXISTS tmp_product3;
                DROP TABLE IF EXISTS tmp_product4;
                set @idorder:=0;
                create TEMPORARY TABLE tmp_product1(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER  NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER  NULL,idproduct  INTEGER NULL,inp_session  INTEGER  NULL,trash INTEGER  NULL);
                SET @queryString = @_str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE tmp_product2(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL, parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL) as (SELECT * from tmp_product1);
								SELECT *, Fnc_latestprice(idproduct, 31) as price from tmp_product1;								
								/*SELECT inf.* from (SELECT info_p.*,p.namepro, p.short_desc, p.slug, p.description,phf.idfile,f.urlfile from (SELECT tmp_p1.*, info1.idproduct,info1.idproduct, info1.idparentcross, info1.amount, info1.price_import, info1.price, info1.quality_sale from tmp_product1 as tmp_p1 LEFT JOIN (select inf1.* from (select idimp, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idcrosstype = 0 and idstore = @_idstore and id_status_type = 4 and idparentcross = 0 UNION all select idimp, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idcrosstype = 4 and idstore = @_idstore and id_status_type = 4 and idparentcross > 0) as inf1 ORDER BY inf1.idimp DESC LIMIT 1) as info1 on tmp_p1.idproduct = info1.idproduct UNION ALL SELECT tmp_p2.*,info2.amount, info2.price_import, info2.price, info2.quality_sale from tmp_product2 as tmp_p2 LEFT JOIN (select idimp, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idstore = @_idstore and id_status_type = 4 and idcrosstype <> 4 and idparentcross > 0) as info2 on info2.idparentcross = tmp_p2.idproduct WHERE info2.idproduct is not NULL) as info_p LEFT JOIN products as p on info_p.idproduct = p.idproduct LEFT JOIN producthasfile as phf on p.idproduct = phf.idproduct LEFT JOIN files as f on phf.idfile = f.idfile) as inf ORDER BY inf.idorder ASC;*/
                DROP TABLE tmp_product1;
                DROP TABLE tmp_product2;
								DROP TABLE tmp_product3;
                DROP TABLE tmp_product4;