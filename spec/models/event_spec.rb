require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "relationships" do
    it {should belong_to(:lesson)}
    it {should have_many(:attendances)}
    it {should have_many(:users).through(:attendances)}
  end
end
