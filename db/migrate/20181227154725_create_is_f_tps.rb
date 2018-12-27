class CreateIsFTps < ActiveRecord::Migration[5.2]
  def change
    create_table :is_f_tps do |t|
      t.string :isFTP

      t.timestamps
    end
  end
end
