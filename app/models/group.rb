class Group < ApplicationRecord
  belongs_to :user
  has_many :joints, dependent: :destroy
  has_many :expenses, through: :joints

  validates :name, presence: true
  validates :icon, presence: true
end
