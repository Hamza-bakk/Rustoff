# spec/models/quote_spec.rb

require 'rails_helper'

RSpec.describe Quote, type: :model do
  it "is valid with valid attributes" do
    quote = Quote.new(
      description: "This is a test description.",
      email: "john@example.com",
      first_name: "John",
      last_name: "Doe",
      category: "3D",
      processed: false
    )
    expect(quote).to be_valid
  end

  it "is not valid without a description" do
    quote = Quote.new(
      email: "john@example.com",
      first_name: "John",
      last_name: "Doe",
      category: "3D",
      processed: false
    )
    expect(quote).to_not be_valid
  end

  it "is not valid without an email" do
    quote = Quote.new(
      description: "This is a test description.",
      first_name: "John",
      last_name: "Doe",
      category: "3D",
      processed: false
    )
    expect(quote).to_not be_valid
  end
end
