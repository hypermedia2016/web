<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

$id = $connection->real_escape_string(isset($_GET['id'])?$_GET['id']:'');


$query = 'SELECT A.*, T.name as type FROM assistance A  JOIN assistance_types T ON A.type_id = T.id WHERE A.id = \''.$id.'\'';
$devices = getDataByQuery($query);

print json_encode($devices);
