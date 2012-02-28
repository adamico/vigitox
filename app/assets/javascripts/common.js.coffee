$ = jQuery

$ ->
  $(".alert-message").alert()
  #autocomplete
  $("[id*=argument_name]").autocomplete
    source: '/arguments/names.js'
    minLength: 2
  add_autocomplete()
  $("#article_authorship_tokens").addtokenInput("/authors/names.json")
  $("#revue_redactionship_tokens").addtokenInput("/authors/names.json")

add_autocomplete = ->
  $('[id*=author_name]').autocomplete
    source: '/authors/names.js'
    minLength: 2
  $('[id*=redacteur_name]').autocomplete
    source: '/authors/names.js'
    minLength: 2

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
