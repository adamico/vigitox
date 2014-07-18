$ = jQuery

$ ->
  $("#search_button").click (e) ->
    e.preventDefault()
    search_value = $("#query").val()
    if search_value
      $(@).parent("form").submit()
  $("[data-toggle=tooltip]").tooltip
    delay:
      hide: 100
  $(".alert-message").alert()
  revue_numero = $("#revue_numero").attr("data-value")
  $("#revue_numero").val(revue_numero)
  $("#article_authorship_tokens").attachMultiSelect2("/authors.json")
  $("#revue_redactionship_tokens").attachMultiSelect2("/authors.json")
  $(".author_autocomplete").attachSelect2("author")
  $(".argument_autocomplete").attachSelect2("argument")
  $(".subnav").affix
    offset:
      top: ->
        if $(window).width() <= 980 then 190 else 110
      bottom: 170
  if $(".argumentaire-error").length
    $(".argumentaire-error").closest(".control-group").addClass("error")

$.fn.attachSelect2 = (resource) ->
  @each ->
    $(@).select2
      minimumInputLength: 3
      initSelection : (element, callback) ->
        preload = element.data("load")
        callback(preload)
      ajax:
        url: "/#{resource}s.json"
        dataType: "json"
        data: (term, page) ->
          q: term
          page_limit: 10
        results: (data, page) ->
          return {results: data}
    $(@).on "change", (e) ->
      $.ajax
        url: "/#{resource}s.json?#{resource}_id=#{e.val}"
        dataType: "json"
        success: (data) =>
          $(this).data("load", data[0])

jQuery.fn.attachMultiSelect2 = (url) ->
  @select2
    minimumInputLength: 3
    multiple: true
    initSelection : (element, callback) ->
      preload = element.data("load")
      callback(preload)
    width: "75%"
    ajax:
      url: url
      dataType: "json"
      data: (term, page) ->
        q: term
        page_limit: 10
      results: (data, page) ->
        return {results: data}

$.fn.select2.defaults.allowClear = true
$.fn.select2.defaults.formatNoMatches = -> "Aucun résultat"
$.fn.select2.defaults.formatInputTooShort = (input, min) ->
  "Saisir au moins #{min - input.length} caractères"
$.fn.select2.defaults.formatSearching = -> "Recherche en cours..."
