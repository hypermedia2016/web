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

createBrands();
createOs();
createTypes();
createDevices();

function createBrands(){
    $data = [['\'Samsung\''], ['\'Apple\''], ['\'Sony\'']];
    insertByArray(['name'], $data, 'brands');
}

function createOs(){
    $data = [['\'Android\''], ['\'iOS\'']];
    insertByArray(['name'], $data, 'os');
}

function createTypes(){
    $data = [['\'Smartphones\''], ['\'Tablets\''], ['\'Wearable\''], ['\'Outlet\'']];
    insertByArray(['name'], $data, 'devices_types');
}

function createDevices(){
    $data = [
        ['\'Samsung galaxy S7\'', '200', '1', '1', '1'],
        ['\'Apple iPad pro\'', '300', '2', '2', '2'],
        ['\'Apple watch\'', '250', '3','2', '2'],
        ['\'Sony smart band\'', '150', '4', '1', '3']];
    insertByArray(['name', 'price', 'type_id', 'os_id', 'brand_id'], $data, 'devices');
}