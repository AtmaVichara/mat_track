require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe "relationships" do
    it {should have_many(:events)}
    it {should have_many(:school_lessons)}
    it {should have_many(:schools).through(:school_lessons)}
  end

  describe "class methods" do
    describe "#users_lessons" do
      it "returns all lessons associated with a user" do
        school = create(:school)
        user = create(:user)
        lessons = create_list(:lesson, 3)
        other_lessons = create_list(:lesson, 4)
        school.lessons << lessons
        user.schools << school

        expect(Lesson.users_lessons(user.id)).to eq(lessons)
        expect(Lesson.users_lessons(user.id)).to_not include(other_lessons)
      end
    end
  end
end
