# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Generate a random password for the users
def generate_password
  Devise.friendly_token.first(8)
end

# Users
user_one = User.create!(name: "Margaret", email: 'user_one@weirdmail.com', password: generate_password)
user_two = User.create!(name: "Gavin", email: 'user_two@dreamland.com', password: generate_password)
user_three = User.create!(name: "Megan", email: 'user_three@catnapping.com', password: generate_password)

# Trades
# Trades that belongs to user_one
trade_one = Trade.create(name: "Bodyshop cream", amount: 25, author_id: user_one.id)
trade_two = Trade.create(name: "Webcam", amount: 15, author_id: user_one.id)
trade_three = Trade.create(name: "Lush conditioner", amount: 15, author_id: user_one.id)
trade_four = Trade.create(name: "Sunglasses", amount: 15, author_id: user_one.id)

# Trades that belongs to user_two
trade_five = Trade.create(name: "Sweater", amount: 15, author_id: user_two.id)
trade_six = Trade.create(name: "Lush body wash", amount: 15, author_id: user_two.id)
trade_seven = Trade.create(name: "Sunglasses", amount: 15, author_id: user_two.id)

# Trades that belongs to user_three
trade_eight = Trade.create(name: "SSD external disk", amount: 15, author_id: user_three.id)
trade_nine = Trade.create(name: "Monitor LCD", amount: 15, author_id: user_three.id)
trade_ten = Trade.create(name: "Keyboard", amount: 15, author_id: user_three.id)

# Categories
category_one = Category.create(name: "Beauty", icon: "http://geab.za/wutebupa", author_id: user_one.id)
category_two = Category.create(name: "Fashion", icon: "http://logu.gp/dev", author_id: user_two.id)
category_three = Category.create(name: "Electronics", icon: "http://wifub.ls/joeke", author_id: user_three.id)

# Trade_Categories
trade_category_one = TradeCategory.create(trade_id: trade_one.id, category_id: category_one.id)
trade_category_two = TradeCategory.create(trade_id: trade_two.id, category_id: category_three.id)
trade_category_three = TradeCategory.create(trade_id: trade_three.id, category_id: category_one.id)
trade_category_four = TradeCategory.create(trade_id: trade_four.id, category_id: category_two.id)
trade_category_five = TradeCategory.create(trade_id: trade_five.id, category_id: category_two.id)
trade_category_six = TradeCategory.create(trade_id: trade_six.id, category_id: category_one.id)
trade_category_seven = TradeCategory.create(trade_id: trade_seven.id, category_id: category_two.id)
trade_category_eight = TradeCategory.create(trade_id: trade_eight.id, category_id: category_three.id)
trade_category_nine = TradeCategory.create(trade_id: trade_nine.id, category_id: category_three.id)
trade_category_ten = TradeCategory.create(trade_id: trade_ten.id, category_id: category_three.id)