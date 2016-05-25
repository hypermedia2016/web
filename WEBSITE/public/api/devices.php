<?php
/**
 * Created by PhpStorm.
 * User: claudio
 * Date: 24/05/16
 * Time: 13.25
 */


$type = isset($_GET['type'])?$_GET['type']:'';

print json_encode(['filters'=>[['name'=>'popular'], ['name'=>'other']],'devices'=>[['name'=>'test11', 'img'=>'src...'], ['name'=>'test11', 'img'=>'src...']]]);