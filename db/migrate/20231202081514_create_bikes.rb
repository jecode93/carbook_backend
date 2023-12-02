class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :description
      t.string :image
      t.float :deposit
      t.float :finance_fee
      t.float :option_to_purchase_fee
      t.float :total_amount_payable
      t.integer :duration

      t.timestamps
    end
  end
end
