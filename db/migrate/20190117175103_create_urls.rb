class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :account_number
      t.string :urls

      t.timestamps
    end
  end
end
