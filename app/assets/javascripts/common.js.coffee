$ = jQuery

$ ->
  $("#search_button").click (e) ->
    e.preventDefault()
    search_value = $("#search").val()
    if search_value
      $(".navbar-search").submit()
  $("[data-toggle=tooltip]").tooltip
    delay:
      hide: 100
  $(".alert-message").alert()
  revue_numero = $("#revue_numero").attr("data-value")
  $("#revue_numero").val(revue_numero)
  $("#article_authorship_tokens").addtokenInput("/auteurs/names.json")
  $("#revue_redactionship_tokens").addtokenInput("/auteurs/names.json")
  $(".subnav").affix
    offset:
      top: ->
        if $(window).width() <= 980 then 190 else 110
      bottom: 170
  if $(".argumentaire-error").length
    $(".argumentaire-error").closest(".control-group").addClass("error")

jQuery.fn.addtokenInput = (url) ->
  unless this.prev("ul.token-input-list-facebook").length
    this.tokenInput url,
      propertyToSearch: "nom"
      theme: "facebook"
      hintText: "Saisir une partie du mot..."
      noResultsText: "Aucun résultat"
      searchingText: "Recherche en cours..."
      preventDuplicates: true
