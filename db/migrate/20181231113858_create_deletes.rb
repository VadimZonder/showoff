class CreateDeletes < ActiveRecord::Migration[5.2]
  def change
    create_table :deletes do |t|
      t.boolean :delete

      t.timestamps
    end
  end
end
