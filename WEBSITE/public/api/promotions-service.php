<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */

require_once __DIR__ . '/../../resources/php/include/bootstrap.php';

//$query = 'SELECT P.*, S.id as service_id FROM promotions_service P JOIN services S on P.service_id = S.id';
$query = 'SELECT P.* FROM promotions_service P';
$promotions = getDataByQuery($query);

print json_encode($promotions);