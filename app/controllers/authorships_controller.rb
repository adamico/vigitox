class AuthorshipsController < ApplicationController
  autocomplete :author, :nom
end
