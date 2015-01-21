jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $(".input-group input.form-control").focus ->
    $(this).parent().addClass('focus')

  $(".input-group input.form-control").focusout ->
    $(this).parent().removeClass('focus')

  $('.navbar-dropdown').hover ->
    $(this).find('.navbar-avatar').addClass('border-bottom-zero');
    $('#dropdown-menu').stop().slideDown('fast')
  , ->
    $(this).find('.navbar-avatar').removeClass('border-bottom-zero');
    $('#dropdown-menu').stop().slideUp('fast')

