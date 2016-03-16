<?php
header('Access-Control-Allow-Origin: *');  
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Headers: Content-Type');



/*class Connection extends MySQLi {
   
     private static $instance = null;
     const HOST =  getenv('IP');
     const USER = getenv('C9_USER');
     const PASSWORD = '';       
     const DATABASE = 'resergol';


     
         
     private function __construct($host, $user, $password, $database){ 
         parent::__construct($host, $user, $password, $database);
     }

     public static function getInstance(){
         if (self::$instance == null){
             self::$instance = new self(self::HOST, self::USER, self::PASSWORD, self::DATABASE);
             self::$instance->query("SET NAMES 'utf8'");
         }
         return self::$instance ;
     }
}*/

    
$result = array(
    "error" => true,
    "message" => "Error interno del servidor"
);

function request($val){
    $request = json_decode(file_get_contents('php://input'), true);
      return $request[$val];
/*   
    if(isset($request[$val])){
        return $request[$val];
    }else{
        
        sendError("Parametros insuficientes: no se encuentra el parametro " . $val);
    }
    */
};


  function getConnection(){
    $servername = getenv('IP');
    $username = getenv('C9_USER');
    $password = "";
    $database = "resergol";
    $dbport = 3306;

    // Create connection
    $mysqli = new mysqli($servername, $username, $password, $database, $dbport);

    
    if ($mysqli->connect_errno) {
        sendError("Error al intentar establecer la coneccion a la base");
    }else{
        $mysqli->query("SET NAMES 'utf8'");
        return $mysqli;
    }
}

    


function sendResult($data, $msg){
    $result['error'] = false;
    $result['message'] = $msg;
    $result['data'] = $data;
    die(json_encode($result));
}


function sendError($error){
    //http_response_code(400);
    $result["error"] = true;
    $result["message"] = $error;
    die(json_encode($result));
}