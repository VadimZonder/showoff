class AddAccountNumberToIsFTps < ActiveRecord::Migration[5.2]
  def change
    add_column :is_f_tps, :account_number, :string
  end
end
