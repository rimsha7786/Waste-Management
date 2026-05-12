<?php
include 'db.php';

// Fetch all bins with area name
$result = mysqli_query($conn, "
SELECT b.bin_id, b.bin_type, b.capacity, b.fill_level, b.status, b.install_date, a.area_name
FROM Bins b
JOIN Areas a ON b.area_id = a.area_id
ORDER BY b.bin_id DESC
");

$bins = [];
while($row = mysqli_fetch_assoc($result)){
    $bins[] = $row;
}

header('Content-Type: application/json');
echo json_encode($bins);

mysqli_close($conn);
?>
