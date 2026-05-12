<?php
include 'db.php';

$query = "
SELECT 
    p.invoice_number,
    CONCAT(c.first_name,' ',c.last_name) AS citizen_name,
    c.phone,
    p.amount,
    p.payment_date,
    p.method,
    p.status
FROM Payments p
JOIN Citizens c ON p.citizen_id = c.citizen_id
ORDER BY p.payment_date DESC
";

$result = mysqli_query($conn, $query);

$data = [];
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

header('Content-Type: application/json');
echo json_encode($data);
