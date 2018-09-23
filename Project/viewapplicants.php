<?php
session_start();
include("config.php");
$tab = 1;
$count = 0;
$tab2 = 1;
$count2 = 0;
$tab3 = 1;
$count3 = 0;
$uid = $_SESSION['Idnum'];
$sqli = "SELECT * FROM heads where HeadID = $uid";
$result2 = mysqli_query($conn,$sqli);
$count2 = mysqli_num_rows($result2);
$row2=mysqli_fetch_row($result2);
$_SESSION['Department'] = $row2[3];
        $depart = $_SESSION['Department'];
        
$sqlli = "SELECT * FROM tenders where Department=$depart";
$result3 = mysqli_query($conn,$sqlli);
$count3 = mysqli_num_rows($result3);
$row3=mysqli_fetch_row($result3);
$_SESSION['TenderID'] = $row3[0];
        $tenderid = $_SESSION['TenderID'];

            
$sql = "SELECT * FROM applications";
$result = mysqli_query($conn,$sql);
$count = mysqli_num_rows($result);
?>
<head>
		<link href="css/user.css" type="text/css" rel="stylesheet">
		<link href="images/fav.png" rel="icon" type="image/x-icon" />
		<title>View tender applications</title>
	</head>
	<body>
	<ul class="navbar">
		<li><span><img src="images/menu.png"></span></li>
		<li><a href="amanager.php" ><span>Home</span></a></li>
		<li><a href="managerdetails.php"><span>My Details</span></a></li>
        <li><a href="#" class="active">View applicants</a></li>
		<div class="dropdown">
		<li class="navbtn"><img src="images/user.svg"></li>
		<div class="dropdown-content">
		  <a href="logout.php">Log Out</a>
		</div>
		</div>
	</ul>
<div class="tendernew"><br>
<center><h3>APPLICANTS</h3>
    
    
    
    
			 <?php
echo $tenderid;
                     if($result = $conn->query($sql)){
                        if($result->num_rows > 0){
                
                       echo "<table>";
                            echo "<thead>";
                                echo "<tr>";
                                    echo "<th>TenderID</th>";
                                    echo "<th>IDNo</th>";
                                    echo "<th>Submission date</th>";
                                  
                                  
                                echo "</tr>";
                            echo "</thead>";
                            echo "<tbody>";
                   while($row = $result->fetch_array()){
                                echo "<tr>";
                                    echo "<td>" . $row['TenderID'] . "</td>";
                                    echo "<td>" . $row['IDNo'] . "</td>";
                                    echo "<td>" . $row['Submission date'] . "</td>";
                                echo "<td>";
                                  
                                          echo "<button>View Documents</button>";
                                    echo "</td>";
                                    echo "<td>";
                                  
                                          echo "<button>Grant Tender</button>";
                                    echo "</td>";
                                     echo "<td>";
                                        
                                          echo "<button>Reject Tender</button>";
                                    echo "</td>";
                                echo "</tr>";
                                }
                            echo "</tbody>";
                        echo "</table>";
                        // Free result set
                        $result->free();
                        } else{
                        echo "<p class='lead'><em>No records were found.</em></p>";
                        }
                         }
                        
                        
                        // Close connection
                        $conn->close();
                        ?>
				
</center>
</div>
    </div>

</body>
</html>