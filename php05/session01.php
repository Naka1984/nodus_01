<?php
//セッションを使う宣言。これがないと動かない
session_start();

//セッションを使うと宣言した後にIDを取得する（発行=鍵）
$sid = session_id();  //session_start()を使わないと使えない

echo $sid;

echo '<br/>';

$_SESSION['test'] = 'なか';

