<html>
<?php
$con = mysqli_connect("localhost","root","root","dental_office_test");
if (!$con){ die('Could not connect: ' . mysqli_error()); }
mysqli_select_db($con,"dental_office_test");

$patient_id= $_REQUEST['patient_id'];
 
$query  = " DELETE FROM `patient.patient_personal_info`
WHERE patient_id='$patient_id';" ;

$delete_contact_query = 
"DELETE FROM `patient.patient_contact` WHERE patient_id = '$patient_id';" ;

$delete_address_query = "DELETE FROM `patient.patient_address` WHERE patient_id = $patient_id";

mysqli_query($con,$query);

mysqli_query($con,$delete_contact_query);

mysqli_query($con,$delete_address_query);

?>
<h3> Patient has been deleted ! </h3> <br />

<a href='home.php'>Home</a><br />

</html>