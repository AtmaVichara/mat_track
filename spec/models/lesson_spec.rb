require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe "relationships" do
    it {should have_many(:events)}
    it {should have_many(:school_lessons)}
    it {should have_many(:schools).through(:school_lessons)}
  end
end
