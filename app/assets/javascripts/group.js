// 候補ユーザーをメンバーリストに表示する
$(function() {
  $('#user-search-result').on('click', '.user-search-add', function(e) {
    e.preventDefault();
    var userId = $(this).data('user_id');
    var userName = $(this).data('user_name');
    $('#group-user').append("<div class= 'chat-group-user clearfix'><input multiple='multiple' type='hidden' name='group[user_ids][]', value="+userId+ "><p class='chat-group-user__name'>"+userName+"</p><a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove', data-user-id="+userId+">削除</a></div>");
  });
});

// リストから削除するボタン
$(function(){
  $('#group-user').on('click', '.chat-group-user', function(e) {
    e.preventDefault();
    $(this).remove();
  });
});

// $(function() {
//   $('#group-user').on('click', '.chat-group-user', function(e) {
//     e.preventDefault();
//     $(this).remove();
//   });
// )};

// ユーザーのインクリメントサーチ
$(function() {
  var list = $("#user-search-result");
  var preWord;
  // 検索ユーザーを結果欄に表示させる
  function appendList(user) {
    var item = $("<div class= 'chat-group-user clearfix'>").append("<p class='chat-group-user__name'>"+user.name+"</p><a class='user-search-add chat-group-user__btn chat-group-user__btn--add', data-user_id='"+user.id+"', data-user_name='"+user.name+"'>追加</a>");
    list.append(item);
  }
  // json検索ワードを送信して、候補ユーザーを受け取る
  $('#keyword_keyword').on("keyup", function() {
      $("#user-search-result").empty();
      var input = $('#keyword_keyword').val();
        if(input !== preWord) {
          $.ajax({
            url: 'http://localhost:3000/users.json',
            type: 'GET',
            datatype:'json',
            data: {
              name: input
            }
          })
          .done(function(searched_user) {
            $.each(searched_user, function(i, user){
              appendList(user);
            })
          })
          .fail(function() {
          });
        }
      preWord = input;
  });
});
