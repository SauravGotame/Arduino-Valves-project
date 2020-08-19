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
if ( authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["create"]) || 
authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["edit"]) || 
authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["view"]) || 
authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["delete"]) ) {
 $status = TRUE;
}

if ($status === FALSE) {
die("You dont have the permission to access this page");
}

// set page title
$title = "Valve Testing";


include 'header.php';
?>
<div class="row">
    <div class="col-lg-9">

        <?php if (authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["create"])) { ?>
            <button class="btn btn-sm btn-primary" type="button"><i class="fa fa-plus"></i> NEW VALVE TEST</button> 
        <?php } ?>
        <div style="height: 10px;">&nbsp;</div>

        <div class=" table-responsive">
            <table class="table table-striped table-hover ">
                <tbody><tr>
                        <th>Valve #</th>
                        <th>Location</th>
                        <th>Zone</th>
                        <th style="width: 280px;">Actions</th>
                    </tr>
                    <?php for ($i = 1; $i <= 6; $i++) { ?>
                        <tr>
                            <td><?php echo $i; ?></td>
                            <td>Wolverhampton</td>
                            <td>1</td>
                            <td>
                                <?php if (authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["edit"])) { ?>
                                    <button class="btn btn-sm btn-info" type="button"><i class="fa fa-edit"></i> EDIT</button> 
                                <?php } ?>
                                <?php if (authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["view"])) { ?>
                                    <button class="btn btn-sm btn-warning" type="button"><i class="fa fa-search-plus"></i> STATUS</button>
                                <?php } ?>
                                <?php if (authorize($_SESSION["access"]["VALVES"]["VALVETEST"]["delete"])) { ?>
                                    <button class="btn btn-sm btn-danger" type="button"><i class="fa fa-trash-o"></i> TEST</button>
                                <?php } ?>
                            </td>
                        </tr>
                    <?php } ?>

                </tbody></table>
        </div>


        <div style="height: 20px;">&nbsp;</div>
        <a href="dashboard.php"><button class="btn btn-lg btn-info" type="button"><i class="fa fa-backward"></i> Back to user dashboard</button></a>

    </div>

</div>