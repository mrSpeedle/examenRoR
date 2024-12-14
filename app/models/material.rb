class Material < ApplicationRecord
  belongs_to :recycler
  belongs_to :base_material
  has_many :deliveries, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end