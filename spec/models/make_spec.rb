require 'rails_helper'

RSpec.describe Make, type: :model do

  subject(:make) { build :make }

  context 'factory' do
    it { is_expected.to be_valid }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :webmotors_id }
    it { is_expected.to validate_uniqueness_of :webmotors_id }
    it { is_expected.to validate_uniqueness_of :name }
  end

  context 'when persisting makes' do
    subject(:persist_if_absent) { Make.persist_if_absent }
    before { create :make, name: 'FIAT' }

    context 'when make is absent' do
      it 'persists make' do
        expect do
          persist_if_absent
        end.to change(Make.where(name: 'HONDA'), :count)
      end
    end

    context 'when make is present' do
      it "doesn't persist make" do
        expect do
          persist_if_absent
        end.not_to change(Make.where(name: 'FIAT'), :count)
      end
    end
  end
end
