module Api
  class EventsController < ApplicationController
    def index
      events = Event.all
      render json: events.to_json
    end
  end
end
