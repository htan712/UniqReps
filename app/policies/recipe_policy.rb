class RecipePolicy

  attr_reader :user, :recipe

  def initialize(user, recipe)
    @user = user
    @recipe = recipe
  end

  def update?
    user.present? && user == recipe.user
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user == recipe.user
  end
end
