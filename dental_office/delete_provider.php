<html>
<?php
$con = mysqli_connect("localhost","root","root","dental_office_test");
if (!$con){ die('Could not connect: ' . mysqli_error()); }
mysqli_select_db($con,"dental_office_test");

$provider_id= $_REQUEST['provider_id'];
 
$query  = " DELETE FROM `provider.provider_info`
WHERE provider_id='$provider_id';" ;

$delete_contact_query = 
"DELETE FROM `provider.provider_contact` WHERE provider_id = '$provider_id';" ;

mysqli_query($con,$query);

mysqli_query($con,$delete_contact_query);

?>
<h3> Provider has been deleted ! </h3> <br />

<a href='home.php'>Home</a><br />

</html>