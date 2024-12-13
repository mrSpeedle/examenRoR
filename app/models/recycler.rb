class Recycler < ApplicationRecord
  has_many :deliveries, dependent: :destroy
  has_many :materials, dependent: :destroy
end