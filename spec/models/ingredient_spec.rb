require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:recipe) { create(:recipe) }
  let(:ingredient) {Ingredient.create!(name: "123456", recipe: recipe)}

  it { should belong_to (:recipe) }

  it { should validate_presence_of(:name)}
  # describe "attributes" do
  #   it "should respond to name" do
  #     expect(ingredient).to respond_to(:name)
  #   end
  # end
end
