class Make < ActiveRecord::Base

  has_many :car_models, inverse_of: :make

  validates :webmotors_id, presence: true, uniqueness: true
  validates :name, uniqueness: true

  def self.persist_if_absent
    Webmotors.makes.each do |make_params|
      Make.find_or_create_by(name: make_params["Nome"]) do |make|
        make.webmotors_id = make_params["Id"]
      end
    end
  end
end
