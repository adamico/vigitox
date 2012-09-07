$ = jQuery

$ ->
  $(".dropdown-toggle").dropdown()
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
