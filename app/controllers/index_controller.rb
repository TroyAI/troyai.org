class IndexController < ApplicationController
  before_action :authenticate_user!, only: :discord

  def index
  end

  def people
  end

  def discord
    redirect_to "https://discord.gg/gSDs5kYxeb", allow_other_host: true
  end
end
