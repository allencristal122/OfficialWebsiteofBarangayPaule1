<?php
    $conn = new mysqli('localhost', 'id22105062_root', 'Allen_122', 'id22105062_barangay_paule1');

    if ($conn->connect_error) {
        die("Connection failed: ". $conn->connect_error);
    }
?>