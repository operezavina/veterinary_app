class Pet < ActiveRecord::Base
  has_many :appointments
end
