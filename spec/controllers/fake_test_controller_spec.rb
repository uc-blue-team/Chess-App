require 'rails_helper'

RSpec.describe FakeTestController, type: :controller do
  describe "sanityCheck for Rspect" do
    it "should pass successfully" do
      two = 1 + 1
      expect(two).to eq(2)
    end
  end
end
