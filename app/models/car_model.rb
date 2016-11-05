class CarModel < ActiveRecord::Base

  belongs_to :make, inverse_of: :car_models

  validates :make, presence: true

  def self.persist_if_absent(make_id)
    Webmotors.models(make_id).each do |model_params|
      CarModel.find_or_create_by(name: model_params["Nome"], make_id: make_id)
    end
  end
end
