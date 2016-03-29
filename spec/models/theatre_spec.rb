require 'rails_helper'

RSpec.describe Theatre, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:number)  }

    it { should validate_presence_of(:capacity)  }
    it { should validate_presence_of(:number) }
  end
end
