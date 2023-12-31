require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:category) }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
end
