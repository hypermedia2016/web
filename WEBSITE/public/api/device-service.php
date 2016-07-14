<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

if(isset($_GET['device_id']))
{
    $id = $connection->real_escape_string(isset($_GET['device_id'])?$_GET['device_id']:'');

    $query = 'SELECT S.*, D.name as device FROM service S, devices D, device_service DS WHERE  DS.device_id = D.id and DS.service_id = S.id and D.id = \''.$id.'\'';
    $service = getDataByQuery($query);

    print json_encode($service);
}else if(isset($_GET['service_id'])){
    $id = $connection->real_escape_string(isset($_GET['service_id'])?$_GET['service_id']:'');

    $query = 'SELECT D.*, S.name as service FROM service S, devices D, device_service DS WHERE  DS.device_id = D.id and DS.service_id = S.id and S.id = \''.$id.'\'';
    $devices = getDataByQuery($query);

    print json_encode($devices);
}else
{
    print error('Wrong type');
}
