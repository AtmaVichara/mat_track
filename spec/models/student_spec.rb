require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'relationships' do
    it {should have_many(:user_students)}
    it {should have_many(:users).through(:user_students)}
    it {should have_many(:attendances)}
    it {should have_many(:events).through(:attendances)}
    it {should have_many(:user_schools)}
    it {should have_many(:schools).through(:user_schools)}
  end
end
