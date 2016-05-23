<?php
require_once("connection.php");

class Complejo
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
    
    
}