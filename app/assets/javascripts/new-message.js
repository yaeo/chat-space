// jsonで飛んできたメッセージのhtmlを生成して追加する
function insertHtml(data) {
  if(data.image == null){
    var html = "<div class= 'message__header clearfix'>\
                  <div class='message__header__name'>"+data.name+"</div>\
                  <div class='message__header__date'>"+data.date+"</div>\
                </div>\
                <div class='message__body'>\
                  <p>"+data.body+"</p>\
                </div>";
  } else {
    var html = "<div class= 'message__header clearfix'>\
                  <div class='message__header__name'>"+data.name+"</div>\
                  <div class='message__header__date'>"+data.date+"</div>\
                </div>\
                <div class='message__body'>\
                  <p>"+data.body+"</p>\
                  <img src="+data.image+">\
                </div>";
  }

  $('#ajax').append(html);
};

$(function() {
  $('#message-form').on('submit', function(e) {
      e.preventDefault();
      var form = $(this).get()[0];

      var formData = new FormData(form);

      // ajaxで送信
      $.ajax({
        url: 'http://localhost:3000/messages.json',
        type: 'POST',
        datatype: 'json',
        data:  formData,
        processData: false,
        contentType: false
      })
      .done(function(data) {
        insertHtml(data);
      })
      .fail(function() {
      });
  });
});
