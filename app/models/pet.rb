class Pet < ActiveRecord::Base
  has_many :appointments
  validates :name,  presence: true, length: { maximum: 35 }
  validates :breed,  presence: true, length: { maximum: 35 }
  validates :customer,  presence: true
  validates :age, presence: true
  validates :weight, presence: true
  validates :visit_date, presence: true
end
