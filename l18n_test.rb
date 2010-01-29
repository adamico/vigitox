# encoding: utf-8
plugin 'webrat', :git => 'git://github.com/brynary/webrat.git'
generate 'controller', '-f ' 'Test', 'index'

append_file 'app/views/test/index.html.erb', <<-EOF
<%= date_select "post", "publication_date" %>
EOF

file "public/index.html", 'Webrat test'

file("config/locales/fr.yml", <<-EOF)
fr:
  activerecord:
    errors:
      template:
        header: 
          one: "Impossible d'enregistrer {{model}}: 1 erreur"
          other: "Impossible d'enregistrer {{model}}: {{count}} erreurs."
        body: "Veuillez vérifier les champs suivants :"
      messages:
        empty: "doit être rempli(e)"
EOF

append_file("test/test_helper.rb",<<-EOF)
require "webrat"
Webrat.configure do |config|
  config.mode = :rails
end
EOF

file("test/integration/select_date_test.rb",<<-EOF)
require 'test_helper'

class SelectDateTest < ActionController::IntegrationTest
  def test_date
    visit '/test'
    select_date Date.new(2008,4,23)
  end
end

EOF

rake("db:migrate")
rake("db:test:prepare")

puts "\n\nTesting without locale"
system("rake test:integration")

puts "\n\nTesting with locale"
environment "config.i18n.default_locale = 'fr'"
system("rake test:integration")

