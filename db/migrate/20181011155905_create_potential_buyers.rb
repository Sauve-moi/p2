class CreatePotentialBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_buyers do |t|
      t.integer :house_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end
