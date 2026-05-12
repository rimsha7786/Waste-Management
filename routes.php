<?php
include "db.php";
$query = "
SELECT R.route_name, A.area_name, V.vehicle_number
FROM Routes R
JOIN Areas A ON R.area_id = A.area_id
JOIN Vehicles V ON R.vehicle_id = V.vehicle_id
";
$result = mysqli_query($conn, $query);
?>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #e0e0e0; /* grey page background */
        padding: 2rem;
    }

    h2 {
        color: #28a745; /* green title */
        margin-bottom: 1.5rem;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: #d4edda; /* light green like login box */
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 1rem;
        text-align: left;
    }

    th {
        background: #28a745; /* green header */
        color: white;
    }

    tr:nth-child(even) {
        background: #c3e6cb; /* slightly darker green for even rows */
    }

    tr:hover {
        background: #b2d8b2; /* hover effect */
    }

    @media (max-width: 768px) {
        table, th, td {
            font-size: 0.85rem;
        }
        th, td {
            padding: 0.5rem;
        }
    }
</style>
<h2>Routes</h2>
<table border="1">
<tr>
<th>Route</th><th>Area</th><th>Vehicle</th>
</tr>

<?php while($r = mysqli_fetch_assoc($result)) { ?>
<tr>
<td><?php echo $r['route_name']; ?></td>
<td><?php echo $r['area_name']; ?></td>
<td><?php echo $r['vehicle_number']; ?></td>
</tr>
<?php } ?>
</table>
