<?php
// echo is used to output text with php
echo "PROVIDER INFO";
echo "<br/>";

// creating a connection to the database
$con = mysqli_connect("localhost","root","root","dental_office_test");

// if connection to the database fails an error is thrown
if (!$con){
  die('Could not connect: ' . mysqli_error());
}
  
// selecting the database for the connection created  
mysqli_select_db($con,"dental_office_test");


  $query_provider_info=

("INSERT INTO `provider.provider_info`(first_name, last_name, provider_type_id)VALUES 
('{$_POST['fname']}','{$_POST['lname']}','{$_POST['category']}');");

$result_provider_info = mysqli_query($con,$query_provider_info);


$query_provider_contact = ("UPDATE `provider.provider_contact` SET provider_contact='{$_POST['contact']}',
 email = '{$_POST['email']}' 
where provider_id = (SELECT MAX(provider_id) from `provider.provider_info`)");

mysqli_query($con, $query_provider_contact);


//closing the connection
mysqli_close($con);


echo "<br/>";
echo "<p>Name - {$_POST['fname']} </p> <br/>";
echo "<p>Email - {$_POST['lname']} </p> <br/>";
echo "<p>Contact - {$_POST['contact']} </p> <br/>";

echo "<a href='home.php'>Home</a><br/>";
?>