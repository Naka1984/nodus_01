<?php

//最初にSESSIONを開始！！ココ大事！！
session_start();

//POST値を受け取る
$lid = $_POST['lid'];
$lpw = $_POST['lpw'];

//1.  DB接続します
require_once('funcs.php');
$pdo = db_conn();

//2. データ登録SQL作成
// gs_user_tableに、IDとWPがあるか確認する。
$stmt = $pdo->prepare('SELECT * FROM users WHERE lid = :lid AND lpw=:lpw');
$stmt->bindValue(':lid', $lid, PDO::PARAM_STR);
$stmt->bindValue(':lpw', $lpw, PDO::PARAM_STR);
$status = $stmt->execute();





//３．ログイン時間の登録
// require_once('funcs.php');
// $pdo = db_conn();
$stmt2 = $pdo->prepare('UPDATE users SET login_date=sysdate() WHERE lid=:lid;');
$stmt2->bindValue(':lid',   $lid,   PDO::PARAM_STR);
$status2 = $stmt2->execute(); //実行


//3. SQL実行時にエラーがある場合STOP
if($status === false){
    sql_error($stmt);
}

//4. 抽出データ数を取得
$val = $stmt->fetch();

//if(password_verify($lpw, $val['lpw'])){ //* PasswordがHash化の場合はこっちのIFを使う
//if(password_verify($lpw, $val['lpw'])){ //* PasswordがHash化の場合はこっちのIFを使う







    if($val['id'] != '' ){
        $_SESSION['chk_ssid'] = session_id();
        $_SESSION['kanri_flg'] = $val['kanri_flg'];
        $_SESSION['name'] = $val['name'];
        $_SESSION['lpw'] = $val['lpw'];
        $_SESSION['user_id'] = $val['id'];
        $_SESSION['user_photo'] = $val['user_photo'];
        $_SESSION['github_url'] = $val['github_url'];
        date_default_timezone_set('Asia/Tokyo');
        $_SESSION['login_date'] = date('Y/m/d H:i');
        header('Location: select.php');
    // }elseif($val['id'] != '' && $val['kanri_flg'] == 0){
    //     $_SESSION['chk_ssid'] = session_id();
    //     $_SESSION['kanri_flg'] = $val['kanri_flg'];
    //     $_SESSION['name'] = $val['name'];
    //     $_SESSION['lpw'] = $val['lpw'];
    //     $_SESSION['user_id'] = $val['id'];
    //     $_SESSION['user_photo'] = $val['user_photo'];
    //     header('Location: select2.php');

    // }
    }else{
        //Login失敗時(Logout経由)
        header('Location: login.php');
    }

exit();
