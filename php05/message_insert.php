<?php

session_start();

//1. POSTデータ取得
// $id   = $_POST['id'];
// $title  = $_POST['title'];
// $content = $_POST['content'];

// $id = $_SESSION['id'];
$user_id    = $_SESSION['user_id']; //追加されています
$title = $_POST['title'];
$content = $_POST['text'];
$destination_user_name = $_POST['destination_user_name'];
$name = $_SESSION['name'];
$user_photo = $_SESSION['user_photo'];

//2. DB接続します
require_once('funcs.php');
$pdo = db_conn();

//３．データ登録SQL作成
$stmt = $pdo->prepare('INSERT INTO message(title,text,user_id,destination_user_photo,destination_user_name,created_at,status)VALUES(:title,:text,:user_id,:user_photo,:destination_user_name,sysdate(),0);');
// $stmt->bindValue(':id', $id, PDO::PARAM_INT);
$stmt->bindValue(':title', $title, PDO::PARAM_STR);
$stmt->bindValue(':text', $content, PDO::PARAM_STR);
$stmt->bindValue(':user_id', $name, PDO::PARAM_STR);
$stmt->bindValue(':user_photo', $user_photo, PDO::PARAM_STR);
$stmt->bindValue(':destination_user_name', $destination_user_name, PDO::PARAM_STR);
$status = $stmt->execute(); //実行

//４．データ登録処理後
if ($status == false) {
    sql_error($stmt);
} else {
    redirect('select.php');
}
