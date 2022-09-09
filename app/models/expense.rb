class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { only_float: true, greater_than: 0 }
end
