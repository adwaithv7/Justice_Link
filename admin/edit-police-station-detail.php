<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['crmsaid']==0)) {
  header('location:logout.php');
  } else{
    if(isset($_POST['update']))
  {

$psid=intval($_GET['psid']);
$psname=$_POST['policestationname'];
$pscode=$_POST['policestationcode'];
$sql="Update tblpolicestation set PoliceStationName=:psname,PoliceStationCode=:pscode where id=:psid";
$query=$dbh->prepare($sql);
$query->bindParam(':psname',$psname,PDO::PARAM_STR);
$query->bindParam(':pscode',$pscode,PDO::PARAM_STR);
$query->bindParam(':psid',$psid,PDO::PARAM_STR);
$query->execute();
echo '<script>alert("Police Station detail has been updated.")</script>';
echo "<script>window.location.href ='manage-police-stations.php'</script>";


  

}

?>
<!doctype html>
<html class="fixed">
	<head>
		<title>Justice Link | Add Police Station</title>
		
		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="../assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="../assets/vendor/bootstrap-datepicker/css/datepicker3.css" />
		<link rel="stylesheet" href="../assets/stylesheets/theme.css" />
		<link rel="stylesheet" href="../assets/stylesheets/skins/default.css" />
		<link rel="stylesheet" href="../assets/stylesheets/theme-custom.css">
		<script src="../assets/vendor/modernizr/modernizr.js"></script>

	</head>
	<body>
		<section class="body">

			<!-- start: header -->
		<?php include_once('includes/header.php');?>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<?php include_once('includes/sidebar.php');?>
				<!-- end: sidebar -->

				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Add Police Station</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="dashboard.php">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Add</span></li>
								<li><span>Police</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					
					<div class="row">
						<div class="col-md-12">
							<form class="form-horizontal" method="post">
								 
								<section class="panel">
									<header class="panel-heading">

										<h2 class="panel-title">Add Police Station Detail</h2>
									
									</header>
									<div class="panel-body">
										<div class="validation-message">
											<ul></ul>
										</div>

									<?php
$psid=intval($_GET['psid']);
$sql="SELECT * from tblpolicestation where id=:psid";
$query = $dbh -> prepare($sql);
$query->bindParam(':psid',$psid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
foreach($results as $row)
{               ?>

										<div class="form-group">
											<label class="col-sm-3 control-label">Police Station Name <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="policestationname" required='true' value="<?php  echo htmlentities($row->PoliceStationName);?>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Police Station Code <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" name="policestationcode"  required="true" value="<?php  echo htmlentities($row->PoliceStationCode);?>">
											</div>
										</div>
									
									<?php } ?>
									</div>
									<footer class="panel-footer">
										<div class="row">
											<div class="col-sm-9 col-sm-offset-3">
												<button class="btn btn-sm btn-primary login-submit-cs" type="submit" name="update">Update</button>
											
											</div>
										</div>
									</footer>
								</section>
							</form>
						</div>
					
					</div>
					<!-- end: page -->
				</section>
			</div>

		</section>

		<!-- Vendor -->
		<script src="../assets/vendor/jquery/jquery.js"></script>
		<script src="../assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="../assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="../assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="../assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="../assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="../assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		<script src="../assets/vendor/jquery-validation/jquery.validate.js"></script>
		<script src="../assets/javascripts/theme.js"></script>
		<script src="../assets/javascripts/theme.custom.js"></script>
		<script src="../assets/javascripts/theme.init.js"></script>
		<script src="../assets/javascripts/forms/examples.validation.js"></script>
	</body>
</html><?php }  ?>