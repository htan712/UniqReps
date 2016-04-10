class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  after_action :verify_authorized, only: [:edit, :update, :destroy]

  def index
    @recipe = Recipe.all.order("created_at DESC")
  end

  def show
    @reviews = Review.where(recipe_id: @recipe)
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe created!"
    else
      render :new
    end
  end

  def edit
    authorize @recipe

  end

  def update
    authorize @recipe
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    authorize @recipe
    @recipe.destroy
    redirect_to root_path, notice: "Recipe Deleted."
  end

  def upvote
    @recipe.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @recipe.downvote_by current_user
    redirect_to :back
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
  end
end
