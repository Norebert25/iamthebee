<?php

class DBconnection{
    static $database_name = 'film';
    var $conn = null;
    private static $instance = null;

    private function __construct($database_name){
        $connection = mysqli_connect('localhost', 'root','') or die("Hibás csatlakozás!");
        // a karakterek helyes megjelenítése miatt be kell állítani a karakterkódolást!
        mysqli_query($connection, 'SET NAMES UTF-8');
        mysqli_query($connection, "SET character_set_results=utf8");
        mysqli_set_charset($connection, 'utf-8');
        if ( mysqli_select_db($connection, $database_name) ) {    // ha sikeres az adatbázis kiválasztása
        } else {                                    // nem sikerült csatlakozni az adatbázishoz
            die('Nem sikerült csatlakozni az adatbázishoz.');
        }
        $this->conn = $connection;
    }

    public static function getInstance($database_name){
        if(self::$instance==null){
            self::$instance= new DBConnection($database_name);
        }
        return self::$instance;
}

    function disconnectDB(){
        mysqli_close($this->conn); // lezárjuk az adatbázis-kapcsolatot
    }

    function getErrorMessage(){
        return mysqli_error($this->conn);
    }

    function insertInto($table_name, $arguments){
        //$arguments: kulcs-érték pár, ahol a kulcs az adatbázis mezője,
        //az érték pedig az adatbázisban a mező értéke
        $query = "INSERT INTO {$table_name} (";
        foreach($arguments as $key=>$value){
            $query.="$key";
            if(array_key_last($arguments)==$key){
            }else{
                $query.=", ";
            }
        }
        $query.=") VALUES (";
        foreach($arguments as $key=>$value){
            $query=$query."\"$value\"";
            if(array_key_last($arguments)==$key){
            }else{
                $query.=", ";}
        }
        $query.=");";
        mysqli_query($this->conn, $query);
    }

    function select($oszloplista, $distinct, $tablalista, $feltetelek){
        //megvalósítja a SELECT SQL utasítást
        //$oszloplista és $distinct megadja a megjelenítendő oszlopokat illetve azok egyedi mivoltát (a két tömb hossza egyenlő)
        //$tablalista megadja a megjelenítendő táblákat (ezekből lesz "Descartes-szorzat" - Németh Gábor)
        //$feltetelek string, szűrési feltételeket ad meg
        $query = "SELECT ";
        for($i=0;$i<sizeof($oszloplista);$i++){
            $o=($distinct[$i]==1?"DISTINCT ":"");
            $o.=$oszloplista[$i];
            $query.=$o;
            if($o!=end($oszloplista)){
                $query.=", ";
            }
        }
        $query.=" FROM ";
        foreach($tablalista as $o){
            $query.=$o;
            if($o!=end($tablalista)){
                $query.=" , ";
            }
        }
        if($feltetelek!=null){
            $query.=" WHERE {$feltetelek}";
        }
        //echo $query;
        return mysqli_query($this->conn, $query);
    }

    function update(){

    }

    function deleteFrom(){

    }

}





