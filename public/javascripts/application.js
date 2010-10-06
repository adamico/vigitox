// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
  add_autocomplete();
}

//autocomplete
$(function() {
  $("[id*=author_name]").autocomplete({
    source: '/authors/names.js',
    minLength: 2
  });
  $("[id*=argument_name]").autocomplete({
    source: '/arguments/names.js',
    minLength: 2
  });
});

function add_autocomplete() {
  $('[id*=author_name]').autocomplete({
    source: '/authors/names.js',
    minLength: 2
  });
};
