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
$stmt = $pdo->prepare('SELECT * FROM code WHERE id=:id;');
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
  <meta charset="utf-8">
  <title>メインページ</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="sidemenu.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <link rel="stylesheet"  href="css/styles.css"/>
</head>


<body>
  <div class="slidemenu slidemenu-left">
    <div class="slidemenu-header">
     
        <img src='<?php echo $_SESSION["user_photo"]; ?>' style="padding-top: 30px ">
        <div class='user_photo'><p style='font-size:large'><?=  $_SESSION['name'],'&nbsp;&nbsp;&nbsp' ?></p></div>
        <div class='user_logintime'><?= $_SESSION['login_date'] ?></div>
    </div>
    <div class="slidemenu-body">
      <ul class="slidemenu-content">
        <li><a class="menu-item" href="https://docs.google.com/spreadsheets/d/1G_TBZlJnlL_nCz1jNHsmEgABRg7OpRYusg7abPzh3HM/edit#gid=1124570819">要件定義書トップ</a></li>
        <li><a class="menu-item" href="https://docs.google.com/spreadsheets/d/1G_TBZlJnlL_nCz1jNHsmEgABRg7OpRYusg7abPzh3HM/edit#gid=983649554">サイトマップ</a></li>
        <li><a class="menu-item" href="https://docs.google.com/spreadsheets/d/1G_TBZlJnlL_nCz1jNHsmEgABRg7OpRYusg7abPzh3HM/edit#gid=1241013620">WBS・ガントチャート</a></li>
        <li><a class="menu-item" href="https://forms.gle/mn2725gzD3wfit7a6">アンケート（回答）</a></li>
        <li><a class="menu-item" href="https://docs.google.com/forms/d/1UUTsoORpdGR1F9vGzVATOZ1EjTnIOTXmNXC6DRK0kiY/edit">アンケート（質問・設定）</a></li>
        <li><a class="menu-item" href="">アンケート（集計）</a></li>
        <li><a class="menu-item" href="user_data.php">ユーザー設定</a></li>
        <li><a class="menu-item" href="message_index.php">対応依頼</a></li>
        <li><a class="menu-item" href="code_index.php">コード共有</a></li>
        <!-- <li><a class="menu-item" href="">Menu 10</a></li>
        <li><a class="menu-item" href="">Menu 11</a></li>
        <li><a class="menu-item" href="">Menu 12</a></li>
        <li><a class="menu-item" href="">Menu 13</a></li>
        <li><a class="menu-item" href="">Menu 14</a></li>
        <li><a class="menu-item" href="">Menu 15</a></li>
        <li><a class="menu-item" href="">Menu 16</a></li>
        <li><a class="menu-item" href="">Menu 17</a></li>
        <li><a class="menu-item" href="">Menu 18</a></li>
        <li><a class="menu-item" href="">Menu 19</a></li>
        <li><a class="menu-item" href="">Menu 20</a></li>
        <li><a class="menu-item" href="">Menu 21</a></li>
        <li><a class="menu-item" href="">Menu 22</a></li>
        <li><a class="menu-item" href="">Menu 23</a></li>
        <li><a class="menu-item" href="">Menu 24</a></li>
        <li><a class="menu-item" href="">Menu 25</a></li>
        <li><a class="menu-item" href="">Menu 26</a></li>
        <li><a class="menu-item" href="">Menu 27</a></li>
        <li><a class="menu-item" href="">Menu 28</a></li>
        <li><a class="menu-item" href="">Menu 29</a></li> -->
        <li><a class="menu-item" href="logout.php">ログアウト</a></li> 
      </ul>
    </div>
  </div>

  <div id="main"  style='background-color:aliceblue'>
    <header id="header">
      <span class="button menu-button-left">
      </span>
      <div><a href="select.php"><img src="img/logo_white.png" alt="ロゴ" style="padding-left: 65px; padding-top: 4px "></a></div>
    
    </header>

    <!-- Main[Start] -->
    <main>
    <div class='col-10 mx-auto' style='margin-top:6%';>
    <div><p style='font-size:xx-large'>共有コード</p></div>
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=sunburst"></script>

    
    <table>
        <tr>
            <th><img src='<?php echo $row['destination_user_photo']; ?>' style="padding-top: 0px; width:60px; height:60px "></th> <th colspan="2" style="vertical-align:middle"><label style='font-size:large'>送信元：<?= $row['user_id'] ?></label><br><br>宛先：<?= $_SESSION['name'] ?>  </th> <!-- thは書かない -->
        </tr>
        <tr>
            <td style="background-color:darkblue; color:white">ID</td><td colspan="2";  style= "background-color:white"><?= $row['id'] ?></td>
        </tr>
        <tr>
            <td style="background-color:darkblue; color:white">受信日時</td><td colspan="2";  style= "background-color:white"><?= $row['created_at'] ?></td>
        </tr>
        <tr>
            <td style="background-color:darkblue; color:white">使用言語</td> <td colspan="2";  style= "background-color:white"><?= $row['code_name'] ?></td>
        </tr>
        <tr>
            <td style="background-color:darkblue; color:white">件名</td> <td colspan="2";  style= "background-color:white"><?= $row['title'] ?></td>
        </tr>
        <tr>
            <td style="background-color:darkblue; color:white; height:200px; vertical-align:middle">コード</td><td colspan="2";  style= "background-color:white; height:200px">

<pre class="prettyprint linenums lang-css" style="height:400px; width:100%; overflow-x: scroll; overflow-y: scroll; word-wrap: normal;">
<style type="text/css">  pre.prettyprint.linenums li{ list-style-type: decimal; } </style>
     <code> <?= $row['code'] ?> </code>
</pre></td>
        </tr>
    </table>


<!-- 

    <form method="POST" action="user_update.php">
        <div class="jumbotron">
            <fieldset>
               
                <label style='font-size:large'>送信元：<?= $row['user_id'] ?></label><br>
                <label style='font-size:large'>受信日時：<?= $row['created_at'] ?></label><br>
                <label style='font-size:large'>件名：<?= $row['title'] ?></label><br>

               


                <pre class="prettyprint linenums lang-css" style="height:400px; width:100%; overflow-x: scroll; overflow-y: scroll; word-wrap: normal;">
                <style type="text/css">  pre.prettyprint.linenums li{ list-style-type: decimal; } </style>
                     <code> <?= $row['code'] ?> </code>
                </pre>
                <br>


                <input type="submit" value="送信">
                <input type="hidden" name="id" value="<?= $id ?>">
            </fieldset>
        </div>
    </form> -->
    <!-- Main[End] -->
    </main>
    <script type="text/javascript" src="sp-slidemenu.js"></script>
  <script src="http://code.jquery.com/jquery.min.js"></script>
  <script>
    var menu = SpSlidemenu({
      main : '#main',
      button: '.menu-button-left',
      slidemenu : '.slidemenu-left',
      direction: 'left'
    });


    jQuery(function($) {
 
 //data-hrefの属性を持つtrを選択しclassにclickableを付加
 $('tr[data-href]').addClass('clickable')
  
   //クリックイベント
   .click(function(e) {
  
     //e.targetはクリックした要素自体、それがa要素以外であれば
     if(!$(e.target).is('a')){
      
       //その要素の先祖要素で一番近いtrの
       //data-href属性の値に書かれているURLに遷移する
       window.location = $(e.target).closest('tr').data('href');}
 });
});



  </script>

</body>

</html>
