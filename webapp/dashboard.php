<?php
session_start();
if (!isset($_SESSION["user_id"])) {
    header("Location: secure-login.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h1>Welcome, <?php echo htmlspecialchars($_SESSION["username"]); ?></h1>
    <p>You're securely logged in!</p>
    <a href="logout.php">Logout</a>
</body>
</html>

