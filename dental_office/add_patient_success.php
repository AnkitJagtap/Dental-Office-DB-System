<?php
// echo is used to output text with php
echo "PATIENT INFO";
echo "<br/>";

// creating a connection to the database
$con = mysqli_connect("localhost","root","root","dental_office_test");

// if connection to the database fails an error is thrown
if (!$con){
  die('Could not connect: ' . mysqli_error());
}
  
// selecting the database for the connection created  
mysqli_select_db($con,"dental_office_test"); 


  $query_patient_info=

("INSERT INTO `patient.patient_personal_info`(first_name, last_name, gender, email, date_of_birth)VALUES 
('{$_POST['fname']}','{$_POST['lname']}','{$_POST['gender']}','{$_POST['email']}','{$_POST['dob']}');");


mysqli_query($con,$query_patient_info);


$query_patient_address = ("UPDATE `patient.patient_address` SET patient_street='{$_POST['street']}',
 patient_city = '{$_POST['city']}', patient_state = '{$_POST['state']}', patient_zip = '{$_POST['zip']}' 
where patient_id = (SELECT MAX(patient_id) from `patient.patient_personal_info`)");

$query_patient_contact =("UPDATE `patient.patient_contact` SET contact = '{$_POST['contact']}' 
WHERE patient_id = (SELECT MAX(patient_id) from `patient.patient_personal_info`) ");

mysqli_query($con, $query_patient_address);
mysqli_query($con, $query_patient_contact);

//closing the connection
mysqli_close($con);


echo "<br/>";
echo "<p>Patient information added successfully<br/>";

echo "<a href='home.php'>Home</a><br/>";
?>