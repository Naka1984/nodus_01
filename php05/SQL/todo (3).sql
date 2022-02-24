-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:3306
-- 生成日時: 2022-02-24 16:49:29
-- サーバのバージョン： 5.7.24
-- PHP のバージョン: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `todo`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `code`
--

CREATE TABLE `code` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `destination_user_name` varchar(60) NOT NULL,
  `code_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `destination_user_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `code`
--

INSERT INTO `code` (`id`, `title`, `code`, `user_id`, `destination_user_name`, `code_name`, `created_at`, `destination_user_photo`) VALUES
(2, 'code共有画面', '&lt;?php\r\nsession_start();\r\n\r\n//1. POSTデータ取得\r\n$id   = $_POST[&#039;id&#039;];\r\n$title = $_POST[&#039;title&#039;];\r\n$content = $_POST[&#039;content&#039;];\r\n$user_id = $_SESSION[&#039;user_id&#039;];\r\n\r\n//2. DB接続します\r\nrequire_once(&#039;funcs.php&#039;);\r\n$pdo = db_conn();\r\n\r\n//３．データ登録SQL作成\r\n$stmt = $pdo-&gt;prepare(&#039;UPDATE posts SET title=:title,content=:content,time=sysdate(),user_id=:user_id WHERE id=:id;&#039;);\r\n$stmt-&gt;bindValue(&#039;:title&#039;,   $title,   PDO::PARAM_STR);\r\n$stmt-&gt;bindValue(&#039;:content&#039;,  $content,  PDO::PARAM_STR);\r\n$stmt-&gt;bindValue(&#039;:user_id&#039;,    $user_id,    PDO::PARAM_INT);\r\n$stmt-&gt;bindValue(&#039;:id&#039;,     $id,     PDO::PARAM_INT);\r\n$status = $stmt-&gt;execute(); //実行\r\n\r\n//４．データ登録処理後\r\nif ($status === false) {\r\n    sql_error($stmt);\r\n} else {\r\n    redirect(&#039;select.php&#039;);\r\n}\r\n', '1', '那珂　慎二', 'PHP', '2022-02-21 19:53:07', ''),
(3, 'コード共有のテスト', '<nav class=\"navbar navbar-default\">\r\n    <div class=\"container-fluid\">\r\n        <div class=\"navbar-header\">\r\n            <a class=\"navbar-brand\" href=\"select.php\">アンケート一覧</a>　\r\n            <a class=\"navbar-brand\" href=\"user.php\">ユーザー登録</a>　\r\n            <a class=\"navbar-brand\" href=\"user_select.php\">ユーザー一覧</a>　\r\n            <a class=\"navbar-brand\" href=\"logout.php\">ログアウト</a>\r\n        </div>\r\n    </div>\r\n</nav>', '1', '那珂　慎二', 'HTML', '2022-02-21 20:28:00', ''),
(6, 'テストです', '&lt;!DOCTYPE html&gt;\r\n&lt;html lang=&quot;en&quot;&gt;\r\n\r\n&lt;head&gt;\r\n    &lt;meta charset=&quot;UTF-8&quot;&gt;\r\n    &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\r\n    &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\r\n    &lt;title&gt;ログインページ&lt;/title&gt;\r\n    &lt;link rel=&quot;stylesheet&quot; href=&quot;css/style.css&quot;&gt;\r\n&lt;/head&gt;\r\n\r\n&lt;body&gt;\r\n    &lt;div class=&quot;title-area&quot;&gt;\r\n        &lt;h1&gt;ログインページ&lt;/h1&gt;\r\n    &lt;/div&gt;\r\n    &lt;form action=&quot;login_act.php&quot; method=&quot;POST&quot;&gt;\r\n        &lt;input type=&quot;text&quot; class=&quot;input-area&quot; name=&quot;lid&quot; placeholder=&quot;Your Name&quot;&gt; &lt;br&gt;\r\n        &lt;input type=&quot;password&quot; class=&quot;input-area&quot; name=&quot;lpw&quot; placeholder=&quot;Your Password&quot;&gt; &lt;br&gt;\r\n        &lt;input type=&quot;submit&quot; class=&quot;input-area submit&quot; name=&quot;submit&quot; value=&quot;Log in&quot;&gt;\r\n    &lt;/form&gt;\r\n&lt;/body&gt;\r\n\r\n&lt;/html&gt;', '2', '那珂　慎二', 'PHP', '2022-02-23 02:10:47', ''),
(7, 'Sigersメイン画面のコード', '&lt;?php\r\n  // 0. SESSION開始！！\r\nsession_start();\r\n\r\n$id = $_GET[&#039;id&#039;]; //?id~**を受け取る\r\n$login_date = $_SESSION[&#039;login_date&#039;];\r\n$user_id = $_SESSION[&#039;user_id&#039;];  //user_idと紐づいたTodoを読み込む\r\n$kanri_flg = $_SESSION[&#039;kanri_flg&#039;];\r\n$name = $_SESSION[&#039;name&#039;];\r\n$login_date = $_SESSION[&#039;login_date&#039;];\r\n$git = $_SESSION[&#039;github_url&#039;];\r\n\r\n// 1. ログインチェック処理！\r\n// 以下、セッションID持ってたら、ok\r\n// 持ってなければ、閲覧できない処理にする。\r\n\r\nif(!isset($_SESSION[&#039;chk_ssid&#039;] )|| $_SESSION[&#039;chk_ssid&#039;]!= session_id()){\r\n    echo &#039;LOGIN Error:&#039;;\r\n    exit();\r\n}\r\n\r\n\r\n\r\n//１．関数群の読み込み\r\nrequire_once(&#039;funcs.php&#039;);\r\n\r\n// if ($kanri_flg == 0) {      //管理者権限があるかチェックする。なければselect2.phpに移動\r\n//     redirect(&#039;select2.php&#039;);\r\n// }\r\n\r\n//２．データ登録SQL作成\r\n$pdo = db_conn();\r\n$stmt = $pdo-&gt;prepare(&#039;SELECT * FROM posts WHERE user_id=:id&#039;);\r\n$stmt-&gt;bindValue(&#039;:id&#039;, $user_id, PDO::PARAM_INT);\r\n$status = $stmt-&gt;execute();\r\n?&gt;\r\n\r\n&lt;!DOCTYPE html&gt;\r\n&lt;html lang=&quot;ja&quot;&gt;\r\n&lt;head&gt;\r\n  &lt;meta charset=&quot;utf-8&quot;&gt;\r\n  &lt;title&gt;メインページ&lt;/title&gt;\r\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1&quot;&gt;\r\n  &lt;script type=&quot;text/javascript&quot; src=&quot;https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js&quot; charset=&quot;utf-8&quot;&gt;&lt;/script&gt;\r\n  &lt;script type=&quot;text/javascript&quot; src=&quot;sidemenu.js&quot;&gt;&lt;/script&gt;\r\n  &lt;link href=&quot;https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css&quot; rel=&quot;stylesheet&quot; integrity=&quot;sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1&quot; crossorigin=&quot;anonymous&quot;&gt;\r\n  &lt;link rel=&quot;stylesheet&quot;  href=&quot;css/styles.css&quot;/&gt;\r\n&lt;/head&gt;\r\n\r\n\r\n&lt;body&gt;\r\n  &lt;div class=&quot;slidemenu slidemenu-left&quot;&gt;\r\n    &lt;div class=&quot;slidemenu-header&quot;&gt;\r\n     &lt;img src=&#039;&lt;?php echo $_SESSION[&quot;user_photo&quot;]; ?&gt;&#039; style=&quot;padding-top: 30px &quot;&gt;\r\n     &lt;div class=&#039;user_photo&#039;&gt;&lt;p style=&#039;font-size:large&#039;&gt;&lt;?=  $_SESSION[&#039;name&#039;],&#039;&amp;nbsp;&amp;nbsp;&amp;nbsp&#039; ?&gt;&lt;/p&gt;&lt;/div&gt;\r\n     &lt;div class=&#039;user_logintime&#039;&gt;最終ログイン:2022/02/17 15:05&lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;slidemenu-body&quot;&gt;\r\n      &lt;ul class=&quot;slidemenu-content&quot;&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;https://docs.google.com/spreadsheets/d/1G_TBZlJnlL_nCz1jNHsmEgABRg7OpRYusg7abPzh3HM/edit#gid=1124570819&quot;&gt;要件定義書トップ&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;https://docs.google.com/spreadsheets/d/1G_TBZlJnlL_nCz1jNHsmEgABRg7OpRYusg7abPzh3HM/edit#gid=983649554&quot;&gt;サイトマップ&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;https://docs.google.com/spreadsheets/d/1G_TBZlJnlL_nCz1jNHsmEgABRg7OpRYusg7abPzh3HM/edit#gid=1241013620&quot;&gt;WBS・ガントチャート&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;https://forms.gle/mn2725gzD3wfit7a6&quot;&gt;アンケート（回答）&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;https://docs.google.com/forms/d/1UUTsoORpdGR1F9vGzVATOZ1EjTnIOTXmNXC6DRK0kiY/edit&quot;&gt;アンケート（質問・設定）&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;アンケート（集計）&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;user_data.php&quot;&gt;ユーザー設定&lt;/a&gt;&lt;/li&gt;\r\n        &lt;!--&lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 8&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 9&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 10&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 11&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 12&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 13&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 14&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 15&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 16&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 17&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 18&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 19&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 20&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 21&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 22&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 23&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 24&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 25&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 26&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 27&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 28&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;&quot;&gt;Menu 29&lt;/a&gt;&lt;/li&gt; --&gt;\r\n        &lt;li&gt;&lt;a class=&quot;menu-item&quot; href=&quot;logout.php&quot;&gt;ログアウト&lt;/a&gt;&lt;/li&gt; \r\n      &lt;/ul&gt;\r\n    &lt;/div&gt;\r\n  &lt;/div&gt;\r\n\r\n  &lt;div id=&quot;main&quot;  style=&#039;background-color:aliceblue&#039;&gt;\r\n    &lt;header id=&quot;header&quot;&gt;\r\n      &lt;span class=&quot;button menu-button-left&quot;&gt;\r\n      &lt;/span&gt;\r\n      &lt;div&gt;&lt;img src=&quot;img/signers_logo_baner.png&quot; alt=&quot;ロゴ&quot; style=&quot;padding-left: 60px; padding-top: 5px&quot;&gt;&lt;/div&gt;\r\n      \r\n    &lt;/header&gt;\r\n    &lt;!-- &lt;div id=&quot;contents&quot;&gt;\r\n      &lt;h1&gt;SpSlideMenu Demo&lt;/h1&gt;\r\n      &lt;p&gt;&lt;a href=&quot;demo1.html&quot;&gt;Demo 1&lt;/a&gt; : Standard&lt;/p&gt;\r\n      &lt;p&gt;&lt;a href=&quot;demo2.html&quot;&gt;Demo 2&lt;/a&gt; : No Header&lt;/p&gt;\r\n      &lt;p&gt;&lt;a href=&quot;demo3.html&quot;&gt;Demo 3&lt;/a&gt; : Right&lt;/p&gt;\r\n      &lt;p&gt;&lt;a href=&quot;demo4.html&quot;&gt;Demo 4&lt;/a&gt; : Left And Right&lt;/p&gt; --&gt;\r\n    &lt;!-- &lt;/div&gt; --&gt;\r\n  \r\n\r\n  &lt;main&gt;\r\n    &lt;!-- Option 1: Bootstrap Bundle with Popper --&gt;\r\n    &lt;div class=&#039;col-10 mx-auto&#039; style=&#039;margin-top:10%&#039;;&gt;\r\n    &lt;form method=&quot;POST&quot; action=&quot;message_insert.php&quot;&gt;\r\n      &lt;h1&gt;対応依頼&lt;/h1&gt;\r\n      \r\n      &lt;div&gt;\r\n        &lt;label&gt;送信先&lt;/label&gt;\r\n        &lt;select class=&quot;dropdown&quot; name=&quot;destination_user_name&quot;&gt;\r\n            &lt;option&gt;選択して下さい&lt;/option&gt;\r\n            &lt;option&gt;全員&lt;/option&gt;\r\n            &lt;option&gt;諏訪　実奈未&lt;/option&gt;\r\n            &lt;option&gt;那珂　慎二&lt;/option&gt;\r\n        &lt;/select&gt;\r\n      &lt;/div&gt;\r\n\r\n\r\n      &lt;div&gt;\r\n        &lt;label&gt;件名&lt;/label&gt;\r\n        &lt;input type=&quot;text&quot; class=&quot;text&quot; size=&quot;45&quot; value=&quot;&quot; name=&quot;title&quot;/&gt;\r\n      &lt;/div&gt;\r\n                \r\n\r\n    \r\n      &lt;div&gt;\r\n        &lt;label&gt;本文&lt;/label&gt;\r\n        &lt;textarea cols=&quot;60&quot; rows=&quot;5&quot; name=&quot;text&quot; id=&quot;comments&quot;&gt;&lt;/textarea&gt;\r\n      &lt;/div&gt;\r\n      &lt;div&gt;\r\n        &lt;input type=&quot;submit&quot; class=&quot;submit&quot; value=&quot;送信する&quot; /&gt;\r\n      &lt;/div&gt;\r\n    &lt;/form&gt;\r\n&lt;/div&gt;\r\n  &lt;/main&gt;\r\n\r\n  &lt;script type=&quot;text/javascript&quot; src=&quot;sp-slidemenu.js&quot;&gt;&lt;/script&gt;\r\n  &lt;script&gt;\r\n    var menu = SpSlidemenu({\r\n      main : &#039;#main&#039;,\r\n      button: &#039;.menu-button-left&#039;,\r\n      slidemenu : &#039;.slidemenu-left&#039;,\r\n      direction: &#039;left&#039;\r\n    });\r\n  &lt;/script&gt;\r\n\r\n&lt;/div&gt;\r\n&lt;/body&gt;\r\n\r\n&lt;/html&gt;\r\n', '0', '那珂　慎二', 'CSS', '2022-02-24 18:21:27', 'img/naka.png'),
(8, 'Signersのメイン画面', '&lt;?php\r\n\r\nsession_start();\r\n\r\n$id = $_GET[&#039;id&#039;]; //?id~**を受け取る\r\n$login_date = $_SESSION[&#039;login_date&#039;];\r\n$user_id = $_SESSION[&#039;user_id&#039;];  //user_idと紐づいたTodoを読み込む\r\n$kanri_flg = $_SESSION[&#039;kanri_flg&#039;];\r\n$name = $_SESSION[&#039;name&#039;];\r\n$login_date = $_SESSION[&#039;login_date&#039;];\r\n$git = $_SESSION[&#039;github_url&#039;];\r\n\r\nrequire_once(&#039;funcs.php&#039;);\r\n$pdo = db_conn();\r\n\r\n//２．データ登録SQL作成\r\n$stmt = $pdo-&gt;prepare(&#039;SELECT * FROM posts WHERE id=:id;&#039;);\r\n$stmt-&gt;bindValue(&#039;:id&#039;, $id, PDO::PARAM_INT);\r\n$status = $stmt-&gt;execute();\r\n\r\n//３．データ表示\r\nif ($status == false) {\r\n    sql_error($stmt);\r\n} else {\r\n    $row = $stmt-&gt;fetch();\r\n}\r\n?&gt;\r\n\r\n\r\n\r\n&lt;!DOCTYPE html&gt;\r\n&lt;html lang=&quot;ja&quot;&gt;\r\n\r\n&lt;head&gt;\r\n    &lt;meta charset=&quot;UTF-8&quot;&gt;\r\n    &lt;title&gt;Todo編集&lt;/title&gt;\r\n    &lt;link href=&quot;css/bootstrap.min.css&quot; rel=&quot;stylesheet&quot;&gt;\r\n    &lt;style&gt;\r\n        div {\r\n            padding: 10px;\r\n            font-size: 16px;\r\n        }\r\n    &lt;/style&gt;\r\n&lt;/head&gt;\r\n\r\n&lt;body&gt;\r\n\r\n    &lt;!-- Head[Start] --&gt;\r\n    &lt;header&gt;\r\n        &lt;nav class=&quot;navbar navbar-default&quot;&gt;\r\n            &lt;div class=&quot;container-fluid&quot;&gt;\r\n                &lt;div class=&quot;navbar-header&quot;&gt;&lt;a class=&quot;navbar-brand&quot; href=&quot;select.php&quot;&gt;データ一覧&lt;/a&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/nav&gt;\r\n    &lt;/header&gt;\r\n    &lt;!-- Head[End] --&gt;\r\n\r\n    &lt;!-- Main[Start] --&gt;\r\n    &lt;form method=&quot;POST&quot; action=&quot;post_update.php&quot;&gt;\r\n        &lt;div class=&quot;jumbotron&quot;&gt;\r\n            &lt;fieldset&gt;\r\n                &lt;legend&gt;[編集]&lt;/legend&gt;\r\n                &lt;label&gt;タイトル：&lt;input type=&quot;text&quot; name=&quot;title&quot; value=&quot;&lt;?= $row[&#039;title&#039;] ?&gt;&quot;&gt;&lt;/label&gt;&lt;br&gt;\r\n                &lt;label&gt;本文：&lt;input type=&quot;text&quot; name=&quot;content&quot; value=&quot;&lt;?= $row[&#039;content&#039;] ?&gt;&quot;&gt;&lt;/label&gt;&lt;br&gt;\r\n                &lt;input type=&quot;submit&quot; value=&quot;送信&quot;&gt;\r\n                &lt;input type=&quot;hidden&quot; name=&quot;id&quot; value=&quot;&lt;?= $id ?&gt;&quot;&gt;\r\n            &lt;/fieldset&gt;\r\n        &lt;/div&gt;\r\n    &lt;/form&gt;\r\n    &lt;!-- Main[End] --&gt;\r\n\r\n\r\n&lt;/body&gt;\r\n\r\n&lt;/html&gt;\r\n', '那珂　慎二', '諏訪　実奈未', 'PHP', '2022-02-24 20:05:18', 'img/naka.png');

-- --------------------------------------------------------

--
-- テーブルの構造 `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `destination_user_name` varchar(20) NOT NULL,
  `destination_user_photo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `message`
--

INSERT INTO `message` (`id`, `title`, `text`, `user_id`, `destination_user_name`, `destination_user_photo`, `created_at`, `status`) VALUES
(14, 'テスト送信です', 'よろしく', '諏訪　実奈未', '那珂　慎二', 'img/suwa.png', '2022-02-24 02:11:17', 1),
(15, 'おつかれさま！！！', '一緒にGGA目指して頑張ろうね！！', '那珂　慎二', '諏訪　実奈未', 'img/naka.png', '2022-02-24 02:45:25', 1),
(16, '課題チェックのためのテスト投稿', 'テストテスト\r\nしっかり見れていますか？', '諏訪　実奈未', '那珂　慎二', 'img/suwa.png', '2022-02-25 00:50:26', 0),
(17, 'テストです', '那珂から諏訪ちゃんにメッセージを送信\r\nきちんと見れてるかな？', '那珂　慎二', '諏訪　実奈未', 'img/naka.png', '2022-02-25 00:51:45', 0),
(18, '自分あてにも送ってみる', 'きこえますか、きこえますか、、、', '那珂　慎二', '那珂　慎二', 'img/naka.png', '2022-02-25 00:52:19', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `message_relation`
--

CREATE TABLE `message_relation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `destination_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `time`, `user_id`) VALUES
(1, 'テスト', 'こんにちは', '2022-02-17 05:08:43', 1),
(13, 'てすと464', 'ｓｓｓ', '2022-02-17 11:38:28', 2),
(14, 'テスト投稿', 'テストのための投稿です', '2022-02-17 10:32:11', 1),
(15, 'よろしくお願いします', '眠いけど頑張ります', '2022-02-16 16:05:17', 1),
(16, 'お疲れ様です', '課題提出に向けて頑張ります', '2022-02-16 16:08:46', 2),
(17, '疲れた', '眠いけどいい感じに進んでいるので頑張ります', '2022-02-16 16:14:14', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `lid` varchar(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `lpw` varchar(12) NOT NULL,
  `kanri_flg` int(1) NOT NULL,
  `user_photo` varchar(50) NOT NULL,
  `github_url` varchar(255) NOT NULL,
  `login_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `lid`, `name`, `lpw`, `kanri_flg`, `user_photo`, `github_url`, `login_date`) VALUES
(1, 'sj1984', '那珂　慎二', 'sj1984', 1, 'img/naka.png', 'https://github.com/Naka1984/', '2022-02-25 00:50:33'),
(2, 'minami', '諏訪　実奈未', 'minami', 0, 'img/suwa.png', 'https://github.com/suwaminami/', '2022-02-25 00:40:59');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `message_relation`
--
ALTER TABLE `message_relation`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `code`
--
ALTER TABLE `code`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- テーブルの AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- テーブルの AUTO_INCREMENT `message_relation`
--
ALTER TABLE `message_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
