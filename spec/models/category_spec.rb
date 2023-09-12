require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:purchases) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:icon) }
end
