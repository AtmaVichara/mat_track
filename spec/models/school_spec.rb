require 'rails_helper'

RSpec.describe School, type: :model do
  describe "relationships" do
    it {should have_many(:school_lessons)}
    it {should have_many(:lessons).through(:school_lessons)}
    it {should have_many(:user_schools)}
    it {should have_many(:users).through(:user_schools)}
  end
end
