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
$devices = getDataByQuery($query);
addCharacteristics($devices);
$filters = [];
$filters['All'] = null;
$filters['Popular'] = null;
$filters['Recently added'] = null;
$filters['brand'] = getData('brands');
$filters['os'] = getData('os');
$filters['price'] = ['0_100','100_500','500_-1'];
print json_encode(['filters'=>$filters,'devices'=>$devices]);


/**
 * @param $data passed by reference
 */
function addCharacteristics(&$data){
    foreach ($data as $key=>$row) {
        $data[$key]['characteristics'] = [];
        if($row['popular'] == '1')
            $data[$key]['characteristics'][] = 'Popular';
        if((time()-(new DateTime($row['creation_date']))->getTimestamp())<=3600*24*28) //four weeks
            $data[$key]['characteristics'][] = 'Recently added';
    }
}