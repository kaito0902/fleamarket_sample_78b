$(document).on('turbolinks:load', ()=> {
  function buildHTML(comment){
    if (comment.user_id === comment.saler_id) {
      let html =
      `<div class='product__topContent__commentBox__index__box'>
        <span class='product__topContent__commentBox__index__box--name'>${comment.user_name}</span>
        <span class='product__topContent__commentBox__index__box--saler'>出品者</span>
        <span class='product__topContent__commentBox__index__box--date'>${comment.created_at}</span>
        <p class='product__topContent__commentBox__index__box--text'>${comment.text}</p>
      </div>`
      return html;
    } else {
      let html =
      `<div class='product__topContent__commentBox__index__box'>
        <span class='product__topContent__commentBox__index__box--name'>${comment.user_name}</span>
        <span class='product__topContent__commentBox__index__box--date'>${comment.created_at}</span>
        <p class='product__topContent__commentBox__index__box--text'>${comment.text}</p>
      </div>`
      return html;
    }
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.product__topContent__commentBox__index').append(html);
      $('.product__topContent__commentBox__text').val('');
      $('.product__topContent__commentBox__index').animate({ scrollTop: $('.product__topContent__commentBox__index')[0].scrollHeight});
      $('.product__topContent__commentBox__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを入力してください');
    })
  })

  $('.product__topContent__commentBox__head').on('click', function(e){
    e.preventDefault();
    $('.product__topContent__commentBox__index').animate({scrollTop:0});
  })
})
