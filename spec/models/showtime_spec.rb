require 'rails_helper'

RSpec.describe Showtime, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:time) }
  end

  describe 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:theatre) }
  end
end
