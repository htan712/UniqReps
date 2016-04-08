module RecipesHelper
  def user_allowed_to_edit
    current_user.admin? || current_user = @recipe.user
  end
end
