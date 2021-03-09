class UpdateBadgesJob < ApplicationJob
  queue_as :default

  def perform(user, lesson)
    lesson.recipe.ingredients.each do |ingredient|
      badge = ingredient.badge
      user_badge = UserBadge.find_by(user_id: user.id, badge_id: badge.id)
      if user_badge
        user_badge.xp += ingredient.score_2
        user_badge.save
      else
        UserBadge.create(user_id: user.id, badge_id: badge.id, xp: ingredient.score_1)
      end
    end

    lesson.recipe.tools.each do |tool|
      badge = tool.badge
      user_badge = UserBadge.find_by(user_id: user.id, badge_id: badge.id)
      if user_badge
        user_badge.xp += tool.score_2
        user_badge.save
      else
        UserBadge.create(user_id: user.id, badge_id: badge.id, xp: tool.score_1)
      end
    end

    lesson.recipe.techniques.each do |technique|
      badge = technique.badge
      user_badge = UserBadge.find_by(user_id: user.id, badge_id: badge.id)
      if user_badge
        user_badge.xp += technique.score_2
        user_badge.save
      else
        UserBadge.create(user_id: user.id, badge_id: badge.id, xp: technique.score_1)
      end
    end
  end
end
