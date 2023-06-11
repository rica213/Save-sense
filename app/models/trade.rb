class Trade < ApplicationRecord
  # Associations
  # A trade belongs to a user
  # A trade can have one or many categories
  belongs_to :user
  has_many  :trade_categories, dependent: :destroy
  has_many :categories, through: :trade_categories
end
