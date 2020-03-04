<?php
 require 'assets/php/db.php';
?>

<!Doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Wabi Cars</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
        <link rel="stylesheet" href="assets/bootstrap-4.3.1-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/fontawesome.css"> 
        <script src="assets/js/jquery-3.4.1.min.js"></script>
        <script src="assets/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/owl.carousel.js"></script>
    </head>
    <body>
        <div class="body-container">
            <nav class="navbar hidden fixed-top navbar-expand-lg navbar-light ">
                <a class="navbar-brand" href="#"><img src="assets/images/wabi.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="assets/php/new_cars.php">New Cars</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="assets/php/used_cars.php">Used Cars</a>
                        </li>
                    </ul>
                    <form class="form-inline header-search my-2 my-lg-0">
                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success " type="submit">Search</button>
                    </form>
                </div>
            </nav>
            <header>
                            
                <center>
                    <div class="header-comp">
                        <h2>Providing from everyday cars to luxurious cars</h2>
                        <div class="header-btns">
                            <a href="assets/php/new_cars.php" class="btn btn-primary">New Cars</a>
                            <a href="assets/php/used_cars.php" class="btn btn-warning">Used Cars</a>
                        </div>
                    
                    </div>
                    </center>

                <div class="header-cars">
                    <img src="assets/images/rove.png" class="header-range">
                    <img src="assets/images/mercedes.png" class="header-mercedes">
                </div>
                

                
            </header>

            <div class="models">
                <center>
                    
                <h3>Choose cars by model</h3><br><br>
                <div class="pill-tab">
                    <!-- Nav pills -->
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#new">New</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#used">Used</a>
                        </li>
                    
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="new" class="container tab-pane active"><br>
                        <div class="row" style="margin-left: -30vw;">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="row">
                            <?php
                                $stmt = "SELECT DISTINCT name FROM car_name WHERE id IN (SELECT name_id FROM cars WHERE new_or_used = 1 OR new_or_used = 2)";
                                if ($result2= mysqli_query($conn, $stmt)) {
                                    while($row2 = mysqli_fetch_array($result2)){
                                        echo '<div class="col-sm-6 col-xs-6">';
                                        echo '<a href="assets/php/cars_models.php?name='.$row2['name'].'">'.$row2['name'].'</a>';
                                        echo '</div>';
                                    }
                                }
                            ?>
                            
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                        <div id="used" class="container tab-pane fade"><br>
                            <div class="row" style="margin-left: -30vw;">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <div class="row">
                                    <?php
                                    $stmt = "SELECT DISTINCT name FROM car_name WHERE id IN (SELECT name_id FROM cars WHERE new_or_used = 3)";
                                    if ($result2= mysqli_query($conn, $stmt)) {
                                        while($row2 = mysqli_fetch_array($result2)){
                                            echo '<div class="col-sm-6 col-xs-6">';
                                            echo '<a href="assets/php/cars_models.php?name='.$row2['name'].'">'.$row2['name'].'</a>';
                                            echo '</div>';
                                        }
                                    }
                                ?>
                                    </div>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>
                    </div>
                </center>
            </div>


            <div class="recent-cars col-sm-12">
                <center>
                    <h3>Recently posted cars for sale</h3><br><br>

                    <div class="row">
                    <?php
                        $count=0;   
                        $stmt= "SELECT * FROM cars ORDER BY time_created desc LIMIT 8";
                        $result= mysqli_query($conn,$stmt);
                        while($row = mysqli_fetch_array($result)){
                            $time = strtotime($row['time_created']);
                            $myFormatForView = date("m/d/y g:i A", $time);

                                $stmt2="SELECT * FROM car_name WHERE id =". $row['name_id'];
                                $result2= mysqli_query($conn,$stmt2);
                                while($row2 = mysqli_fetch_array($result2)){
                                    $stmt3="SELECT * FROM image WHERE car_id =". $row['id'];
                                    $result3= mysqli_query($conn,$stmt3);
                                    while($row3 = mysqli_fetch_array($result3)){
                                        echo '';
                                        echo '<div class="col-sm-3">'; 
                                        echo '<a href="assets/php/detail.php?id='.$row["id"].'"><img src="uploads/'. $row3["path_1"].'" style="width: 15vw; height: 15vh;">';
                                        echo "<h3>". $row2['name']."</h3>";
                                        echo "<h6>".$myFormatForView."</h6>";
                                        echo "<h6> ".$row['price']."Birr</h6> </a>";
                                        if($row['new_or_used']==0){echo "<p><strong>New</strong></p>";}
                                        else{echo "<p><strong>Used</strong></p>";}
                                    echo '</div>';
                                    $count++;
                                    if($count=3){
                                        echo '<br><br>';
                                    }
                            }
                        }
                    }
                            ?>
                        
                        
                    </div>

                    <a  href="assets/php/cars.php"><button class="btn btn-primary">View All</button></a>
                </center>

            </div>



            <br><br><br><br><br><br>
            <footer>
                <div class="footer">
                        <i class="fab fa-facebook fa-2x logos"></i>
                        <i class="fab fa-twitter fa-2x logos"></i>
                        <i class="fab fa-linkedin-in fa-2x logos"></i>
                        <i class="fab fa-skype fa-2x logos"></i>
                        <i class="fab fa-google-plus-g fa-2x logos"></i>
                        <h5>2019 Wabi Cars</h5>
                        <h5>Powered by Genesis Technologies</h5>
                    </div>
            
                    
            </footer>
            
         </div>
    </body>
   
</html>