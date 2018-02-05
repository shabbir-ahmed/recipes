require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(chefname: "Shabbir", email: "shabbir@gmail.com")
    end
    
    test "should be valid" do
        assert @chef.valid?
    end
    
    test "name should be valid" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    
    test "email should be valid" do 
        @chef.email = " "
        assert_not @chef.valid?
    end
    
    test "email shouldn't be more than 50 characters" do 
        @chef.email = "a" * 51
        assert_not @chef.valid?
    end
    
    test "chefname shouldn't be more than 50 characters" do 
        @chef.chefname = "a" * 51
        assert_not @chef.valid?
    end
    
    test "email should accept correct format" do
        valid_emails = %w[user@example.com SHABBIR@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
        valid_emails.each do |valids|
            @chef.email = valids
            assert @chef.valid?, "#{valids.inspect} should be valid"
        end
    end
    
    test "should reject invalid addresses" do
        invalid_emails = %w[user@example.com]
        invalid_emails.each do |invalids|
            @chef.email = invalids
            assert @chef.valid?, "#{invalids.inspect} should be valid"
        end
    end
    
    test "email should be unique and case insensitive" do
        duplicate_chef = @chef.dup 
        duplicate_chef.email = @chef.email.upcase
        @chef.save
        assert_not duplicate_chef.valid?
    end
    
    test "email should be lower case before hittinf db" do 
        mixed_email = "Shabbir@gmail.com"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase, @chef.reload.email
        
    end
end