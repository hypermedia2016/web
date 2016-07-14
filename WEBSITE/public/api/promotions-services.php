<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

$query = 'SELECT P.*, S.id as service_id FROM promotions_services P JOIN services S on P.service_id = S.id';
$assistance = getDataByQuery($query);

print json_encode($assistance);