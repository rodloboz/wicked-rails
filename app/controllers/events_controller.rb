class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create
    redirect_to event_design_path(Wicked::FIRST_STEP, event_id: @event.id)
  end
end
