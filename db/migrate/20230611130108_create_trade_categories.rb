class CreateTradeCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_categories do |t|
      t.references :trade, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
