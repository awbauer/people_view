class EventsController < ApplicationController
  def index
    @current_page = (params[:page] || 1).to_i
    response = token.get("/api/v1/sites/actu/pages/events", :headers => standard_headers, :params => { page: @current_page })
    @events = JSON.parse(response.body)["results"]#.map { |person_data| Person.from_hash(person_data) }
  end
end
