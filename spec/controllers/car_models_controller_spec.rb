require 'rails_helper'

RSpec.describe CarModelsController, type: :controller do

  let(:make) { create :make, id: 2 }
  before { create :car_model, make: make }

  describe '#index' do

    context 'when make exists' do
      subject(:get_index) { get :index, webmotors_make_id: make.id }

      render_views
      it { is_expected.to render_template :index }

      it 'calls method to persist new makes' do
        expect { get_index }.to change(CarModel, :count)
      end
    end

    context "when make doesn't exist" do
      subject { get :index }
      it { is_expected.to be_not_found }
    end
  end

end
