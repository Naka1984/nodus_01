<?php

session_start();

//1. POSTデータ取得
// $id   = $_POST['id'];
// $title  = $_POST['title'];
// $content = $_POST['content'];

// $id = $_SESSION['id'];
$user_id    = $_SESSION['name']; //追加されています
$title = $_POST['title'];
$code_name = $_POST['code_name'];
$destination_user_name = $_POST['destination_user_name'];
$destination_user_photo = $_SESSION['user_photo'];
$code = $_POST['code'];

//2. DB接続します
require_once('funcs.php');
$pdo = db_conn();



//３．データ登録SQL作成
$stmt = $pdo->prepare('INSERT INTO code(title,code_name,user_id,destination_user_photo,destination_user_name,code,created_at)VALUES(:title,:code_name,:user_id,:destination_user_photo,:destination_user_name,:code,sysdate());');
// $stmt->bindValue(':id', $id, PDO::PARAM_INT);
$stmt->bindValue(':title', $title, PDO::PARAM_STR);
$stmt->bindValue(':code_name', $code_name, PDO::PARAM_STR);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_STR);
$stmt->bindValue(':destination_user_name', $destination_user_name, PDO::PARAM_STR);
$stmt->bindValue(':destination_user_photo', $destination_user_photo, PDO::PARAM_STR);
$stmt->bindValue(':code', $code, PDO::PARAM_STR);
$status = $stmt->execute(); //実行


//４．データ登録処理後
if ($status == false) {
    sql_error($stmt);
} else {
    redirect('select.php');
}
