class UserSkillsController < ApplicationController
  def create
    @user_skill = UserSkill.new(user_skill_params)
    @user_skill.user = current_user
    @user_skill.completed = true
    @user_skill.save
  end

  private

  def user_skill_params
    params.require(:user_skill).permit(:skill_chapter_id)
  end
end
