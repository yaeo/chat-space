$(function() {
  $('#user-search-result').on('click', '.user-search-add', function(e) {
    e.preventDefault();
    var userId = $(this).data('userId');
    var userName = $(this).data('userName');
    $('#group-user').append("<div class= 'chat-group-user clearfix'><input multiple='multiple' type='hidden' name='group[user_ids][]', value="+userId+ "><p class='chat-group-user__name'>"+userName+"</p><a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove', data-user-id="+userId+">削除</a></div>");
  });
});
