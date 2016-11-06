class CarModelsController < ApplicationController

  expose :make, -> { Make.find_by(webmotors_id: params[:webmotors_make_id]) }
  expose :car_models, from: :make

  before_action :check_make!

  def index
    CarModel.persist_if_absent(params[:webmotors_make_id])
  end

  private

  def check_make!
    unless make
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
