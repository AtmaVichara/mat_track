require 'rails_helper'

RSpec.describe UserSchool, type: :model do
  describe "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:school)}
  end
end
