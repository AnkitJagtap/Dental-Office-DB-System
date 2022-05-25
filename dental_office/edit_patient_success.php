<html>
<?php
$con = mysqli_connect("localhost","root","root","dental_office_test");

if (!$con){ die('Could not connect: ' . mysqli_error()); }

mysqli_select_db($con,"dental_office_test");

$patient_id=$_POST['patient_id'];
$first_name= $_POST['first_name'];
$last_name= $_POST['last_name'];
$contact= $_POST['contact'];
$email= $_POST['email'];
$street= $_POST['street'];
$city = $_POST['city'];
$state = $_POST['state'];
$zip = $_POST['zip'];

 
$query  = "
UPDATE `patient.patient_personal_info`
SET first_name ='$first_name',last_name ='$last_name', email = '$email'
WHERE patient_id ='$patient_id';" ;

$update_address_query = "UPDATE `patient.patient_address` SET patient_zip = '$zip' , patient_street = '$street' , 
patient_state = '$state', patient_city = '$city' WHERE patient_id = '$patient_id' ";

$update_contact_query  = "
UPDATE `patient.patient_contact`
SET contact ='$contact' 
WHERE patient_id ='$patient_id';" ;

mysqli_query($con,$query);

mysqli_query($con,$update_address_query);

mysqli_query($con,$update_contact_query);

echo "<a href='manage_patient_info.php'>Go back to manage patient</a><br/>";
?>
</html>