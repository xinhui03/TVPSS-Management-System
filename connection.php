<?php

    $database= new mysqli("localhost","root","","wpdc");    //connection to SWL database

    if ($database->connect_error){
        die("Connection failed:  ".$database->connect_error);
    }

?>