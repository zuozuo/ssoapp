jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $(".input-group input.form-control").focus ->
    $(this).parent().addClass('focus')

  $(".input-group input.form-control").focusout ->
    $(this).parent().removeClass('focus')

  $('.navbar-dropdown').hover ->
    $(this).find('.navbar-avatar').addClass('border-bottom-zero')
    $('#dropdown-menu').stop().slideDown('fast')
  , ->
    $(this).find('.navbar-avatar').removeClass('border-bottom-zero')
    $('#dropdown-menu').stop().slideUp('fast')

  $("button#create_phone_code").click ->
    btn = $(this)
    if btn.hasClass('counting')
    else
      btn.addClass('counting')
      $(this).html("<span></span>s后重发验证码")
      window.timeCounter $(this).find('span'), 6, ->
        btn.html("重新发送验证码")
        btn.removeClass('counting')

      $.ajax(
        type: 'POST'
        url: '/phones/create_code'
        data:
          phone: $('#phone_number').val()
      ).done (phone) ->
        return
