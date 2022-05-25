<html>
<?php
$con = mysqli_connect("localhost","root","root","dental_office_test");

if (!$con){ die('Could not connect: ' . mysqli_error()); }

mysqli_select_db($con,"dental_office_test");

$provider_id=$_POST['provider_id'];
$first_name= $_POST['first_name'];
$last_name= $_POST['last_name'];
$contact= $_POST['contact'];
$email= $_POST['email'];

 
$query  = "
UPDATE `provider.provider_info`
SET first_name ='$first_name',last_name ='$last_name'
WHERE provider_id ='$provider_id';" ;

$update_contact_query  = "
UPDATE `provider.provider_contact`
SET provider_contact ='$contact',email ='$email'
WHERE provider_id ='$provider_id';" ;


mysqli_query($con,$query);

mysqli_query($con,$update_contact_query);

echo "<a href='home.php'>Home</a><br/>";
?>
</html>