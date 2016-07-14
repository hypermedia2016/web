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

    $query = 'SELECT A.*, D.name as device FROM assistance A, devices D, device_assistance DA WHERE  DA.device_id = D.id and DA.assistance_id = A.id and D.id = \''.$id.'\'';
    $assistance = getDataByQuery($query);

    print json_encode($assistance);
}else if(isset($_GET['assistance_id'])){
    $id = $connection->real_escape_string(isset($_GET['assistance_id'])?$_GET['assistance_id']:'');

    $query = 'SELECT D.*, A.name as assistance FROM assistance A, devices D, device_assistance DA WHERE  DA.device_id = D.id and DA.assistance_id = A.id and A.id = \''.$id.'\'';
    $devices = getDataByQuery($query);

    print json_encode($devices);
}else
{
    print error('Wrong type');
}
