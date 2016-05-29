<?php
/**
 * Created by PhpStorm.
 * User: Claudio Cardinale <cardi@thecsea.it>
 * Date: 25/05/16
 * Time: 23.25
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
require_once __DIR__ . '/../include/bootstrap.php';
$faker = Faker\Factory::create();

//-------------devices-------------------
createBrands();
createOs();
createDevicesTypes();
createDevices();

//----------------services------------
createServicesTypes();
createServices();


//-------------devices-------------------
function createBrands(){
    $data = [['\'Samsung\''], ['\'Apple\''], ['\'Sony\'']];
    insertByArray(['name'], $data, 'brands');
}

function createOs(){
    $data = [['\'Android\''], ['\'iOS\'']];
    insertByArray(['name'], $data, 'os');
}

function createDevicesTypes(){
    $data = [['\'Smartphones\''], ['\'Tablets\''], ['\'Wearable\''], ['\'Outlet\'']];
    insertByArray(['name'], $data, 'devices_types');
}

function createDevices(){
    $data = [
        ['\'Samsung galaxy S7\'', '200', '1', '1', '1', '1', '\'The best device in the world\'', '\'\''],
        ['\'Apple iPad pro\'', '300', '2', '2', '2', '1', '\'The best device in the world\'', '\'\''],
        ['\'Apple watch\'', '250', '3','2', '2', '0', '\'The best device in the world\'', '\'\''],
        ['\'Sony smart band\'', '150', '4', '1', '3', '0', '\'The best device in the world\'', '\'\'']];
    insertByArray(['name', 'price', 'type_id', 'os_id', 'brand_id', 'popular', 'description', 'img'], $data, 'devices');
}


//----------------services------------
function createServicesTypes(){
    $data = [['\'Stay connected\''], ['\'Stay amused\''], ['\'Stay secure\'']];
    insertByArray(['name'], $data, 'services_types');
}

function createServices(){
    $data = [
        ['\'Verizon next\'', '200', '1', '\'The best service in the world\'', '\'\''],
        ['\'Verizon music\'', '300', '2', '\'The best service in the world\'', '\'\''],
        ['\'verizon beSafe\'', '250', '3', '\'The best service in the world\'', '\'\'']];
    insertByArray(['name', 'price', 'type_id', 'description', 'img'], $data, 'services');
}
