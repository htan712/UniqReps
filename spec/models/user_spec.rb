require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should have_many(:recipes)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password)}

  it { should allow_value("user@example.com").for(:email) }
  it { should_not allow_value("user.com").for(:email) }

  it { should validate_length_of(:password).is_at_least(8)}

  describe "attribues" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to role" do
      expect(user).to respond_to(:role)
    end

    it "should respond to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "should respond to member?" do
      expect(user).to respond_to(:member?)
    end
  end

  describe "roles" do
    it "should be member by default" do
      expect(user.role).to eql("member")
    end

    context "member user" do
      it "should return true for member?" do
        expect(user.member?).to be_truthy
      end

      it "should return false for admin?" do
        expect(user.admin?).to be_falsey
      end
    end

    context "admin user" do
      before do
        user.admin!
      end

      it "should return false for member?" do
        expect(user.member?).to be_falsey
      end

      it "should return true for admin?" do
        expect(user.admin?).to be_truthy
      end
    end

    describe "invalid user" do
      let(:invalid_name) { build(:user, name:"") }
      let(:invalid_email) { build(:user, email:"")}
      let(:invalid_email_format) { build(:user, email:"notanemail.com")}

      it "should be an invalid user due to blank name" do
        expect(invalid_name).to_not be_valid
      end

      it "should be an invalid user due to blank email" do
        expect(invalid_email).to_not be_valid
      end

      it "should be an invalid user due to wrong email format" do
        expect(invalid_email_format).to_not be_valid
      end
    end
  end
end
