require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on the Add to cart button" do
    # ACT
    visit root_path
    click_button 'Add'
    sleep(1)
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
    
  end
end