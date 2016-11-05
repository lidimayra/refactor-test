class CarModel < ActiveRecord::Base

  belongs_to :make, inverse_of: :car_models

  validates :make, presence: true
end
