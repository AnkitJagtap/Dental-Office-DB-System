<?php
?>
<html>
<title>REGISTER PROVIDER</title>

<head>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
        integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <style>
    html,
    body {
        display: flex;
        justify-content: center;
        font-family: Roboto, Arial, sans-serif;
        font-size: 15px;
    }

    form {
        border: 5px solid rgba(189, 195, 199);
    }

    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 16px 8px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    .icon {
        font-size: 110px;
        display: flex;
        justify-content: center;
        color: #4286f4;
    }

    button {
        background-color: rgba(50, 50, 120);
        color: white;
        padding: 14px 0;
        margin: 10px 0;
        border: none;
        cursor: grab;
        width: 48%;
    }

    h1 {
        text-align: center;
        fone-size: 18;
    }

    button:hover {
        opacity: 0.8;
        background-color:rgba(8, 14, 44);
    }

    .formcontainer {
        text-align: center;
        margin: 24px 50px 12px;
    }

    .container {
        padding: 16px 0;
        text-align: left;
    }

    span.psw {
        float: right;
        padding-top: 0;
        padding-right: 15px;
    }

    /* Change styles for span on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
    </style>
</head>

<body style="background-color: rgba(71, 147, 227, 1)";>
    <form action="add_provider_info_success.php" method="POST">
        <h1>REGISTER PROVIDER</h1>
        <div class="icon">
            <i class="fas fa-user-circle"></i>
        </div>
        <div class="formcontainer">
            <div class="container">
                <label for="fname"><strong>FIRST NAME</strong></label>
                <input type="text" placeholder="Enter first name" name="fname" required>
                <label for="lname"><strong>LAST NAME</strong></label>
                <input type="text" placeholder="Enter Last name" name="lname" required><br><br>
                <label for="providertype"><strong>PROVIDER SPECIALTY</strong></label>
                <?php
                $con = mysqli_connect("localhost","root","root","dental_office_test");

                if (!$con){ die('Could not connect: ' . mysqli_error()); }

                mysqli_select_db($con,"dental_office_test");


                $sql = "SELECT category,provider_type_id FROM `provider.provider_type`";
                $result = mysqli_query($con,$sql);
                
                echo "<select name='category'>";
                echo "<option size=100 ></option> ";
                while ($row = mysqli_fetch_array($result)) {
                    echo "<option value='" . $row['provider_type_id'] . "'>" . $row['category'] . "</option>";
                }
                echo "</select>";
                echo "<br><br>"
                ?>
                <label for="contact"><strong>CONTACT</strong></label>
                <input type="text" placeholder="Enter contact" name="contact" required>
                <label for="contact"><strong>EMAIL</strong></label>
                <input type="text" placeholder="Enter email" name="email" required>
            </div>
            <button type="submit"><strong>REGISTER</strong></button>
    </form>
</body>

</html>