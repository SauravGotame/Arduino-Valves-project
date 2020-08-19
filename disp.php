<?php
//connection to the database
include 'conn.php';



//Select Database
$sql = "SELECT * FROM system_users";
$result = $conn->query($sql);
?>


<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" type="text/css" href="style.css">
    </head>
<body>
<h1 align="center"> System Users </h1>
<table id="table1" border="1" align="center" style="line-height:25px;">
<tr>
<th> User ID </th>
<th> Username </th>
<th> Password </th>
<th> Role Code </th>     
</tr>
<?php
    
    
//Fetch data from database
if($result->num_rows > 0) {
while($row = $result -> fetch_assoc()) {
?>
    <div class="table1">
    
<tr>
            <td align="center" width=75px;><?php echo $row['u_userid']; ?></td>
            <td align="center" width=120px;><?php echo $row['u_username']; ?></td>
            <td align="center" width=120px;><?php echo $row['u_password']; ?></td>
            <td align="center" width=130px;><?php echo $row['u_rolecode']; ?></td>
        </tr>
        </div>
        
        <?php
            }
        }
        else
        {
            ?>
        <tr>
        <th colspan="2"> There is no data found!!</th>
        </tr>
        <?php
        }
    ?>
    </table>
    </body>
</html>