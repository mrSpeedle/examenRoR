class Material < ApplicationRecord
  belongs_to :recycler
  has_many :deliveries, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end