class ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.create(params[:review].permit(:content))
    @review.user_id = current_user.id
    @review.recipe_id = @recipe.id

    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end
end
