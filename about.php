<?php
/*
 * @author Carl Wilding
 */

require_once("config.php");
if (!isset($_SESSION["user_id"]) || $_SESSION["user_id"] == "") {
    // not logged in send to login page
    redirect("index.php");
}
$status = FALSE;
if ( authorize($_SESSION["access"]["OTHER"]["ABOUT"]["create"]) || 
authorize($_SESSION["access"]["OTHER"]["ABOUT"]["edit"]) || 
authorize($_SESSION["access"]["OTHER"]["ABOUT"]["view"]) || 
authorize($_SESSION["access"]["OTHER"]["ABOUT"]["delete"]) ) {
 $status = TRUE;
}

if ($status === FALSE) {
die("You dont have the permission to access this page");
}

// set page title
$title = "About";


include 'header.php';
?>

We are a group of Students at the University of Wolverhampton

        <div style="height: 20px;">&nbsp;</div>
        <a href="dashboard.php"><button class="btn btn-lg btn-info" type="button"><i class="fa fa-backward"></i> Back to user dashboard</button></a>

    </div>

    
</div>