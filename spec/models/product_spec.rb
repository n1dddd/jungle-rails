require 'rails_helper'

RSpec.describe Product, type: :model do
  before do 
    @category = Category.new(name: 'Large Trees')
    @category.save
end

  describe 'validation' do
    it "should save a product with all arguments satisfied" do
      @product = Product.new(name: 'Seqouia', price: 1500, quantity: 12, category: @category)
      expect(@product).to be_valid
    end

    it "should not be valid if the name argument is missing/nil" do
      @product = Product.new(name: nil, price: 1200, quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not be valid if the price argument is missing/nil" do
      @product = Product.new(name: 'Seqouia', quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not be valid if the quantity argument is missing/nil" do
      @product = Product.new(name: 'Seqouia', price: 10000, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not be valid if the category argument is missing/nil" do
      @product = Product.new(name: 'Seqouia', price: 10000, quantity: 20, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end

end

