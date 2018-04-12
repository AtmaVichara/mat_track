require 'rails_helper'

RSpec.describe SchoolLesson, type: :model do
  describe "relationships" do
    it {should belong_to(:lesson)}
    it {should belong_to(:school)}
  end
end
