class Expense < ApplicationRecord
  belongs_to :user
  has_many :joints, dependent: :destroy
  has_many :groups, through: :joints

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { only_float: true, greater_than: 0 }
end
