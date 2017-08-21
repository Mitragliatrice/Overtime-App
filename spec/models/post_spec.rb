require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      user = User.create(email: "test@test.com", 
                        password: "asdfasdf", 
                        password_confirmation: "asdfasdf", 
                        first_name: "Jon", 
                        last_name:"Snow", 
                        phone: "3853233071")
            login_as(user, :scope => :user)
      @post = FactoryGirl.create(:post)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end
    
    it 'cannot be created without data, rationale, and overtime request' do
      @post.date = nil
      @post.rationale = nil
      @post.overtime_request = nil
      expect(@post).to_not be_valid
    end

    it 'has an overtime request greater than 0.0' do
      @post.overtime_request = 0.0
      expect(@post).to_not be_valid
    end
  end
end
