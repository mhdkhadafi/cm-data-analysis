class CreateImdbs < ActiveRecord::Migration
  def change
    create_table :imdbs do |t|
      t.string :mov1
      t.string :mov2
      t.string :mov3
      t.string :mov4
      t.string :mov5
      t.string :mov6
      t.string :mov7
      t.string :mov8
      t.string :mov9
      t.string :mov10

      t.timestamps
    end
  end
end
