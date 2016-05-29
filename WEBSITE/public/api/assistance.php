<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

$type = $connection->real_escape_string(isset($_GET['type'])?$_GET['type']:'');


$query = 'SELECT A.* FROM assistance A  JOIN assistance_types T ON A.type_id = T.id WHERE T.name = \''.$type.'\'';
$assistance = getDataByQuery($query);
print json_encode($assistance);
