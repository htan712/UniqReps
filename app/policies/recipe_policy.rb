# class RecipePolicy
#   attr_reader :current_user, :recipe
#
#   def initialize(current_user, recipe)
#     @current_user = current_user
#     @recipe = recipe
#   end
#
#   def update?
#     @current_user.admin? || @current_user = @recipe.user
#   end
#
#   def edit?
#     @current_user.admin? || @current_user = @recipe.user
#   end
#
#   def destroy?
#     @current_user.admin? || @current_user = @recipe.user
#   end
# end
