require 'rails_helper'

RSpec.describe Grade, type: :model do
  describe "relationships" do
    it {should belong_to(:student)}
  end
end
