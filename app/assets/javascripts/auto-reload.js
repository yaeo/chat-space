// 日付をフォーマットするファンクション
function formatData(message) {
  // created_atをファーマット
  message.created_at = message.created_at.replace(/-/, "年");
  message.created_at = message.created_at.replace(/-/, "月");
  message.created_at = message.created_at.replace(/T/, "日 ");
  message.created_at = message.created_at.replace(/:[0-9][0-9]\..*/, "");
  return message;
};

// メッセージのhtmlを生成し、appendするファンクション
function appendHtml(message) {
  if(message.image.url == null){
    var html = "<div class= 'message__header clearfix'>\
                  <div class='message__header__name'>"+message.user.name+"</div>\
                  <div class='message__header__date'>"+message.created_at+"</div>\
                </div>\
                <div class='message__body'>\
                  <p>"+message.body+"</p>\
                </div>";
  } else {
    // 画像がある場合は、テキストと画像
    var html = "<div class= 'message__header clearfix'>\
                  <div class='message__header__name'>"+message.user.name+"</div>\
                  <div class='message__header__date'>"+message.created_at+"</div>\
                </div>\
                <div class='message__body'>\
                  <p>"+message.body+"</p>\
                  <img src="+message.image.url+">\
                </div>";
  }
  // メッセージ欄にhtmlをappend
  $('#ajax').append(html);
};


// ajaxを投げて、グループの全メッセージを取得してくる
$(function(){
  setInterval (function(){
    // どのグループにいるか判定するためグループ名を取得
    var groupName = $('#group-name').text();
    $.ajax({
        url: 'http://localhost:3000/groups.json',
        type: 'GET',
        datatype: 'json',
        data: {
          group_name: groupName
        }
    })
    // リクエストに成功したとき
    .done(function(messages) {
      $('#ajax').empty();
      $.each(messages, function(index, message){
        formatData(message);
        appendHtml(message);
      });
    })
    // リクエストに失敗したとき
    .fail(function(){
    });
  // 5000ms毎にajaxを投げてjson形式のメッセージを取得
}, 5000);
});
