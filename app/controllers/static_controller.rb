class StaticController < ApplicationController
  def home
    @communities = Community.all
  end
end
