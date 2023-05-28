require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it "should save user when all credentials are provided" do
      @user = User.new(name: 'Daniel Seniv', email: 'ds@gmail.com', password: '123HELLO', password_confirmation: '123HELLO' )
      expect(@user).to be_valid
    end
    it "should provide error if name is not provided" do
      @user = User.new(name: nil, email: 'ds1@gmail.com', password: '123HELLO', password_confirmation: '123HELLO' )
      @user.save
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
  end
end
