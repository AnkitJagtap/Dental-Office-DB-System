<?php
$con = mysqli_connect("localhost","root","root","dental_office_test");
if (!$con){ die('Could not connect: ' . mysqli_error()); }
mysqli_select_db($con,"dental_office_test");

$searchtext=$_GET['searchtext'];

?>



<html>
<body style="background-color: rgba(71, 147, 227, 1)";>
<center>
    <h2>Search Results</h2>

    <?php

 $query = "select pi.provider_id, pi.first_name, pi.last_name, pc.provider_contact as contact, pc.email as email
from `provider.provider_info` pi join `provider.provider_contact` pc 
on pi.provider_id  = pc.provider_id where pi.first_name like '%$searchtext%' or pi.last_name like '%$searchtext%';";
 $result= mysqli_query($con,$query) or die('Query failed: ' . mysqli_error()); 
 $numresults= mysqli_query($con,$query);
 $numrows=mysqli_num_rows($numresults);

 if ($numrows == 0){

    echo ("<br><br><h3>No match Found</h3>");
    
}
 	
 else	
 {	
?>
    <style type="text/css">
    * {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
    }

    body {
        font-family: Helvetica;
        -webkit-font-smoothing: antialiased;
        background: rgba(71, 147, 227, 1);
    }

    h2 {
        text-align: center;
        font-size: 18px;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: white;
        padding: 30px 0;
    }

    /* Table Styles */

    .table-wrapper {
        margin: 10px 70px 70px;
        box-shadow: 0px 35px 50px rgba(0, 0, 0, 0.2);
    }

    .fl-table {
        border-radius: 5px;
        font-size: 12px;
        font-weight: normal;
        border: none;
        border-collapse: collapse;
        width: 100%;
        max-width: 100%;
        white-space: nowrap;
        background-color: white;
    }

    .fl-table td,
    .fl-table th {
        text-align: center;
        padding: 8px;
    }

    .fl-table td {
        border-right: 1px solid #f8f8f8;
        font-size: 12px;
    }

    .fl-table thead th {
        color: #ffffff;
        background: #4FC3A1;
    }


    .fl-table thead th:nth-child(odd) {
        color: #ffffff;
        background: #324960;
    }

    .fl-table tr:nth-child(even) {
        background: #F8F8F8;
    }

    /* Responsive */

    @media (max-width: 767px) {
        .fl-table {
            display: block;
            width: 100%;
        }

        .table-wrapper:before {
            content: "Scroll horizontally >";
            display: block;
            text-align: right;
            font-size: 11px;
            color: white;
            padding: 0 0 10px;
        }

        .fl-table thead,
        .fl-table tbody,
        .fl-table thead th {
            display: block;
        }

        .fl-table thead th:last-child {
            border-bottom: none;
        }

        .fl-table thead {
            float: left;
        }

        .fl-table tbody {
            width: auto;
            position: relative;
            overflow-x: auto;
        }

        .fl-table td,
        .fl-table th {
            padding: 20px .625em .625em .625em;
            height: 60px;
            vertical-align: middle;
            box-sizing: border-box;
            overflow-x: hidden;
            overflow-y: auto;
            width: 120px;
            font-size: 13px;
            text-overflow: ellipsis;
        }

        .fl-table thead th {
            text-align: left;
            border-bottom: 1px solid #f7f7f9;
        }

        .fl-table tbody tr {
            display: table-cell;
        }

        .fl-table tbody tr:nth-child(odd) {
            background: none;
        }

        .fl-table tr:nth-child(even) {
            background: transparent;
        }

        .fl-table tr td:nth-child(odd) {
            background: #F8F8F8;
            border-right: 1px solid #E6E4E4;
        }

        .fl-table tr td:nth-child(even) {
            border-right: 1px solid #E6E4E4;
        }

        .fl-table tbody td {
            display: block;
            text-align: center;
        }
    }
    </style>
    <div class="table-wrapper">
        <table class="fl-table">
            <thead>
                <!-- <table border='1'> -->
                <tr>
                    <th>FIRST NAME</td>
                    <th>LAST NAME</td>
                    <th>CONTACT</td>
                    <th>EMAIL</td>
                    <th>Action</td>
                </tr>
            </thead>

            <?php
while($row = mysqli_fetch_array($result))
 { 
 ?>
            <tbody>
                <tr>
                    <td><?php echo $row['first_name']; ?></td>
                    <td><?php echo $row['last_name']; ?></td>
                    <td><?php echo $row['contact']; ?></td>
                    <td><?php echo $row['email']; ?></td>
                    <td><a href="edit_provider.php?provider_id=<?php echo $row['provider_id']; ?>">Edit</a>&nbsp;
                        <a href="delete_provider.php?provider_id=<?php echo $row['provider_id']; ?>">Delete</a>
                    </td>
                </tr>
            </tbody>
            <?php 
  
   }  //end of while
   
 }  //end of else i.e match is found
 ?>
        </table>
</center>

</html>