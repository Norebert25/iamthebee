<?php
    header("Location: index.php");
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["jelszo"];

    include 'dbconnection.php';
    $connection = DBconnection::getInstance(DBconnection::$database_name);
    //$connection->connectDB("film");
    $args = array('Username'=>$username, 'Jelszo'=>$password, 'Email'=>$email);
    $connection->insertInto('felhasznalo', $args);
    exit();

