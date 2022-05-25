<?php
$con = mysqli_connect("localhost","root","root","dental_office_test");
if (!$con){
  die('Could not connect: ' . mysqli_error());
  }
mysqli_select_db($con,"dental_office_test");

$patient_id = $_REQUEST['patient_id'];


$query = "select pi.patient_id as patient_id, pi.first_name, pi.last_name,pco.contact,pc.patient_street as street,pc.patient_city as city,
pc.patient_state as state, pc.patient_zip as zip, pi.email as email from
 `patient.patient_personal_info` pi join `patient.patient_address` pc on pi.patient_id  = pc.patient_id
 join `patient.patient_contact` pco on pco.patient_id = pi.patient_id 
 where pi.patient_id = $patient_id;";
$result= mysqli_query($con,$query) or die('Query failed: ' . mysqli_error());
$row = mysqli_fetch_array($result);

if($row!= NULL)
{
?>
<html>
<body style="background-color: rgba(71, 147, 227, 1)";>
<center>


    <h2>Fill in New Patient Details</h2>

    <form action="edit_patient_success.php" method="POST">
        <table cellpadding=2 cellspacing=2 border="0">
            <input type="hidden" name="patient_id" value="<?php echo $row['patient_id']; ?>">


            <tr>
                <th>First Name: </th>
                <td><input name="first_name" type="text" value="<?php echo $row['first_name']; ?>"></td>
            </tr>


            <tr>
                <th>Last Name: </th>
                <td><input name="last_name" type="text" value="<?php echo $row['last_name']; ?>"></td>
            </tr>

            <tr>
                <th>Email: </th>
                <td><input name="email" type="text" value="<?php echo $row['email']; ?>"></td>
            </tr>
            <tr>
                <th>Contact: </th>
                <td><input name="contact" type="text" value="<?php echo $row['contact']; ?>"></td>
            </tr>
            <tr>
                <th>Street: </th>
                <td><input name="street" type="text" value="<?php echo $row['street']; ?>"></td>
            </tr>
            <tr>
                <th>City: </th>
                <td><input name="city" type="text" value="<?php echo $row['city']; ?>"></td>
            </tr>
            <tr>
                <th>State: </th>
                <td><input name="state" type="text" value="<?php echo $row['state']; ?>"></td>
            </tr>
            <tr>
                <th>Zip: </th>
                <td><input name="zip" type="text" value="<?php echo $row['zip']; ?>"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Update Patient" /></td>
                <td><input type="Reset" value="Reset" /></td>

            </tr>

    </form>

</center>
</body>
</html>
<?php
}
?>