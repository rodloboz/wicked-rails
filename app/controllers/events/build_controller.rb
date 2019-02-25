class Events::BuildController < ApplicationController
  include Wicked::Wizard

  before_action :set_event

  steps :add_categories, :add_additional_categories, :add_details

  def show
    render_wizard
  end

  def update
    case step
    when :add_categories
      merge_categories
    when :add_additional_categories
      merge_categories
    end
    @event.update_attributes(event_params)
    render_wizard @event
  end

  def finish_wizard_path
    event_path(@event)
  end

  def create
    @event = Event.create
    redirect_to wizard_path(steps.first, event_id: @event.id)
  end

  private

  def merge_categories
    return unless params.dig(:event, :category_ids)

    ids = @event.categories.pluck(:id)
    params[:event][:category_ids] = params[:event][:category_ids] + ids
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def event_params
    params.require(:event).permit(:title, :location, :description, category_ids: [])
  end
end
