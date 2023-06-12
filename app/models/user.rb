class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Associations
  # A user can make one or many trades
  # A user can create one or many categories
  has_many :trades, foreign_key: 'author_id', dependent: :destroy
  has_many :categories, foreign_key: 'author_id', dependent: :destroy

  # Validations
  # A user must have a name
  validates :name, presence: true

  # A user name must not exceed 50 characters
  validates :name, length: { maximum: 50 }
end
