class Doctor < ActiveRecord::Base
  has_many :appointments
  validates :name,  presence: true, length: { maximum: 35 }
  validates :zip, length: { minimum: 5 },length: { maximum: 5 }
  validates_inclusion_of :experience, in: 1..100
end
