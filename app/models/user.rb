class User < ApplicationRecord
  # Associations
  # A user can make one or many trades
  # A user can create one or many categories
  has_many :trades
  has_many :categories

end
