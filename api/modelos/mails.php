<?php
require_once("connection.php");
//require_once("bower_components\swiftmailer-5.x\lib\swift_required.php");
//include_once "bower_components\swiftmailer-5.x\lib\swift_required.php";
//require_once 'bower_components/swiftmailer-5.x/lib/swift_required.php';

class Mails
{
    
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    public function mandarMail(){

        $subject = 'Hello from Mandrill, PHP!';
        $from = array('you@yourdomain.com' =>'Your Name');
        $to = array(
         'matiasfumacoo@gmail.com'  => 'Recipient1 Name',
         'ivanjfernandez@outlook.com' => 'Recipient2 Name'
        );

        $text = "Mandrill speaks plaintext";
        $html = "<em>Mandrill speaks <strong>HTML</strong></em>";

        $transport = Swift_SmtpTransport::newInstance('smtp.mandrillapp.com', 587);
        $transport->setUsername('MANDRILL_USERNAME');
        $transport->setPassword('MANDRILL_PASSWORD');
        $swift = Swift_Mailer::newInstance($transport);

        $message = new Swift_Message($subject);
        $message->setFrom($from);
        $message->setBody($html, 'text/html');
        $message->setTo($to);
        $message->addPart($text, 'text/plain');

        if ($recipients = $swift->send($message, $failures))
        {
         echo 'Message successfully sent!';
        } else {
         echo "There was an error:\n";
         print_r($failures);
        }


    }
 
}

