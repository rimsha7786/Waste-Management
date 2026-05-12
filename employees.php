<?php
include "db.php";
$result = mysqli_query($conn, "SELECT * FROM Employees");
?>

<h2>Employees</h2>
<table border="1">
<tr>
<th>ID</th><th>Name</th><th>Role</th><th>Status</th>
</tr>

<?php while($e = mysqli_fetch_assoc($result)) { ?>
<tr>
<td><?php echo $e['employee_id']; ?></td>
<td><?php echo $e['first_name']." ".$e['last_name']; ?></td>
<td><?php echo $e['job_role']; ?></td>
<td><?php echo $e['status']; ?></td>
</tr>
<?php } ?>
</table>
