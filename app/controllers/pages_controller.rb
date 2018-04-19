class PagesController < ApplicationController
    
    def home
        @chef = Chef.new
    end
    
end