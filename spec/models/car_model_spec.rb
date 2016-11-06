require 'rails_helper'

RSpec.describe CarModel, type: :model do

  let(:make) { create :make, name: 'CHEVROLET' }
  subject(:car_model) { build :car_model, make: make }

  context 'factories' do
    it { is_expected.to be_valid }
  end

  context 'validations' do
    it { is_expected.to belong_to(:make).inverse_of :car_models }
    it { is_expected.to validate_presence_of :make }
  end

  context 'when persisting models' do
    subject(:persist_if_absent) { CarModel.persist_if_absent 2 }
    before { create :car_model, name: 'A20', make: make }

    let(:query) { CarModel.where(name: name, make_id: make.id) }

    context 'when model is absent' do
      let(:name) { 'ADVANCED DESIGN' }

      it 'persists model' do
        expect { persist_if_absent }.to change(query, :count)
      end
    end

    context 'when model is present' do
      let(:name) { 'A20' }

      it "doesn't persist model" do
        expect { persist_if_absent }.not_to change(query, :count)
      end
    end
  end
end
