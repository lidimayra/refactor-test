require 'rails_helper'

RSpec.describe 'Webmotors', type: :services do

  describe 'makes' do
    subject(:makes) { Webmotors.makes }

    it { is_expected.to be_an_instance_of Array }

    context 'when checking make keys' do
      subject { makes.sample.keys }

      let(:keys) do
        ['Id', 'Nome', 'Count', 'IsPrincipal', 'Selected', 'NomeAmigavel']
      end

      it { is_expected.to eq keys }
    end
  end

  describe 'models' do
    let(:make) { create :make }
    subject(:models) { Webmotors.models(make.id) }

    it { is_expected.to be_an_instance_of Array }

    context 'when make has no models' do
      it { is_expected.to be_empty }
    end

    context 'when make has models' do
      let(:make) { create :make, id: 2 }
      subject { models.sample.keys }

      let(:keys) do
        ['Id', 'Nome', 'Count', 'NomeAmigavel']
      end

      it { is_expected.to eq keys }
    end
  end
end
