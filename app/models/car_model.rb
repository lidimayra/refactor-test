class CarModel < ActiveRecord::Base

  belongs_to :make

  validates :make, presence: true
end
