<?php

session_start();

$id = $_GET['id']; //?id~**を受け取る
$login_date = $_SESSION['login_date'];
$user_id = $_SESSION['user_id'];  //user_idと紐づいたTodoを読み込む
$kanri_flg = $_SESSION['kanri_flg'];
$name = $_SESSION['name'];
$login_date = $_SESSION['login_date'];
$git = $_SESSION['github_url'];

require_once('funcs.php');
$pdo = db_conn();

//２．データ登録SQL作成
$stmt = $pdo->prepare('SELECT * FROM posts WHERE id=:id;');
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute();

//３．データ表示
if ($status == false) {
    sql_error($stmt);
} else {
    $row = $stmt->fetch();
}
?>



<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>Todo編集</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        div {
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>

<body>

    <!-- Head[Start] -->
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header"><a class="navbar-brand" href="select.php">データ一覧</a></div>
            </div>
        </nav>
    </header>
    <!-- Head[End] -->

    <!-- Main[Start] -->
    <form method="POST" action="post_update.php">
        <div class="jumbotron">
            <fieldset>
                <legend>[編集]</legend>
                <label>タイトル：<input type="text" name="title" value="<?= $row['title'] ?>"></label><br>
                <label>本文：<input type="text" name="content" value="<?= $row['content'] ?>"></label><br>
                <input type="submit" value="送信">
                <input type="hidden" name="id" value="<?= $id ?>">
            </fieldset>
        </div>
    </form>
    <!-- Main[End] -->


</body>

</html>
