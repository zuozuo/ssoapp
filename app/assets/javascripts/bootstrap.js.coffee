jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $(".input-group input.form-control").focus ->
    $(this).parent().addClass('focus')

  $(".input-group input.form-control").focusout ->
    $(this).parent().removeClass('focus')
