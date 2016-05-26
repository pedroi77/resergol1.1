<?php
    header('Access-Control-Allow-Origin: *');  
    header('Content-Type: application/json; charset=utf-8');
    header('Access-Control-Allow-Headers: Content-Type');
    
class Connection extends MySQLi{
    
     private static $instance = null ;
     
     //si lo uso desde localhost
     const HOST = 'localhost';
     const USER = 'root';
     const PASSWORD = '';       
     const DATABASE = 'resergol';
     
         
     private function __construct($host, $user, $password, $database){ 
         parent::__construct($host, $user, $password, $database);
     }

     public static function getInstance(){
       
         
         //if (self::$instance == null){ //comento por que anda mal si la instancia ya esta abierta
            self::$instance = new self(self::HOST, self::USER, self::PASSWORD, self::DATABASE); //si lo uso desde localhost
              
            $servername ='localhost';
            $username = 'root';
            $password = '';
            $database = 'resergol';
            $dbport = 3306;
             
             self::$instance =new mysqli($servername, $username, $password, $database, $dbport);
             self::$instance->query("SET NAMES 'utf8'");
        // }
         return self::$instance ;
     }
}


//////////////////////////////
