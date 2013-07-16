# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification "terminal-notifier-guard"

guard 'rspec', all_on_start: false, all_after_pass: false, zeus: true, bundler: false, cli: "-c -f doc" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('app/models/ability.rb')                      { "spec/models/user_spec.rb"}

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/features/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| "spec/features/#{m[1]}_spec.rb" }
end
