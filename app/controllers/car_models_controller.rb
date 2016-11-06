class CarModelsController < ApplicationController

  expose :make, -> { Make.find_by(webmotors_id: params[:webmotors_make_id]) }
  expose :car_models, from: :make

  def index
    CarModel.persist_if_absent(params[:webmotors_make_id])
  end
end
