require 'rails_helper'

RSpec.describe CarModel, type: :model do

  subject { build :car_model }

  context 'factories' do
    it { is_expected.to be_valid }
  end

  context 'validations' do
    it { is_expected.to belong_to :make }
    it { is_expected.to validate_presence_of :make }
  end

end
