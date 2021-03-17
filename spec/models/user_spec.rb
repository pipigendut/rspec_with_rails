require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user)              { create(:user, role: "admin", age: 40) }
  let(:another_user)      { create(:user, role: "guest", age: 1) }

  context "validations" do
    it "presence of firstname" do
      should validate_presence_of(:firstname)
    end
  end

  describe "#is_admin?" do
    context "answer is number" do
      it "accepts answer as number" do
        expect(user.is_admin?).to be(true)
      end

      it "accepts answer as number in words" do
        expect(another_user.is_admin?).to be(false)
      end
    end
  end

  describe "#is_baby?" do
    context "answer is number" do
      it "accepts answer as number" do
        expect(user.is_baby?).to be(false)
      end

      it "accepts answer as number in words" do
        expect(another_user.is_baby?).to be(true)
      end
    end
  end
end
