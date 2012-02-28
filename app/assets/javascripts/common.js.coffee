$ = jQuery

$ ->
  $(".alert-message").alert()
  $("#article_authorship_tokens").addtokenInput("/authors/names.json")
  $("#revue_redactionship_tokens").addtokenInput("/authors/names.json")

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
