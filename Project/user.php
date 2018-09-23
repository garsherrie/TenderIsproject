<?php
session_start();
include("config.php");
$tab = 1;
$count = 0;
$sql = "SELECT * FROM tenders";
$result = mysqli_query($conn,$sql);
$count = mysqli_num_rows($result);
?>
<html>
	<head>
		<link href="css/user.css" type="text/css" rel="stylesheet">
		<link href="images/fav.png" rel="icon" type="image/x-icon" />
		<title>Tenderer's Module</title>
	</head>
	<body>
	<ul class="navbar">
		<li><span><img src="images/menu.png"></span></li>
		<li><a href="#" class="active"><span>Home</span></a></li>
		<li><a href="port.php"><span>Portfolio</span></a></li>
		<div class="dropdown">
		<li class="navbtn"><img src="images/user.svg"></li>
		<div class="dropdown-content">
		  <a href="#">Notifications</a>
		  <a href="logout.php">Log Out</a>
		  <a href="#">Contact Us</a>
		</div>
		</div>
	</ul>
	<?php
		if($count <= 0) {
	?>
	<center>
	<h2>There are currently no Tender Requests available.</h2><br>
	<h3>Please check back later</h3>
	</center>
	<?php
		}else {
		?>
	<h1>Available Tender Requests</h1>
	<?php
			while ($row=mysqli_fetch_row($result)){
	?>
	<div class="tender">
	<div class="text">
<!--		<h3>ID: <?php //printf($row[0])?></h3>-->
		<h2><?php printf($row[1])?></h2>
		<h3>Department: <?php printf($row[2])?></h3>
		<h3>Due Date: <?php printf($row[6])?></h3>
	</div>
	</div>
	<?php
			$tab++;
		}
	}
	?>
	</body>
</html>