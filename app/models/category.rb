class Category < ApplicationRecord
  # Associations
  # A category belongs to a user
  # A category can have one or many trades
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :trade_categories, dependent: :destroy
  has_many :trades, through: :trade_categories

  # Validations
  # A category must have a name
  validates :name, presence: true

  # A category name must not exceed 50 characters
  validates :name, length: { maximum: 50 }

  # Extract date from a timestamp
  def date(timestamp)
    datetime = DateTime.parse(timestamp)
    datetime.strftime('%d %b %Y')
  end
end
