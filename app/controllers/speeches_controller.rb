class SpeechesController < ApplicationController
  def index
    @speeches = Speech.all
  end

  def show
    @speech = Speech.find(params[:id])
    @contribution = Contribution.new
  end
end
