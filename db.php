<?php
// Database Configuration
$host = "localhost";
$username = "Root";
$password = "RUA778866";
$database = "waste_management_pk";

// Create Connection
$conn = mysqli_connect($host, $username, $password, $database);

// Check Connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Set charset to UTF-8
mysqli_set_charset($conn, "utf8");
?>