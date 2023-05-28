require 'rails_helper'

RSpec.describe Product, type: :model do
  before do 
    @category = Category.new(name: 'Large Trees')
    @category.save
end

describe 'Validation' do
  it "should save a product with all arguments satisfied" do
    @product = Product.new(name: 'Seqouia', price: 1500, quantity: 12, category: @category)
    expect(@product).to be_valid
  end
end
end

