class Trips::DashboardController < ApplicationController
  def index
    @trips = Trip.all
  end
end
