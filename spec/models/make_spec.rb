require 'rails_helper'

RSpec.describe Make, type: :model do

  subject { build :make }
  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of :webmotors_id }
  it { is_expected.to validate_uniqueness_of :webmotors_id }
end
