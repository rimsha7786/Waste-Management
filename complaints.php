<?php
include "db.php";
$query = "
SELECT C.type, C.status, Ci.first_name, Ci.last_name
FROM Complaints C
JOIN Citizens Ci ON C.citizen_id = Ci.citizen_id
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

<h2>Complaints</h2>
<table border="1">
<tr>
<th>Citizen</th><th>Type</th><th>Status</th>
</tr>

<?php while($c = mysqli_fetch_assoc($result)) { ?>
<tr>
<td><?php echo $c['first_name']." ".$c['last_name']; ?></td>
<td><?php echo $c['type']; ?></td>
<td><?php echo $c['status']; ?></td>
</tr>
<?php } ?>
</table>
