class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end
    
    def show
        @recipe = Recipe.find(params[:id])
    
        respond_to do |wants|
            wants.html # show.html.erb
            wants.xml  { render :xml => @recipe }
        end
    end
end