class ChefsController < ApplicationController
    
    def new
        @chef = Chef.new
        respond_to do |wants|
            wants.html # new.html.erb
            wants.xml  { render :xml => @chef }
        end
    end
    
    def create
        @chef = Chef.new(chef_params)
    
        respond_to do |wants|
            if @chef.save
                flash[:notice] = 'Chef was successfully created.'
                wants.html { redirect_to(@chef) }
                wants.xml  { render :xml => @chef, :status => :created, :location => @chef }
            else
                wants.html { render :action => "new" }
                wants.xml  { render :xml => @chef.errors, :status => :unprocessable_entity }
            end
        end
    end
    
    private
    
    def chef_params
        params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end
end