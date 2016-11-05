class CarModelsController < ApplicationController
  def index
    #search the models
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # Make request for Webmotors site
    make = Make.where(webmotors_id: params[:webmotors_make_id])[0]

    response = Net::HTTP.post_form(uri, { marca: params[:webmotors_make_id] })
    models_json = JSON.parse response.body

    # debugger

    # Itera no resultado e grava os modelos que ainda não estão persistidas
    models_json.each do |json|
      CarModel.find_or_create_by(name: json["Nome"], make_id: make.id)
    end
  end
end
