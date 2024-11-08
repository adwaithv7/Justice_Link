<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['crmspid']==0)) {
  header('location:logout.php');
  } else{

if(isset($_POST['submit']))
{
$name=$_POST['name'];
$mobnum=$_POST['mobnum'];
$email=$_POST['email'];
$address=$_POST['add'];
$eid=$_SESSION['crmspid'];

$sql="update tblpolice set Name=:name,MobileNumber=:mobnum,Email=:email,Address=:address where ID=:eid";
$query=$dbh->prepare($sql);
$query->bindParam(':name',$name,PDO::PARAM_STR);
$query->bindParam(':mobnum',$mobnum,PDO::PARAM_STR);
$query->bindParam(':email',$email,PDO::PARAM_STR);
$query->bindParam(':address',$address,PDO::PARAM_STR);
$query->bindParam(':eid',$eid,PDO::PARAM_STR);
$query->execute();
echo '<script>alert("Police detail has been updated")</script>';
echo "<script>window.location.href ='profile.php'</script>";

}
  ?>
<!doctype html>
<html class="fixed">
	<head>
		<title>Justice Link | Profile</title>
		
		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="../assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="../assets/vendor/bootstrap-datepicker/css/datepicker3.css" />
		<link rel="stylesheet" href="../assets/stylesheets/theme.css" />
		<link rel="stylesheet" href="../assets/stylesheets/skins/default.css" />
		<link rel="stylesheet" href="../assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
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
						<h2>Profile</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="dashboard.php">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>User</span></li>
								<li><span>Profile</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					
					<div class="row">
						<div class="col-md-12">
							<form class="form-horizontal" method="post">
								  <?php
$pid=$_SESSION['crmspid'];
$sql="SELECT * from  tblpolice where ID=:pid";
$query = $dbh -> prepare($sql);
$query->bindParam(':pid',$pid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $row)
{               ?>
								<section class="panel">
									<header class="panel-heading">
						

										<h2 class="panel-title">Police Profile</h2>
									
									</header>
									<div class="panel-body">
										<div class="validation-message">
											<ul></ul>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Your ID <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="exampleTextInput1" value="<?php  echo $row->PID;?>" readonly='true'>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Name <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="exampleTextInput1" name="name" value="<?php  echo $row->Name;?>" required='true'>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Email <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="email" class="form-control" id="email2" name="email" value="<?php  echo $row->Email;?>" required='true'>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Contact Number</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="mobnum" name="mobnum" value="<?php  echo $row->MobileNumber;?>" required='true' maxlength='10'>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Address</label>
											<div class="col-sm-9">
												<textarea type="text" class="form-control" name="add" cols="4" rows="4" required='true'><?php  echo $row->Address;?></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Joining Date <span class="required">*</span></label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="email2" name="" value="<?php  echo $row->JoiningDate;?>" readonly="true">
											</div>
										</div>
										
									</div><?php $cnt=$cnt+1;}} ?>
									<footer class="panel-footer">
										<div class="row">
											<div class="col-sm-9 col-sm-offset-3">
												<button class="btn btn-sm btn-primary login-submit-cs" type="submit" name="submit">Update</button>
											
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