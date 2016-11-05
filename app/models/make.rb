class Make < ActiveRecord::Base

  validates :webmotors_id, presence: true, uniqueness: true
end
