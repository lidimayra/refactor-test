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
    subject(:models) { Webmotors.models(2) }

    it { is_expected.to be_an_instance_of Array }

    context 'when make has models' do
      subject { models.sample.keys }

      let(:keys) do
        ['Id', 'Nome', 'Count', 'NomeAmigavel']
      end

      it { is_expected.to eq keys }
    end
  end
end
