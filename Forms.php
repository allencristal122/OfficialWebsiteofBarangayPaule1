<?php
  session_start();

  if (!isset($_SESSION['username'])) {
      header("Location: Login.php");
      exit;
  }

  if (isset($_GET['logout'])) {
      session_destroy();

      header("Location: Login.php");
      exit;
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Forms</title>
  <link rel="icon" href="images/logo1.png" type="image/x-icon">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.7/sweetalert2.min.css">
  <link rel="stylesheet" href="Forms.css">
</head>
<body>
  <div>
    <div class="header">
      <div class="picfetch">
        <?php
            include 'connection.php';

              $sql = "SELECT * FROM proof_of_identity WHERE id = (SELECT id FROM profiledata WHERE email = ?)";
              $stmt = $conn->prepare($sql);
              $stmt->bind_param("s", $_SESSION['username']);
              $stmt->execute();
              $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $picture = $row["picture"];
            } else {
                $picture = "";
            }
                
              $sql = "SELECT * FROM profiledata WHERE email = ?";
              $stmt = $conn->prepare($sql);
              $stmt->bind_param("s", $_SESSION['username']);
              $stmt->execute();
              $result = $stmt->get_result();

            if ($result->num_rows > 0) {
              $row = $result->fetch_assoc();
              $firstname = $row["firstname"];
              $middlename = $row["middlename"];
              $lastname = $row["lastname"];
            } else {
              $firstname = "";
              $middlename = "";
              $lastname = "";
            }

            $stmt->close();
            $conn->close();
          ?>

          <img src="<?php echo $picture; ?>" width="80px" height="80px" onerror="this.style.display='none';">
          <p class="p"><?php echo $firstname . " " . $middlename . " " . $lastname; ?></p>
      </div>
      <i class="fas fa-bars hamburger" onclick="toggleNavigation()" style="display: none;"></i>
      <div class="profile-icon" onclick="toggleProfileDetails()">
          <i class="fas fa-user"></i>
          <div class="profile-details-container" id="profileDetailsContainer">
              <div class="profile">
              <?php
                include 'connection.php';

                $sql = "SELECT * FROM proof_of_identity WHERE id = (SELECT id FROM profiledata WHERE email = ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $_SESSION['username']);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $picture = $row["picture"];
                } else {
                    $picture = "";
                }

                $sql = "SELECT * FROM profiledata WHERE email = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $_SESSION['username']);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $firstname = $row["firstname"];
                    $middlename = $row["middlename"];
                    $lastname = $row["lastname"];
                } else {
                    $firstname = "";
                    $middlename = "";
                    $lastname = "";
                }

                $sql = "SELECT * FROM users WHERE userName = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $_SESSION['username']);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $userType = $row["userType"];
                } else {
                    $userType = "";
                }

                $stmt->close();
                $conn->close();
                ?>
                <img src="<?php echo $picture; ?>" alt="Barangay Hall of Paule 1" width="80px" height="80px">
                <div class="adminname">
                  <p class="p1"><?php echo $firstname . " " . $middlename . " " . $lastname; ?></p>
                  <p class="p2"><?php echo $userType; ?></p>
                </div>
              </div>
              <hr>
              <a href="UserProfile.php"><i class="bi bi-person"></i> Profile</a>
              <a href="ForgotPassword.php"><i class="bi bi-key"></i> Reset Password</a>
              <hr>
              <a href="#" onclick="confirmLogout()"><i class="bi bi-box-arrow-right"></i> Log Out</a>
          </div>
      </div>
    </div>
    <div class="navigation" id="navigation">
      <div class="logo">
        <img src="images/logo1.png" alt="Barangay Logo" height="40px" width="40px">
        <p>Barangay Records</p>
      </div>
      <div class="administrators">
        <p><em> Administrator</em></p>
      </div>
      <a href="AdminDashboard.php" class="a1"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
      <a href="BarangayOfficial.php" class="a1"><i class="fas fa-users"></i> Barangay Officials</a>
      <a href="Blotter.php" class="a1"><i class="fas fa-book"></i> Blotter</a>
      <a href="Resident.php" class="a1"><i class="fas fa-users"></i> Residents</a>
      <a href="Users.php" class="a1"><i class="fas fa-users-cog"></i> Users</a>
      <a href="Activity.php" class="a1"><i class="bi bi-activity"></i> Activity</a>
      <div class="dropdown" onclick="toggleDropdown()">
        <button class="btn btn-primary plus-toggle" type="button" id="dropdownMenuButton" >
          <i class="fas fa-cog"></i>Page <i class="bi bi-plus"></i>
        </button>
        <div class="dropdown-content" id="dropdownContent">
          <a href="Information.php"><i class="fas fa-chevron-right"></i>Information</a>
          <a href="Forms.php" id="forms"><i class="fas fa-chevron-right"></i>Forms</a>
          <a href="BarangayFAQ.php"><i class="fas fa-chevron-right"></i>FAQ</a>
          <a href="BarangayContact&Message.php" class="contact1"><i class="fas fa-chevron-right"></i>Contact</a>
        </div>
      </div>
      <a href="#" onclick="confirmLogout()" class="a1"><i class="fas fa-sign-out-alt"></i> Log Out</a>
    </div>
  </div>
  
  <div class="title-with-icon" style="z-index: 1;">
    <a href="AdminDashboard.php" title="Dashboard"><i class="bi bi-house"></i></a>
    <p>Barangay Forms</p>
  </div>

  <div class="overlay" id="overlay" onclick="hideForm()"></div>
  
  <?php
  include 'connection.php';

  $sql = "SELECT COUNT(*) AS totalcertificates FROM certificates";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
      $row = $result->fetch_assoc();
      $countcertificates = $row['totalcertificates'];
  } else {
      $countcertificates = 0;
  }

  $conn->close();
  ?>

  <div class="form" id="barangayOfficialsDashboard">
      <div class="title-with-icon1">
          <i class="fas fa-chart-line"></i>
          <h3>List Chart</h3>
          <button type="button" class="btn btn-success" onclick="showActivityForm()" style="margin-left: -50px;">Add Forms</button>
      </div>
      <hr>
      <div class="heading-and-buttons">
          <div class="show-entries">
              <label for="entries">Show Entries: </label>
              <input type="number" title="number" placeholder="0" value="<?php echo $countcertificates; ?>">
          </div>    
          <div class="search-bar">
              <p>Search: </p><input type="text" id="searchInput" onkeyup="searchForms()" placeholder="Search for names..." style="padding-left: 10px;">
          </div>
      </div>
      <hr>
      <table class="table-no-border">
          <thead>
              <tr>
                  <th>Certificate</th>
                  <th>Requirements</th>
                  <th>File</th>
                  <th>Date</th>
                  <th>Action</th>
              </tr>
          </thead>
          <tbody>
              <?php
              include 'connection.php';

              $limit = 5;
              $currentPage = isset($_GET['page']) ? $_GET['page'] : 1;
              $offset = ($currentPage - 1) * $limit;

              $searchQuery = isset($_GET['search']) ? $_GET['search'] : '';

              $sql = "SELECT * FROM certificates WHERE certificate_name LIKE '%$searchQuery%' LIMIT $limit OFFSET $offset";

              $result = $conn->query($sql);

              if ($result->num_rows > 0) {
                  while($row = $result->fetch_assoc()) {
                      echo "<tr>";
                      echo "<td>{$row['certificate_name']}</td>";
                      echo "<td><ul style='list-style: none; padding-left: 0;'>";
                      $requirements_list = explode("\n", $row['requirements']);
                      foreach ($requirements_list as $requirement) {
                          echo "<li>$requirement</li>";
                      }
                      echo "</ul></td>";
                      echo "<td><a href='uploads/{$row['file']}' target='_blank' style='outline: none; text-decoration: none; color: #000;'>{$row['file']}</a></td>";
                      echo "<td>{$row['created_at']}</td>";
                      echo "<td>";
                      echo "<a href='#' onclick='editForms(" . $row['id'] . ")' class='btn btn-primary btnedit' style='margin-right:5px;'>Edit</a>";
                      echo "<button class='btn btn-danger' onclick='deleteForm(" . $row['id'] . ")'>Delete</button>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='5'>No Data Available</td></tr>";
              }

              $conn->close();
              ?>
          </tbody>
      </table>
      <div class="navigation-buttons" style="width: 100%;">
          <p style="margin-right: 850px;">Showing <?php echo $countcertificates; ?> of <?php echo $limit; ?> entries.</p>
          <a href="?page=<?php echo $currentPage > 1 ? $currentPage - 1 : 1; ?>" class="btn <?php echo $currentPage == 1 ? 'btn-secondary disabled' : 'btn-primary'; ?>">Previous</a>
          <a style="width: 190px;" href="?page=<?php echo $currentPage < ceil($countcertificates / $limit) ? $currentPage + 1 : ceil($countcertificates / $limit); ?>" class="btn <?php echo $currentPage == ceil($countcertificates / $limit) ? 'btn-secondary disabled' : 'btn-primary'; ?>">Next</a>
      </div>
  </div>
  <footer class="footer">
    <div class="container">
        <p>&copy; 2024 Barangay Paule 1. All rights reserved.</p>
    </div>
  </footer>

  <div class="form-container" id="activityContainer">
    <div class="heading-with-icon"></h2><i class="fas fa-plus-circle"></i><h2>Add Forms</h2>
      <button type="button" class="btn-close" aria-label="Close" onclick="hideActivityForm()"></button>
    </div>
    <form action="forms_insert.php" method="POST" enctype="multipart/form-data">
      <div class="row">
          <div class="col-md-6">
                  <div class="form-group">
                    <label for="fullName" class="lab">Certificate Name</label>
                    <div class="input-group">
                      <span class="input-group-text"><i class="bi bi-chat-dots"></i></span>
                      <input type="text" class="form-control" id="certificate" name="certificate" placeholder="Enter certificate name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="contact" class="lab">Requirements</label>
                    <div class="input-group">
                      <textarea class="form-control" id="requirements" name="requirements" placeholder="Enter requirements"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="address" class="lab">File</label>
                    <div class="input-group">
                      <input type="file" class="form-control" id="file" name="file" placeholder="Enter file">
                    </div>
                  </div>
          </div>
          <div class="form-group text-center">
          <div class="col">
            <button type="button" class="btn btn-secondary btn3" onclick="hideActivityForm()">Close</button>
              <button type="submit" class="btn btn-primary btn4" id="add">Add</button>
          </div>
      </div>
      </div>
  </form>
  </div>

  <div class="form-container" id="editactivityContainer">
    <div class="heading-with-icon">
        <i class="fas fa-plus-circle"></i>
        <h2>Edit Forms</h2>
        <button type="button" class="btn-close" aria-label="Close" onclick="hideEditActivityForm()"></button>
    </div>
    <form action="forms_update.php" method="POST" enctype="multipart/form-data">
        <?php
          include 'connection.php';
          function fetchFormsData($conn, $formsId) {
              $formsId = mysqli_real_escape_string($conn, $formsId);
              $sql = "SELECT * FROM certificates WHERE id = '$formsId'";
              $result = $conn->query($sql);
              if ($result->num_rows > 0) {
                  $row = $result->fetch_assoc();
                  return $row;
              } else {
                  return null;
              }
          }

          if (isset($_GET['id'])) {
              $formsData = fetchFormsData($conn, $_GET['id']);
              if ($formsData) {
                  $formsid = $formsData["id"];
                  $formsname = $formsData["certificate_name"];
                  $formrequirements = $formsData["requirements"];
                  $formfile = $formsData["file"];
              } else {
                  echo "Forms not found";
              }
          } else {
              echo "Forms ID not provided";
          }
        ?>
        <input type="hidden" name="forms_id" value="<?php echo $formsid; ?>">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="fullName" class="lab">Certificate Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-chat-dots"></i></span>
                        <input type="text" class="form-control" id="certificate" name="certificate" placeholder="Enter certificate name" value="<?php echo $formsname; ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contact" class="lab">Requirements</label>
                    <div class="input-group">
                        <textarea class="form-control" id="requirements" name="requirements" placeholder="Enter requirements"><?php echo $formrequirements; ?></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="lab">File</label>
                    <div class="input-group">
                        <input type="file" class="form-control" id="file" name="file" placeholder="Enter file" value="<?php echo $formfile; ?>">
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group text-center">
            <div class="col">
                <button type="button" class="btn btn-secondary btn3" onclick="hideEditActivityForm()">Close</button>
                <button type="submit" class="btn btn-primary btn4" id="update">Update</button>
            </div>
        </div>
    </form>
  </div>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
    var addBtn = document.getElementById('add');

    if (addBtn) {
        addBtn.addEventListener('click', function() {
        Swal.fire({
          icon: 'success',
          title: 'Official Added Successfully',
          text: 'You have added the official successfully.',
            timer: 12000,
            showConfirmButton: false
        }).then((result) => {
            if (result.dismiss === Swal.DismissReason.timer) {
              hideActivityForm();
            }
        });
        }, 3000);
      }
    });

    function deleteForm(formId) {
    Swal.fire({
        title: 'Are you sure?',
        text: 'Are you sure you want to delete this form?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'Forms has been deleted.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                }
            };
            xhttp.open("POST", "forms_delete.php", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("delete_id=" + formId);
        } else if (
            result.dismiss === Swal.DismissReason.cancel
        ) {
            Swal.fire(
                'Cancelled',
                'Your form is safe',
                'error'
            )
        }
    });
}

    function editForms(formId) {
      if (formId) {
            var editUrl = 'Forms.php?id=' + formId;
            window.location.href = editUrl;
        } else {
            console.error("Invalid userId:", formId);
      }
    }

    window.onload = function() {
        var urlParams = new URLSearchParams(window.location.search);
        var formId = urlParams.get('id'); 
        
        if (formId) {
            var editUrl = 'Forms.php?id=' + formId;
            showEditActivityForm(editUrl);
        }
    }
        
    function hideEditActivityForm() {
      var overlay = document.getElementById('overlay');
      var formContainer = document.getElementById('editactivityContainer');
      var blurredBackground = document.querySelector('.blurred-background'); 

      blurredBackground.parentNode.removeChild(blurredBackground);

      overlay.style.display = 'none';
      formContainer.style.display = 'none';

      window.location.href = 'Forms.php';
    }

    function showEditActivityForm(editUrl) {
      var overlay = document.getElementById('overlay');
      var formContainer = document.getElementById('editactivityContainer');
      var blurredBackground = document.createElement('div'); 
      blurredBackground.classList.add('blurred-background'); 

      document.body.appendChild(blurredBackground);

      overlay.style.display = 'block';
      formContainer.style.display = 'block';
    }

    document.addEventListener('DOMContentLoaded', function() {
      var updateBtn = document.getElementById('update');

      if (updateBtn) {
        updateBtn.addEventListener('click', function() {
          Swal.fire({
            icon: 'success',
            title: 'Official Edit Successfully',
            text: 'You have successfuly edit Official.',
            timer: 12000,
            showConfirmButton: false
          }).then((result) => {
            if (result.dismiss === Swal.DismissReason.timer) {
              hideEditActivityForm();
            }
          });
        }, 3000);
      }
    });

    function searchForms() {
        var input = document.getElementById("searchInput").value.toLowerCase();
        var tableRows = document.querySelectorAll("tbody tr"); 
        var filteredRows = 0;

        tableRows.forEach(function(row) {
        var cells = row.getElementsByTagName("td");
        var found = false;

        Array.from(cells).forEach(function(cell) {
            var cellText = cell.innerText.toLowerCase();
            if (cellText.includes(input)) {
                found = true;
            }
        });

        if (found) {
            row.style.display = "";
            filteredRows++;
        } else {
            row.style.display = "none";
        }
    });
    }

    function confirmLogout() {
        Swal.fire({
            title: 'Are you sure?',
            text: 'Are you sure you want to log out?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, log out',
            cancelButtonText: 'Cancel',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'Forms.php?logout=true';
            }
        });
    }
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.7/sweetalert2.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-euKpLsYQJz5jE0EEOxnTPI1a2ybp4QA9QfsB1LD73pI95/02djN3eVkD5bZlNumj" crossorigin="anonymous"></script>
  <script src="Admin.js"></script>
</body>
</html>