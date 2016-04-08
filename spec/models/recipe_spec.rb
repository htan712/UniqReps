require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user)}
  let(:recipe) { create(:recipe) }
  let(:ingredient) {Ingredient.create!(name: "chocolate", recipe: recipe, user: user) }
  let(:direction) {Direction.create!(step: "123456", recipe: recipe, user: user) }

  it { should have_many(:ingredients)}
  it { should have_many(:directions)}
  it { should belong_to(:user) }

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:ingredients)}
  it { should validate_presence_of(:directions)}
  it { should validate_presence_of(:image)}

  # undefined method each and "don't know how to teset image attachment"
  # describe "attributes" do
  #   it "should respond to title" do
  #     expect(recipe).to respond_to(:title)
  #   end
  #
  #   it "should respond to description" do
  #     expect(recipe).to respond_to(:description)
  #   end
  #
  #   it "should respond to ingredients" do
  #     expect(recipe).to respond_to(:ingredients)
  #   end
  #
  #   it "should respond to directions" do
  #     expect(recipe).to respond_to(:directions)
  #   end
  #
  #   it "should respond to image" do
  #     expect(recipe).to respond_to(:image)
  #   end
  # end
end
