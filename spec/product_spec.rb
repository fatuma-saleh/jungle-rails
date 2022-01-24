require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is a Valid Product " do
      @category = Category.create(name: "category1")
      shirt = Product.new(
          category_id: @category.id,
          name:  'Gym shirt',
          description: 'Athletic Basketball',
          quantity: 17,
          price: 100
        )
       
    expect(shirt).to be_valid
    end

    it "is not a  Valid Product without a name" do
      @category = Category.create(name: "category1")
      shirt = Product.new(
          category_id: @category.id,
          name:  nil,
          description: 'Athletic Basketball',
          quantity: 17,
          price: 100
        )
       
    expect(shirt).to_not be_valid
    end

    it "is not a  Valid Product without a price" do
      @category = Category.create(name: "category1")
      shirt = Product.new(
          category_id: @category.id,
          name:  'Gym shirt',
          description: 'Athletic Basketball',
          quantity: 17
         
        )
       
    expect(shirt).to_not be_valid
  end

  it "is not a Valid Product without a quantity" do
    @category = Category.create(name: "category1")
    shirt = Product.new(
        category_id: @category.id,
        name:  'Gym shirt',
        description: 'Athletic Basketball',
        price: 100,
        quantity: nil
      )
     
  expect(shirt).to_not be_valid
end

it "is not a Valid Product without a category" do
  @category = Category.create(name: "category1")
  shirt = Product.new(
      category: nil,
      name:  'Gym shirt',
      description: 'Athletic Basketball',
      quantity: 17,
      price: 100
    )
   
expect(shirt).to_not be_valid
 end

 it "will generate errors on create of products" do
  @category = Category.create(name: "category1")
  shirt = Product.create(
      category: nil,
      name:  'Gym shirt',
      description: 'Athletic Basketball',
      quantity: 17,
      price: 100
    )
     puts shirt.errors.full_messages
 expect(shirt.errors.full_messages).to eq(["Category can't be blank"]) 
 end
end
end
