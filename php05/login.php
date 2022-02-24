<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ログインページ</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="title-area">
        <h1>ログインページ</h1>
    </div>
    <form action="login_act.php" method="POST">
        <input type="text" class="input-area" name="lid" placeholder="Your Name"> <br>
        <input type="password" class="input-area" name="lpw" placeholder="Your Password"> <br>
        <input type="submit" class="input-area submit" name="submit" value="Log in">
    </form>
</body>

</html>