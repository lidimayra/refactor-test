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
end
