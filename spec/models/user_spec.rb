require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it {should have_many(:user_schools)}
    it {should have_many(:schools).through(:user_schools)}
    it {should have_many(:attendances)}
    it {should have_many(:events).through(:attendances)}
  end
end
