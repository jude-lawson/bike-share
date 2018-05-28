require 'rails_helper'

describe 'When you click on a specific trip' do
  context 'as a visitor' do
    it 'shows all attributes of a trip' do
      station = Station.create!(
        name: 'Union Station',
        dock_count: 12,
        city: 'Denver',
        installation_date: Time.parse('2010-05-05 00:00:00')
      )
      trip = Trip.create!(
        duration: 1315,
        start_date: Time.parse('2018-05-05 13:10:00'),
        end_date: Time.parse('2018-05-05 14:02:00'),
        start_station_id: station.id,
        end_station_id: station.id,
        bike_id: 64,
        subscription_type: 'subscriber',
        zip_code: 80202
      )

      visit trip_path(trip)

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.start_station_id)
      expect(page).to have_content(trip.end_station_id)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
  end
end
