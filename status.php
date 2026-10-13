<?php
session_start();
require('vendor/autoload.php');
use Razorpay\Api\Api;
use Razorpay\Api\Errors\SignatureVerificationError;

// Keys should match pay.php exactly
$keyId = "rzp_test_87EahAexKuSNQh";
$keySecret = "cJ94JSNyKIkuHSFrw8bFx641";

$success = false;
$error = "Payment Verification Not Possible";
$payment_id = "";
$order_id = "";

if (empty($_POST['razorpay_payment_id']) === false) {
    $api = new Api($keyId, $keySecret);
    $payment_id = $_POST['razorpay_payment_id'];
    $order_id = $_SESSION['razorpay_order_id'];

    try {
        $attributes = array(
            'razorpay_order_id' => $order_id,
            'razorpay_payment_id' => $payment_id,
            'razorpay_signature' => $_POST['razorpay_signature']
        );

        $api->utility->verifyPaymentSignature($attributes);
        $success = true;
    } catch(SignatureVerificationError $e) {
        $success = false;
        $error = 'Razorpay Error : ' . $e->getMessage();
    } catch(Exception $e) {
        $success = false;
        $error = 'System Error : ' . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="images/logo.png?v=3">
    <title>Payment Status | Krishna Bhojnalay</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Outfit', sans-serif;
            background: #f4f7f6;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .status-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            padding: 40px;
            max-width: 500px;
            width: 90%;
            text-align: center;
        }
        .status-icon {
            font-size: 60px;
            margin-bottom: 20px;
        }
        .success-icon { color: #28a745; }
        .error-icon { color: #dc3545; }
        .btn-custom {
            border-radius: 10px;
            padding: 12px 25px;
            font-weight: 600;
            margin-top: 25px;
            transition: all 0.3s;
        }
        .btn-success { background-color: #28a745; border-color: #28a745; color: #fff; }
        .btn-danger { background-color: #dc3545; border-color: #dc3545; color: #fff; }
        .details-box {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 15px;
            margin-top: 20px;
            text-align: left;
            font-size: 14px;
        }
        .details-box label {
            color: #6c757d;
            margin-bottom: 2px;
            display: block;
        }
        .details-box span {
            font-weight: 600;
            color: #2D3142;
            word-break: break-all;
        }
    </style>
</head>
<body>

<div class="status-card">
    <div style="margin-bottom: 20px;">
        <img src="images/logo.png?v=3" alt="Krishna Bhojnalay" style="height: 60px; border-radius: 50%; background: #ffffff; padding: 3px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
        <h4 style="font-weight: 700; color: #333; margin-top: 8px; margin-bottom: 0;">Krishna Bhojnalay</h4>
    </div>
    <?php if ($success): ?>
        <div class="status-icon success-icon">
            <i class="fa fa-check-circle"></i>
        </div>
        <h2 style="font-weight:700;">Payment Successful!</h2>
        <p>Your transaction has been processed successfully. We're now preparing your food!</p>
        
        <div class="details-box">
            <label>Payment ID</label>
            <span><?php echo $payment_id; ?></span>
            <hr style="margin: 10px 0;">
            <label>Order ID</label>
            <span><?php echo $order_id; ?></span>
        </div>
        
        <a href="your_orders.php" class="btn btn-success btn-custom btn-block">Track Your Order</a>
    <?php else: ?>
        <div class="status-icon error-icon">
            <i class="fa fa-times-circle"></i>
        </div>
        <h2 style="font-weight:700;">Payment Failed</h2>
        <p>Unfortunately, your payment could not be processed at this time.</p>
        
        <div class="alert alert-danger" style="border-radius: 10px; font-size: 14px; margin-top: 15px;">
            <strong>Error:</strong> <?php echo $error; ?>
        </div>
        
        <a href="checkout.php" class="btn btn-danger btn-custom btn-block">Try Again</a>
    <?php endif; ?>
    
    <a href="index.php" style="display: block; margin-top: 15px; color: #999; font-size: 13px; text-decoration: none;">Return to Home</a>
</div>

</body>
</html>