$(function(){
	
    //***********************************
    
    /* ▼ここから初期設定 */
    
    // 1. メニューを囲んでるdivのid
    var menuWrap = '#menu_wrap'
    
    // 2.ボタンクリック時に現れる領域のid
    var sideMenu = '#sidemenu'
    
    // 3.ボタンのid
    var sidemenKey = '#sidemenu_key'
    
    // 4.メニューの横幅（px）
    var menuWidth = '150'
    
    // 5.メニューが閉じてる時のボタンの中身（textでも画像でも可）
    var closeHtml = '→'
    
    // 6.メニューが開いてる時のボタンの中身（textでも画像でも可）
    var openHtml = '←'
    
    // 7.開閉アニメーションの速さ（単位ミリ秒）
    var speed = 300
    
    
    //***********************************
    
    //▼ボタンをクリックしたらメニューが開いたり閉じたりする処理
    $(sidemenKey).click(function(){
        if($(menuWrap).hasClass('active')){
            //activeのクラスを持っていたら
            //menuを閉じる(アニメーションの速さは300)＆activeを取る
            $(menuWrap).stop().animate({left:'-'+menuWidth+'px'},speed).removeClass('active');
            //ボタンの文言を変更
            $(sidemenKey).html(closeHtml);
        }else{
            //activeのクラスを持っていなければ
            //menuを開く＆activeを付与
            $(menuWrap).stop().animate({left:'0'},speed).addClass('active');
            //ボタンの文言を変更
            $(sidemenKey).html(openHtml);
        };
    });
    
    
    /**************************/
    
    //▼menuの高さをウィンドウの高さ100%に設定する処理（不要な場合は削除）
    
    //変数windowHeightに画面の高さを取得、変数windowHeightに格納
    var windowHeight = $(window).height();
    
    //sideMenuのheightをwindowHeightにする
    $(sideMenu).height(windowHeight);
    
    //画面をリサイズした時、heightを読み直し
    var timer = false;
    $(window).resize(function() {
        if (timer !== false) {
            clearTimeout(timer);
        }
        timer = setTimeout(function() {
            windowHeight = $(window).height();
            $(sideMenu).height(windowHeight);
        }, 50);
    });
    
    
    /**************************/
        
    });
    