<?php
include 'db.php';

$query = "
SELECT 
    c.complaint_id,
    CONCAT(ci.first_name,' ',ci.last_name) AS citizen_name,
    c.type,
    c.description,
    c.date,
    c.status,
    CONCAT(e.first_name,' ',e.last_name) AS assigned_to_name
FROM Complaints c
JOIN Citizens ci ON c.citizen_id = ci.citizen_id
LEFT JOIN Employees e ON c.assigned_to = e.employee_id
ORDER BY c.date DESC
";

$result = mysqli_query($conn, $query);

$data = [];
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

header('Content-Type: application/json');
echo json_encode($data);
