<?php
                $con = mysqli_connect("localhost","root","root","dental_office_test");

                if (!$con){ die('Could not connect: ' . mysqli_error()); }

                mysqli_select_db($con,"dental_office_test");


                $sql = "SELECT category FROM provider_type";
                $result = mysqli_query($con,$sql);
                
                echo "<select name='category'>";
                while ($row = mysql_fetch_array($result)) {
                    echo "<option value='" . $row['category'] . "'>" . $row['category'] . "</option>";
                }
                echo "</select>";

                ?>