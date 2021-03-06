class Admin::TripsController < Admin::BaseController
  before_action :set_all_stations, only: [:new, :edit]

  def edit
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "Trip Created"
      redirect_to trip_path(@trip)
    else
      flash[:error] = "Incorrect attributes entered"
      redirect_to new_admin_trip_path
    end
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      flash[:notice] = "The trip #{@trip.id} has been updated!"
      redirect_to trip_path @trip
    else
      flash[:error] = "Invalid Attributes"
      redirect_to edit_admin_trip_path @trip
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Trip deleted"
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(
      :duration,
      :bike_id,
      :subscription_type,
      :zip_code,
      :bike_id,
      :start_station_id,
      :end_station_id,
      :start_date,
      :end_date
    )
  end

  def set_all_stations
    @all_stations = Station.all
  end
end
