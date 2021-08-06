require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to(:coach) }
  it { should have_many(:activities) }

  it { should validate_presence_of(:coach) }
  it { should validate_presence_of(:name) }
end
