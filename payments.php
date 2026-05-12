<?php
include "db.php";
$result = mysqli_query($conn, "SELECT * FROM Payments");
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
<h2>Payments</h2>
<table border="1">
<tr>
<th>Invoice</th><th>Amount</th><th>Method</th><th>Status</th>
</tr>

<?php while($p = mysqli_fetch_assoc($result)) { ?>
<tr>
<td><?php echo $p['invoice_number']; ?></td>
<td><?php echo $p['amount']; ?></td>
<td><?php echo $p['method']; ?></td>
<td><?php echo $p['status']; ?></td>
</tr>
<?php } ?>
</table>
