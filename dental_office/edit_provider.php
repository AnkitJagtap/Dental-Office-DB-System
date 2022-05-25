<?php
$con = mysqli_connect("localhost","root","root","dental_office_test");
if (!$con){
  die('Could not connect: ' . mysqli_error());
  }
mysqli_select_db($con,"dental_office_test");

$provider_id= $_REQUEST['provider_id'];


$query = "select pi.provider_id, pi.first_name, pi.last_name, pc.provider_contact as contact, pc.email as email from `provider.provider_info` pi join `provider.provider_contact` pc 
on pi.provider_id  = pc.provider_id WHERE pi.provider_id = '$provider_id';";
$result= mysqli_query($con,$query) or die('Query failed: ' . mysqli_error());
$row = mysqli_fetch_array($result);

if($row!= NULL)
{
?>
<html>
<body style="background-color: rgba(71, 147, 227, 1)";>
<center>


    <h2>Fill in New Provider Details</h2>

    <form action="edit_provider_success.php" method="POST">
        <table cellpadding=2 cellspacing=2 border="0">
            <input type="hidden" name="provider_id" value="<?php echo $row['provider_id']; ?>">


            <tr>
                <th>First Name: </th>
                <td><input name="first_name" type="text" value="<?php echo $row['first_name']; ?>"></td>
            </tr>


            <tr>
                <th>Last Name: </th>
                <td><input name="last_name" type="text" value="<?php echo $row['last_name']; ?>"></td>
            </tr>

            <tr>
                <th>Contact: </th>
                <td><input name="contact" type="text" value="<?php echo $row['contact']; ?>"></td>
            </tr>

            <tr>
                <th>Email: </th>
                <td><input name="email" type="text" value="<?php echo $row['email']; ?>"></td>
            </tr>

            <tr>
                <td><input type="submit" value="Update Provider" /></td>
                <td><input type="Reset" value="Reset" /></td>

            </tr>

    </form>

</center>
</body>
</html>
<?php
}
?>