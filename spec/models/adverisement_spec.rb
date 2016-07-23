require 'rails_helper'

RSpec.describe Adverisement, type: :model do
  let(:adverisement) {Adverisement.create!}

  describe "attributes" do
    it "should respond to title" do
      expect(adverisement).to respond_to(:title)
    end

    it "should respond to copy" do
      expect(adverisement).to respond_to(:copy)
    end

    it "should respond to price" do
      expect(adverisement).to respond_to(:price)
    end
  end
end
