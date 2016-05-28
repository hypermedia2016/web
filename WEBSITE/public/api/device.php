<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

$id = $connection->real_escape_string(isset($_GET['id'])?$_GET['id']:'');


$query = 'SELECT D.*, O.name as os, B.name as brand, T.name as type FROM devices D JOIN os O ON D.os_id = O.id JOIN brands B ON D.brand_id = B.id JOIN devices_types T ON D.type_id = T.id WHERE D.id = \''.$id.'\'';
$devices = getDataByQuery($query);

print json_encode($devices);
