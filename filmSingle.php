<?php
include "functions.php";
//$cim = "Joker";
$username = "asdf";
$filmID = $_REQUEST["filmID"];
?>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <link rel="stylesheet" text="text/css" href="css/style.css">


</head>

<?php
echo "<body>";
navbar();
?>
<div class="content">
    <?php
    include "dbconnection.php";
    $connection = DBconnection::getInstance(DBconnection::$database_name);
    $oszloplista=array("Id", "Ertekelesek_Szama", "Korhatar", "Leiras", "Megjelenes_eve",
        "Cim", "Bevetel", "Forgalmaz");
    $distinct=array(0,0,0,0,0,0,0,0);
    $tablalista=array("film");
    $feltetelek="film.Id=\"{$filmID}\";";
    $result = $connection->select($oszloplista, $distinct, $tablalista, $feltetelek);
    while($v=mysqli_fetch_assoc($result)){
        foreach($oszloplista as $o){
            echo "<div id=\"$o\">".$v[$o]."</div><br>";
            if($o=="Id"){
                $filmID=$v[$o];
            }
        }
    }

    $result = $connection->select(array("MAX(HID)"), array(0), array("hozzaszolas"), "");
    $result=mysqli_fetch_assoc($result);
    $hozzaszolasID = 0;
    foreach($result as $r){
        $hozzaszolasID= $r+1;
    }
    ?>
    <br>
    <br>
    <h2>Kommentek:</h2>
    <?php
    $oszloplista=array("HID","Szoveg", "Felhasznalo", "Spoiler", "Film_id");
    $distinct=array(1,0,0,0,0);
    $tablalista=array("hozzaszolas");
    $feltetelek="hozzaszolas.Film_id=\"{$filmID}\";";
    $result=$connection->select($oszloplista, $distinct, $tablalista, $feltetelek);

    while($v=mysqli_fetch_assoc($result)){
        $class = ($v["Spoiler"]==1?"comment-spoiler, comment-body":"comment-body");
        echo "<div class='comment'>
                <table id=\"{$v['HID']}\">
                    <tr><td class='comment-username'>{$v["Felhasznalo"]}:</td></tr>
                    <tr><td class='{$class}'>{$v["Szoveg"]}</td></tr>   
                </table>
             </div>
             <br>";
    }



    ?>
    <br>
    <br>

    <form name="komment" method="post" action="addComment.php">
        <table>
            <tr><td>Posting as: [Username]</td></tr>
            <tr><td><textarea name="text" id="text" maxlength="255"></textarea> </td></tr>
            <tr><td>Spoiler? <input type="checkbox" name="spoiler"></td></tr>
            <tr><td><input type="submit" name="submit" method="post"> </td></tr>
            <tr><input type="hidden" name="hozzaszolasID" value="<?php echo $hozzaszolasID;?>"></tr>
            <tr><input type="hidden" name="username" value="<?php echo $username; ?>"></tr>
            <tr><input type="hidden" name="filmID" value="<?php echo $filmID;?>"></tr>
        </table>
    </form>


</div>
</body>