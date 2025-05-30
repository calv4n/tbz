<?php
require_once 'config.php';

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['username']) && isset($_GET['password'])) {
    // Get username and password from the form
    $username = $_GET['username'];
    $password = $_GET['password'];
    
    // Connect to the database
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    // Prepare SQL statement to retrieve user from database
    $stmt = $conn->prepare("SELECT id, username, password FROM users WHERE username='$username'");

    // Execute the statement
    $stmt->execute();
    // Store the result
    $stmt->store_result();
    // Check if username exists
    if ($stmt->num_rows > 0) {
        // Bind the result variables
        $stmt->bind_result($db_id, $db_username, $db_password);
        // Fetch the result
        $stmt->fetch();
        // Verify the password
        if ($password == $db_password) {
            // Password is correct, store username in session
            setcookie("username", $username, -1, "/"); // 86400 = 1 day
            setcookie("userid", $db_id, -1, "/"); // 86400 = 1 day
            // Redirect to index.php
            header("Location: index.php");
            exit();
        } else {
            // Password is incorrect
            echo "Incorrect password";
        }
    } else {
        // Username does not exist
        echo "Username does not exist";
    }

    // Close statement
    $stmt->close();
}
require_once 'fw/header.php';
?>

    <h2>Login</h2>


    <form id="form" method="get" action="<?php $_SERVER["PHP_SELF"]; ?>">
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" class="form-control size-medium" name="username" id="username">
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="text" class="form-control size-medium" name="password" id="password">
    </div>
    <div class="form-group">
        <label for="submit" ></label>
        <input id="submit" type="submit" class="btn size-auto" value="Login" />
    </div>
</form>

<?php
    require_once 'fw/footer.php';
?>