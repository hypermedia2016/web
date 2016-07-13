<?php
/**
 * Created by PhpStorm.
 * User: Claudio Cardinale <cardi@thecsea.it>
 * Date: 25/05/16
 * Time: 20.39
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header("Access-Control-Allow-Origin: *");

//require_once __DIR__ . '/../../../vendor/autoload.php';
require_once __DIR__ . '/../../../config/config.php';

$connection = getConnection();


/**
 * @param string $table
 * @param string $where
 * @return array
 */
function getData($table, $where = ''){
    if($where == '')
        $query = "SELECT * FROM $table";
    else
        $query = "SELECT * FROM $table WHERE $where";

    return getDataByQuery($query);
}

/**
 * @param string $query
 * @return array
 */
function getDataByQuery($query){
    global $connection;
    $results = $connection->query($query);
    if (!$results) {
        error("Mysql error ".$connection->error." on '".$query."''");
    }
    $ret = [];
    while($row = $results->fetch_array(MYSQLI_ASSOC)) {
        $ret[] = array_map('utf8_encode', $row);
    }

    return $ret;
}

/**
 * @param string $fields
 * @param array $data
 * @param string $table
 */
function insertByArray($fields, $data, $table){
    global $connection;
    $query = "INSERT INTO $table (".implode(',', $fields).") VALUES (".implode('),(', implodeRows(',', $data)).")";
    $results = $connection->query($query);
    if (!$results) {
        error("Mysql error ".$connection->error." on '".$query."''");
    }
}

/**
 * @param string $separator
 * @param array $array
 * @return array
 */
function implodeRows($separator, $array){
    $ret = [];
    foreach($array as $row)
        $ret[] = implode($separator, $row);
    return $ret;
}

/**
 * @return mysqli
 */
function getConnection(){
    global $server, $user, $password, $db;
    $mysqliRef = mysqli_init();
    $connected = @$mysqliRef->real_connect($server,
        $user,
        $password,
        $db);
    if (!$connected || $mysqliRef->connect_error) {
        error('Database connection error ('.$mysqliRef->connect_errno.') '.$mysqliRef->connect_error);
    }

    return $mysqliRef;
}

/**
 * @param string $error
 */
function error($error){
    die (json_encode(['error'=>$error]));
}
