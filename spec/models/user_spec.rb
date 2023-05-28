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
    it "should provide error if password and password_confirmation do not match" do
      @user = User.new(name: nil, email: 'ds1@gmail.com', password: '123HELLO', password_confirmation: '1234HELLO' )
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "should have a minimum password length" do
      @user = User.new(name: nil, email: 'ds1@gmail.com', password: 'ELLO', password_confirmation: 'ELLO' )
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
    it "should have an erorr if password is not set" do
      @user = User.new(name: 'Daniel', email: 'ds1@gmail.com', password: nil, password_confirmation: nil )
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  end
end
