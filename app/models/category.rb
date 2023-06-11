class Category < ApplicationRecord
  # Associations
  # A category belongs to a user
  # A category can have one or many trades
  belongs_to :user
  has_many :trade_categories, dependent: :destroy
  has_many :trades, through: :trade_categories
end
