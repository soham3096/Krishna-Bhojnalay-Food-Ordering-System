<?php
session_start();
require "vendor/autoload.php";
use Razorpay\Api\Api;

// These keys should match in both pay.php and status.php
$keyId = "rzp_test_87EahAexKuSNQh";
$keySecret = "cJ94JSNyKIkuHSFrw8bFx641";

$api = new Api($keyId, $keySecret);

if(!isset($_GET['name']) || empty($_GET['name'])) {
    header("Location: checkout.php");
    exit();
}

$actual_amount = $_GET['name'];
$currency = "INR";
$receipt = str_replace('.', '', ceil(microtime(true) * 1000)) . rand(1, 10000) . '2';

try {
    $order = $api->order->create(array(
        'receipt' => $receipt, 
        'amount' => $actual_amount * 100, 
        'currency' => $currency, 
        'payment_capture' => '1'
    ));
} catch (Exception $e) {
    die("Error creating Razorpay order: " . $e->getMessage());
}

$order_id = $order['id'];
$_SESSION['razorpay_order_id'] = $order_id;
$_SESSION['payable_amount'] = $actual_amount;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="images/logo.png?v=3">
    <title>Secure Checkout | Krishna Bhojnalay</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Outfit', sans-serif;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .checkout-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            padding: 40px;
            width: 100%;
            max-width: 450px;
            text-align: center;
            border: 1px solid rgba(255,255,255,0.3);
        }
        .icon-circle {
            width: 80px;
            height: 80px;
            background: #00AC4C;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
            color: white;
            font-size: 32px;
            box-shadow: 0 8px 16px rgba(0,172,76,0.3);
        }
        .amount-display {
            font-size: 42px;
            font-weight: 700;
            color: #2D3142;
            margin-bottom: 8px;
        }
        .amount-label {
            color: #6c757d;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 30px;
        }
        .razorpay-payment-button {
            background-color: #00AC4C !important;
            color: white !important;
            font-weight: 600 !important;
            padding: 14px 30px !important;
            border-radius: 12px !important;
            border: none !important;
            font-size: 18px !important;
            width: 100% !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
            box-shadow: 0 4px 12px rgba(0,172,76,0.3) !important;
        }
        .razorpay-payment-button:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 6px 18px rgba(0,172,76,0.4) !important;
            background-color: #008f3f !important;
        }
        .back-link {
            display: inline-block;
            margin-top: 24px;
            color: #6c757d;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }
        .back-link:hover {
            color: #2D3142;
        }
        .trusted-badge {
            margin-top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-size: 12px;
            color: #999;
        }
    </style>
</head>
<body>

<div class="checkout-card wow fadeIn" data-wow-duration="1s">
    <div style="margin-bottom: 20px;">
        <img src="images/logo.png?v=3" alt="Krishna Bhojnalay" style="height: 70px; border-radius: 50%; background: #ffffff; padding: 4px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
    </div>
    <h2 style="font-weight: 700; color: #2D3142; margin-bottom: 10px;">Krishna Bhojnalay</h2>
    <p style="color: #6c757d; font-size: 15px; margin-bottom: 20px;">Secure Checkout</p>
    <div class="amount-display">₹<?php echo number_format($actual_amount, 2); ?></div>
    <div class="amount-label">Total Amount Payable</div>
    
    <form action="status.php" method="POST">
        <script
            src="https://checkout.razorpay.com/v1/checkout.js"
            data-key="<?=$keyId?>" 
            data-amount="<?=$actual_amount * 100?>"
            data-currency="<?=$currency?>"
            data-order_id="<?=$order_id?>"
            data-buttontext="Pay SECURELY"
            data-name="Krishna Bhojnalay"
            data-description="Order Payment"
            data-image="images/logo.png?v=3"
            data-theme.color="#00AC4C"
        ></script>
        <input type="hidden" custom="Hidden Element" name="hidden">
    </form>
    
    <a href="checkout.php" class="back-link"><i class="fa fa-arrow-left"></i> Change Payment Method</a>
    
    <div class="trusted-badge">
        <i class="fa fa-lock"></i> SSL Secure Checkout
        <span>•</span>
        <img src="https://razorpay.com/assets/razorpay-glyph.svg" width="16" alt="RZP"> Razorpay Secured
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/animsition.min.js"></script>
<script src="js/bootstrap-slider.min.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/headroom.js"></script>
<script src="js/foodpicky.min.js"></script>

</body>
</html>
