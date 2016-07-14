<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

$query = 'SELECT P.*, D.id as device_id FROM promotions_device P JOIN devices D on P.device_id = D.id';
$promotions = getDataByQuery($query);

print json_encode($promotions);