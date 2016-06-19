<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

$id = $connection->real_escape_string(isset($_GET['id'])?$_GET['id']:'');


$query = 'SELECT S.*, T.name as type FROM services S  JOIN services_types T ON S.type_id = T.id WHERE S.id = \''.$id.'\'';
$service = getDataByQuery($query);

print json_encode($service);
