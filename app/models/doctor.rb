class Doctor < ActiveRecord::Base
  has_many :appointments
  validates :name,  presence: true, length: { maximum: 35 }
end
