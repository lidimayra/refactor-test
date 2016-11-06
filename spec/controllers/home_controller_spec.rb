require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe '#index' do
    subject(:get_index) { get :index }

    render_views
    it { is_expected.to render_template :index }

    it 'calls method to persist new makes' do
      expect { get_index }.to change(Make, :count)
    end
  end

end
