class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :description
      t.float :deposit
      t.float :finance_fee
      t.float :option_to_purchase_fee
      t.float :total_amount_payable
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
