class PagesController < ApplicationController
  def home
   @vehicles = Vehicle.new
  end

  def account
   @info = current_user
  end
end
