$ = jQuery

$ ->
  $(".alert-message").alert()
  $("#article_authorship_tokens").addtokenInput("/authors/names.json")
  $("#revue_redactionship_tokens").addtokenInput("/authors/names.json")
  $(window).on 'scroll', -> dynamic_subnav()

dynamic_subnav = ->
  # If has not activated (has no attribute "data-top")
  if !$('.subnav').attr('data-top')
    # If already fixed, then do nothing
    return if $('.subnav').hasClass('subnav-fixed')
    # Remember top position
    offset = $('.subnav').offset()
    $('.subnav').attr('data-top', offset.top)

  if $('.subnav').attr('data-top') - $('.subnav').outerHeight() <= $(this).scrollTop()
    $('.subnav').addClass('subnav-fixed')
  else
    $('.subnav').removeClass('subnav-fixed')


jQuery.fn.addtokenInput = (url) ->
  unless this.prev("ul.token-input-list-facebook").length
    this.tokenInput(url,
      propertyToSearch: "nom"
      theme: "facebook"
      hintText: "Saisir une partie du mot..."
      noResultsText: "Aucun résultat"
      searchingText: "Recherche en cours..."
      preventDuplicates: true
      )
