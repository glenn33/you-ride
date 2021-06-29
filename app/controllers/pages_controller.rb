class PagesController < ApplicationController
  def home
   @vehicles = Vehicle.new
  end
end
