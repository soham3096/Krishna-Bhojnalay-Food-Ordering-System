<?php

// Main connection file for both admin & front end
// Supports environment variables for Cloud/Remote MySQL on Vercel while preserving localhost defaults for XAMPP
$servername = getenv('DB_HOST') ?: "localhost";
$username   = getenv('DB_USER') ?: "root";
$password   = getenv('DB_PASSWORD') !== false ? getenv('DB_PASSWORD') : "";
$dbname     = getenv('DB_NAME') ?: "onlinefoodphp";
$port       = getenv('DB_PORT') ? intval(getenv('DB_PORT')) : 3306;

// Create connection
$db = @mysqli_connect($servername, $username, $password, $dbname, $port);

// Check connection
if (!$db) {
    // If running on Vercel / serverless environment without configured DB
    if (getenv('VERCEL') || getenv('VERCEL_ENV') || $servername !== 'localhost') {
        die("<div style='font-family:sans-serif;max-width:600px;margin:50px auto;padding:24px;border:1px solid #e2e8f0;border-radius:12px;background:#fff5f5;color:#9b2c2c;'>
            <h2 style='margin-top:0;'>⚠️ Cloud Database Connection Required</h2>
            <p>Your PHP application is running on Vercel, but cannot connect to the MySQL database.</p>
            <p><strong>Error:</strong> " . htmlspecialchars(mysqli_connect_error()) . "</p>
            <hr style='border:none;border-top:1px solid #feb2b2;margin:16px 0;'>
            <p><strong>How to fix:</strong></p>
            <ol style='padding-left:20px;line-height:1.6;'>
                <li>Create a free cloud MySQL database (e.g. on <a href='https://tidbcloud.com/' target='_blank'>TiDB Cloud</a>, <a href='https://aiven.io/' target='_blank'>Aiven</a>, or <a href='https://clever-cloud.com/' target='_blank'>Clever Cloud</a>).</li>
                <li>Import <code>DATABASE FILE/onlinefoodphp.sql</code> into your cloud database.</li>
                <li>Add these Environment Variables in your Vercel Project Settings:
                    <ul>
                        <li><code>DB_HOST</code></li>
                        <li><code>DB_USER</code></li>
                        <li><code>DB_PASSWORD</code></li>
                        <li><code>DB_NAME</code></li>
                        <li><code>DB_PORT</code> (default 3306)</li>
                    </ul>
                </li>
            </ol>
        </div>");
    }
    die("Connection failed: " . mysqli_connect_error());
}

?>