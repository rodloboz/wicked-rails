class ContributionsController < ApplicationController
  def create
    speech = Speech.find(params[:speech_id])
    contribution = Contribution.new(contribution_params)
    contribution.speech = speech
    if contribution.save
      speech.update(content: params[:speech_html])
    else
      raise
    end
    redirect_to speech
  end

  private

  def contribution_params
    params.require(:contribution).permit(:paragraph, :content, :selection_uui)
  end
end
