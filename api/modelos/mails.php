<?php
require_once("connection.php");
require 'phpmailer/PHPMailerAutoload.php';
//require_once("bower_components\swiftmailer-5.x\lib\swift_required.php");
//include_once "bower_components\swiftmailer-5.x\lib\swift_required.php";
//require_once 'bower_components/swiftmailer-5.x/lib/swift_required.php';

class Mails
{
    
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    public function mandarMail($mail){
        
        //RECEPTOR, ASUNTO, MENSAJE
        $receptor = $this->connection->real_escape_string($mail['receptor']);
        $asunto = $this->connection->real_escape_string($mail['asunto']);
        $mensaje = $this->connection->real_escape_string($mail['mensaje']);
        
        $mail = new PHPMailer;
        $mail->isSMTP();

        //$mail->Host = 'smtp.comcast.net';  // Specify main and backup SMTP servers
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = 'resergol@gmail.com';                 // SMTP username
        $mail->Password = '123resergol321';                           // SMTP password
        $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = 587;                                    // TCP port to connect to

        $mail->setFrom('resergol@gmail.com', 'Resergol');
        //$mail->addAddress('iralapedro@gmail.com', 'Joe User');     // Add a recipient
        //$mail->addAddress('matiasfumacoo@gmail.com');               // Name is optional
        $mail->addAddress($receptor);               // Name is optional



        /*$mail->addReplyTo('info@example.com', 'Information');
        $mail->addCC('cc@example.com');
        $mail->addBCC('bcc@example.com');*/


        //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
        //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
        $mail->isHTML(true);                                  // Set email format to HTML

        $mail->Subject = $asunto;
        //$mensaje += "<img src='images/logo/logoMediano.png'>";
        $mail->Body = $mensaje;
        $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
        //$mail->AddEmbeddedImage('images/logo/logoMediano.png', 'logoResergol');

        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );

        if(!$mail->send()) {
            echo "Error: " . $mail->ErrorInfo;
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        } else {
            echo 'Message has been sent';
        }


    }
 
}

