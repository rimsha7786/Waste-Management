<?php
session_start();
include "db.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Waste Management System - Pakistan</title>
    <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #e0e0e0; /* soft grey background */
        min-height: 100vh;
    }

    /* Navigation */
    nav {
        background: #28a745; /* green nav */
        padding: 1rem 2rem;
        box-shadow: 0 3px 6px rgba(0,0,0,0.1);
        display: none;
        border-radius: 8px;
    }

    nav.active {
        display: block;
    }

    nav h1 {
        color: #d4edda; /* light green */
        margin-bottom: 1rem;
        font-size: 1.5rem;
    }

    nav ul {
        list-style: none;
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
    }

    nav button {
        background: #555; /* grey */
        color: #fff;
        border: none;
        padding: 0.7rem 1.5rem;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
        transition: all 0.3s;
    }

    nav button:hover {
        background: #218838; /* darker green hover */
        transform: translateY(-2px);
    }

    nav button.logout {
        background: #c0392b; /* red logout button */
        margin-left: auto;
    }

    /* Container */
    .container {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 0 1rem;
    }

    /* Pages */
    .page {
        display: none;
        background: #d4edda; /* light green like login box */
        border-radius: 15px;
        padding: 2rem;
        box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        animation: fadeIn 0.5s;
    }

    .page.active {
        display: block;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Login Page */
    .login-box {
        max-width: 400px;
        margin: 100px auto;
        background: #d4edda; /* light green */
        padding: 3rem;
        border-radius: 15px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        text-align: center;
    }

    .login-box h2 {
        color: #28a745; /* green */
        margin-bottom: 2rem;
        font-size: 2rem;
    }

    .login-box input {
        width: 100%;
        padding: 1rem;
        margin-bottom: 1rem;
        border: 2px solid #cfcfcf; /* grey border */
        border-radius: 8px;
        font-size: 1rem;
        transition: border 0.3s;
    }

    .login-box input:focus {
        outline: none;
        border-color: #28a745; /* green focus */
    }

    .login-box button {
        width: 100%;
        padding: 1rem;
        background: #555; /* grey button */
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1.1rem;
        cursor: pointer;
        transition: transform 0.3s;
    }

    .login-box button:hover {
        transform: scale(1.05);
        background: #218838; /* darker green hover */
    }

    /* Dashboard Cards */
    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1.5rem;
        margin-bottom: 2rem;
    }

    .card {
        background: #d4edda; /* same light green as login */
        color: #155724; /* dark green text */
        padding: 2rem;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: transform 0.3s, background 0.3s;
    }

    .card:hover {
        transform: translateY(-5px);
        background: #c3e6cb; /* slightly darker green */
    }

    .card h3 {
        font-size: 1rem;
        margin-bottom: 1rem;
        opacity: 0.9;
    }

    .card .number {
        font-size: 2.5rem;
        font-weight: bold;
    }

    /* Tables */
    .table-container {
        overflow-x: auto;
        margin-top: 2rem;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: #d4edda; /* light green table */
        border-radius: 10px;
        overflow: hidden;
    }

    th {
        background: #28a745; /* green header */
        color: white;
        padding: 1rem;
        text-align: left;
        font-weight: 600;
    }

    td {
        padding: 1rem;
        border-bottom: 1px solid #cfcfcf; /* grey line */
    }

    tr:hover {
        background: #c3e6cb; /* darker green hover */
    }

    .status-badge {
        display: inline-block;
        padding: 0.3rem 0.8rem;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 600;
        background: #c3e6cb;
        color: #155724;
    }

    /* Loading */
    .loading {
        text-align: center;
        padding: 2rem;
        color: #28a745; /* green */
        font-size: 1.2rem;
    }

    /* Page Header */
    .page-header {
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 3px solid #28a745; /* green */
    }

    .page-header h2 {
        color: #28a745;
        font-size: 2rem;
    }

    /* Responsive */
    @media (max-width: 768px) {
        nav ul {
            flex-direction: column;
        }

        .dashboard-grid {
            grid-template-columns: 1fr;
        }

        table {
            font-size: 0.85rem;
        }

        th, td {
            padding: 0.5rem;
        }
    }
</style>

</head>
<body>
    <!-- Navigation -->
    <nav id="mainNav">
        <h1>🗑️ Smart Waste Management System</h1>
        <ul>
            <button onclick="showPage('dashboard')">📊 Dashboard</button>
            <button onclick="showPage('bins')">🗑️ Bins Management</button>
            <button onclick="showPage('complaints')">📝 Complaints</button>
            <button onclick="showPage('payments')">💰 Payments</button>
            <button class="logout" onclick="logout()">🚪 Logout</button>
        </ul>
    </nav>

    <div class="container">
        <!-- Login Page -->
        <div id="loginPage" class="page active">
            <div class="login-box">
                <h2>🗑️ Smart Waste System</h2>
                <p style="color: #666; margin-bottom: 2rem;">Lahore, Pakistan</p>
                <input type="text" id="username" placeholder="Username" value="admin">
                <input type="password" id="password" placeholder="Password" value="admin123">
                <button onclick="login()">Login</button>
            </div>
        </div>

        <!-- Dashboard Page -->
      <div id="dashboardPage" class="page">
    <div class="page-header">
        <h2>📊 Dashboard Overview</h2>
    </div>
    <div class="dashboard-grid"> <div class="card green">
            <h3>Total Bins</h3>
            <div class="number" id="totalBins">-</div>
        </div>

        <div class="card blue">
            <h3>Active Vehicles</h3>
            <div class="number" id="activeVehicles">-</div>
        </div>

        <div class="card yellow">
            <h3>Total Revenue</h3>
            <div class="number" id="totalRevenue">-</div>
        </div>

        <div class="card orange">
            <h3>Total Citizens</h3>
            <div class="number" id="totalCitizens">-</div>
        </div>

        <div class="card red">
            <h3>Pending Complaints</h3>
            <div class="number" id="pendingComplaints">-</div>
        </div>
    </div>

    <h3 style="margin-top: 2rem; color: #155724;">Bins Status Distribution</h3>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Status</th>
                    <th>Count</th>
                </tr>
            </thead>
            <tbody id="binsStatusTable">
                <tr><td colspan="2" class="loading">Loading...</td></tr>
            </tbody>
        </table>
    </div>
</div>

       <!-- Bins Management Page -->
<div id="binsPage" class="page">

    <!-- Page Header -->
    <div class="page-header">
        <h2>🗑️ Bins Management</h2>
    </div>

    <!-- Add New Bin Form -->
   <div class="add-bin-form">
    <h3>Add New Bin</h3>
   <form id="addBinForm">
    <label>Bin Type:</label>
    <input type="text" name="bin_type" required>

    <label>Capacity (L):</label>
    <input type="number" name="capacity" min="1" required>

    <label>Status:</label>
    <select name="status" required>
        <option>Empty</option>
        <option>Partial</option>
        <option>Full</option>
    </select>

    <label>Fill Level (%):</label>
    <input type="number" name="fill_level" min="0" max="100" value="0" required>

    <label>Install Date:</label>
    <input type="date" name="install_date" value="<?php echo date('Y-m-d'); ?>" required>

    <label>Area:</label>
    <input type="text" name="area_name" placeholder="Enter area" required>

    <button type="submit">Add Bin</button>
</form>
<p id="addBinMessage" style="color:green;"></p>>
</div>

    <!-- Table Container -->
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Bin ID</th>
                    <th>Type</th>
                    <th>Capacity (L)</th>
                    <th>Area</th>
                    <th>Fill Level (%)</th>
                    <th>Status</th>
                    <th>Install Date</th>
                </tr>
            </thead>
            <tbody id="binsTable">
                <tr><td colspan="7" class="loading">Loading...</td></tr>
            </tbody>
        </table>
    </div>

</div>


        <!-- Complaints Page -->
        <div id="complaintsPage" class="page">
            <div class="page-header">
                <h2>📝 Complaints Management</h2>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Citizen</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Assigned To</th>
                        </tr>
                    </thead>
                    <tbody id="complaintsTable">
                        <tr><td colspan="7" class="loading">Loading...</td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Payments Page -->
        <div id="paymentsPage" class="page">
            <div class="page-header">
                <h2>💰 Payments Management</h2>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Invoice</th>
                            <th>Citizen</th>
                            <th>Phone</th>
                            <th>Amount (PKR)</th>
                            <th>Date</th>
                            <th>Method</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="paymentsTable">
                        <tr><td colspan="7" class="loading">Loading...</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Login Function
        function login() {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            if (username && password) {
                document.getElementById('loginPage').classList.remove('active');
                document.getElementById('dashboardPage').classList.add('active');
                document.getElementById('mainNav').classList.add('active');
                loadDashboard();
            } else {
                alert('Please enter username and password');
            }
        }

        // Logout Function
        function logout() {
            document.getElementById('mainNav').classList.remove('active');
            document.querySelectorAll('.page').forEach(page => page.classList.remove('active'));
            document.getElementById('loginPage').classList.add('active');
        }

        // Show Page
        function showPage(pageName) {
            document.querySelectorAll('.page').forEach(page => page.classList.remove('active'));
            document.getElementById(pageName + 'Page').classList.add('active');

            if (pageName === 'dashboard') loadDashboard();
            else if (pageName === 'bins') loadBins();
            else if (pageName === 'complaints') loadComplaints();
            else if (pageName === 'payments') loadPayments();
        }

        // Load Dashboard
       function loadDashboard() {
    fetch('get_dashboards.php')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            // Mapping the JSON data to the HTML IDs
            document.getElementById('totalBins').textContent = data.total_bins || 0;
            document.getElementById('totalCitizens').textContent = data.total_citizens || 0;
            document.getElementById('pendingComplaints').textContent = data.pending_complaints || 0;
            document.getElementById('activeVehicles').textContent = data.active_vehicles || 0;
            document.getElementById('totalRevenue').textContent = "Rs. " + (data.total_revenue || 0);

            const statusTable = document.getElementById('binsStatusTable');
            statusTable.innerHTML = '';
            if (data.bins_by_status && data.bins_by_status.length > 0) {
                data.bins_by_status.forEach(item => {
                    statusTable.innerHTML += `
                        <tr>
                            <td><span class="status-badge">${item.status}</span></td>
                            <td>${item.count}</td>
                        </tr>
                    `;
                });
            } else {
                statusTable.innerHTML = '<tr><td colspan="2">No data available</td></tr>';
            }
        })
        .catch(error => {
            console.error('Fetch Error:', error);
            alert('Dashboard Error: Check if get_dashboard.php is working.');
        });
}
        // Load Bins
       // Load bins table
function loadBins(){
    fetch('get_bins.php')
    .then(res=>res.json())
    .then(data=>{
        const table = document.getElementById('binsTable');
        table.innerHTML = '';
        data.forEach(bin=>{
            table.innerHTML += `<tr>
                <td>${bin.bin_id}</td>
                <td>${bin.bin_type}</td>
                <td>${bin.capacity}</td>
                <td>${bin.status}</td>
                <td>${bin.fill_level}%</td>
                <td>${bin.area_name}</td>
                <td>${bin.install_date}</td>
            </tr>`;
        });
    })
    .catch(err=>console.error(err));
}

// Add Bin form submit
document.getElementById('addBinForm').addEventListener('submit', function(e){
    e.preventDefault();
    const formData = new FormData(this);
    fetch('bins.php',{method:'POST',body:formData})
    .then(res=>res.text())
    .then(msg=>{
        document.getElementById('addBinMessage').textContent = msg;
        this.reset();
        loadBins();
    }).catch(err=>console.error(err));
});

// Initial load
loadBins();

        // Load Complaints
        function loadComplaints() {
            fetch('get_complaints.php')
                .then(response => response.json())
                .then(data => {
                    const table = document.getElementById('complaintsTable');
                    table.innerHTML = '';
                    data.forEach(complaint => {
                        const statusClass = complaint.status === 'Pending' ? 'pending' : 
                                          complaint.status === 'Resolved' ? 'resolved' : 'progress';
                        table.innerHTML += `
                            <tr>
                                <td>${complaint.complaint_id}</td>
                                <td>${complaint.citizen_name}</td>
                                <td>${complaint.type}</td>
                                <td>${complaint.description}</td>
                                <td>${complaint.date}</td>
                                <td><span class="status-badge ${statusClass}">${complaint.status}</span></td>
                                <td>${complaint.assigned_to_name}</td>
                            </tr>
                        `;
                    });
                })
                .catch(error => {
                    console.error('Error:', error);
                    document.getElementById('complaintsTable').innerHTML = '<tr><td colspan="7">Error loading data</td></tr>';
                });
        }

        // Load Payments
        function loadPayments() {
            fetch('get_payments.php')
                .then(response => response.json())
                .then(data => {
                    const table = document.getElementById('paymentsTable');
                    table.innerHTML = '';
                    data.forEach(payment => {
                        const statusClass = payment.status === 'Paid' ? 'paid' : 'pending';
                        table.innerHTML += `
                            <tr>
                                <td>${payment.invoice_number}</td>
                                <td>${payment.citizen_name}</td>
                                <td>${payment.phone}</td>
                                <td>Rs. ${parseFloat(payment.amount).toLocaleString()}</td>
                                <td>${payment.payment_date}</td>
                                <td>${payment.method}</td>
                                <td><span class="status-badge ${statusClass}">${payment.status}</span></td>
                            </tr>
                        `;
                    });
                })
                .catch(error => {
                    console.error('Error:', error);
                    document.getElementById('paymentsTable').innerHTML = '<tr><td colspan="7">Error loading data</td></tr>';
                });
        }
    </script>
</body>
</html>
