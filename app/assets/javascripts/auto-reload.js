// ajaxを投げて、グループの全メッセージを取得してくる
$(function(){
  var groupName = $('.header__group__name').text();
  setInterval (function(){
    $.ajax({
        url: 'http://localhost:3000/groups.json',
        type: 'GET',
        datatype: 'json',
        data: {
          group_name: groupName
        }
    })
    // リクエストに成功したとき
    .done(function(messages){
      $('#ajax').empty();
      $.each(messages, function(index, message){
        // created_atをファーマット
        var date = message.created_at.replace(/-/, "年");
        var date = date.replace(/-/, "月");
        var date = date.replace(/T/, "日 ");
        var date = date.replace(/:[0-9][0-9]\..*/, "");

        if(message.image.url == null){
          var html = "<div class= 'message__header clearfix'>\
                        <div class='message__header__name'>"+message.user.name+"</div>\
                        <div class='message__header__date'>"+date+"</div>\
                      </div>\
                      <div class='message__body'>\
                        <p>"+message.body+"</p>\
                      </div>";
        } else {
          var html = "<div class= 'message__header clearfix'>\
                        <div class='message__header__name'>"+message.user.name+"</div>\
                        <div class='message__header__date'>"+date+"</div>\
                      </div>\
                      <div class='message__body'>\
                        <p>"+message.body+"</p>\
                        <img src="+message.image.url+">\
                      </div>";
        }
        $('#ajax').append(html);
      });
    })
    // リクエストに失敗したとき
    .fail(function(){

    });
  // 1000ms毎にajaxを投げてjsonを取得
}, 1000);
});
