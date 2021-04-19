class RecipesController < ApplicationController
    before_action :set_recipe, only:[:new, :edit, :show, :create, :update, :delete]
    before_action :set_ingredients, only:[:new, :edit, :show, :create, :update, :delete]

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
        # binding.pry
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
        if @recipe.save
            redirect_to recipe_path(@recipe) #show page
        else 
            render :edit
        end
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

    def set_ingredients
        @ingredients = Ingredient.all
    end


end
