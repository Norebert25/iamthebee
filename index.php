<!DOCTYPE html>
<html lang="hu">
<?php
include 'functions.php';
head();
?>
<body>

<?php
navbar();
include "dbconnection.php";
$connection = DBconnection::getInstance(DBconnection::$database_name);
$oszloplista=array("Cim", "Boritokep", "Id");
$distinct=array(0,0,0);
$tablalista=array("film");
$feltelteek=null;
$result = $connection->select($oszloplista, $distinct, $tablalista, $feltelteek);
?>
<h1>HOME PAGE</h1>
<div class="content">
    <?php
        while($v = mysqli_fetch_assoc($result)){
            echo "
                <form action='filmSingle.php' style='display: inline-block' method='post'>
                    <input type='image' name='submit' alt='{$v["Cim"]}' src='{$v["Boritokep"]}' class='boritokep' style='width: 250px; padding: 20px'>
                    <input type='hidden' value='{$v["Id"]}' name='filmID'>
                </form>
                {$v["Id"]}    
            ";
        }
    ?>

</div>

</body>


</html>