<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

$type = $connection->real_escape_string(isset($_GET['type'])?$_GET['type']:'');


$query = 'SELECT D.*, O.name as os, B.name as brand FROM devices D JOIN os O ON D.os_id = O.id JOIN brands B ON D.brand_id = B.id JOIN devices_types T ON D.type_id = T.id WHERE T.name = \''.$type.'\'';

print json_encode(['filters'=>[['name'=>'popular'], ['name'=>'other']],'devices'=>getDataByQuery($query)]);