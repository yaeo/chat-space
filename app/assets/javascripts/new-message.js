// jsonで飛んできたメッセージのhtmlを生成して追加する
function insertHtml(data) {
  var html = "<div class= 'message__header clearfix'>\
                <div class='message__header__name'>"+data.name+"</div>\
                <div class='message__header__date'>"+data.date+"</div>\
              </div>\
              <div class='message__body'>\
                <p>"+data.body+"</p>\
                <img src="+data.image.url+"/>\
              </div>";

  $('#ajax').append(html);
};

$(function() {
  $('#message-form').on('submit', function(e) {
      e.preventDefault();
      var form = $('#message-form').get()[0];

      var formData = new FormData(form);

      // ajaxで送信
      $.ajax({
        url: 'http://localhost:3000/messages.json',
        type: 'POST',
        datatype: 'json',
        data:  formData,
            // body: $(this).find('#message_body').prop('value'),
            // image: $(this).find('#message_image').prop('value'),
            // group_id: $(this).find('#message_group_id').prop('value'),
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
