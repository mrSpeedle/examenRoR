class Recycler < ApplicationRecord
  has_many :deliveries, dependent: :destroy
  has_many :materials, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true
end