class CreateMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :mappings do |t|
      t.string :a1
      t.string :b2
      t.string :c3
      t.string :d4
      t.string :e5
      t.string :f6
      t.string :g7
      t.string :h8
      t.string :i9
      t.string :j10
      t.string :k11
      t.string :l12
      t.string :m13
      t.string :n14
      t.string :x24
      t.string :y25
      t.string :z26
      t.string :aa27
      t.string :ad30
      t.string :ae31
      t.string :af32

      t.timestamps
    end
  end
end
