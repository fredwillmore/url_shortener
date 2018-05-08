class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :short
      t.string :full
      t.timestamps
    end
  end
end
