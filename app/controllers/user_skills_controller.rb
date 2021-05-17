class UserSkillsController < ApplicationController
  def index
    @feedback = Feedback.new
    @skills = UserSkill.includes(:skill_chapter).where(user: current_user)
    authorize @skills, policy_class: UserSkillPolicy

    if params[:query].present?
      @search_skills = UserSkill.global_search(params[:query]).select {|skills| skill.user == current_user}
      respond_to do |format|
        format.js { render partial: 'search_results'}
      end
    end
  end

  def create
    @user_skill = UserSkill.new(user_skill_params)
    @user_skill.user = current_user
    @user_skill.completed = true
    authorize @user_skill, policy_class: UserSkillPolicy
    @user_skill.save
  end

  private

  def user_skill_params
    params.require(:user_skill).permit(:skill_chapter_id)
  end
end
