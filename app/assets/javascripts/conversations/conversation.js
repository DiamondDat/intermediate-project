$(document).on('turbolinks:load', function() {

  // leave a gap at the top of the conversation windows' scrollbar
  $('.messages-list').scrollTop(500);

  // send a message on Enter key click and leave the textarea in its original state
  $(document).on('keydown', 'conversation-window, .conversation', function(e) {
    if (e.keyCode === 13) {
      // if textarea window is not empty
      if($.trim($('textarea', this).val())) {
        $('.send-message', this).click();
        e.target.value = "";
        e.preventDefault();
      }
    }
  });
});

function calculateUnseenConversation() {
  var unseen_conv_length = $('#conversation-menu').find('.unseen-conv').length;
  if (unseen_conv_length) {
    $('#unseen-conversations').css('visibility', 'visible');
    $('#unseen-conversations').text(unseen_conv_length);
  } else {
    $('#unseen-conversations').css('visibility', 'hidden');
    $('#unseen-conversations').text('');
  }
}

send_message: function(message) {
  return this.perform('send_message', {
    message: message
  });
}
