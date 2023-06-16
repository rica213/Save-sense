class Trade < ApplicationRecord
  # Associations
  # A trade belongs to a user
  # A trade can have one or many categories
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :trade_categories, dependent: :destroy
  has_many :categories, through: :trade_categories

  # Validations
  # A trade must have a name
  validates :name, presence: true

  # A trade name must not exceed 50 characters
  validates :name, length: { maximum: 50 }

  # A trade must have an amount
  validates :amount, presence: true

  # An amount must be numeric
  validates :amount, numericality: true

  # Extract date from a timestamp
  def date(timestamp)
    datetime = DateTime.parse(timestamp)
    datetime.strftime('%d %b %Y')
  end
end
