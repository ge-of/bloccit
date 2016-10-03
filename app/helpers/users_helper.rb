module UsersHelper

  def user_has_posts?(user)
    if user.posts.count > 0
      return true
    else
      return false
    end
  end

  def user_has_comments?(user)
    if user.comments.count > 0
      return true
    else
      return false
    end
  end

  def user_has_favorites?(user)
    if user.favorites.count > 0
      return true
    else
      return false
    end
  end
end
