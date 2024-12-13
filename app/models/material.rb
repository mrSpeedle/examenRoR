class Material < ApplicationRecord
  belongs_to :recycler
  has_many :deliveries, dependent: :destroy
end