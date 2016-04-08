require 'rails_helper'

RSpec.describe Direction, type: :model do
  let(:recipe) { create(:recipe) }
  let(:direction) {Direction.create!(step: "123456", recipe: recipe)}

  it { should belong_to (:recipe) }

  it { should validate_presence_of(:step)}
  # describe "attributes" do
  #   it "should respond to step" do
  #     expect(direction).to respond_to(:step)
  #   end
  # end
end
