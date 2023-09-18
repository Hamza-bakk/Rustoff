# spec/models/item_spec.rb

require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is valid with valid attributes" do
    item = Item.new(
      title: "Sample Item",
      description: "This is a sample item description.",
      price: 19.99,
      image_url: "sample.jpg",
      alt: "Sample Image",
      category: "Sample Category",
      disabled: false
    )
    expect(item).to be_valid
  end

  it "is not valid without a title" do
    item = Item.new(description: "This is a sample item description.", price: 19.99)
    expect(item).to_not be_valid
  end

  it "is not valid without a price" do
    item = Item.new(title: "Sample Item", description: "This is a sample item description.")
    expect(item).to_not be_valid
  end
end
