class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :account_type, :first_name, :last_name, :address, :pick_activities,
        :skill_details, :about_me, :upload_avatar, :upload_video

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(wizard_params)
    case step
    when :address
      jump_to(:about_me) if @user.is_a? Student
    when :about_me
      redirect_to finish_wizard_path and return if @user.is_a? Student
    end
    sign_in(@user, bypass: true) # needed for devise
    render_wizard @user
  end

  def finish_wizard_path
    user_path(current_user)
  end

  private

  def wizard_params
    case current_user.type
    when 'Teacher'
      teacher_params
    when 'Student'
      student_params
    else
      user_params
    end
  end

  def user_params
    params.require(:user).permit(:type)
  end

  def teacher_params
    params.require(:teacher).permit(:first_name,
      :last_name, :address, :about, :avatar, :video
    )
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :address, :about)
  end
end
