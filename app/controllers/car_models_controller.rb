class CarModelsController < ApplicationController

  expose :make, -> { Make.find_by(webmotors_id: params[:webmotors_make_id]) }
  expose :car_models, from: :make

  def index
    make = Make.find_by(webmotors_id: params[:webmotors_make_id])
    CarModel.persist_if_absent(make.id)
  end
end
