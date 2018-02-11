require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
    
    test "should get respes index" do
        get recipes_url
        assert_response :success
    end
    
    test "create new valid recipe" do
        get new_recipe_path
    end
    
    test "rejet invalid recipe submission" do 
        get new_recipe_path
        assert_template 'recipes/new'
        assert_no_difference "Recipe.count" do 
            post recipes_path, params: {recipe: {name: "SASA", description: "SASA"}}
        end
        assert_template 'recipes/new'
        # assert_select 'h2.panel-title'
        # assert_select 'div.panel-body'
    end
    
    
    
end