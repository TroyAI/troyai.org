class AuthenticationTokensController < ApplicationController
  before_action :authenticate_user!

  def generate
    @token = current_user.authentication_token.new(token: helpers.new_token_string())
    @token.save!

    render 'generate_post'
  end

  def generate_get
  end
end
