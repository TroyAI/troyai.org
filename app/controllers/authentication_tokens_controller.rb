class AuthenticationTokensController < ApplicationController
  before_action :authenticate_user!

  def generate
    token_string = ""
    characters = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]
    length = 16

    length.times do
      token_string << characters.sample
    end

    @token = current_user.authentication_token.new
    @token.token = token_string

    @token.save!

    render 'generate_post'
  end

  def generate_get
  end
end
