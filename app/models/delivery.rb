class Delivery < ApplicationRecord
  belongs_to :recycler
  belongs_to :material

  validates :date, :quantity, presence: true
end