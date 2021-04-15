class RecipesController < ApplicationController
    before_action :set_recipe, only:[:edit, :show, :update, :delete]

    def index
        @recipes = Recipe.all
    end
   
    def show
        # binding.pry
    end

    def new
        @recipe = Recipe.new
    end


    def create
        binding.pry
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
          render :new
        end
    end

    def edit 
    end

    def update
        # binding.pry
        @recipe.update(recipe_params)
        # @recipe.update(name: params[:recipe][:name], ingredients: params[:recipe][:ingredient_ids][])
        redirect_to recipe_path(@recipe) #show page
    end

    def delete
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def set_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end



end
