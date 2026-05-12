<?php
include 'db.php';

// Handle Add Bin AJAX submission
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['bin_type'])) {
    $bin_type = mysqli_real_escape_string($conn, $_POST['bin_type']);
    $capacity = intval($_POST['capacity']);
    $status = mysqli_real_escape_string($conn, $_POST['status']);
    $fill_level = intval($_POST['fill_level']);
    $install_date = mysqli_real_escape_string($conn, $_POST['install_date']);
    $area_name = mysqli_real_escape_string($conn, $_POST['area_name']);

    // Check if area exists
    $area_query = mysqli_query($conn, "SELECT area_id FROM Areas WHERE area_name='$area_name'");
    if (mysqli_num_rows($area_query) > 0) {
        $area_row = mysqli_fetch_assoc($area_query);
        $area_id = $area_row['area_id'];
    } else {
        mysqli_query($conn, "INSERT INTO Areas (area_name) VALUES ('$area_name')");
        $area_id = mysqli_insert_id($conn);
    }

    // Insert bin
    $insert_query = "INSERT INTO Bins (bin_type, capacity, status, fill_level, install_date, area_id)
                     VALUES ('$bin_type', $capacity, '$status', $fill_level, '$install_date', $area_id)";
    if(mysqli_query($conn, $insert_query)){
        echo "Bin added successfully!";
    } else {
        echo "Error: ".mysqli_error($conn);
    }
    exit;
}
