class Position < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 40 }
end
