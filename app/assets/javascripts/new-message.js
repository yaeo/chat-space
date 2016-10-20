// jsonで飛んできたメッセージのhtmlを生成して追加する
function insertHtml(data) {
  var html = "<div class= 'message__header clearfix'><div class='message__header__name'>"+data.name+"</div><div class='message__header__date'>"+data.date+"</div></div><div class='message__body'>"+data.body+"</div>";
  $('#ajax').append(html);
};

$(function() {
  $('#message-form').on('submit', function(e) {
      e.preventDefault();
      $.ajax({
        url: 'http://localhost:3000/messages.json',
        type: 'POST',
        datatype: 'json',
        data: {
          message: {
            body: $(this).find('#message_body').prop('value'),
            group_id: $(this).find('#message_group_id').prop('value'),
          }
        }
      })
      .done(function(data) {
        insertHtml(data);
      })
      .fail(function() {
      });
  });
});