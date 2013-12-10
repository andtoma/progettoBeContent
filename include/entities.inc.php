<?php


	/*
	
	This file is part of beContent.
	
    Foobar is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Foobar is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with beContent.  If not, see <http://www.gnu.org/licenses/>.
    
    http://www.becontent.org
    
    */




/* ///////////////////////////////////// SYSTEM ENTITIES //////////////////////// */

/* GROUPS - It is important to have it in this position */

$groupsEntity = new Entity($database,"groups");
$groupsEntity->setPresentation("name");

$groupsEntity->addField("name", VARCHAR, 50);
$groupsEntity->addField("description", TEXT);

$groupsEntity->connect();

/* ENTITIES - It is important to have it in this position */

$entitiesEntity = new Entity($database, "entities");
$entitiesEntity->setPresentation("name");

$entitiesEntity->addPrimaryKey("name", VARCHAR, 50);
$entitiesEntity->addField("content_name", VARCHAR, 50);
$entitiesEntity->addField("owner", VARCHAR, 1);


$entitiesEntity->addField("forum", VARCHAR, 1);
$entitiesEntity->addReference($groupsEntity, "forum_moderator");

$entitiesEntity->addReference($groupsEntity,"moderator_group");
$entitiesEntity->addReference($groupsEntity,"priviledged_group");

$entitiesEntity->connect();


/* USERS + SSD + FACULTY ROLE (DISIM SPECIFIC)*/

$facultyRoleEntity = new Entity($database, "facultyrole");
$facultyRoleEntity->setPresentation("name");

$facultyRoleEntity->addField("name", VARCHAR, 50);
$facultyRoleEntity->addField("name_plural", VARCHAR, 50);

$facultyRoleEntity->addField("position", POSITION);
$facultyRoleEntity->addField("visible", VARCHAR, 1);
$facultyRoleEntity->connect();

/* --- */

$ssdEntity = new Entity($database, "ssd");
$ssdEntity->setPresentation("name");

$ssdEntity->addField("name", VARCHAR, 100);
$ssdEntity->connect();



/* AREA */

$areaEntity = new Entity($database, "area", WITH_OWNER);
$areaEntity->setPresentation("title");

$areaEntity->addField("title", VARCHAR, 50);
$areaEntity->addField("title_it", VARCHAR, 50);
$areaEntity->addField("achronim", VARCHAR, 20);

$menuEntity = new Entity($database, "menu");

$areaEntity->addReference($menuEntity,"id_menu");
$areaEntity->addReference($newsCatEntity, "id_newscat");

$pageEntity = new Entity($database, "page", WITH_OWNER);
$areaEntity->addReference($pageEntity, "id_page");
$areaEntity->addField("foto", FILE);
$areaEntity->addField("payoff", TEXT);
$areaEntity->addField("position", POSITION);
$areaEntity->addField("active", VARCHAR, 1);

$areaEntity->connect();

/* GRUPPI DI RICERCA */

$resGroupEntity = new Entity($database, "researchgroup");
$resGroupEntity->setPresentation("name");

$resGroupEntity->addField("name", VARCHAR, 80);
$resGroupEntity->addReference($areaEntity, "id_area");
$resGroupEntity->addField("description", TEXT);
$resGroupEntity->connect();


/* BUILDING */

$buildingEntity = new Entity($database, "building");
$buildingEntity->setPresentation("name");

$buildingEntity->addField("name", VARCHAR, 50);
$buildingEntity->addField("acronym", VARCHAR, 6);
$buildingEntity->addField("address", TEXT);
$buildingEntity->addField("map", VARCHAR, 255);
$buildingEntity->addField("position", POSITION);

$buildingEntity->connect();

/* *** */

/* USERS */

$usersEntity = new Entity($database, "users");
$usersEntity->setPresentation("%name %surname (%username)");

$usersEntity->addPrimaryKey("username", VARCHAR, 50);
$usersEntity->addField("password", PASSWORD);
$usersEntity->addField("email", VARCHAR, 100);
$usersEntity->addField("name", VARCHAR, 50);
$usersEntity->addField("surname", VARCHAR, 50);
$usersEntity->addReference($facultyRoleEntity, "id_role");
$usersEntity->addField("phone", VARCHAR, 20);
$usersEntity->addReference($buildingEntity, "building_id");
$usersEntity->addField("room", VARCHAR, 50);
$usersEntity->addField("picture", FILE);

$usersEntity->addReference($ssdEntity, "id_ssd");
$usersEntity->addReference($areaEntity, "id_area");
$usersEntity->addReference($resGroupEntity, "id_resgroup");

$usersEntity->addField("active", VARCHAR, 1);
$usersEntity->addField("active_home", VARCHAR, 1);

/* These are necessary for the newsletter management */

$usersEntity->addField("active_newsletter", VARCHAR, 1);
$usersEntity->addField("processed", VARCHAR, 1);

/* additional fields follow here */

$usersEntity->addField("research", TEXT);
$usersEntity->addField("publications", TEXT);

$usersEntity->connect();

$usersEntity->setTextSearchFields("name", "surname", "email", "research");
$usersEntity->setSearchPresentationHead("name", "surname");
$usersEntity->setSearchPresentationBody("email", "phone");
$usersEntity->setHandler("home.php");


/* PUB CAT + PUBLICATIONS */

$pubCatEntity = new Entity($database, "pubcategories");
$pubCatEntity->setPresentation("name");

$pubCatEntity->addField("name", VARCHAR, 255);
$pubCatEntity->addField("description", TEXT);
$pubCatEntity->addField("position", POSITION);

$pubCatEntity->connect();

/* --- */

//$pubEntity = new Entity($database, "publications", WITH_OWNER);

//$pubEntity->addField("title", TEXT);
//$pubCatEntity->addReference($pubCatEntity, "pubcat_id");

// book (b)

// journal article (j)
//$pubEntity->addField("journal", VARCHAR, 255); 	// journal name
//$pubEntity->addField("jnumber", VARCHAR, 15); 	// journal number
//$pubEntity->addField("jvolume", VARCHAR, 15);	// journal volume

// conference proceedings (c)
//$pubEntity->addField("ctitle", VARCHAR, 255);	// conf. title

// report (r)
//$pubEntity->addField("rref", VARCHAR, 255);		// tech. report. reference and/or number, eg "Tech. Rep. 06.03, LINA"

// all
//$pubEntity->addField("pages", VARCHAR, 15);
//$pubEntity->addField("year", VARCHAR, 12);
//$pubEntity->addField("publisher", VARCHAR, 255);






/*PAGE + MENU :: BEGIN */


$pageEntity->setPresentation("title");

$pageEntity->addReference($sectionEntity, "section");
$pageEntity->addReference($newsCatEntity, "id_newscat");
$pageEntity->addField("title", VARCHAR, 100);
$pageEntity->addField("description", TEXT);
$pageEntity->addField("subtitle", VARCHAR, 100);
$pageEntity->addField("body", TEXT);
$pageEntity->addField("foto", FILE);
$pageEntity->addField("position", POSITION);
$pageEntity->addField("link", VARCHAR, 100);

$pageEntity->setTextSearchFields("title", "body");
$pageEntity->setSearchPresentationHead("title");
$pageEntity->setSearchPresentationBody("body");
$pageEntity->setHandler("page.php");

/* --- */


$menuEntity->setPresentation("entry", "id");

$menuEntity->addField("entry", VARCHAR, 50);
$menuEntity->addField("link", VARCHAR, 255);
$menuEntity->addReference($pageEntity, "page_id");
$menuEntity->addReference($menuEntity, "parent_id");
$menuEntity->addField("position", POSITION);

$menuEntity->connect();

/* --- */

$pageEntity->addReference($menuEntity, "menu");

$pageEntity->connect();

$pageEntity->setEditable();
$pageEntity->setEditableField("body");

$pageEntity->setTextSearchFields("title", "body");
$pageEntity->setSearchPresentationHead("title");
$pageEntity->setSearchPresentationBody("body");
$pageEntity->setHandler("page.php");

/* PAGE + MENU :: END */


/* USER-GROUPS */

$usersGroupsRelation = new Relation($usersEntity, $groupsEntity);

$usersGroupsRelation->connect();

/* SERVICE CATEGORIES */

$servicecategoryEntity = new Entity($database, "servicecategory");
$servicecategoryEntity->setPresentation("name");

$servicecategoryEntity->addField("name", VARCHAR, 40);
$servicecategoryEntity->addField("position", POSITION);

$servicecategoryEntity->connect();



/* SERVICES */

$servicesEntity = new Entity($database,"services");
$servicesEntity->setPresentation("name");

$servicesEntity->addField("name", VARCHAR, 50);
$servicesEntity->addField("script", VARCHAR, 100);
$servicesEntity->addField("entry", VARCHAR, 30);
$servicesEntity->addReference($servicecategoryEntity, "servicecategory");
$servicesEntity->addField("visible", VARCHAR, 1);
$servicesEntity->addField("des", TEXT);
$servicesEntity->addReference($entitiesEntity, "id_entities");
$servicesEntity->addReference($groupsEntity, "superuser_group");
$servicesEntity->addField("position", POSITION);

$servicesEntity->addField("icon", FILE);

$servicesEntity->connect();

/* SERVICES-GROUPS */

$servicesGroupsRelation = new Relation($servicesEntity, $groupsEntity);
$servicesGroupsRelation->connect();

/* LOGGING */

$logEntity = new Entity($database, "logs");

$logEntity->setPresentation("date", "entity", "operation");

$logEntity->addField("operation", VARCHAR, 20);
$logEntity->addField("entity", VARCHAR, 100);
$logEntity->addField("itemid", VARCHAR, 255);
$logEntity->addField("service", VARCHAR, 100);

/* the following abstract from the users key definition
 which was VARCHAR (15) before

*/

$logEntity->addReference($usersEntity, "username");

// $logEntity->addField("username", VARCHAR, 15);

$logEntity->addField("date", LONGDATE);
$logEntity->addField("ip",VARCHAR, 15);

$logEntity->connect();


/* ///////////////////////////////////// RSS MANAGEMENT //////////////////////// */

/*

This entity is preposed for the Rss channels gestion.
Is important that all the fields have the correspondent name of
the Rss 2.0 TAG. The field title,link and description is MANDATORY.

For the composed Tag (es. <image>) is sufficient have fields
for the children Tag (es. <link> ) as parent_cildren (es. image_link)
Is possible define a n<->n relation only if the name is'n
automaticaly generation and don't contain bc_channel that substring


*/


/* LANGUAGES */

$lanEntity = new Entity($database, "rsslanguages");
$lanEntity->setPresentation("code", "name");

$lanEntity->addPrimaryKey("code", VARCHAR, 8);
$lanEntity->addField("name", VARCHAR, 50);

$lanEntity->connect();

/* CHANNELS */

$channelEntity = new Entity($database,"bc_channel");
$channelEntity->setPresentation("title");

$channelEntity->addField("title",VARCHAR,50,MANDATORY);
$channelEntity->addField("link",VARCHAR,100,MANDATORY);
$channelEntity->addField("description",VARCHAR,150,MANDATORY);
$channelEntity->addReference($lanEntity, "language");

$channelEntity->addField("image_title",VARCHAR,50);
$channelEntity->addField("image_link",VARCHAR,100);
$channelEntity->addField("image",FILE);


$channelEntity->connect();

/*Channel-entity*/

$channelAssotiation = new Entity($database,"channel_entity");
$channelAssotiation->setPresentation("entity");
$channelAssotiation->addField("entity",VARCHAR,50,MANDATORY);
$channelAssotiation->addReference($channelEntity);

$channelAssotiation->connect();

$rssMod=new Entity($database,"bc_rss_mod");
$rssMod->setPresentation("entity");
$rssMod->addPrimaryKey("entity",VARCHAR,50);
$rssMod->addField("modality",VARCHAR,20,MANDATORY);


$rssMod->connect();

/* ////////////////////////////// COMMENTS ////////////////////////// */

$commentEntity = new Entity($database, "comments", WITH_OWNER);
$commentEntity->setPresentation("entityname", "itemid");

$commentEntity->addField("entityname", VARCHAR, 100);
$commentEntity->addField("itemid", VARCHAR, 255);
$commentEntity->addField("body", TEXT);
$commentEntity->addField("rate", VARCHAR, 1);
$commentEntity->addField("ratenumbers", INT);
$commentEntity->addField("active", VARCHAR, 1);
$commentEntity->addField("new", VARCHAR, 1);

$commentEntity->connect();

/* ////////////////////////////////////////////////////////////////// */


/* SECTIONS */

$sectionEntity = new Entity($database, "section");
$sectionEntity->setPresentation("name");

$sectionEntity->addField("name", VARCHAR, 40);

$sectionEntity->connect();




/* MENU */

$menuEntity = new Entity($database, "menu");
$menuEntity->setPresentation("entry", "id");

$menuEntity->addField("entry", VARCHAR, 50);
$menuEntity->addField("link", VARCHAR, 255);
$menuEntity->addReference($pageEntity, "page_id");
$menuEntity->addReference($menuEntity, "parent_id");
$menuEntity->addField("position", POSITION);

$menuEntity->connect();





/* NEWS CAT, NEWS */

$newsCatEntity = new Entity($database, "newscat", WITH_OWNER);
$newsCatEntity->setPresentation("name");

$newsCatEntity->addField("name", VARCHAR, 50);
$newsCatEntity->addField("description", TEXT);
$newsCatEntity->addField("foto", FILE);
$newsCatEntity->addField("position", POSITION);
$newsCatEntity->addReference($newsCatEntity, "parent");

$newsCatEntity->connect();


/* ---- */

$newsEntity = new Entity($database, "news", WITH_OWNER);
$newsEntity->setPresentation("title", "active");

$newsEntity->addField("title", VARCHAR, 68, MANDATORY);

$newsEntity->addField("date", LONGDATE, MANDATORY);
$newsEntity->addField("active", VARCHAR, 1);
$newsEntity->addField("body", TEXT);
$newsEntity->addReference($newsCatEntity, "category");

$newsEntity->addRss($channelEntity,"title=\"title\" description=\"body\" pubDate=\"date\"");
#$newsEntity->addRssFilter("active = '*'");

$newsEntity->connect();

$newsEntity->setEditable();
$newsEntity->setEditableField("body");

$newsEntity->setTextSearchFields("title", "body");
$newsEntity->setSearchPresentationHead("title");
$newsEntity->setSearchPresentationBody("body");
$newsEntity->setHandler("news.php");


/* ---- */

$mergedNewsEntity = new Entity($database, "merged_news", WITH_OWNER);
$mergedNewsEntity->setPresentation("title", "active");

$mergedNewsEntity->addField("title", VARCHAR, 68, MANDATORY);

$mergedNewsEntity->addField("date", LONGDATE, MANDATORY);
$mergedNewsEntity->addField("active", VARCHAR, 1);
$mergedNewsEntity->addField("body", TEXT);
$mergedNewsEntity->addReference($newsCatEntity, "category");

$mergedNewsEntity->addRss($channelEntity,"title=\"title\" description=\"body\" pubDate=\"date\"");
#$newsEntity->addRssFilter("active = '*'");

$mergedNewsEntity->connect();

#$mergedNewsEntity->setEditable();
#$mergedNewsEntity->setEditableField("body");

$mergedNewsEntity->setTextSearchFields("title", "body");
$mergedNewsEntity->setSearchPresentationHead("title");
$mergedNewsEntity->setSearchPresentationBody("body");
$mergedNewsEntity->setHandler("news.php");




/* *** */
$testEntity = new Entity($database, "testimonial");
$testEntity->setPresentation("name");

$testEntity->addField("name", VARCHAR, 100);
$testEntity->addField("posizione", POSITION);
$testEntity->addField("edizione", VARCHAR, 30);
$testEntity->addField("affiliazione", VARCHAR, 100);
$testEntity->addField("photo", FILE);
$testEntity->addField("messaggio", TEXT);

$testEntity->connect();


/* TO BE ELIMINATED

$galleryEntity = new Entity($database, "gallery");
$galleryEntity->setPresentation("name");

$galleryEntity->addField("name", VARCHAR, 50);
$galleryEntity->addField("description", TEXT);
$galleryEntity->addField("position", POSITION);

$galleryEntity->connect();


$fotoEntity = new Entity($database, "foto");
$fotoEntity->setPresentation("title");

$fotoEntity->addField("title", VARCHAR, 50);
$fotoEntity->addReference($galleryEntity);
$fotoEntity->addField("description", TEXT);
$fotoEntity->addField("foto", FILE);
$fotoEntity->addField("position", POSITION);

$fotoEntity->connect();

*/

/*
 *
* ****** AQUA SPECIFIC ***** *
*
*
*/


/* MACRO AREA DISCIPLINARE
 *
* This is an aggregator, it takes
* - a menu root
* - a news root (category)
* - a page
*
* Connected Entities: resGroupEntity, ...
*
* IMPORTANT: only the connector is left here
*/





/* FACULTY + ROLES + BUILDINGS*/






/* ICON */

$iconEntity = new Entity($database, "iconogram");
$iconEntity->setPresentation("name", "icon_filename");
#$iconEntity->setPresentation("%name (%icon_filename)");

$iconEntity->addField("name", VARCHAR, 50);
$iconEntity->addField("icon", FILE);

$iconEntity->connect();



/* LAYER BACKGROUND */

$bgEntity = new Entity($database, "background");
$bgEntity->setPresentation("name", "file_filename");

$bgEntity->addField("name", VARCHAR, 50);
$bgEntity->addField("file", FILE);

$bgEntity->connect();


$layerEntity = new Entity($database, "layer");
$layerEntity->setPresentation("title", "foto_filename");

$layerEntity->addField("title", VARCHAR, 50);
$layerEntity->addField("subtitle", VARCHAR, 50);
$layerEntity->addField("description", TEXT);
$layerEntity->addField("foto", FILE);
$layerEntity->addReference($bgEntity, "bg_id");
$layerEntity->addReference($pageEntity, "page_id");
$layerEntity->addField("position", POSITION);

$layerEntity->connect();

$msgEntity = new Entity($database, "message");
$msgEntity->setPresentation("title");

$msgEntity->addField("title", VARCHAR, 255);
$msgEntity->addField("description", TEXT);
$msgEntity->addField("position", POSITION);

$msgEntity->connect();

/* MODULISTICA + CATEGORIE MODULI */


$catModuleEntity = new Entity($database, "catmodule");
$catModuleEntity->setPresentation("name");

$catModuleEntity->addField("name", VARCHAR, 50);
$catModuleEntity->addField("position", POSITION);

$catModuleEntity->connect();

/* *** */

$moduleEntity = new Entity($database, "module", WITH_OWNER);
$moduleEntity->setPresentation("name");

$moduleEntity->addField("name", VARCHAR, 100);
$moduleEntity->addField("description", TEXT);
$moduleEntity->addField("position", POSITION);
$moduleEntity->addField("file", FILE);
$moduleEntity->addReference($catModuleEntity, "category");

$moduleEntity->connect();
?>