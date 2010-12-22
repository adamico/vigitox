// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


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
  add_autocomplete();
});

function add_autocomplete() {
  $('[id*=author_name]').autocomplete({
    source: '/authors/names.js',
    minLength: 2
  });
};
