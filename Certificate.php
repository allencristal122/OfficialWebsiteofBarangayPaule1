<!DOCTYPE html> 
<html lang="en"> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificates</title>
    <link rel="icon" href="images/logo1.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Certificate.css">
</head> 
<body>
    <header class="header"> 
        <a href="#" class="logo">
            <img src="images/logo1.png" alt="Error Image" height="60px" width="60px"/>
            <h2>Barangay Paule 1</h2>
        </a>
        <button class="hamburger" onclick="toggleMenu()"> 
            <div class="bar"></div>
            <div class="bar"></div>
            <div class="bar"></div>
        </button>
        <nav class="navigation"> 
            <a href="index.php" style="--i:1">Home</a>
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    Our Barangay</button>
                <div class="dropdown-content">
                  <a href="GeneralInformation.php">General Information</a>
                  <a href="History.php">History</a>
                  <a href="Maps.php">Maps</a>
                  <a href="Photos.php">Photo Album</a>
                </div>
            </div>
            <a id="Cert1" href="Certificate.php" style="--i:3; color: white; background-color: #00aaff;
            padding: 12px; border-radius: 30px;">Services</a>
            <a href="FAQ.php" style="--i:4">FAQ</a>
            <a href="Contact.php" style="--i:5">Contacts</a>
        </nav> 
    </header> 
    <section class="certificate">
        <h3 class="h31">Certificates</h3>
        <p>Here are the downloadable certificates</p>
        <hr>
        <h3 class="h32">General Services</h3>
        <?php
            include 'connection.php';

            $sql = "SELECT * FROM certificates";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $counter = 0; 
                while($row = $result->fetch_assoc()) {
                    if ($counter % 2 == 0) {
                        echo '<div class="container">';
                    }
                    $certificate_name  = $row["certificate_name"];
                    $file  = $row["file"];
                    $requirements  = $row["requirements"];
        ?>
            <div class="box">
                <h2 style="text-align: left;"><?php echo $certificate_name; ?></h2>
                <ul style="list-style-type: disc; padding-left: 20px;">
                    <?php
                        $requirements_list = explode("\n", $requirements);
                        foreach ($requirements_list as $requirement) {
                            echo "<li>$requirement</li>";
                        }
                    ?>
                </ul>
                <div class="button">
                <a id="view" href="uploads/<?php echo $file; ?>" class="a2" target="_blank"><em>View</em></a>
                <a id="download" href="uploads/<?php echo $file; ?>" class="a1" download><em>Download</em></a>
                </div>
            </div>
        <?php
                    $counter++;
                    if ($counter % 2 == 0) {
                        echo '</div>';
                    }
                }
                if ($counter % 2 != 0) {
                    echo '</div>';
                }
            } else {
                echo "0 results";
            }
            $conn->close();
        ?>
    </section>
    <footer> 
      <p>&copy; 2024 Barangay Paule 1. All rights reserved.</p> 
    </footer>
    <script src="index.js"></script>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script>
        function toggleMenu() {
            var navigation = document.querySelector('.navigation');
            var hamburger = document.querySelector('.hamburger');

            navigation.classList.toggle('active');

            hamburger.classList.toggle('active');
        }
    </script>
</body> 
</html> 
