<?php
require 'phpmailer/PHPMailerAutoload.php';

$mail = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mail->isSMTP();
  
//$mail->Host = 'smtp.comcast.net';  // Specify main and backup SMTP servers
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'resergol@gmail.com';                 // SMTP username
$mail->Password = '123resergol321';                           // SMTP password
$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 587;                                    // TCP port to connect to

$mail->setFrom('from@example.com', 'Mailer');
//$mail->addAddress('iralapedro@gmail.com', 'Joe User');     // Add a recipient
//$mail->addAddress('matiasfumacoo@gmail.com');               // Name is optional
//$mail->addAddress('ivanjfernandez@outlook.com');               // Name is optional



$mail->addReplyTo('info@example.com', 'Information');
$mail->addCC('cc@example.com');
$mail->addBCC('bcc@example.com');


$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'RESERGOL!!!!!!!!!!';
$mail->Body    = 'Aguante <b>Resergol!</b>';
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

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

