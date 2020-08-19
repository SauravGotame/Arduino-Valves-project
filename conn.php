<?php
$servername="localhost";
$username="root";
$password="";
$db="arduino-site-users";

//check connection
$conn = new mysqli($servername, $username, $password, $db);
if(!$conn){
    die ("Error on the Connection" . $connect_error);
}
?>