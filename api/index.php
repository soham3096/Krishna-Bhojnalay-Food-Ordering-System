<?php
/**
 * Vercel Serverless Function Entrypoint / Router for PHP
 * Krishna Bhojnalay - Food Ordering System
 */

// Error handling
error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
ini_set('display_errors', '0');

$projectRoot = dirname(__DIR__);
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = urldecode($uri);
$cleanUri = ltrim($uri, '/');

// Default landing page
if ($cleanUri === '' || $cleanUri === '/') {
    $cleanUri = 'index.php';
}

// Admin shortcuts
if ($cleanUri === 'admin' || $cleanUri === 'admin/') {
    $cleanUri = 'admin/index.php';
}

$targetFile = $projectRoot . '/' . $cleanUri;

// If URL has no extension and file doesn't exist, try appending .php
if (!file_exists($targetFile) && file_exists($targetFile . '.php')) {
    $targetFile .= '.php';
    $cleanUri .= '.php';
}

// Directory handling (fallback to index.php inside directory)
if (is_dir($targetFile) && file_exists($targetFile . '/index.php')) {
    $targetFile = $targetFile . '/index.php';
    $cleanUri = rtrim($cleanUri, '/') . '/index.php';
}

// Static asset delivery fallback
$ext = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
$mimeTypes = [
    'css'   => 'text/css',
    'js'    => 'application/javascript',
    'png'   => 'image/png',
    'jpg'   => 'image/jpeg',
    'jpeg'  => 'image/jpeg',
    'gif'   => 'image/gif',
    'svg'   => 'image/svg+xml',
    'ico'   => 'image/x-icon',
    'webp'  => 'image/webp',
    'woff'  => 'font/woff',
    'woff2' => 'font/woff2',
    'ttf'   => 'font/ttf',
    'eot'   => 'application/vnd.ms-fontobject',
    'json'  => 'application/json',
    'html'  => 'text/html'
];

if (isset($mimeTypes[$ext]) && file_exists($targetFile) && !is_dir($targetFile)) {
    header('Content-Type: ' . $mimeTypes[$ext]);
    // Cache static assets for performance
    header('Cache-Control: public, max-age=86400');
    readfile($targetFile);
    exit;
}

// PHP Script execution
if (file_exists($targetFile) && !is_dir($targetFile) && $ext === 'php') {
    // Switch working directory so relative includes (e.g., connection/connect.php or ../connection/connect.php) work
    chdir(dirname($targetFile));

    $_SERVER['SCRIPT_FILENAME'] = $targetFile;
    $_SERVER['SCRIPT_NAME'] = '/' . $cleanUri;
    $_SERVER['PHP_SELF'] = '/' . $cleanUri;

    require $targetFile;
    exit;
}

// 404 Not Found fallback
http_response_code(404);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Not Found - Krishna Bhojnalay</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; text-align: center; padding: 60px 20px; background: #f8fafc; color: #1e293b; }
        .box { max-width: 500px; margin: 0 auto; background: white; padding: 40px; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); }
        h1 { font-size: 48px; margin: 0; color: #e11d48; }
        p { font-size: 16px; color: #64748b; margin: 16px 0 24px; }
        a { display: inline-block; background: #e11d48; color: white; padding: 10px 24px; border-radius: 6px; text-decoration: none; font-weight: 600; }
        a:hover { background: #be123c; }
    </style>
</head>
<body>
    <div class="box">
        <h1>404</h1>
        <h2>Page Not Found</h2>
        <p>The page <code><?php echo htmlspecialchars($uri); ?></code> could not be located.</p>
        <a href="/">Back to Home</a>
    </div>
</body>
</html>
