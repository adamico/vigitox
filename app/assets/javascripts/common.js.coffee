$ = jQuery

$ ->
  #autocomplete
  $("[id*=argument_name]").autocomplete
    source: '/arguments/names.js'
    minLength: 2
  add_autocomplete()

add_autocomplete = ->
  $('[id*=author_name]').autocomplete
    source: '/authors/names.js'
    minLength: 2
  $('[id*=redacteur_name]').autocomplete
    source: '/authors/names.js'
    minLength: 2
