require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
    
    test "should get respes index" do
        get recipes_url
        assert_response :success
    end
    
end