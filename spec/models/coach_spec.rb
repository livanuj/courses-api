require 'rails_helper'

RSpec.describe Coach, type: :model do
  let!(:coach) { create(:coach) }
  it { should have_many(:courses) }

  it { should validate_presence_of(:name) }
  
  it  "triggers transfer_coach on destroy" do
    is_expected.to callback(:transfer_coach).after(:destroy)
  end

  context "transfer_coach should work as expected" do
  
    let!(:coach1) { create(:coach) }
    let!(:coach2) { create(:coach) }
    let!(:course_a) { create(:course, coach: coach1) }
    let!(:course_b) { create(:course, coach: coach1) }
    it 'User deletes a coach having courses' do
      # coach1 has 2 courses
      expect(coach1.courses.count).to be(2)
      # coach2 has none
      expect(coach2.courses.count).to be(0)
      
      # removes coach1
      coach1.destroy

      # coach1's courses are transfered to coach2
      expect(coach2.courses.count).to be(2)
    end
  end
end
