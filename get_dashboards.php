<?php
ob_clean(); // Clears any accidental spaces or previous output
header('Content-Type: application/json');
error_reporting(0); // Hides warnings that break JSON
include 'db.php';

if (!$conn) {
    die(json_encode(["error" => "Database connection failed"]));
}

$stats = array();

// Helper function to fetch counts
function getCount($conn, $query) {
    $result = mysqli_query($conn, $query);
    if ($result) {
        $row = mysqli_fetch_assoc($result);
        return $row['count'] ?? $row['total'] ?? 0;
    }
    return 0;
}

// These keys must match your JavaScript exactly
$stats['total_bins'] = getCount($conn, "SELECT COUNT(*) as count FROM Bins");
$stats['total_complaints'] = getCount($conn, "SELECT COUNT(*) as count FROM Complaints");
$stats['pending_complaints'] = getCount($conn, "SELECT COUNT(*) as count FROM Complaints WHERE status='Pending'");
$stats['total_vehicles'] = getCount($conn, "SELECT COUNT(*) as count FROM Vehicles");
$stats['active_vehicles'] = getCount($conn, "SELECT COUNT(*) as count FROM Vehicles WHERE status='Active'");
$stats['total_citizens'] = getCount($conn, "SELECT COUNT(*) as count FROM Citizens");

// Bins by Status Table logic
$result = mysqli_query($conn, "SELECT status, COUNT(*) as count FROM Bins GROUP BY status");
$bins_status = array();
if ($result) {
    while($row = mysqli_fetch_assoc($result)) {
        $bins_status[] = $row;
    }
}
$stats['total_revenue'] = getCount($conn, "SELECT SUM(amount) as total FROM Payments WHERE status='Paid'");
$stats['bins_by_status'] = $bins_status;

echo json_encode($stats);
mysqli_close($conn);
?>