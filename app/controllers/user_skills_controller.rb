class UserSkillsController < ApplicationController
  def index
    @feedback = Feedback.new
    @skills = UserSkill.includes(:skill_chapter).where(user: current_user).group_by { |skill| skill.skill_chapter.badge.category }
    authorize @skills, policy_class: UserSkillPolicy
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
